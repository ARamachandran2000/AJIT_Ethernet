//----------------------------------------------------------------------------------------------------------------------
// Title      : Verilog Example Level Module
// File       : axi_ethernet_0_example.v
// Author     : Xilinx Inc.
// ########################################################################################################################
// ##
// # (c) Copyright 2012-2016 Xilinx, Inc. All rights reserved.
// #
// # This file contains confidential and proprietary information of Xilinx, Inc. and is protected under U.S. and
// # international copyright and other intellectual property laws. 
// #
// # DISCLAIMER
// # This disclaimer is not a license and does not grant any rights to the materials distributed herewith. Except as
// # otherwise provided in a valid license issued to you by Xilinx, and to the maximum extent permitted by applicable law:
// # (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND
// # CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// # INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract or tort,
// # including negligence, or under any other theory of liability) for any loss or damage of any kind or nature related to,
// # arising under or in connection with these materials, including for any direct, or any indirect, special, incidental, or
// # consequential loss or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered as a
// # result of any action brought by a third party) even if such damage or loss was reasonably foreseeable or Xilinx had
// # been advised of the possibility of the same.
// #
// # CRITICAL APPLICATIONS
// # Xilinx products are not designed or intended to be fail-safe, or for use in any application requiring fail-safe
// # performance, such as life-support or safety devices or systems, Class III medical devices, nuclear facilities,
// # applications related to the deployment of airbags, or any other applications that could lead to death, personal injury,
// # or severe property or environmental damage (individually and collectively, "Critical Applications"). Customer assumes
// # the sole risk and liability of any use of Xilinx products in Critical Applications, subject only to applicable laws and
// # regulations governing limitations on product liability.
// #
// # THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
// #
// ########################################################################################################################
// Description: This module is the top level of AXI Ethernet IP Example Design.
//              It contains other resources required for an example.
//----------------------------------------------------------------------------------------------------------------------

`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module axi_ethernet_0_example
(
    // 200MHz clock input from board
    //input          clk_in_p             ,
    //input          clk_in_n             ,
   
    output         phy_rst_n            ,

    input          sgmii_rxn            ,
    input          sgmii_rxp            ,
    output         sgmii_txn            ,
    output         sgmii_txp            ,

    input          mgt_clk_n            ,
    input          mgt_clk_p            ,
    input          dummy_port_in        ,

    // MDIO Interface
    //---------------
    inout          mdio                 ,
    output         mdc                  ,
    
     input soft_rst,
    
    // from reset and clock generator
    input axi_lite_resetn ,
    input axis_rstn       ,
    input sys_out_rst     ,

    // clock outputs
    input clkgen_gtx_clk  ,
    input ref_clk  ,
    input ref_clk_50_bufg,
    input axis_clk,
    input axi_lite_clk,
    
    // control signals
    
    output mtrlb_activity_flash,
    output mtrlb_pktchk_error,
    output control_ready,
    
    input control_valid,
    input [3:0] control_data,
    input start_config
);

wire [31:0] m_axis_rxd_tdata, m_axis_rxs_tdata, s_axis_txc_tdata, s_axis_txd_tdata;
wire [3:0]  m_axis_rxd_tkeep, m_axis_rxs_tkeep, s_axis_txc_tkeep, s_axis_txd_tkeep;

wire axi_lite_clk, axi_lite_resetn, s_axi_arready, s_axi_arvalid, s_axi_awready, s_axi_awvalid, s_axi_bready, s_axi_bvalid;
wire s_axi_rvalid, s_axi_rready, s_axi_wready, s_axi_wvalid;
wire [ 1 : 0] s_axi_bresp, s_axi_rresp;
wire [17 : 0] s_axi_araddr, s_axi_awaddr;
wire [31 : 0] s_axi_rdata, s_axi_wdata;

wire [7:0]  cmnd_data;
wire        cmnd_data_valid, cmnd_data_ready;

wire     signal_detect;
assign   signal_detect  = 1'b1;
wire     sys_out_rst, axis_rstn;

wire pat_chk_ctrl, ex_des_cl,ex_des_blink_on_tx;
wire loopback_master_slaven, slvlb_en_l2_addr_swap, mtrlb_en_packet_gen, mtrlb_en_packet_chk, mtrlb_en_pkt_drop_chk, mtrlb_reset_error;

wire          mtrlb_pktchk_error_s, mtrlb_activity_flash_s;
wire [1 :0]   mtrlb_line_speed, mtrlb_en_cs_offload;
wire [11:0]   mtrlb_config_vlan_id       ;
wire [2 :0]   mtrlb_config_vlan_priority ;
wire [ 4:0]   mtrlb_select_packet_type ;
wire          mtrlb_da_sa_swap_en ;
wire [31:0]   mtrlb_config_ip_dest_addr  , mtrlb_config_ip_src_addr   ;
wire [47:0]   mtrlb_config_dest_addr     , mtrlb_config_src_addr      ;
wire [15:0]   mtrlb_config_min_size, mtrlb_config_max_size, mtrlb_config_tcp_dest_port , mtrlb_config_tcp_src_port  , mtrlb_config_udp_dest_port , mtrlb_config_udp_src_port  ;

wire         mdio_i       , mdio_o       , mdio_t      ;
IOBUF mdio_io_iobuf ( .I (mdio_o ), .IO(mdio   ), .O (mdio_i ), .T (mdio_t ));

// asynchronous reset
wire sys_rst;
assign mtrlb_pktchk_error   = mtrlb_pktchk_error_s   ;
assign mtrlb_activity_flash = mtrlb_activity_flash_s ;


assign      mtrlb_en_cs_offload               = 2'h0  ;
assign      mtrlb_config_dest_addr            = 48'hDA0203040506   ;
assign      mtrlb_config_src_addr             = 48'hCA0203040506   ;
assign      mtrlb_config_vlan_id              = 12'h000            ;
assign      mtrlb_config_vlan_priority        =  3'b000            ;
assign      mtrlb_config_ip_dest_addr         = 32'hDA060708       ;
assign      mtrlb_config_ip_src_addr          = 32'h5A060708       ;
assign      mtrlb_config_tcp_dest_port        = 16'hDA09           ;
assign      mtrlb_config_tcp_src_port         = 16'h5A09           ;
assign      mtrlb_config_udp_dest_port        = 16'hDA0A           ;
assign      mtrlb_config_udp_src_port         = 16'h5A0A           ;
assign      mtrlb_config_min_size             = 16'h0040           ;
assign      mtrlb_config_max_size             = 16'h0500           ;
assign      mtrlb_da_sa_swap_en               = 1'b0               ;


ila_1 ILA_1 (
	.clk(axis_clk), // input wire clk
	.probe0(axis_rstn), // input wire [0:0]  probe0  
	.probe1(m_axis_rxs_tdata), // input wire [31:0]  probe1 
	.probe2(m_axis_rxs_tkeep), // input wire [3:0]  probe2 
	.probe3(s_axis_txc_tlast), // input wire [0:0]  probe3 
	.probe4(s_axis_txc_tready), // input wire [0:0]  probe4 
	.probe5(m_axis_rxs_tvalid), // input wire [0:0]  probe5 
	.probe6(axis_rstn), // input wire [0:0]  probe6 
	.probe7(m_axis_rxd_tdata), // input wire [31:0]  probe7 
	.probe8(m_axis_rxd_tkeep), // input wire [3:0]  probe8 
	.probe9(m_axis_rxd_tlast), // input wire [0:0]  probe9 
	.probe10(m_axis_rxd_tready), // input wire [0:0]  probe10 
	.probe11(m_axis_rxd_tvalid) // input wire [0:0]  probe11
);

ila_1 ILA_2 (
	.clk(axis_clk), // input wire clk
	.probe0(axis_rstn), // input wire [0:0]  probe0  
	.probe1(s_axis_txc_tdata), // input wire [31:0]  probe1 
	.probe2(s_axis_txc_tkeep), // input wire [3:0]  probe2 
	.probe3(m_axis_rxs_tlast), // input wire [0:0]  probe3 
	.probe4(m_axis_rxs_tready), // input wire [0:0]  probe4 
	.probe5(s_axis_txc_tvalid), // input wire [0:0]  probe5 
	.probe6(axis_rstn), // input wire [0:0]  probe6 
	.probe7(s_axis_txd_tdata), // input wire [31:0]  probe7 
	.probe8(s_axis_txd_tkeep), // input wire [3:0]  probe8 
	.probe9(s_axis_txd_tlast), // input wire [0:0]  probe9 
	.probe10(s_axis_txd_tready), // input wire [0:0]  probe10 
	.probe11(s_axis_txd_tvalid) // input wire [0:0]  probe11
);


axi_ethernet_0_support   axi_ethernet_0_support
(
    .s_axi_lite_resetn   (axi_lite_resetn   ),
    .s_axi_araddr        (s_axi_araddr      ),
    .s_axi_arready       (s_axi_arready     ),
    .s_axi_arvalid       (s_axi_arvalid     ),
    .s_axi_awaddr        (s_axi_awaddr      ),
    .s_axi_awready       (s_axi_awready     ),
    .s_axi_awvalid       (s_axi_awvalid     ),
    .s_axi_bready        (s_axi_bready      ),
    .s_axi_bresp         (s_axi_bresp       ),
    .s_axi_bvalid        (s_axi_bvalid      ),
    .s_axi_rdata         (s_axi_rdata       ),
    .s_axi_rready        (s_axi_rready      ),
    .s_axi_rresp         (s_axi_rresp       ),
    .s_axi_rvalid        (s_axi_rvalid      ),
    .s_axi_wdata         (s_axi_wdata       ),
    .s_axi_wready        (s_axi_wready      ),
    .s_axi_wvalid        (s_axi_wvalid      ),

    .axis_clk            (axis_clk          ),

    .axi_txc_arstn       (axis_rstn         ),
    .s_axis_txc_tdata    (s_axis_txc_tdata  ),
    .s_axis_txc_tkeep    (s_axis_txc_tkeep  ),
    .s_axis_txc_tlast    (s_axis_txc_tlast  ),
    .s_axis_txc_tready   (s_axis_txc_tready ),
    .s_axis_txc_tvalid   (s_axis_txc_tvalid ),

    .axi_txd_arstn       (axis_rstn         ),
    .s_axis_txd_tdata    (s_axis_txd_tdata  ),
    .s_axis_txd_tkeep    (s_axis_txd_tkeep  ),
    .s_axis_txd_tlast    (s_axis_txd_tlast  ),
    .s_axis_txd_tready   (s_axis_txd_tready ),
    .s_axis_txd_tvalid   (s_axis_txd_tvalid ),

    .axi_rxd_arstn       (axis_rstn         ),
    .m_axis_rxd_tdata    (m_axis_rxd_tdata  ),
    .m_axis_rxd_tkeep    (m_axis_rxd_tkeep  ),
    .m_axis_rxd_tlast    (m_axis_rxd_tlast  ),
    .m_axis_rxd_tready   (m_axis_rxd_tready ),
    .m_axis_rxd_tvalid   (m_axis_rxd_tvalid ),

    .axi_rxs_arstn       (axis_rstn         ),
    .m_axis_rxs_tdata    (m_axis_rxs_tdata  ),
    .m_axis_rxs_tkeep    (m_axis_rxs_tkeep  ),
    .m_axis_rxs_tlast    (m_axis_rxs_tlast  ),
    .m_axis_rxs_tready   (m_axis_rxs_tready ),
    .m_axis_rxs_tvalid   (m_axis_rxs_tvalid ),

    .sgmii_rxn           (sgmii_rxn         ),
    .sgmii_rxp           (sgmii_rxp         ),
    .sgmii_txn           (sgmii_txn         ),
    .sgmii_txp           (sgmii_txp         ),
    .signal_detect       (signal_detect     ),
    .mgt_clk_n           (mgt_clk_n         ),
    .mgt_clk_p           (mgt_clk_p         ),
    .dummy_port_in        (dummy_port_in    ),

    .mdio_mdc            (mdc               ),
    .mdio_mdio_i         (mdio_i            ),
    .mdio_mdio_o         (mdio_o            ),
    .mdio_mdio_t         (mdio_t            ),
    .phy_rst_n           (phy_rst_n         ),

    .ref_clk             (ref_clk           ),

    .s_axi_lite_clk      (axi_lite_clk      )
);

//----------------------------------------------------------------------------
//  Instantiate the AXI Streaming pattern generator and checker
//----------------------------------------------------------------------------
axi_ethernet_0_streaming_generator axi_streaming_gen_inst
(
    .loopback_master_slaven     (loopback_master_slaven    ),
    .slvlb_en_l2_addr_swap      (slvlb_en_l2_addr_swap     ),
    .mtrlb_en_packet_gen        (mtrlb_en_packet_gen       ),
    .mtrlb_en_cs_offload        (mtrlb_en_cs_offload       ),
    .mtrlb_select_packet_type   (mtrlb_select_packet_type  ),
    .mtrlb_da_sa_swap_en        (mtrlb_da_sa_swap_en       ),
    .mtrlb_line_speed           (mtrlb_line_speed          ),
    .mtrlb_config_dest_addr     (mtrlb_config_dest_addr    ),
    .mtrlb_config_src_addr      (mtrlb_config_src_addr     ),
    .mtrlb_config_vlan_id       (mtrlb_config_vlan_id      ),
    .mtrlb_config_vlan_priority (mtrlb_config_vlan_priority),
    .mtrlb_config_ip_dest_addr  (mtrlb_config_ip_dest_addr ),
    .mtrlb_config_ip_src_addr   (mtrlb_config_ip_src_addr  ),
    .mtrlb_config_tcp_dest_port (mtrlb_config_tcp_dest_port),
    .mtrlb_config_tcp_src_port  (mtrlb_config_tcp_src_port ),
    .mtrlb_config_udp_dest_port (mtrlb_config_udp_dest_port),
    .mtrlb_config_udp_src_port  (mtrlb_config_udp_src_port ),
    .mtrlb_config_min_size      (mtrlb_config_min_size     ),
    .mtrlb_config_max_size      (mtrlb_config_max_size     ),
    .mtrlb_en_packet_chk        (mtrlb_en_packet_chk       ),
    .mtrlb_reset_error          (mtrlb_reset_error         ),
    .mtrlb_en_pkt_drop_chk      (mtrlb_en_pkt_drop_chk     ),
    .mtrlb_pktchk_error         (mtrlb_pktchk_error_s      ),
    .ex_des_blink_on_tx         (ex_des_blink_on_tx        ),
    .mtrlb_activity_flash       (mtrlb_activity_flash_s    ),

    .axi_txc_arstn              (axis_rstn                 ),
    .m_axis_str_gen_c_tdata     (s_axis_txc_tdata          ),
    .m_axis_str_gen_c_tkeep     (s_axis_txc_tkeep          ),
    .m_axis_str_gen_c_tlast     (s_axis_txc_tlast          ),
    .m_axis_str_gen_c_tready    (s_axis_txc_tready         ),
    .m_axis_str_gen_c_tvalid    (s_axis_txc_tvalid         ),

    .axi_txd_arstn              (axis_rstn                 ),
    .m_axis_str_gen_d_tdata     (s_axis_txd_tdata          ),
    .m_axis_str_gen_d_tkeep     (s_axis_txd_tkeep          ),
    .m_axis_str_gen_d_tlast     (s_axis_txd_tlast          ),
    .m_axis_str_gen_d_tready    (s_axis_txd_tready         ),
    .m_axis_str_gen_d_tvalid    (s_axis_txd_tvalid         ),

    .axi_rxd_arstn              (axis_rstn                 ),
    .s_axis_str_gen_d_tdata     (m_axis_rxd_tdata          ),
    .s_axis_str_gen_d_tkeep     (m_axis_rxd_tkeep          ),
    .s_axis_str_gen_d_tlast     (m_axis_rxd_tlast          ),
    .s_axis_str_gen_d_tready    (m_axis_rxd_tready         ),
    .s_axis_str_gen_d_tvalid    (m_axis_rxd_tvalid         ),

    .axi_rxs_arstn              (axis_rstn                 ),
    .s_axis_str_gen_s_tdata     (m_axis_rxs_tdata          ),
    .s_axis_str_gen_s_tkeep     (m_axis_rxs_tkeep          ),
    .s_axis_str_gen_s_tlast     (m_axis_rxs_tlast          ),
    .s_axis_str_gen_s_tready    (m_axis_rxs_tready         ),
    .s_axis_str_gen_s_tvalid    (m_axis_rxs_tvalid         ),

    .axis_clk                   (axis_clk                  )
);


axi_ethernet_0_axi_lite_ctrl axi_lite_ctrl_inst
(
    .axi_lite_resetn           (axi_lite_resetn         ),
    .m_axi_araddr              (s_axi_araddr            ),
    .m_axi_arready             (s_axi_arready           ),
    .m_axi_arvalid             (s_axi_arvalid           ),
    .m_axi_awaddr              (s_axi_awaddr            ),
    .m_axi_awready             (s_axi_awready           ),
    .m_axi_awvalid             (s_axi_awvalid           ),
    .m_axi_bready              (s_axi_bready            ),
    .m_axi_bresp               (s_axi_bresp             ),
    .m_axi_bvalid              (s_axi_bvalid            ),
    .m_axi_rdata               (s_axi_rdata             ),
    .m_axi_rready              (s_axi_rready            ),
    .m_axi_rresp               (s_axi_rresp             ),
    .m_axi_rvalid              (s_axi_rvalid            ),
    .m_axi_wdata               (s_axi_wdata             ),
    .m_axi_wready              (s_axi_wready            ),
    .m_axi_wvalid              (s_axi_wvalid            ),

    .cmnd_data                 ({4'h0,control_data}     ),
    .cmnd_data_valid           (control_valid           ),
    .cmnd_data_ready           (control_ready           ),
    .start_config              (start_config            ),

    .ex_des_mtr_slv_lb_mode    (loopback_master_slaven  ),
    .ex_des_en_slvlb_addr_swap (slvlb_en_l2_addr_swap   ),
    .ex_des_blink_on_tx        (ex_des_blink_on_tx      ),
    .soft_rst_except_to_mmcm   (soft_rst                ),
    .ex_des_line_speed         (mtrlb_line_speed        ),
    .pat_chk_en_pkt_drop_chk   (mtrlb_en_pkt_drop_chk   ),
    .pat_chk_enable            (mtrlb_en_packet_chk     ),
    .pat_chk_rst_error         (mtrlb_reset_error       ),
    .pat_gen_en_pkt_types      (mtrlb_select_packet_type),
    .pat_gen_enable            (mtrlb_en_packet_gen     ),

    .axi_lite_clk              (axi_lite_clk            )
);


endmodule


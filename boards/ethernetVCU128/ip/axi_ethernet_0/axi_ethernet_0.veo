// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:axi_ethernet:7.1
// IP Revision: 6

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
axi_ethernet_0 your_instance_name (
  .s_axi_lite_resetn(s_axi_lite_resetn),    // input wire s_axi_lite_resetn
  .s_axi_lite_clk(s_axi_lite_clk),          // input wire s_axi_lite_clk
  .mac_irq(mac_irq),                        // output wire mac_irq
  .axis_clk(axis_clk),                      // input wire axis_clk
  .axi_txd_arstn(axi_txd_arstn),            // input wire axi_txd_arstn
  .axi_txc_arstn(axi_txc_arstn),            // input wire axi_txc_arstn
  .axi_rxd_arstn(axi_rxd_arstn),            // input wire axi_rxd_arstn
  .axi_rxs_arstn(axi_rxs_arstn),            // input wire axi_rxs_arstn
  .interrupt(interrupt),                    // output wire interrupt
  .signal_detect(signal_detect),            // input wire signal_detect
  .clk125_out(clk125_out),                  // output wire clk125_out
  .clk312_out(clk312_out),                  // output wire clk312_out
  .rst_125_out(rst_125_out),                // output wire rst_125_out
  .riu_valid_3(riu_valid_3),                // input wire riu_valid_3
  .riu_valid_2(riu_valid_2),                // input wire riu_valid_2
  .riu_valid_1(riu_valid_1),                // input wire riu_valid_1
  .riu_prsnt_3(riu_prsnt_3),                // input wire riu_prsnt_3
  .riu_prsnt_2(riu_prsnt_2),                // input wire riu_prsnt_2
  .riu_prsnt_1(riu_prsnt_1),                // input wire riu_prsnt_1
  .riu_rddata_3(riu_rddata_3),              // input wire [15 : 0] riu_rddata_3
  .riu_rddata_2(riu_rddata_2),              // input wire [15 : 0] riu_rddata_2
  .riu_rddata_1(riu_rddata_1),              // input wire [15 : 0] riu_rddata_1
  .tx_dly_rdy_1(tx_dly_rdy_1),              // input wire tx_dly_rdy_1
  .rx_dly_rdy_1(rx_dly_rdy_1),              // input wire rx_dly_rdy_1
  .tx_vtc_rdy_1(tx_vtc_rdy_1),              // input wire tx_vtc_rdy_1
  .rx_vtc_rdy_1(rx_vtc_rdy_1),              // input wire rx_vtc_rdy_1
  .tx_dly_rdy_2(tx_dly_rdy_2),              // input wire tx_dly_rdy_2
  .rx_dly_rdy_2(rx_dly_rdy_2),              // input wire rx_dly_rdy_2
  .tx_vtc_rdy_2(tx_vtc_rdy_2),              // input wire tx_vtc_rdy_2
  .rx_vtc_rdy_2(rx_vtc_rdy_2),              // input wire rx_vtc_rdy_2
  .tx_dly_rdy_3(tx_dly_rdy_3),              // input wire tx_dly_rdy_3
  .rx_dly_rdy_3(rx_dly_rdy_3),              // input wire rx_dly_rdy_3
  .tx_vtc_rdy_3(tx_vtc_rdy_3),              // input wire tx_vtc_rdy_3
  .rx_vtc_rdy_3(rx_vtc_rdy_3),              // input wire rx_vtc_rdy_3
  .tx_logic_reset(tx_logic_reset),          // output wire tx_logic_reset
  .rx_logic_reset(rx_logic_reset),          // output wire rx_logic_reset
  .rx_locked(rx_locked),                    // output wire rx_locked
  .tx_locked(tx_locked),                    // output wire tx_locked
  .tx_bsc_rst_out(tx_bsc_rst_out),          // output wire tx_bsc_rst_out
  .rx_bsc_rst_out(rx_bsc_rst_out),          // output wire rx_bsc_rst_out
  .tx_bs_rst_out(tx_bs_rst_out),            // output wire tx_bs_rst_out
  .rx_bs_rst_out(rx_bs_rst_out),            // output wire rx_bs_rst_out
  .tx_rst_dly_out(tx_rst_dly_out),          // output wire tx_rst_dly_out
  .rx_rst_dly_out(rx_rst_dly_out),          // output wire rx_rst_dly_out
  .tx_bsc_en_vtc_out(tx_bsc_en_vtc_out),    // output wire tx_bsc_en_vtc_out
  .tx_bs_en_vtc_out(tx_bs_en_vtc_out),      // output wire tx_bs_en_vtc_out
  .rx_bsc_en_vtc_out(rx_bsc_en_vtc_out),    // output wire rx_bsc_en_vtc_out
  .rx_bs_en_vtc_out(rx_bs_en_vtc_out),      // output wire rx_bs_en_vtc_out
  .riu_clk_out(riu_clk_out),                // output wire riu_clk_out
  .riu_wr_en_out(riu_wr_en_out),            // output wire riu_wr_en_out
  .tx_pll_clk_out(tx_pll_clk_out),          // output wire tx_pll_clk_out
  .rx_pll_clk_out(rx_pll_clk_out),          // output wire rx_pll_clk_out
  .tx_rdclk_out(tx_rdclk_out),              // output wire tx_rdclk_out
  .riu_addr_out(riu_addr_out),              // output wire [5 : 0] riu_addr_out
  .riu_wr_data_out(riu_wr_data_out),        // output wire [15 : 0] riu_wr_data_out
  .riu_nibble_sel_out(riu_nibble_sel_out),  // output wire [1 : 0] riu_nibble_sel_out
  .rx_btval_1(rx_btval_1),                  // output wire [8 : 0] rx_btval_1
  .rx_btval_2(rx_btval_2),                  // output wire [8 : 0] rx_btval_2
  .rx_btval_3(rx_btval_3),                  // output wire [8 : 0] rx_btval_3
  .dummy_port_in(dummy_port_in),            // input wire dummy_port_in
  .phy_rst_n(phy_rst_n),                    // output wire [0 : 0] phy_rst_n
  .s_axi_araddr(s_axi_araddr),              // input wire [17 : 0] s_axi_araddr
  .s_axi_arready(s_axi_arready),            // output wire s_axi_arready
  .s_axi_arvalid(s_axi_arvalid),            // input wire s_axi_arvalid
  .s_axi_awaddr(s_axi_awaddr),              // input wire [17 : 0] s_axi_awaddr
  .s_axi_awready(s_axi_awready),            // output wire s_axi_awready
  .s_axi_awvalid(s_axi_awvalid),            // input wire s_axi_awvalid
  .s_axi_bready(s_axi_bready),              // input wire s_axi_bready
  .s_axi_bresp(s_axi_bresp),                // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),              // output wire s_axi_bvalid
  .s_axi_rdata(s_axi_rdata),                // output wire [31 : 0] s_axi_rdata
  .s_axi_rready(s_axi_rready),              // input wire s_axi_rready
  .s_axi_rresp(s_axi_rresp),                // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),              // output wire s_axi_rvalid
  .s_axi_wdata(s_axi_wdata),                // input wire [31 : 0] s_axi_wdata
  .s_axi_wready(s_axi_wready),              // output wire s_axi_wready
  .s_axi_wstrb(s_axi_wstrb),                // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(s_axi_wvalid),              // input wire s_axi_wvalid
  .s_axis_txc_tdata(s_axis_txc_tdata),      // input wire [31 : 0] s_axis_txc_tdata
  .s_axis_txc_tkeep(s_axis_txc_tkeep),      // input wire [3 : 0] s_axis_txc_tkeep
  .s_axis_txc_tlast(s_axis_txc_tlast),      // input wire s_axis_txc_tlast
  .s_axis_txc_tready(s_axis_txc_tready),    // output wire s_axis_txc_tready
  .s_axis_txc_tvalid(s_axis_txc_tvalid),    // input wire s_axis_txc_tvalid
  .s_axis_txd_tdata(s_axis_txd_tdata),      // input wire [31 : 0] s_axis_txd_tdata
  .s_axis_txd_tkeep(s_axis_txd_tkeep),      // input wire [3 : 0] s_axis_txd_tkeep
  .s_axis_txd_tlast(s_axis_txd_tlast),      // input wire s_axis_txd_tlast
  .s_axis_txd_tready(s_axis_txd_tready),    // output wire s_axis_txd_tready
  .s_axis_txd_tvalid(s_axis_txd_tvalid),    // input wire s_axis_txd_tvalid
  .m_axis_rxd_tdata(m_axis_rxd_tdata),      // output wire [31 : 0] m_axis_rxd_tdata
  .m_axis_rxd_tkeep(m_axis_rxd_tkeep),      // output wire [3 : 0] m_axis_rxd_tkeep
  .m_axis_rxd_tlast(m_axis_rxd_tlast),      // output wire m_axis_rxd_tlast
  .m_axis_rxd_tready(m_axis_rxd_tready),    // input wire m_axis_rxd_tready
  .m_axis_rxd_tvalid(m_axis_rxd_tvalid),    // output wire m_axis_rxd_tvalid
  .m_axis_rxs_tdata(m_axis_rxs_tdata),      // output wire [31 : 0] m_axis_rxs_tdata
  .m_axis_rxs_tkeep(m_axis_rxs_tkeep),      // output wire [3 : 0] m_axis_rxs_tkeep
  .m_axis_rxs_tlast(m_axis_rxs_tlast),      // output wire m_axis_rxs_tlast
  .m_axis_rxs_tready(m_axis_rxs_tready),    // input wire m_axis_rxs_tready
  .m_axis_rxs_tvalid(m_axis_rxs_tvalid),    // output wire m_axis_rxs_tvalid
  .sgmii_rxn(sgmii_rxn),                    // input wire sgmii_rxn
  .sgmii_rxp(sgmii_rxp),                    // input wire sgmii_rxp
  .sgmii_txn(sgmii_txn),                    // output wire sgmii_txn
  .sgmii_txp(sgmii_txp),                    // output wire sgmii_txp
  .mdio_mdc(mdio_mdc),                      // output wire mdio_mdc
  .mdio_mdio_i(mdio_mdio_i),                // input wire mdio_mdio_i
  .mdio_mdio_o(mdio_mdio_o),                // output wire mdio_mdio_o
  .mdio_mdio_t(mdio_mdio_t),                // output wire mdio_mdio_t
  .lvds_clk_clk_n(lvds_clk_clk_n),          // input wire lvds_clk_clk_n
  .lvds_clk_clk_p(lvds_clk_clk_p)          // input wire lvds_clk_clk_p
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file axi_ethernet_0.v when simulating
// the core, axi_ethernet_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.


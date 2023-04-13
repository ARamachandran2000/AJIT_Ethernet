module top_level(
    // 100MHz clock input from board
    input          clk_in_p             ,
    input          clk_in_n             ,
   
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
    output         mdc                  
    
    );
    
    
    wire sys_rst, clk_rst, mmcm_locked_out;
    
    wire axi_lite_clk,mtrlb_activity_flash,mtrlb_pktchk_error,control_ready;
    wire control_valid,start_config;
    wire [3:0] control_data;
    
    wire soft_rst,axi_lite_resetn,axis_rstn,sys_out_rst,clkgen_gtx_clk;
    wire ref_clk,ref_clk_50_bufg,axis_clk;
    
    
    vio_0 vio_rst 
    (
        .clk(axi_lite_clk),                // input wire clk
        .probe_in0(mtrlb_activity_flash),    // input wire [0 : 0] probe_in0
        .probe_in1(mtrlb_pktchk_error),    // input wire [0 : 0] probe_in1
        .probe_in2(control_ready),    // input wire [0 : 0] probe_in2
        .probe_out0(control_data),  // output wire [3 : 0] probe_out0
        .probe_out1(control_valid),  // output wire [0 : 0] probe_out1
        .probe_out2(start_config),  // output wire [0 : 0] probe_out2
        .probe_out3(sys_rst),  // output wire [0 : 0] probe_out3
        .probe_out4(clk_rst)  // output wire [0 : 0] probe_out4
    );
    
    axi_ethernet_0_example mac_support
    (
        .phy_rst_n(phy_rst_n),
        .sgmii_rxn(sgmii_rxn),
        .sgmii_rxp(sgmii_rxp),
        .sgmii_txn(sgmii_txn),
        .sgmii_txp(sgmii_txp),
        
        .mgt_clk_n(mgt_clk_n),
        .mgt_clk_p(mgt_clk_p),
        
        .dummy_port_in(dummy_port_in),
        .mdio(mdio),
        .mdc(mdc),
        
        .soft_rst(soft_rst),
    
        // from reset and clock generator
        .axi_lite_resetn(axi_lite_resetn) ,
        .axis_rstn(axis_rstn)       ,
        .sys_out_rst(sys_out_rst)     ,
        
         // clock outputs
        .clkgen_gtx_clk(clkgen_gtx_clk)  ,
        .ref_clk(ref_clk)  ,
        .ref_clk_50_bufg(ref_clk_50_bufg),
        .axis_clk(axis_clk),
        .axi_lite_clk(axi_lite_clk),
            
        // control signals
            
        .mtrlb_activity_flash(mtrlb_activity_flash),
        .mtrlb_pktchk_error(mtrlb_pktchk_error),
        .control_ready(control_ready),
            
        .control_valid(control_valid),
        .control_data(control_data),
        .start_config(start_config)
    );
    
    axi_ethernet_0_clocks_resets example_clocks_resets
    (
        .clk_in_p          (clk_in_p       ),
        .clk_in_n          (clk_in_n       ),
        // asynchronous control/resets
        .sys_rst           (sys_rst        ),
        .clk_rst           (clk_rst        ),
        .soft_rst          (soft_rst       ),
        .mmcm_locked_out   (mmcm_locked_out),
    
        //reset outputs
        .axi_lite_resetn   (axi_lite_resetn),
        .axis_rstn         (axis_rstn      ),
        .sys_out_rst       (sys_out_rst    ),
    
        // clock outputs
        .gtx_clk_bufg      (clkgen_gtx_clk ),
        .ref_clk_bufg      (ref_clk        ),
        .ref_clk_50_bufg   (ref_clk_50_bufg),
        .axis_clk_bufg     (axis_clk       ),
        .axi_lite_clk_bufg (axi_lite_clk   )
    );
endmodule


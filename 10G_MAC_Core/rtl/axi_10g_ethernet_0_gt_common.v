
// Description: This file contains the 10GBASE-R Transceiver GT Common block.
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps

module  axi_10g_ethernet_0_gt_common # (
  parameter WRAPPER_SIM_GTRESET_SPEEDUP = "false" ) //Does not affect hardware
    (
     input  refclk,
     input  qpllreset,
     output qplllock,
     output qplloutclk,
     output qplloutrefclk
    );

assign gt_common_drpdo = 0;
assign gt_common_drprdy = 0;

//***************************** Parameter Declarations ************************
    localparam QPLL_FBDIV_TOP =  66;

    localparam QPLL_FBDIV_IN  =  (QPLL_FBDIV_TOP == 16)  ? 10'b0000100000 :
            (QPLL_FBDIV_TOP == 20)  ? 10'b0000110000 :
            (QPLL_FBDIV_TOP == 32)  ? 10'b0001100000 :
            (QPLL_FBDIV_TOP == 40)  ? 10'b0010000000 :
            (QPLL_FBDIV_TOP == 64)  ? 10'b0011100000 :
            (QPLL_FBDIV_TOP == 66)  ? 10'b0101000000 :
            (QPLL_FBDIV_TOP == 80)  ? 10'b0100100000 :
            (QPLL_FBDIV_TOP == 100) ? 10'b0101110000 : 10'b0000000000;

   localparam QPLL_FBDIV_RATIO = (QPLL_FBDIV_TOP == 16)  ? 1'b1 :
            (QPLL_FBDIV_TOP == 20)  ? 1'b1 :
            (QPLL_FBDIV_TOP == 32)  ? 1'b1 :
            (QPLL_FBDIV_TOP == 40)  ? 1'b1 :
            (QPLL_FBDIV_TOP == 64)  ? 1'b1 :
            (QPLL_FBDIV_TOP == 66)  ? 1'b0 :
            (QPLL_FBDIV_TOP == 80)  ? 1'b1 :
            (QPLL_FBDIV_TOP == 100) ? 1'b1 : 1'b1;

//***************************** Wire Declarations *****************************

    // ground and vcc signals
    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [63:0]  tied_to_vcc_vec_i;

//********************************* Main Body of Code**************************

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;


    wire gt0_gtrefclk0_common_in;
    wire gt0_qpllreset_in;
    wire gt0_qplllock_out;
    wire gt0_qplloutclk_i;
    wire gt0_qplloutrefclk_i;

    assign gt0_gtrefclk0_common_in = refclk;
    assign gt0_qpllreset_in = qpllreset;
    assign qplllock = gt0_qplllock_out;
    assign qplloutclk = gt0_qplloutclk_i;
    assign qplloutrefclk = gt0_qplloutrefclk_i;


    //_________________________________________________________________________
    //_________________________________________________________________________
    //_________________________GTHE2_COMMON____________________________________

    GTHE2_COMMON #
    (
            // Simulation attributes
            .SIM_RESET_SPEEDUP   (WRAPPER_SIM_GTRESET_SPEEDUP),
            .SIM_QPLLREFCLK_SEL  (3'b001),
            .SIM_VERSION         ("2.0"),


           //----------------COMMON BLOCK Attributes---------------
            .BIAS_CFG                               (64'h0000040000001050),
            .COMMON_CFG                             (32'h0000001C),
            .QPLL_CFG                               (27'h04801C7),
            .QPLL_CLKOUT_CFG                        (4'b1111),
            .QPLL_COARSE_FREQ_OVRD                  (6'b010000),
            .QPLL_COARSE_FREQ_OVRD_EN               (1'b0),
            .QPLL_CP                                (10'b0000011111),
            .QPLL_CP_MONITOR_EN                     (1'b0),
            .QPLL_DMONITOR_SEL                      (1'b0),
            .QPLL_FBDIV                             (QPLL_FBDIV_IN),
            .QPLL_FBDIV_MONITOR_EN                  (1'b0),
            .QPLL_FBDIV_RATIO                       (QPLL_FBDIV_RATIO),
            .QPLL_INIT_CFG                          (24'h000006),
            .QPLL_LOCK_CFG                          (16'h05E8),
            .QPLL_LPF                               (4'b1111),
            .QPLL_REFCLK_DIV                        (2),
            .RSVD_ATTR0                             (16'h0000),
            .RSVD_ATTR1                             (16'h0000),
            .QPLL_RP_COMP                           (1'b0),
            .QPLL_VTRL_RESET                        (2'b00),
            .RCAL_CFG                               (2'b00)

    )
    gthe2_common_0_i
    (
        //----------- Common Block  - Dynamic Reconfiguration Port (DRP) -----------
        .DRPADDR                        (tied_to_ground_vec_i[7:0]),
        .DRPCLK                         (tied_to_ground_i),
        .DRPDI                          (tied_to_ground_vec_i[15:0]),
        .DRPDO                          (),
        .DRPEN                          (tied_to_ground_i),
        .DRPRDY                         (),
        .DRPWE                          (tied_to_ground_i),
        //-------------------- Common Block  - Ref Clock Ports ---------------------
        .GTGREFCLK                      (tied_to_ground_i),
        .GTNORTHREFCLK0                 (tied_to_ground_i),
        .GTNORTHREFCLK1                 (tied_to_ground_i),
        .GTREFCLK0                      (gt0_gtrefclk0_common_in),
        .GTREFCLK1                      (tied_to_ground_i),
        .GTSOUTHREFCLK0                 (tied_to_ground_i),
        .GTSOUTHREFCLK1                 (tied_to_ground_i),
        //--------------------- Common Block - Clocking Ports ----------------------
        .QPLLOUTCLK                     (gt0_qplloutclk_i),
        .QPLLOUTREFCLK                  (gt0_qplloutrefclk_i),
        .REFCLKOUTMONITOR               (),
        //----------------------- Common Block - QPLL Ports ------------------------
        .BGRCALOVRDENB                  (tied_to_vcc_i),
        .PMARSVDOUT                     (),
        .QPLLDMONITOR                   (),
        .QPLLFBCLKLOST                  (),
        .QPLLLOCK                       (gt0_qplllock_out),
        .QPLLLOCKDETCLK                 (1'b0),
        .QPLLLOCKEN                     (tied_to_vcc_i),
        .QPLLOUTRESET                   (tied_to_ground_i),
        .QPLLPD                         (tied_to_ground_i),
        .QPLLREFCLKLOST                 (),
        .QPLLREFCLKSEL                  (3'b001),
        .QPLLRESET                      (gt0_qpllreset_in),
        .QPLLRSVD1                      (16'b0000000000000000),
        .QPLLRSVD2                      (5'b11111),
        //------------------------------- QPLL Ports -------------------------------
        .BGBYPASSB                      (tied_to_vcc_i),
        .BGMONITORENB                   (tied_to_vcc_i),
        .BGPDB                          (tied_to_vcc_i),
        .BGRCALOVRD                     (5'b11111),
        .PMARSVD                        (8'b00000000),
        .RCALENB                        (tied_to_vcc_i)

    );


endmodule

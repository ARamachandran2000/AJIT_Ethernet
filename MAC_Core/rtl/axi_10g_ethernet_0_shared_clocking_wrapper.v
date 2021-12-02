
// Description: This is the Shared clocking wrapper level code for the 10G
//              Gigabit Ethernet Core.  It contains the shareable clocking,
//              reset circuitry and the gt common block.
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module axi_10g_ethernet_0_shared_clocking_wrapper  (
   input          reset,
   input          refclk_p,
   input          refclk_n,
   input          dclk,
   input          txoutclk,
   output         txoutclk_out,
   output         coreclk,
   output wire areset_coreclk,
   output wire areset_txusrclk2,
   output         gttxreset,
   output         gtrxreset,
   output         txuserrdy,
   output         txusrclk,
   output         txusrclk2,
   output         reset_counter_done,
   output         qplllock_out,
   output         qplloutclk,
   output         qplloutrefclk
   );

/*-------------------------------------------------------------------------*/

  // Signal declarations
  wire   qplllock;
  wire   refclk;
  wire   counter_done;
  wire   qpllreset;

  assign qplllock_out           = qplllock;
  assign reset_counter_done     = counter_done;


  //---------------------------------------------------------------------------
  // Instantiate the 10GBASER/KR GT Common block
  //---------------------------------------------------------------------------
  axi_10g_ethernet_0_gt_common # (
      .WRAPPER_SIM_GTRESET_SPEEDUP("TRUE") ) //Does not affect hardware
  gt_common_block_i
    (
     .refclk                (refclk),
     .qpllreset             (qpllreset),
     .qplllock              (qplllock),
     .qplloutclk            (qplloutclk),
     .qplloutrefclk         (qplloutrefclk)
    );

  //---------------------------------------------------------------------------
  // Instantiate the 10GBASER/KR shared clock/reset block
  //---------------------------------------------------------------------------

  axi_10g_ethernet_0_shared_clock_and_reset ethernet_shared_clock_reset_block_i
    (
     .areset                (reset),
     .coreclk               (coreclk),
     .refclk_p              (refclk_p),
     .refclk_n              (refclk_n),
     .refclk                (refclk),
     .txoutclk              (txoutclk),
     .qplllock              (qplllock),
     .areset_coreclk        (areset_coreclk),
     .areset_txusrclk2      (areset_txusrclk2),
     .gttxreset             (gttxreset),
     .gtrxreset             (gtrxreset),
     .txuserrdy             (txuserrdy),
     .txusrclk              (txusrclk),
     .txusrclk2             (txusrclk2),
     .qpllreset             (qpllreset),
     .reset_counter_done    (counter_done)
    );

endmodule

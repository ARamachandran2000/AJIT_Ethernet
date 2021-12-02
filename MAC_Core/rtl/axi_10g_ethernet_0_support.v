
// Description: This is the Support level code for 10G Gigabit Ethernet.
//              It contains the block level instance and shareable clocking and
//              reset circuitry.
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module axi_10g_ethernet_0_support (
   // Port declarations
   input                               refclk_p,
   input                               refclk_n,
   input                               dclk,
   output                              coreclk_out,
   input                               reset,
   output                              qplloutclk_out,
   output                              qplloutrefclk_out,
   output                              qplllock_out,
   output                              resetdone_out,
   output                              txusrclk_out,
   output                              txusrclk2_out,
   output                              gttxreset_out,
   output                              gtrxreset_out,
   output                              txuserrdy_out,
   output                              reset_counter_done_out,

   input       [79 : 0]                mac_tx_configuration_vector,
   input       [79 : 0]                mac_rx_configuration_vector,
   output      [2 : 0]                 mac_status_vector,
   input       [535 : 0]               pcs_pma_configuration_vector,
   output      [447 : 0]               pcs_pma_status_vector,

   input       [7:0]                   tx_ifg_delay,

   output      [25:0]                  tx_statistics_vector,
   output      [29:0]                  rx_statistics_vector,
   output                              tx_statistics_valid,
   output                              rx_statistics_valid,

   input                               tx_axis_aresetn,
   input       [31:0]                  s_axis_tx_tdata,
   input       [3:0]                   s_axis_tx_tkeep,
   input                               s_axis_tx_tvalid,
   input                               s_axis_tx_tlast,
   input                               s_axis_tx_tuser,
   output                              s_axis_tx_tready,

   input                               rx_axis_aresetn,
   output      [31:0]                  m_axis_rx_tdata,
   output      [3:0]                   m_axis_rx_tkeep,
   output                              m_axis_rx_tvalid,
   output                              m_axis_rx_tuser,
   output                              m_axis_rx_tlast,



   //Pause axis
   input      [15:0]                   s_axis_pause_tdata,
   input                               s_axis_pause_tvalid,

   output                              txp,
   output                              txn,
   input                               rxp,
   input                               rxn,

   output                              tx_disable,
   output wire                         rxrecclk_out,
   input                               signal_detect,
   input                               sim_speedup_control,
   input                               tx_fault,
   output      [7:0]                   pcspma_status
   );

/*-------------------------------------------------------------------------*/

  // Signal declarations

  wire coreclk;
  wire txoutclk;
  wire qplloutclk;
  wire qplloutrefclk;
  wire qplllock;
  wire tx_resetdone_int;
  wire rx_resetdone_int;
  wire areset_txusrclk2;
  wire areset_coreclk;
  wire gttxreset;
  wire gtrxreset;
  wire txuserrdy;
  wire reset_counter_done;
  wire txusrclk;
  wire txusrclk2;
  wire txoutclk_in;

  assign coreclk_out            = coreclk;

  assign resetdone_out          = tx_resetdone_int && rx_resetdone_int;

  assign qplloutclk_out         = qplloutclk;
  assign qplloutrefclk_out      = qplloutrefclk;
  assign qplllock_out           = qplllock;
  assign txusrclk_out           = txusrclk;
  assign txusrclk2_out          = txusrclk2;
  assign gttxreset_out          = gttxreset;
  assign gtrxreset_out          = gtrxreset;
  assign txuserrdy_out          = txuserrdy;
  assign reset_counter_done_out = reset_counter_done;

  //---------------------------------------------------------------------------
  // Instantiate the shared clock/reset block that also contains the gt_common
  //---------------------------------------------------------------------------

  axi_10g_ethernet_0_shared_clocking_wrapper shared_clocking_wrapper_i
    (
     .reset                            (reset),
     .refclk_p                         (refclk_p),
     .refclk_n                         (refclk_n),
     .dclk                             (dclk),
     .coreclk                          (coreclk),
     .txoutclk                         (txoutclk),
     .txoutclk_out                     (txoutclk_in),
     .areset_coreclk                   (areset_coreclk),
     .areset_txusrclk2                 (areset_txusrclk2),
     .gttxreset                        (gttxreset),
     .gtrxreset                        (gtrxreset),
     .txuserrdy                        (txuserrdy),
     .txusrclk                         (txusrclk),
     .txusrclk2                        (txusrclk2),
     .qplllock_out                     (qplllock),
     .qplloutclk                       (qplloutclk),
     .qplloutrefclk                    (qplloutrefclk),
     .reset_counter_done               (reset_counter_done)
    );

  //---------------------------------------------------------------------------
  // Instantiate the AXI 10G Ethernet core
  //---------------------------------------------------------------------------
  axi_10g_ethernet_0 ethernet_core_i (
      .dclk                            (dclk),
      .coreclk                         (coreclk),
      .txoutclk                        (txoutclk),
      .txusrclk                        (txusrclk),
      .txusrclk2                       (txusrclk2),
      .areset_coreclk                  (areset_coreclk),
      .txuserrdy                       (txuserrdy),
      .rxrecclk_out                    (rxrecclk_out),
      .areset                          (reset),
      .tx_resetdone                    (tx_resetdone_int),
      .rx_resetdone                    (rx_resetdone_int),
      .reset_counter_done              (reset_counter_done),
      .gttxreset                       (gttxreset),
      .gtrxreset                       (gtrxreset),
      .qplllock                        (qplllock),
      .qplloutclk                      (qplloutclk),
      .qplloutrefclk                   (qplloutrefclk),
      .tx_ifg_delay                    (tx_ifg_delay),
      .tx_statistics_vector            (tx_statistics_vector),
      .tx_statistics_valid             (tx_statistics_valid),
      .rx_statistics_vector            (rx_statistics_vector),
      .rx_statistics_valid             (rx_statistics_valid),
      .s_axis_pause_tdata              (s_axis_pause_tdata),
      .s_axis_pause_tvalid             (s_axis_pause_tvalid),

      .tx_axis_aresetn                 (tx_axis_aresetn),
      .s_axis_tx_tdata                 (s_axis_tx_tdata),
      .s_axis_tx_tvalid                (s_axis_tx_tvalid),
      .s_axis_tx_tlast                 (s_axis_tx_tlast),
      .s_axis_tx_tuser                 (s_axis_tx_tuser),
      .s_axis_tx_tkeep                 (s_axis_tx_tkeep),
      .s_axis_tx_tready                (s_axis_tx_tready),

      .rx_axis_aresetn                 (rx_axis_aresetn),
      .m_axis_rx_tdata                 (m_axis_rx_tdata),
      .m_axis_rx_tkeep                 (m_axis_rx_tkeep),
      .m_axis_rx_tvalid                (m_axis_rx_tvalid),
      .m_axis_rx_tuser                 (m_axis_rx_tuser),
      .m_axis_rx_tlast                 (m_axis_rx_tlast),
      .mac_tx_configuration_vector     (mac_tx_configuration_vector),
      .mac_rx_configuration_vector     (mac_rx_configuration_vector),
      .mac_status_vector               (mac_status_vector),
      .pcs_pma_configuration_vector    (pcs_pma_configuration_vector),
      .pcs_pma_status_vector           (pcs_pma_status_vector),


      // Serial links
      .txp                             (txp),
      .txn                             (txn),
      .rxp                             (rxp),
      .rxn                             (rxn),

      .sim_speedup_control             (sim_speedup_control),
      .signal_detect                   (signal_detect),
      .tx_fault                        (tx_fault),
      .tx_disable                      (tx_disable),
      .pcspma_status                   (pcspma_status)
   );


endmodule

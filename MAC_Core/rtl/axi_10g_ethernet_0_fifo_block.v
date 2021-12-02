
// Description: This is the FIFO block level code for the 10G/25G Gigabit
//              Ethernet IP. It contains  FIFOs connected to
//              the AXI-S transmit and receive interfaces of the Ethernet core.
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module axi_10g_ethernet_0_fifo_block  #(
parameter                              FIFO_SIZE = 1024
) (
   // Port declarations
   input                               refclk_p,
   input                               refclk_n,
   input                               dclk,
   input                               reset,
   output                              resetdone_out,
   output                              qplllock_out,
   output                              coreclk_out,
   output                              rxrecclk_out,
   
   
   //AHIR Pipe Signals
   input pipe_write_ack,
   output [36:0]pipe_write_data,
   output pipe_write_req,
   input read_pipe_ack,
   input [36:0]read_pipe_data,
   output read_pipe_req,
   
   
   
   

   input       [79 : 0]                mac_tx_configuration_vector,
   input       [79 : 0]                mac_rx_configuration_vector,
   output      [2 : 0]                 mac_status_vector,
   input       [535 : 0]               pcs_pma_configuration_vector,
   output      [447 : 0]               pcs_pma_status_vector,

   
   output      [25:0]                  tx_statistics_vector,
   output      [29:0]                  rx_statistics_vector,
   output                              tx_statistics_valid,
   output                              rx_statistics_valid,
   
   input                               tx_axis_fifo_aresetn,
   input                               rx_axis_fifo_aresetn,

   

   //Pause axis
   input      [15:0]                   pause_val,
   input                               pause_req,

   output                              txp,
   output                              txn,
   input                               rxp,
   input                               rxn,

   input                               signal_detect,
   input                               sim_speedup_control,
   input                               tx_fault,
   output      [7:0]                   pcspma_status
   );

/*-------------------------------------------------------------------------*/

   // Signal declarations
   
   wire         [7:0]                   tx_ifg_delay;
   wire                               tx_axis_mac_aresetn;
   wire                               rx_axis_mac_aresetn;

   wire rx_axis_mac_aresetn_i  = ~reset | rx_axis_mac_aresetn;
   wire rx_axis_fifo_aresetn_i = ~reset | rx_axis_fifo_aresetn;
   wire tx_axis_mac_aresetn_i  = ~reset | tx_axis_mac_aresetn;
   wire tx_axis_fifo_aresetn_i = ~reset | tx_axis_fifo_aresetn;
   
   wire full_reset = rx_axis_fifo_aresetn_i | tx_axis_fifo_aresetn_i;

   wire         [31:0]                  tx_axis_mac_tdata;
   wire         [3:0]                   tx_axis_mac_tkeep;
   wire                                 tx_axis_mac_tvalid;
   wire                                 tx_axis_mac_tlast;
   wire                                 tx_axis_mac_tready;

   wire         [31:0]                  rx_axis_mac_tdata;
   wire         [3:0]                   rx_axis_mac_tkeep;
   wire                                 rx_axis_mac_tvalid;
   wire                                 rx_axis_mac_tuser;
   wire                                 rx_axis_mac_tlast;

   wire                                 coreclk;
   wire                                 tx_disable;

   assign coreclk_out = coreclk;


   //----------------------------------------------------------------------------
   // Instantiate the Ethernet Core Support level
   //----------------------------------------------------------------------------
  axi_10g_ethernet_0_support support_layer_i(
      .coreclk_out                     (coreclk),
      .refclk_p                        (refclk_p),
      .refclk_n                        (refclk_n),
      .dclk                            (dclk),
      .reset                           (reset),
      .resetdone_out                   (resetdone_out),
      .reset_counter_done_out          (),
      .qplllock_out                    (qplllock_out),
      .qplloutclk_out                  (),
      .qplloutrefclk_out               (),
      .txusrclk_out                    (),
      .txusrclk2_out                   (),
      .gttxreset_out                   (),
      .gtrxreset_out                   (),
      .txuserrdy_out                   (),
      .rxrecclk_out                    (rxrecclk_out),
      .tx_ifg_delay                    (tx_ifg_delay),
      .tx_statistics_vector            (tx_statistics_vector),
      .tx_statistics_valid             (tx_statistics_valid),
      .rx_statistics_vector            (rx_statistics_vector),
      .rx_statistics_valid             (rx_statistics_valid),
      .s_axis_pause_tdata              (pause_val),
      .s_axis_pause_tvalid             (pause_req),

      .tx_axis_aresetn                 (tx_axis_mac_aresetn),
      .s_axis_tx_tdata                 (tx_axis_mac_tdata),
      .s_axis_tx_tvalid                (tx_axis_mac_tvalid),
      .s_axis_tx_tlast                 (tx_axis_mac_tlast),
      .s_axis_tx_tuser                 (1'b0),
      .s_axis_tx_tkeep                 (tx_axis_mac_tkeep),
      .s_axis_tx_tready                (tx_axis_mac_tready),

      .rx_axis_aresetn                 (rx_axis_mac_aresetn),
      .m_axis_rx_tdata                 (rx_axis_mac_tdata),
      .m_axis_rx_tkeep                 (rx_axis_mac_tkeep),
      .m_axis_rx_tvalid                (rx_axis_mac_tvalid),
      .m_axis_rx_tuser                 (rx_axis_mac_tuser),
      .m_axis_rx_tlast                 (rx_axis_mac_tlast),
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


   //----------------------------------------------------------------------------
   // Add the FIFO Top Module Here
   //----------------------------------------------------------------------------
   
   
   axi_fifo_top_block_wrapper mac_fifo (
   
   .clk    (coreclk),
   .pipe_write_ack    (pipe_write_ack),  //input
   .pipe_write_data    (pipe_write_data), //output
   .pipe_write_req    (pipe_write_req),  //output
   .read_pipe_ack    (read_pipe_ack),   //input
   .read_pipe_data    (read_pipe_data),  //input
   .read_pipe_req    (read_pipe_req),   //output
   .reset        (full_reset),           //input
   .rx_axis_resetn    (rx_axis_mac_aresetn),
   .rx_axis_tdata    (rx_axis_mac_tdata),
   .rx_axis_tkeep    (rx_axis_mac_tkeep),
   .rx_axis_tlast    (rx_axis_mac_tlast),
   .rx_axis_tuser    (rx_axis_mac_tuser),
   .rx_axis_tvalid    (rx_axis_mac_tvalid),
   .tx_axis_resetn    (tx_axis_mac_aresetn),
   .tx_axis_tdata     (tx_axis_mac_tdata),
   .tx_axis_tkeep     (tx_axis_mac_tkeep),
   .tx_axis_tlast     (tx_axis_mac_tlast),
   .tx_axis_tready    (tx_axis_mac_tready),
   .tx_axis_tuser     (),
   .tx_axis_tvalid    (tx_axis_mac_tvalid),
   .tx_ifg_delay    (tx_ifg_delay)   //output
   
   );
   
   
   
   
   
   
   
/*   
  axi_10g_ethernet_0_xgmac_fifo #(
      .TX_FIFO_SIZE                    (FIFO_SIZE),
      .RX_FIFO_SIZE                    (FIFO_SIZE)
   ) ethernet_mac_fifo_i  (
      .tx_axis_fifo_aresetn            (tx_axis_fifo_aresetn_i),
      .tx_axis_fifo_aclk               (coreclk),
      .tx_axis_fifo_tdata              (tx_axis_fifo_tdata),
      .tx_axis_fifo_tkeep              (tx_axis_fifo_tkeep),
      .tx_axis_fifo_tvalid             (tx_axis_fifo_tvalid),
      .tx_axis_fifo_tlast              (tx_axis_fifo_tlast),
      .tx_axis_fifo_tready             (tx_axis_fifo_tready),
      .tx_fifo_full                    (),
      .tx_fifo_status                  (),
      .rx_axis_fifo_aresetn            (rx_axis_fifo_aresetn_i),
      .rx_axis_fifo_aclk               (coreclk),
      .rx_axis_fifo_tdata              (rx_axis_fifo_tdata),
      .rx_axis_fifo_tkeep              (rx_axis_fifo_tkeep),
      .rx_axis_fifo_tvalid             (rx_axis_fifo_tvalid),
      .rx_axis_fifo_tlast              (rx_axis_fifo_tlast),
      .rx_axis_fifo_tready             (rx_axis_fifo_tready),
      .rx_fifo_status                  (),
      .tx_axis_mac_aresetn             (tx_axis_mac_aresetn_i),
      .tx_axis_mac_aclk                (coreclk),
      .tx_axis_mac_tdata               (tx_axis_mac_tdata),
      .tx_axis_mac_tkeep               (tx_axis_mac_tkeep),
      .tx_axis_mac_tvalid              (tx_axis_mac_tvalid),
      .tx_axis_mac_tlast               (tx_axis_mac_tlast),
      .tx_axis_mac_tready              (tx_axis_mac_tready),
      .rx_axis_mac_aresetn             (rx_axis_mac_aresetn_i),
      .rx_axis_mac_aclk                (coreclk),
      .rx_axis_mac_tdata               (rx_axis_mac_tdata),
      .rx_axis_mac_tkeep               (rx_axis_mac_tkeep),
      .rx_axis_mac_tvalid              (rx_axis_mac_tvalid),
      .rx_axis_mac_tlast               (rx_axis_mac_tlast),
      .rx_axis_mac_tuser               (rx_axis_mac_tuser),
      .rx_fifo_full                    ()
   );
*/
endmodule

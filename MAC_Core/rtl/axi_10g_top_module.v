`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 01:34:54 PM
// Design Name: 
// Module Name: axi_10g_top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_10g_top_module(

   input             clk_in_p,       // Freerunning clock source
   input             clk_in_n,
   input             refclk_p,       // Transceiver reference clock source
   input             refclk_n,
   output            coreclk_out,
   
   
   //AHIR Pipe Connections
   
     input pipe_write_ack,
     output  [36:0]pipe_write_data,
     output  pipe_write_req,
     input read_pipe_ack,
     input [36:0]read_pipe_data,
     output  read_pipe_req,
   

   //  design control inputs
   input             pcs_loopback,
   input             reset,
   input             reset_error,
   input             insert_error,
   input             enable_pat_gen,
   input             enable_pat_check,
   output            serialized_stats,
   input             sim_speedup_control,
   input             enable_custom_preamble,

   //  design status outputs
   output            frame_error,
   output            gen_active_flash,
   output            check_active_flash,
   output            core_ready,
   output            qplllock_out,

   // Serial I/O from/to transceiver
   output            txp,
   output            txn,
   input             rxp,
   input             rxn

    );
    
   localparam        FIFO_SIZE  = 1024;
 
 
    // Signal declarations
    wire              enable_vlan;
    wire              reset_error_sync;
 
    wire              coreclk;
    wire              block_lock;
    wire              rxrecclk;
    wire              s_axi_aclk;
    
    wire              tx_dcm_locked;
    wire              no_remote_and_local_faults;
    wire    [79 : 0]  mac_tx_configuration_vector;
    wire    [79 : 0]  mac_rx_configuration_vector;
    wire   [2 : 0]    mac_status_vector;
    wire   [535 : 0]  pcs_pma_configuration_vector;
    wire   [447 : 0]  pcs_pma_status_vector;
 
    wire              tx_statistics_vector;
    wire              rx_statistics_vector;
    wire     [25:0]   tx_statistics_vector_int;
    wire              tx_statistics_valid_int;
    reg               tx_statistics_valid;
    reg      [27:0]   tx_statistics_shift = 0;
    wire     [29:0]   rx_statistics_vector_int;
    wire              rx_statistics_valid_int;
    reg               rx_statistics_valid;
    reg      [31:0]   rx_statistics_shift = 0;
    
    
       wire              resetdone_out;
       wire      [7:0]   pcspma_status;
    
       wire              pcs_loopback_sync;
       wire              enable_custom_preamble_coreclk_sync;
       wire              insert_error_sync;
       wire              tx_axis_aresetn;
       wire              rx_axis_aresetn;
       
       wire              tx_reset;
       wire              rx_reset;
       
   
   assign coreclk_out = coreclk;
       
          // Enable or disable VLAN mode
          assign enable_vlan = 0;
       
          // Synchronise design inputs into the applicable clock domain
          axi_10g_ethernet_0_sync_block sync_insert_error (
             .data_in                         (insert_error),
             .clk                             (coreclk),
             .data_out                        (insert_error_sync)
          );
       
          axi_10g_ethernet_0_sync_block sync_coreclk_enable_custom_preamble (
             .data_in                         (enable_custom_preamble),
             .clk                             (coreclk),
             .data_out                        (enable_custom_preamble_coreclk_sync)
          );
       
       
          axi_10g_ethernet_0_sync_block sync_pcs_loopback (
             .data_in                         (pcs_loopback),
             .clk                             (coreclk),
             .data_out                        (pcs_loopback_sync)
          );
       
          // Assign the configuration settings to the configuration vectors
          assign mac_rx_configuration_vector = {72'd0,enable_custom_preamble_coreclk_sync,4'd0,enable_vlan,2'b10};
          assign mac_tx_configuration_vector = {72'd0,enable_custom_preamble_coreclk_sync,4'd0,enable_vlan,2'b10};
       
          assign pcs_pma_configuration_vector = {425'd0,pcs_loopback_sync,110'd0};
          assign block_lock = pcspma_status[0];
          assign no_remote_and_local_faults = !mac_status_vector[0] && !mac_status_vector[1] ;
          assign core_ready = block_lock && no_remote_and_local_faults;
       
          // Combine reset sources
          assign tx_axis_aresetn  = ~reset;
          assign rx_axis_aresetn  = ~reset;
          
          
          assign serialized_stats = tx_statistics_vector || rx_statistics_vector; //Output Stats
          
             assign tx_reset  = reset;
             assign rx_reset  = reset;
    


    
    
    axi_10g_ethernet_0_fifo_block fifo_block_i(
    
        .refclk_p                        (refclk_p), //Transceiver Clock Source
        .refclk_n                        (refclk_n), //Transceiver Clock Source
        .coreclk_out                     (coreclk),  //Output of Core Clock
        .rxrecclk_out                    (rxrecclk),
        
         .dclk                            (s_axi_aclk),
         .reset                           (reset),
            
         .signal_detect                   (1'b1),
         .tx_fault                        (1'b0),
         .sim_speedup_control             (sim_speedup_control),
         .pcspma_status                   (pcspma_status),
         .resetdone_out                   (resetdone_out),
         .qplllock_out                    (qplllock_out),
    
    
        .pipe_write_ack    (pipe_write_ack),  //input
        .pipe_write_data    (pipe_write_data), //output
        .pipe_write_req    (pipe_write_req),  //output
        .read_pipe_ack    (read_pipe_ack),   //input
        .read_pipe_data    (read_pipe_data),  //input
        .read_pipe_req    (read_pipe_req), 
        .mac_tx_configuration_vector     (mac_tx_configuration_vector),
        .mac_rx_configuration_vector     (mac_rx_configuration_vector),
        .mac_status_vector               (mac_status_vector),
        .pcs_pma_configuration_vector    (pcs_pma_configuration_vector),
        .pcs_pma_status_vector           (pcs_pma_status_vector),
        
        .pause_val                       (16'b0),
        .pause_req                       (1'b0),
        
        .rx_axis_fifo_aresetn            (rx_axis_aresetn),
        .tx_axis_fifo_aresetn            (tx_axis_aresetn),
        .txp                             (txp),
        .txn                             (txn),
        .rxp                             (rxp),
        .rxn                             (rxn),
        .tx_statistics_vector            (tx_statistics_vector_int),
        .tx_statistics_valid             (tx_statistics_valid_int),
        .rx_statistics_vector            (rx_statistics_vector_int),
        .rx_statistics_valid             (rx_statistics_valid_int)   
    );
    
    axi_10g_ethernet_0_clocking axi_lite_clocking_i (
          .clk_in_p                        (clk_in_p),
          .clk_in_n                        (clk_in_n),
          .s_axi_aclk                      (s_axi_aclk),
          .tx_mmcm_reset                   (tx_reset),
          .tx_mmcm_locked                  (tx_dcm_locked)
        );
  axi_10g_ethernet_0_sync_block reset_error_sync_reg (
              .clk                             (coreclk),
              .data_in                         (reset_error),
              .data_out                        (reset_error_sync)
              );
              
              
  always @(posedge coreclk)
                 begin
                   tx_statistics_valid               <= tx_statistics_valid_int;
                   if (tx_statistics_valid_int & !tx_statistics_valid) begin
                      tx_statistics_shift            <= {2'b01,tx_statistics_vector_int};
                   end
                   else begin
                      tx_statistics_shift            <= {tx_statistics_shift[26:0], 1'b0};
                   end
                 end
              
                 assign tx_statistics_vector         = tx_statistics_shift[27];
              
                 always @(posedge coreclk)
                 begin
                   rx_statistics_valid               <= rx_statistics_valid_int;
                   if (rx_statistics_valid_int & !rx_statistics_valid) begin
                      rx_statistics_shift            <= {2'b01, rx_statistics_vector_int};
                   end
                   else begin
                      rx_statistics_shift            <= {rx_statistics_shift[30:0], 1'b0};
                   end
                 end
              
                 assign rx_statistics_vector         = rx_statistics_shift[31];
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2022 03:46:30 PM
// Design Name: 
// Module Name: ethernet_stub
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


module ethernet_stub
(

   output             clk_in_p,       // Freerunning clock source
   output             clk_in_n,
   output             refclk_p,       // Transceiver reference clock source
   output             refclk_n,
   input            coreclk_out,
   
   // AHIR FIFO Ports
   
   input [72:0]  RX_FIFO_pipe_read_data,
   output          RX_FIFO_pipe_read_req,
   input         RX_FIFO_pipe_read_ack,
   
   
   output [72:0]  TX_FIFO_pipe_write_data,
   output         TX_FIFO_pipe_write_req,
   input        TX_FIFO_pipe_write_ack,

   // Example design control outputs
   output             pcs_loopback,
   output             reset,
   output             reset_error,
   output             insert_error,
   output             enable_pat_gen,
   output             enable_pat_check,
   input            serialized_stats,
   output             sim_speedup_control,
   output             enable_custom_preamble,

   // Example design status outputs
   input            frame_error,
   input            gen_active_flash,
   input            check_active_flash,
   input            core_ready,
   input            qplllock_out,

   // Serial I/O from/to transceiver
   input            txp,
   input            txn,
   output             rxp,
   output             rxn


);



endmodule

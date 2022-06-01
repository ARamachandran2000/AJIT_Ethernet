`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 03:20:36 PM
// Design Name: 
// Module Name: ethernet_top_level
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


module ethernet_top_level
(

input clk_156_25, // Connect to output of Clk WIzard 1

output refclk_p_gth,refclk_n_gth, // AK8, AK7

input             reset,


input             clk_in_p,       // Freerunning clock source
input             clk_in_n,

output coreclk_out, //  Connect this to NIC


   // AHIR FIFO Ports
   
   output [72:0]  RX_FIFO_pipe_read_data,
   input          RX_FIFO_pipe_read_req,
   output         RX_FIFO_pipe_read_ack,
   
   
   input [72:0]  TX_FIFO_pipe_write_data,
   input         TX_FIFO_pipe_write_req,
   output        TX_FIFO_pipe_write_ack,
   
   output            txp,
   output            txn,
   input             rxp,
   input             rxn

    );
    
    

   wire             pcs_loopback;
   wire             reset_error;
   wire             insert_error;
   wire             enable_pat_gen;
   wire             enable_pat_check;
   wire            serialized_stats;
   wire             sim_speedup_control;
   wire             enable_custom_preamble;

   // Example design status outputs
   wire            frame_error;
   wire            gen_active_flash;
   wire            check_active_flash;
   wire            core_ready;
   wire            qplllock_out;



axi_10g_ethernet_0_example_design ethernet
  (
   // Clock inputs
               clk_in_p,       // Freerunning clock source
               clk_in_n,
               refclk_p_gth,       // Transceiver reference clock source
               refclk_n_gth,
               coreclk_out,

   

    RX_FIFO_pipe_read_data,
            RX_FIFO_pipe_read_req,
            RX_FIFO_pipe_read_ack,


   TX_FIFO_pipe_write_data,
           TX_FIFO_pipe_write_req,
           TX_FIFO_pipe_write_ack,

  
               pcs_loopback,
               reset,
               reset_error,
               insert_error,
               enable_pat_gen,
               enable_pat_check,
               serialized_stats,
               sim_speedup_control,
               enable_custom_preamble,


               frame_error,
               gen_active_flash,
               check_active_flash,
               core_ready,
               qplllock_out,

               txp,
               txn,
               rxp,
               rxn
   );
   
   
   
   diff_refclk_gen diff_clock
   (
   
   clk_156_25, // Connect to output of Clk WIzard 1
   
   refclk_p_gth,
   refclk_n_gth // AK8, AK7
   
   
   );









endmodule

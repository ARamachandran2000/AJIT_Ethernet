`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2022 05:52:11 PM
// Design Name: 
// Module Name: ethernet_top_dummy
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


module ethernet_top_dummy();


   wire             clk_in_p;       // Freerunning clock source
   wire             clk_in_n;
   wire             refclk_p;       // Transceiver reference clock source
   wire             refclk_n;
   wire            coreclk_out;
   
   // AHIR FIFO Ports
   
   wire [72:0]  RX_FIFO_pipe_read_data;
   wire          RX_FIFO_pipe_read_req;
   wire         RX_FIFO_pipe_read_ack;
   
   
   wire [72:0]  TX_FIFO_pipe_write_data;
   wire         TX_FIFO_pipe_write_req;
   wire        TX_FIFO_pipe_write_ack;

   // Example design control inputs
   wire             pcs_loopback;
   wire             reset;
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

   // Serial I/O from/to transceiver
   wire            txp;
   wire            txn;
   wire             rxp;
   wire             rxn;



axi_10g_ethernet_0_example_design ethernet
  (
   // Clock inputs
               clk_in_p,       // Freerunning clock source
               clk_in_n,
               refclk_p,       // Transceiver reference clock source
               refclk_n,
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
   
   
   
   
   ethernet_stub stub
   (
                       clk_in_p,       // Freerunning clock source
   clk_in_n,
   refclk_p,       // Transceiver reference clock source
   refclk_n,
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
   
   
   
   
/*-------------------------------------------------------------------------*/














endmodule

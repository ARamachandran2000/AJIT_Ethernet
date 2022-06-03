`timescale 1ns / 1ps

module ethernet_top_level
(

input  USER_CLOCK_P, USER_CLOCK_N, // For clock Routing to SMA
output USER_SMA_CLOCK_P, USER_SMA_CLOCK_N,

input             clk_in_p,       // Freerunning clock source
input             clk_in_n,
input             refclk_p,       // Transceiver reference clock source
input             refclk_n,
output            coreclk_out,    // Will be connected to NIC
input             reset,

// AHIR FIFO Ports
output [72:0]  RX_FIFO_pipe_read_data,
input          RX_FIFO_pipe_read_req,
output         RX_FIFO_pipe_read_ack,


input [72:0]  TX_FIFO_pipe_write_data,
input         TX_FIFO_pipe_write_req,
output        TX_FIFO_pipe_write_ack,

// Serial I/O from/to transceiver
output            txp,
output            txn,
input             rxp,
input             rxn

);

   
wire reset_error = 1'b0;
wire            frame_error;
wire            gen_active_flash;
wire            check_active_flash;
wire            core_ready;
wire            qplllock_out;

// SI570 156.25MHz user clock input to route to USER_SMA_CLOCK output
// Then connect SMA cables to get 156.25MHz to MGTREFCLK input of QUAD 113
// for SFP use

wire userclock, CLK156, MYCLK ;

IBUFGDS #(.DIFF_TERM("TRUE"), .IOSTANDARD("LVDS") ) u_clk156
           (.I( USER_CLOCK_P ), .IB( USER_CLOCK_N ), .O ( userclock ) );

BUFG ck156 (.I( userclock ), .O( CLK156 )); 

// Clean up clock using ODDR flip flop for best duty cycle clock output
ODDR   u10 (.D1(1'b1), .D2(1'b0), .CE(1'b1), .C( CLK156 ), .Q( MYCLK ) );

// Use LVDS output buffer to create GTH REFCLK for SFP testing
OBUFDS u11 (.I( MYCLK ), .O( USER_SMA_CLOCK_P ), .OB( USER_SMA_CLOCK_N ) );


axi_10g_ethernet_0_example_design ethernet_inst
(
    
      .reset                    (reset),
      .reset_error            (reset_error),

      .refclk_p               (refclk_p),         // Transcevier reference clock source
      .refclk_n               (refclk_n),
      .coreclk_out            (coreclk_out),

      .clk_in_p               (clk_in_p),         // Freerunning clock source
      .clk_in_n               (clk_in_n),
      
      
      
      .RX_FIFO_pipe_read_data (RX_FIFO_pipe_read_data),
      .RX_FIFO_pipe_read_req  (RX_FIFO_pipe_read_req),
      .RX_FIFO_pipe_read_ack  (RX_FIFO_pipe_read_ack),
      
      
      .TX_FIFO_pipe_write_data (TX_FIFO_pipe_write_data) ,
      .TX_FIFO_pipe_write_req  (TX_FIFO_pipe_write_req),
      .TX_FIFO_pipe_write_ack  (TX_FIFO_pipe_write_ack),

      .enable_custom_preamble (1'b0),

      .pcs_loopback           (1'b0),
      .insert_error           (1'b0),

      .enable_pat_gen         (1'b0),
      .enable_pat_check       (1'b0),

      .frame_error            (frame_error),
      .gen_active_flash       (),
      .sim_speedup_control    (1'b0),
      .check_active_flash     (),
      .qplllock_out           (),
      .serialized_stats       (),
      .core_ready             (core_ready),
      .txp                    (txp),
      .txn                    (txn),
      .rxp                    (rxp),
      .rxn                    (rxn)
      
);

endmodule

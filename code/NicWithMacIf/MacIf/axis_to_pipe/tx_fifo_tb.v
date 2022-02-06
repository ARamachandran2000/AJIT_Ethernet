`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2021 08:23:41 PM
// Design Name: 
// Module Name: tx_fifo_tb
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


module tx_fifo_tb();

parameter N     = 32;
parameter S     = 4; //log2(N)
parameter D     = N + S + 1;
parameter DEPTH = 128;
parameter D_S   = 7; //log2(DEPTH)


    reg clk;
    reg reset;
    wire tx_axis_resetn;
    wire [N-1 :0] tx_axis_tdata ;
    wire [S-1 :0] tx_axis_tkeep ;
    wire tx_axis_tvalid ;
    wire tx_axis_tuser;
    wire [7:0] tx_ifg_delay ;
    wire tx_axis_tlast;
    reg tx_axis_tready;
    
    reg [D-1 :0]read_pipe_data;
    wire read_pipe_req;
    reg read_pipe_ack;

    integer i;
    


tx_fifo dut (clk,
               reset,
               tx_axis_resetn,
               tx_axis_tdata,
               tx_axis_tkeep,
               tx_axis_tvalid,
               tx_axis_tuser,
               tx_ifg_delay,
               tx_axis_tlast,
               tx_axis_tready,
               read_pipe_data,
               read_pipe_req,
               read_pipe_ack);
               
always
    begin
    
    clk = 0; #5;
    
    clk = ~clk; #5;
    
    
    end
    
initial
begin

reset = 0;
tx_axis_tready = 1;
read_pipe_ack = 0;

#15;

read_pipe_ack = 1;
read_pipe_data = 1;

#10;
read_pipe_data = 500;
read_pipe_ack = 0;

#10;

read_pipe_data = 4000;
read_pipe_ack = 1;

#10;


end






endmodule

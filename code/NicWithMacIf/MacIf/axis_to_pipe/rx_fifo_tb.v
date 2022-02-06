`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module rx_fifo_tb();

    parameter N     = 32;
    parameter S     = 4; //log2(N)
    parameter D     = N + S + 1;
    parameter DEPTH = 128;
    parameter D_S   = 7; //log2(DEPTH)
reg clk;
reg reset;  
wire rx_axis_resetn;
reg  [N-1 : 0] rx_axis_tdata;
reg  [S-1 : 0] rx_axis_tkeep;
reg rx_axis_tvalid;
reg rx_axis_tuser;
reg rx_axis_tlast;
wire [N-1 : 0] pipe_write_data;
wire pipe_write_req;
reg  pipe_write_ack;

integer i;

rx_fifo dut(   clk,
               reset,
               rx_axis_resetn,
               rx_axis_tdata,
               rx_axis_tkeep,
               rx_axis_tvalid,
               rx_axis_tuser,
               rx_axis_tlast,
               pipe_write_data,
               pipe_write_req,
               pipe_write_ack);

always
    begin
    
    clk = 0; #5;
    
    clk = ~clk; #5;
    
    
    end
    

initial
begin

reset = 0;
rx_axis_tlast = 0;
rx_axis_tuser = 0;
rx_axis_tvalid = 0;
pipe_write_ack = 0;


#15;

rx_axis_tvalid = 1;
rx_axis_tdata = 1;
rx_axis_tkeep = 15;

#10;

rx_axis_tdata = 2;
rx_axis_tkeep = 15;


#10;

rx_axis_tdata = 3;
rx_axis_tlast = 0;
rx_axis_tuser = 0;
rx_axis_tkeep = 15;


#10;




for (i = 0; i<125; i = i+1)
begin

rx_axis_tdata = i + 4;
rx_axis_tkeep = 15;

#10;


end

#20;

pipe_write_ack = 1;

#5

pipe_write_ack = 0;

#5;

pipe_write_ack = 1;

#5;
pipe_write_ack = 0;


end








endmodule

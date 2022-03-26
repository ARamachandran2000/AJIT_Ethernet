`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2022 12:24:31 PM
// Design Name: 
// Module Name: transmit_if
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


module transmit_if
(
clk,
tx_axis_mac_tdata,
tx_axis_mac_tvalid,
tx_axis_mac_tlast ,   
tx_axis_mac_tuser, 
tx_axis_mac_tready,


read_pipe_data,
read_pipe_req,
read_pipe_ack

);
parameter N2 = 8;
parameter N = 64;
parameter S = 8; //log2(N)
parameter D = N + S + 1;

input clk;
output  [N2 - 1 : 0] tx_axis_mac_tdata ;    
output  tx_axis_mac_tvalid ;
output  tx_axis_mac_tlast ;   
output  tx_axis_mac_tuser; 
input tx_axis_mac_tready;

input [D-1:0]read_pipe_data;
output read_pipe_req;
input read_pipe_ack;

wire reset = 0;
wire tx_axis_resetn = 1;

wire [N - 1 : 0] tx_axis_tdata;
wire [7 : 0] tx_axis_tkeep; 
wire tx_axis_tvalid;
wire tx_axis_tuser;
wire tx_axis_tlast;
wire tx_axis_tready;



tx_concat tx_concat_block
(

    .clk(clk),
    .tx_axis_mac_tdata (tx_axis_mac_tdata),
    .tx_axis_mac_tvalid (tx_axis_mac_tvalid),
    .tx_axis_mac_tlast(tx_axis_mac_tlast) ,   
    .tx_axis_mac_tuser(tx_axis_mac_tuser), 
    .tx_axis_mac_tready(tx_axis_mac_tready),
  
    .tx_axis_tdata(tx_axis_tdata),
    .tx_axis_tkeep(tx_axis_tkeep), 
    .tx_axis_tvalid(tx_axis_tvalid),
    .tx_axis_tuser(tx_axis_tuser),
    .tx_axis_tlast(tx_axis_tlast),
    .tx_axis_tready(tx_axis_tready)

);


tx_fifo tx_fifo_block
(
.clk(clk),
.reset(reset),
.tx_axis_resetn(tx_axis_resetn),
.tx_axis_tdata(tx_axis_tdata),
.tx_axis_tkeep(tx_axis_tkeep),
.tx_axis_tvalid(tx_axis_tvalid),
.tx_axis_tuser(tx_axis_tuser),

.tx_axis_tlast(tx_axis_tlast),
.tx_axis_tready(tx_axis_tready),

.read_pipe_data(read_pipe_data),
.read_pipe_req(read_pipe_req),
.read_pipe_ack(read_pipe_ack)
);













endmodule

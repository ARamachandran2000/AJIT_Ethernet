`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 07:57:48 PM
// Design Name: 
// Module Name: mac_to_nic_interface
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


module mac_to_nic_interface
(

    clk,
    reset,
    
    // RX Interface
    
    rx_axis_resetn,
    rx_axis_tdata,
    rx_axis_tkeep,
    rx_axis_tvalid,
    rx_axis_tuser,
    rx_axis_tlast,
    
    RX_FIFO_pipe_read_data,
    RX_FIFO_pipe_read_req,
    RX_FIFO_pipe_read_ack,
    
    // TX Interface
    
    tx_axis_resetn,
    tx_axis_tdata,
    tx_axis_tkeep,
    tx_axis_tvalid,
    tx_axis_tlast,
    tx_axis_tready,
    
    // NIC Pipe  Interface (Write to Tx fifo pipe)
    
    TX_FIFO_pipe_write_data,
    TX_FIFO_pipe_write_req,
    TX_FIFO_pipe_write_ack
    
);



    parameter MAC_WIDTH = 64;
    parameter TKEEP_WIDTH = 8; //log2(N)
    parameter NIC_WIDTH = MAC_WIDTH + TKEEP_WIDTH + 1; 
    
    
    input clk;
    input reset; 


    output  tx_axis_resetn;
    output  [MAC_WIDTH-1 :0] tx_axis_tdata;
    output  [TKEEP_WIDTH-1 :0] tx_axis_tkeep;
    output  tx_axis_tvalid;
    output  tx_axis_tlast;
    input      tx_axis_tready;
    
    

    input     [NIC_WIDTH-1:0]  TX_FIFO_pipe_write_data;
    input                      TX_FIFO_pipe_write_req;
    output                     TX_FIFO_pipe_write_ack;
    
    output  rx_axis_resetn;
    input  [MAC_WIDTH-1 : 0] rx_axis_tdata;
    input  [TKEEP_WIDTH-1 : 0] rx_axis_tkeep;
    input rx_axis_tvalid;
    input rx_axis_tuser;
    input rx_axis_tlast;
    
    output      [NIC_WIDTH-1:0]  RX_FIFO_pipe_read_data;
    input                      RX_FIFO_pipe_read_req;
    output                     RX_FIFO_pipe_read_ack;
    
    
    
    mac_rx_interface rxi
    (
    
    
                   clk,
                   reset,
                   
                   rx_axis_resetn,
                   rx_axis_tdata,
                   rx_axis_tkeep,
                   rx_axis_tvalid,
                   rx_axis_tuser,
                   rx_axis_tlast,
                   
                   RX_FIFO_pipe_read_data,
                   RX_FIFO_pipe_read_req,
                   RX_FIFO_pipe_read_ack
    );
    
    
    mac_tx_interface txi
    (
                   clk,
                   reset,
                   
                   // Connect to MAC Tx interface
                   
                   tx_axis_resetn,
                   tx_axis_tdata,
                   tx_axis_tkeep,
                   tx_axis_tvalid,
                   tx_axis_tlast,
                   tx_axis_tready,
                   
                   // NIC Pipe  Interface (Write to Tx fifo pipe)
                   
                   TX_FIFO_pipe_write_data,
                   TX_FIFO_pipe_write_req,
                   TX_FIFO_pipe_write_ack
                   
    ); 
    




endmodule

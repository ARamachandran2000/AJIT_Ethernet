`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 10:10:52 AM
// Design Name: 
// Module Name: mac_tx_fifo
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
module mac_tx_interface
(
               clk,
               reset,
               
               // Connect to MAC Tx interface
               
               tx_axis_resetn,
               tx_axis_tdata,
               tx_axis_tkeep,
               tx_axis_tvalid,
               tx_axis_tuser,
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


    output reg tx_axis_resetn;
    output reg [MAC_WIDTH-1 :0] tx_axis_tdata;
    output reg [TKEEP_WIDTH-1 :0] tx_axis_tkeep;
    output reg tx_axis_tvalid = 0;
    output reg tx_axis_tuser;
    //output reg [7:0] tx_ifg_delay = 0;
    output reg tx_axis_tlast;
    input      tx_axis_tready;
    
    

    input     [NIC_WIDTH-1:0]  TX_FIFO_pipe_write_data;
    input                      TX_FIFO_pipe_write_req;
    output                     TX_FIFO_pipe_write_ack;
    
    
    reg reset_reg                 = 0;
    reg [NIC_WIDTH-1:0] pipe_data = 0;
    reg data_valid                = 0;
    reg data_sent                 = 1;  
    reg req_reg                   = 0;
    
    
    assign TX_FIFO_pipe_write_ack = (req_reg == 1) ? 1 : 0;
    
    
/////////////////////////////////////////////Reset Logic//////////////////////////////////////////////////
    always@(posedge clk)
    begin
        
        if (reset == 1'b1)
        begin
            reset_reg      <= 1;
            tx_axis_resetn <= 0;
        end
        
        else
        begin
        reset_reg      <= 0;
        tx_axis_resetn <= 1;
        
        end
    end
////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////Read from AHIR Fifo//////////////////////////////////////////
    
    always@(posedge clk)
    begin
        
        if (reset_reg == 1'b1)
        begin
            
            req_reg    <= 1'b0;
            data_valid <= 1'b0;
            
        end
        
        else
        begin
        
        if (data_sent == 1'b1)
        begin
            req_reg <= 1'b1;
            
            if (TX_FIFO_pipe_write_req == 1'b1)
            begin
                
                pipe_data  <= TX_FIFO_pipe_write_data;
                data_valid <= 1'b1;
                
            end
            
            else
                data_valid <= 1'b0;
            
        end
        
        else
            req_reg <= 1'b0;
    end
    
    end
//////////////////////////////////////////////////////////////////////////////////////////////////////



    
/////////////////////////////////////AXI-s Transmitter/////////////////////////////////////////////////////////////////
    always@(posedge clk)
    begin
        
        if (reset_reg == 1'b1)
        begin
            data_sent      <= 1'b1;
            tx_axis_tvalid <= 1'b0;
        end
        
        else
        begin
        
        if (data_valid == 1'b1)
        begin
            
            tx_axis_tvalid <= 1'b1;
            tx_axis_tdata  <= pipe_data[NIC_WIDTH-2:TKEEP_WIDTH];
            tx_axis_tkeep  <= pipe_data[TKEEP_WIDTH-1:0];
            tx_axis_tlast  <= pipe_data[NIC_WIDTH-1];
            
            if (tx_axis_tready == 1'b1)
            begin
                data_sent <= 1;
            end
            
            else
            data_sent <= 0;
            
        end
        
        
        else
        begin
        
        tx_axis_tvalid <= 1'b0;
        
    end
    end
    
    
    end
    
    
//////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
         
               
               
               
               
            
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 03:46:22 PM
// Design Name: 
// Module Name: mac_rx_interface
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


module mac_rx_interface
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

    parameter MAC_WIDTH = 64;
    parameter TKEEP_WIDTH = 8; //log2(N)
    parameter NIC_WIDTH = MAC_WIDTH + TKEEP_WIDTH + 1; 
    
    

    input clk;
    input reset;
    
    output reg rx_axis_resetn;
    input  [MAC_WIDTH-1 : 0] rx_axis_tdata;
    input  [TKEEP_WIDTH-1 : 0] rx_axis_tkeep;
    input rx_axis_tvalid;
    input rx_axis_tuser;
    input rx_axis_tlast;
    
    output reg     [NIC_WIDTH-1:0]  RX_FIFO_pipe_read_data;
    input                      RX_FIFO_pipe_read_req;
    output                     RX_FIFO_pipe_read_ack;
    
    reg reset_reg                 = 0;
    reg [NIC_WIDTH-1:0] pipe_data = 0;
    reg [NIC_WIDTH-1:0] write_data = 0;
    reg data_valid                = 0;
    reg data_sent                 = 1;  
    reg req_reg                   = 0;
    
    
    assign RX_FIFO_pipe_read_ack = (req_reg == 1) ? 1 : 0;
    
    
    //////////////////////////////////////Reset Logic////////////////////////////////////////////
    
    always@(posedge clk)
    begin
        
        if (reset == 1'b1)
        begin
            reset_reg      <= 1;
            rx_axis_resetn <= 0;
        end
        
        else
        begin
        reset_reg      <= 0;
        rx_axis_resetn <= 1;
        
    end
    
    end
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////AXI-S Data Loading////////////////////////////////////
    
    always@(posedge clk)
    begin
        
        if (reset_reg == 1'b1)
        begin
            data_valid <= 1'b0;
        end
        
        else
        begin
        if (rx_axis_tvalid == 1'b1)
        begin
            
            if (rx_axis_tlast == 1'b1 && rx_axis_tuser == 1'b1)
            begin
                pipe_data  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep}; //Valid Data
                data_valid <= 1'b1;
            end
            
            else if (rx_axis_tlast == 1'b1 && rx_axis_tuser == 1'b0)
            begin
                pipe_data  <= {rx_axis_tlast,32'd1,4'd0}; //Indicates Bad Packet format received since FCS didn't pass
                data_valid <= 1'b1;
            end
        
            else
            begin
                pipe_data  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep}; //Valid Data
                data_valid <= 1'b1;
            end
    
        end
    
    
    
        else
        begin
            data_valid <= 1'b0;
        end
    
        
        end
    
    
    
    end


//////////////////////////////////////////Write to AHIR Fifo//////////////////////////////////////////
    
    always@(posedge clk)
    begin
    
        write_data = pipe_data;
        
        if (reset_reg == 1'b1)
        begin          
            req_reg    <= 1'b0;           
        end
        
        else
        begin
        
        if (data_valid == 1'b1)
        begin
            req_reg <= 1'b1;
            
            if (RX_FIFO_pipe_read_req == 1'b1)
            begin
                
                RX_FIFO_pipe_read_data <= write_data;             
            end          
        end
        
        else
            req_reg <= 1'b0;
    end
    
    end
//////////////////////////////////////////////////////////////////////////////////////////////////////





endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
 
 AXI-s Interfaces :
 rx_axis_resetn --> Output (Active low reset for rx path)
 rx_axis_tdata [31:0]   --> Input
 rx_axis_tkeep [3:0]    --> Input
 rx_axis_tvalid         --> Input
 rx_axis_tuser          --> Input
 rx_axis_tlast          --> Input
 
 
 AHIR-Compatible FIFO Interface :
 
 pipe_write_data [31:0]  --> Output
 pipe_write_req          --> Output
 pipe_write_ack          --> Input
 
 
 FIFO Pointer Convention : 
  
   2 3 4 5 6 7 8 9 10
 - - - - - - - - - - 
 R                 F
 Rear always points to empty space ahead of the last element
 Front points to element to pop
 */
//////////////////////////////////////////////////////////////////////////////////


module rx_fifo(clk,
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
    
    
    parameter N     = 32;
    parameter S     = 4; //log2(N)
    parameter D     = N + S + 1;
    parameter DEPTH = 128;
    parameter D_S   = 7; //log2(DEPTH)
    
    input clk;
    input reset;
    
    output reg rx_axis_resetn;
    input  [N-1 : 0] rx_axis_tdata;
    input  [S-1 : 0] rx_axis_tkeep;
    input rx_axis_tvalid;
    input rx_axis_tuser;
    input rx_axis_tlast;
    
    
    output reg [N-1 : 0] pipe_write_data;
    output reg pipe_write_req;
    input  pipe_write_ack;
    
    
    //Create Fifo of Depth 128
    
    reg [D-1 : 0] fifo [DEPTH - 1 : 0];
    
    //Create Pointers to FIFO_POS
    
    reg [D_S-1:0] fifo_pos_front = 0;
    reg [D_S-1:0] fifo_pos_rear = 0;
    
    //Miscellaneous Variables
    
    reg reset_reg = 0; //Set when reset is asserted
    reg data_valid = 0; //Signal from AXI-S  to Pipe to indicate to load data into fifo.
    
    reg [D-1:0] fifo_data = 0; // Concatenated Data assembled on AXI-S side and sent to fifo
    
    reg fifo_full = 0;
    
    
    
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
    
    
    /////////////////////////////////////FIFO  Logic///////////////////////////////////////////
    
    always@(posedge clk)
    begin
        if (reset_reg == 1'b1)
        begin
            pipe_write_req <= 1'b0; //No Data to send to Pipe now since reset has been asserted
            fifo_pos_front <= 1'b0; // Reset Position to 0
            fifo_pos_rear  <= 1'b0;
            fifo_full      <= 1'b0;
        end
        
        else
        begin
        if (data_valid == 1'b1)
        begin
            
            if (fifo_full != 1'b1)  // If FIFO is full then the packets will be dropped
            begin
            $display("Running");
            if (((fifo_pos_rear + 1) % DEPTH) == fifo_pos_front)
                   fifo_full <= 1'b1;
            else
            begin
                fifo[fifo_pos_rear] <= fifo_data;
                fifo_pos_rear       <= (fifo_pos_rear + 1) % DEPTH;
            end
                
                
            end
                
            end
            
            if (fifo_pos_rear != fifo_pos_front)  //Indicates that Data is available to send
            begin
                pipe_write_req  <= 1'b1;
                pipe_write_data <= fifo[fifo_pos_front];
                
                if (pipe_write_ack == 1'b1)
                begin
                    fifo_pos_front <= (fifo_pos_front + 1) % DEPTH;
                    
                    if (fifo_full == 1'b1)
                        fifo_full <= 1'b0;
                    
                    if (fifo_pos_front == fifo_pos_rear) //Means Fifo is empty
                    begin
                        fifo_pos_front <= 1'b0;
                        fifo_pos_rear  <= 1'b0;
                        fifo_full      <= 1'b0;
                        pipe_write_req <= 1'b0;
                        
                    end
                end
            end
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
                fifo_data  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep}; //Valid Data
                data_valid <= 1'b1;
            end
            
            else if (rx_axis_tlast == 1'b1 && rx_axis_tuser == 1'b0)
            begin
            fifo_data  <= {rx_axis_tlast,32'd1,4'd0}; //Indicates Bad Packet format received since FCS didn't pass
            data_valid <= 1'b1;
        end
        
        else
        begin
        fifo_data  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep}; //Valid Data
        data_valid <= 1'b1;
        end
    
    end
    
    
    
    else
    begin
    data_valid <= 1'b0;
    end
    
    
    
    
    end
    
    
    
    end
    
    
    
endmodule

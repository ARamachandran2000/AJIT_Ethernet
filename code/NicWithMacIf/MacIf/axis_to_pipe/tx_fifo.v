`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
 
 About : Load Data from AHIR Fifo and send on an AXI-s Interface to the MAC.
 
 Can send Data in Burst Mode if Available, with boundaries defined solely by tx_axis_tlast.
 Ports :
 
 AXI-s Interface :
 
 tx_axis_resetn --> Output
 tx_axis_tdata[36:0] --> Output
 tx_axis_tkeep[3:0] --> Output
 tx_axis_tvalid --> Output
 tx_axis_tuser  --> Output
 tx_ifg_delay   --> Output
 tx_axis_tlast  --> Output
 tx_axis_ready  -> Input
 
 
 FiFo Interface :
 read_pipe_data [36 : 0] -> Input
 read_pipe_req           --> Output
 read_pipe_ack           --> Input
 
 
 */
//////////////////////////////////////////////////////////////////////////////////


module tx_fifo(clk,
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
    
    
    
    parameter N = 32;
    parameter S = 4; //log2(N)
    parameter D = N + S + 1;
    
    input clk;
    input reset;
    output reg tx_axis_resetn;
    output reg [N-1 :0] tx_axis_tdata = 0;
    output reg [S-1 :0] tx_axis_tkeep = 0;
    output reg tx_axis_tvalid = 0;
    output reg tx_axis_tuser = 0;
    output reg [7:0] tx_ifg_delay = 0;
    output reg tx_axis_tlast = 0;
    input tx_axis_tready;
    
    input [D-1:0]read_pipe_data;
    output read_pipe_req;
    input read_pipe_ack;
    
    
    //Miscellaneous signals
    
    reg reset_reg         = 0;
    reg [D-1:0] pipe_data = 0;
    reg data_valid        = 0;
    reg data_sent         = 1;
    
    reg req_reg = 0;
    
    
    
    assign read_pipe_req = (req_reg == 1) ? 1 : 0;
    
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
            
            if (read_pipe_ack == 1'b1)
            begin
                
                pipe_data  <= read_pipe_data;
                data_valid <= 1'b1;
                
            end
            
            else
                data_valid <= 1'b0;
            
        end
        
        else
        begin
        req_reg <= 1'b0;
    end
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
            tx_axis_tdata  <= pipe_data[N-2:S];
            tx_axis_tkeep  <= pipe_data[S-1:0];
            tx_axis_tlast  <= pipe_data[N-1];
            
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

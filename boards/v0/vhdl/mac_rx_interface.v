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
	       rx_axis_tready,
               
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
    output reg rx_axis_tready;
    input  [MAC_WIDTH-1 : 0] rx_axis_tdata;
    input  [TKEEP_WIDTH-1 : 0] rx_axis_tkeep;
    input rx_axis_tvalid;
    input rx_axis_tuser;
    input rx_axis_tlast;
    
    output      [NIC_WIDTH-1:0]  RX_FIFO_pipe_read_data;
    input                      RX_FIFO_pipe_read_req;
    output       reg              RX_FIFO_pipe_read_ack;
    
    reg reset_reg                 = 0;
    reg [NIC_WIDTH-1:0] pipe_data = 0;
    reg [NIC_WIDTH-1:0] write_data = 0;
    reg data_valid                = 0;
    reg data_sent                 = 1;  
    reg req_reg                   = 0;
    
    
    
  
    
    
    reg [NIC_WIDTH - 1 : 0] rx_fifo [0 : 512];
    
    integer write_pointer = 0;
    integer read_pointer = 0;


    
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



assign RX_FIFO_pipe_read_data = rx_fifo[read_pointer];

always@(posedge clk)
begin

        
        if (reset_reg == 1'b1)
        begin
            data_valid <= 1'b0;    
            write_pointer = 0;
            read_pointer = 0;

        end
        

            
        
     
     	 if (RX_FIFO_pipe_read_req == 1'b1 && (write_pointer != read_pointer))
       begin
           read_pointer = (read_pointer + 1) % 512;   
       end

	

		

	
	if((write_pointer + 1) == read_pointer)
	begin

		rx_axis_tready = 1'b0;

	end
	
	else
		rx_axis_tready = 1'b1;



	if(rx_axis_tvalid == 1 && ((write_pointer + 1) != read_pointer))
	begin
 if (rx_axis_tlast == 1'b1 && rx_axis_tuser == 1'b1)
            begin
                pipe_data  = {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep}; //Valid Data
            end
            
            else if (rx_axis_tlast == 1'b1 && rx_axis_tuser == 1'b0)
            begin
                pipe_data  = {rx_axis_tlast,32'd1,4'd0}; //Indicates Bad Packet format received since FCS didn't pass
            end
        
            else
            begin
                pipe_data  = {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep}; //Valid Data
            end

	    rx_fifo[write_pointer] = pipe_data;
        write_pointer = (write_pointer  + 1) % 512;  


	end
	

        if(write_pointer == read_pointer)
        begin
            RX_FIFO_pipe_read_ack = 1'b0;
        end
        
        else
            RX_FIFO_pipe_read_ack = 1'b1;
            

end


endmodule
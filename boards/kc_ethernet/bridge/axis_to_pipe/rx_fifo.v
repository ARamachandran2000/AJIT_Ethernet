module mac_rx_interface
(
	clk,
	reset,

	rx_axis_tdata,
	rx_axis_tkeep,
	rx_axis_tvalid,
	rx_axis_tlast,
	rx_axis_tready,

	RX_FIFO_pipe_read_data,
	RX_FIFO_pipe_read_req,
	RX_FIFO_pipe_read_ack
);

	parameter MAC_WIDTH = 8;
	parameter TKEEP_WIDTH = 1; //N/8
	parameter NIC_WIDTH = MAC_WIDTH + TKEEP_WIDTH + 1; 

	parameter Q = 2047;

	input clk;
	input reset;

	input  [MAC_WIDTH-1 : 0] rx_axis_tdata;
	input  [TKEEP_WIDTH-1 : 0] rx_axis_tkeep;
	input rx_axis_tvalid;
	output  rx_axis_tready;
	input rx_axis_tlast;

	output      [NIC_WIDTH-1:0]  RX_FIFO_pipe_read_data;
	input                        RX_FIFO_pipe_read_req;
	output                       RX_FIFO_pipe_read_ack;

    
    

	(* mark_debug = "true" *)reg  [10:0] read_pointer;
	(* mark_debug = "true" *)reg  [10:0] write_pointer;

	(* mark_debug = "true" *)reg [NIC_WIDTH - 1 : 0] queue [Q : 0];
	reg ack_reg;

	   
	// 1 only iff reset = 0 and Q not full
	assign rx_axis_tready = (reset != 1 && (((write_pointer + 1) & Q) != read_pointer)) ? 1'b1 : 1'b0;
	// 1 only iff reset = 0 and Q not empty
	assign RX_FIFO_pipe_read_ack = (reset != 1 && (read_pointer != write_pointer)) ? 1'b1 : 1'b0;
	//assign RX_FIFO_pipe_read_ack = ack_reg;
	// data from queue
	assign RX_FIFO_pipe_read_data = queue [read_pointer];


	//
	//  push data to queue
	//    
	always@(posedge clk)
		begin
		
		$display (" RX %t :  wp =%d, rp =%d, rx_axis_tdata = %x \n",$time, write_pointer, read_pointer, rx_axis_tdata);
		if(reset == 1'b1)
			begin
			     write_pointer <= 11'd0;
			end
		else
			begin
			
			if((((write_pointer + 1) & Q) != read_pointer) && (rx_axis_tvalid == 1))
				begin
					queue[write_pointer]  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep};
					write_pointer <= (write_pointer + 1) & Q;	
				end
			end
			
		end
	
	// update read_pointer after successful read
	always@(posedge clk)
		begin
		
		$display (" Send RX %t :  wp =%d, rp =%d \n",$time, write_pointer, read_pointer);
		if(reset == 1'b1)
			begin
				read_pointer <= 11'd0;			
			end
		else
			begin
			
				if((read_pointer != write_pointer) && (RX_FIFO_pipe_read_req == 1'b1))
					begin
						read_pointer <= (read_pointer + 1 ) & Q;
					end
			end
		end
endmodule



	
	/*
	reg rx_axis_tready_reg;
    reg [NIC_WIDTH-1:0] RX_FIFO_pipe_read_data_reg;
    reg RX_FIFO_pipe_read_ack_reg;
	
	assign rx_axis_tready = rx_axis_tready_reg;
	assign RX_FIFO_pipe_read_data = RX_FIFO_pipe_read_data_reg;
	assign RX_FIFO_pipe_read_ack = RX_FIFO_pipe_read_ack_reg;
	
	
	always@(posedge clk)
	   begin
	   
	       if(reset == 1'b1)
	           begin
	               rx_axis_tready_reg <= 1'b0;
	               RX_FIFO_pipe_read_data_reg <= 0;
	               RX_FIFO_pipe_read_ack_reg <= 1'b0;
	               
	               read_pointer <= 11'd0;
	               write_pointer <= 11'd0;
	           end
            else
                begin
                    // if queue is not empty and pipe_read_req == 1
                    //      => increament read pointer
                    if((RX_FIFO_pipe_read_ack_reg == 1'b1) && (read_pointer != write_pointer))
                        begin
                            read_pointer <= (read_pointer + 1 ) & Q;
                        end
                    else
                        read_pointer <= read_pointer;
                        
                    // queue id not full
                    if(((write_pointer + 1) & Q) != read_pointer)
                        begin
                            if(rx_axis_tvalid == 1'b1)
                                begin
                                    queue[write_pointer]  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep};
                                    write_pointer <= (write_pointer + 1) & Q;
                                    RX_FIFO_pipe_read_ack_reg <= 1'b1;
                                end
                        end
                    // queue is full
                    else
                        RX_FIFO_pipe_read_ack_reg <= 1'b1;
                end
	   
	   end*/
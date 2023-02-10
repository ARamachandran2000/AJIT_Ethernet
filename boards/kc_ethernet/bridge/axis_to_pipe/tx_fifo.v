module mac_tx_interface
(
               clk,
               reset,
               
               // Connect to MAC Tx interface
               
               tx_axis_tdata,
               tx_axis_tkeep,
               tx_axis_tvalid,
               tx_axis_tlast,
               tx_axis_tready,
               
               // ahir Pipe  Interface (Write to Tx fifo pipe)
               
               TX_FIFO_pipe_write_data,
               TX_FIFO_pipe_write_req,
               TX_FIFO_pipe_write_ack
);  

    parameter MAC_WIDTH = 8;
    parameter TKEEP_WIDTH = 1; //N/8
    parameter NIC_WIDTH = MAC_WIDTH + TKEEP_WIDTH + 1; 
    parameter DEPTH = 2047;
    
    input clk;
    input reset; 

    output reg [MAC_WIDTH-1 :0] tx_axis_tdata;
    output reg [TKEEP_WIDTH-1 :0] tx_axis_tkeep;
    output tx_axis_tvalid;
    output reg tx_axis_tlast;
    input      tx_axis_tready;

    input     [NIC_WIDTH-1:0]  TX_FIFO_pipe_write_data;
    input                      TX_FIFO_pipe_write_req;
    output                     TX_FIFO_pipe_write_ack;

	(* mark_debug = "true" *)reg [10:0] read_pointer;
	(* mark_debug = "true" *)reg [10:0] write_pointer;

	(* mark_debug = "true" *)reg [NIC_WIDTH - 1 : 0] queue [DEPTH : 0]; // 511


    assign tx_axis_tvalid = ((reset != 1'b1) && (read_pointer != write_pointer)) ? 1'b1 : 1'b0;
    assign TX_FIFO_pipe_write_ack = ((reset != 1'b1) && (((write_pointer + 1) & DEPTH) != read_pointer))? 1'b1 : 1'b0;

	always @ (posedge clk)
	   begin

            if(reset == 1'b1)
                begin
                    write_pointer <= 11'd0;
                end
            else
                begin
                    if ((TX_FIFO_pipe_write_req == 1'b1) && (((write_pointer + 1) & DEPTH) != read_pointer))
                        begin
                            queue[write_pointer]  <= TX_FIFO_pipe_write_data;
                            write_pointer <= ((write_pointer + 1) & DEPTH);
                        end
                end
	   end
	   
	always @ (posedge clk)
        begin
            
            if(reset == 1'b1)
                begin
                    read_pointer <= 11'd0;
                end
            else
                begin
                    if( (tx_axis_tready == 1'b1) && (read_pointer != write_pointer))
                        begin
                            tx_axis_tdata  <= queue[read_pointer][NIC_WIDTH-2:TKEEP_WIDTH];
                            tx_axis_tkeep  <= queue[read_pointer][TKEEP_WIDTH-1:0];
                            tx_axis_tlast  <= queue[read_pointer][NIC_WIDTH-1];
                            read_pointer <= ((read_pointer + 1) & DEPTH);
                        end
                end      
        end
	
endmodule














	/*always@(posedge clk)
	begin
		if(reset == 1'b1)
		begin
			TX_FIFO_pipe_write_ack <= 1'b0;
			tx_axis_tvalid <= 1'b0;
	
			read_pointer <= 11'd0;
			write_pointer <= 11'd0;	
			
			tx_axis_tdata <= 0;
			tx_axis_tkeep <= 0;
			tx_axis_tlast <= 1'b0;
					
		end

		else
		begin
			// queue not empty so data is valid
			if(read_pointer != write_pointer)
				tx_axis_tvalid <= 1'b1;
			else
				tx_axis_tvalid <= 1'b0;

            // Queue is not full 
			if(((write_pointer + 1) & DEPTH) != read_pointer)
				TX_FIFO_pipe_write_ack <= 1'b1;
			else
				TX_FIFO_pipe_write_ack <= 1'b0;


            
			if(TX_FIFO_pipe_write_req == 1'b1 && (((write_pointer + 1) & DEPTH) != read_pointer))
			begin
				
		        queue[write_pointer]  <= TX_FIFO_pipe_write_data;
			    write_pointer <= ((write_pointer + 1) & DEPTH);

			end

			if(tx_axis_tready == 1'b1 && (read_pointer != write_pointer))
			begin
				
            		tx_axis_tdata  <= queue[read_pointer][NIC_WIDTH-2:TKEEP_WIDTH];
            		tx_axis_tkeep  <= queue[read_pointer][TKEEP_WIDTH-1:0];
            		tx_axis_tlast  <= queue[read_pointer][NIC_WIDTH-1];
			        read_pointer <= ((read_pointer + 1 ) & DEPTH);			
			end

		end
	end*/

`timescale 1ns/1ps

module Shift_Left(in_data,shift_amt,out_data);


/*

Inputs : Input Data having N bits
         Shift amount of S bits

Outputs : Output Data of N bits

About : A parametrised barrel shift Left module

*/
                  
parameter N=8; //Size of Data Input
parameter S=3;  // Amount to shift-> Always must be set to log2(N)

input [N-1:0] in_data;
input [S-1:0] shift_amt;
output [N-1:0] out_data;

wire [N-1:0] tmp [S-1:0];
assign tmp[0]  = shift_amt[0] ? in_data << 7'd1  : in_data; 
genvar i;
generate
	for (i=1; i<S; i=i+1)
    begin
		assign tmp[i] = shift_amt[i] ? tmp[i-1] << 2**i : tmp[i-1];
    end
endgenerate
assign out_data = tmp[S-1];

endmodule



module mac_engine (
    clk,


    m_rx_axis_resetn,
    m_rx_axis_tdata,
    m_rx_axis_tkeep,
    m_rx_axis_tvalid,
    m_rx_axis_tuser,
    m_rx_axis_tlast,
    m_rx_axis_tready,

    s_tx_axis_resetn,
    s_tx_axis_tdata,
    s_tx_axis_tkeep,
    s_tx_axis_tvalid,
    s_tx_axis_tuser,
    s_tx_axis_tlast,
    s_tx_axis_tready

);


parameter DATA_WIDTH = 64;
parameter KEEP_WIDTH = 8;

input clk;

input m_rx_axis_resetn;
output reg [DATA_WIDTH - 1 : 0] m_rx_axis_tdata;
output reg [KEEP_WIDTH - 1 : 0] m_rx_axis_tkeep;
output reg m_rx_axis_tvalid;
output reg m_rx_axis_tuser;
output reg m_rx_axis_tlast; 
input m_rx_axis_tready;

input s_tx_axis_resetn;
input [DATA_WIDTH - 1 : 0] s_tx_axis_tdata;
input [KEEP_WIDTH - 1 : 0] s_tx_axis_tkeep;
input s_tx_axis_tvalid;
input s_tx_axis_tuser;
input s_tx_axis_tlast;
output  s_tx_axis_tready;


// Assign TX_READY HIGH 
assign s_tx_axis_tready = 1;

//RX States

parameter ETH_0 = 0;
parameter ETH_1 = 1;
parameter DATA =  2;
parameter LAST =  3;

// Variables

reg [47 : 0] source_mac_address = 2;
reg [47 : 0] destination_mac_address = 1;
reg [55 : 0] pkt_cnt = 0; // Make it 56 bit for convenience
reg [15 : 0] length_in_bytes = 20 + 10;
reg [3 : 0] IHL = 5;
reg [3 : 0] version = 4;
reg [3 : 0] rx_state = ETH_0;
wire [7 : 0] last_tkeep;

reg [72 : 0] array[0 : 1023];
integer arr_i = 0;


// Instantiate Module
Shift_Left shl (2,(length_in_bytes - pkt_cnt - 1),last_tkeep);


// RX State Machine
always @(posedge clk) 
begin
    if(m_rx_axis_resetn == 0)
    begin
        m_rx_axis_tvalid <= 0; 
        m_rx_axis_tlast <= 0;
        m_rx_axis_tuser <= 0;   
    end

    else
    begin
        case (rx_state)
        ETH_0:
                begin
		if(m_rx_axis_tready == 1)
		begin
                    m_rx_axis_tvalid <= 1;
                    m_rx_axis_tdata <= {source_mac_address[15:0],destination_mac_address};
                    m_rx_axis_tkeep <= 8'hFF;
                    m_rx_axis_tuser <= 0;
                    m_rx_axis_tlast <= 0;
                    rx_state <= ETH_1;
		end
	
		else
		begin
		   m_rx_axis_tvalid <= 0;
		   rx_state <= ETH_0;
		end               
                end 
        
        ETH_1:
                begin
		if(m_rx_axis_tready == 1)
		begin
                    m_rx_axis_tvalid <= 1;
                    m_rx_axis_tdata <= {8'h0,IHL,version,length_in_bytes,source_mac_address[47 : 16]};
                    m_rx_axis_tkeep <= 8'hFF;
                    m_rx_axis_tuser <= 0;
                    m_rx_axis_tlast <= 0;
                    rx_state <= DATA;
		end

		else
		begin
		   m_rx_axis_tvalid <= 0;
		   rx_state <= ETH_1;
		end 
          
                end

        DATA:
            begin
		    if(m_rx_axis_tready == 1)
		    begin
                    
                    if(pkt_cnt < (length_in_bytes - 8))
                    begin
                        m_rx_axis_tvalid <= 1;
                        m_rx_axis_tdata <= {8'h0,pkt_cnt};
                        m_rx_axis_tkeep <= 8'hFF;
                        m_rx_axis_tuser <= 0;
                        m_rx_axis_tlast <= 0;
                        pkt_cnt = pkt_cnt + 8;

                        if(pkt_cnt >= (length_in_bytes - 8))
                            rx_state <= LAST;               
                    end
		   end

		else
		begin
		   m_rx_axis_tvalid <= 0;
		   rx_state <= DATA;
		end 

                    
                end

        LAST:
                begin
		if(m_rx_axis_tready == 1)
		begin
                    m_rx_axis_tvalid <= 1;
                    m_rx_axis_tdata <= {8'h0,pkt_cnt};
                    m_rx_axis_tkeep <= (last_tkeep - 1);
                    m_rx_axis_tuser <= 1; //Good Packet
                    m_rx_axis_tlast <= 1;
                    pkt_cnt <= 0;
                    rx_state <= ETH_0;
		end

		else
		begin
		   m_rx_axis_tvalid <= 0;
		   rx_state <= LAST;
		end    
                end

        default: ;
        endcase
        
    end
    
end

// TX State Machine
always @(posedge clk) 
begin
    if(s_tx_axis_tvalid == 1)
    begin
        array[arr_i] <= {s_tx_axis_tlast,s_tx_axis_tdata,s_tx_axis_tkeep};
        arr_i <= arr_i + 1;
    end
end

endmodule
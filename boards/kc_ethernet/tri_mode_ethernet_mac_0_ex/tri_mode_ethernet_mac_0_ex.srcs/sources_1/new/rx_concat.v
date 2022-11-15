`timescale 1ns / 1ps

/*
MAC Side : 
input rx_axis_mac_tvalid
input rx_axis_mac_tdata[7:0]
input rx_axis_mac_tlast
input rx_axis_mac_tuser



// RX_FIFO Side

rx_axis_tdata [63:0]   --> Input
 rx_axis_tkeep [7:0]    --> Input
 rx_axis_tvalid         --> Input
 rx_axis_tuser          --> Input
 rx_axis_tlast          --> Input

*/




module rx_concat
(
    clk,
    rx_axis_mac_tdata,
    rx_axis_mac_tvalid,
    rx_axis_mac_tlast,
    rx_axis_mac_tuser,

    rx_axis_tdata,
    rx_axis_tkeep,
    rx_axis_tvalid,
    rx_axis_tlast,
    rx_axis_tuser

);

parameter N2 = 64;
parameter N1= 8 ;
parameter S = 8;

input clk;
input rx_axis_mac_tvalid;
input [N1-1 : 0] rx_axis_mac_tdata;
input rx_axis_mac_tlast;
input rx_axis_mac_tuser;

output reg [S-1 : 0] rx_axis_tkeep = 0  ;
output reg [N2-1 : 0] rx_axis_tdata = 0 ; 

output reg rx_axis_tvalid = 0;       
output reg rx_axis_tuser = 0;       
output reg rx_axis_tlast = 0;   



reg [N2-1 : 0] accumulate_data;
reg [S-1 : 0] accumulate_keep;

reg [4 : 0] cnt = 0;
reg last_reached = 0;
reg last_user = 0;


always @(posedge clk) 
begin

    if(cnt == 0)
    begin
        rx_axis_tdata  <= 0;
        rx_axis_tkeep  <= 0;
        rx_axis_tvalid <= 0;
        rx_axis_tlast  <= 0;
        rx_axis_tuser  <= 0;
        accumulate_data <= 0;
        accumulate_keep <= 0;
    end

    
    if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
    begin
        accumulate_data[(cnt * 8) +: 8] <=rx_axis_mac_tdata;
        accumulate_keep[cnt] <= 1'b1;
        cnt <= cnt + 1;
        last_reached <= 0;
        last_user <= 0;       
    end

    else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
    begin
        accumulate_data[(cnt * 8) +: 8] <=rx_axis_mac_tdata;
        accumulate_keep[cnt] <= 1'b1;
        cnt <= 8;
        last_reached <= 1;
        last_user <= rx_axis_mac_tuser;
    end


    if(cnt == 8)
    begin
        cnt <= 0;
        rx_axis_tdata <= accumulate_data;
        rx_axis_tkeep <= accumulate_keep;
        rx_axis_tvalid <= 1'b1;
        rx_axis_tlast <= (last_reached == 1) ? 1 : 0;
        rx_axis_tuser <= (last_reached == 1) ? last_user : 0;
    end
       
end

endmodule


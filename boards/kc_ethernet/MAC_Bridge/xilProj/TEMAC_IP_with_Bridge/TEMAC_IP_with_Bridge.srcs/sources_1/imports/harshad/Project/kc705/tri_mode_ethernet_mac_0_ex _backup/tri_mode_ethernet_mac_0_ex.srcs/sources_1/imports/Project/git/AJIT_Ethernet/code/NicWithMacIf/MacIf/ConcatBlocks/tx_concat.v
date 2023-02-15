`timescale 1ns/1ps


/*

[7 : 0] tx_axis_mac_tdata   Out
tx_axis_mac_tvalid   Out
tx_axis_mac_tlast    Out
tx_axis_mac_tuser    Out
tx_axis_mac_tready   In




 tx_axis_tdata[63:0] --> In
 tx_axis_tkeep[7:0] --> In
 tx_axis_tvalid --> In
 tx_axis_tuser  --> In
 tx_axis_tlast  --> In
 tx_axis_ready  -> Out

*/


module tx_concat
(
    clk,
    tx_axis_mac_tdata,
    tx_axis_mac_tvalid,
    tx_axis_mac_tlast ,   
    tx_axis_mac_tuser, 
    tx_axis_mac_tready,


    tx_axis_tdata,
    tx_axis_tkeep, 
    tx_axis_tvalid,
    tx_axis_tuser,
    tx_axis_tlast,
    tx_axis_tready
);

parameter N1 = 64;
parameter N2 = 8;



input clk;
output reg [N2 - 1 : 0] tx_axis_mac_tdata = 0;    
output reg tx_axis_mac_tvalid = 0;
output reg tx_axis_mac_tlast = 0  ;   
output reg tx_axis_mac_tuser = 0; 
input tx_axis_mac_tready;

input [N1 - 1 : 0] tx_axis_tdata;
input [7 : 0] tx_axis_tkeep; 
input tx_axis_tvalid;
input tx_axis_tuser;
input tx_axis_tlast;
output reg tx_axis_tready = 0;


integer cnt =  -1 ;

reg [N1 - 1 : 0] data_reg;
reg [7 : 0] keep_reg;
reg last_reg;
reg user_reg;


always @(posedge clk) 
begin

    if(cnt == -1) //State to get the data
    begin
        tx_axis_tready <= 1;
        tx_axis_mac_tvalid <= 0;
        tx_axis_mac_tlast <= 0;
        if(tx_axis_tvalid == 1)
        begin
            data_reg <= tx_axis_tdata;
            keep_reg <= tx_axis_tkeep;
            last_reg <= tx_axis_tlast;
            user_reg <= tx_axis_tuser;
            cnt <= 0;
        end

        else
        begin
            cnt <= -1;
        end

    end


    else if(cnt >= 0 && cnt < 8)
    begin
        tx_axis_tready <= 0;
        if(last_reg != 1)
        begin
            tx_axis_mac_tdata <= data_reg[(cnt * 8) +: 8];
            tx_axis_mac_tvalid <= 1;
            if (tx_axis_mac_tready == 1) 
            begin
                cnt <= cnt + 1;
            end
                       
        end

        else if(last_reg == 1)
        begin
            
            if(keep_reg != 0)
            begin                
                tx_axis_mac_tdata <= data_reg [(cnt * 8) +: 8];
                tx_axis_mac_tvalid <= 1;
                tx_axis_mac_tlast <= keep_reg == 1 ? 1 : 0;
                tx_axis_mac_tuser <=  keep_reg == 1 ? user_reg : 0;

                if(tx_axis_mac_tready == 1)
                begin
                    keep_reg <= keep_reg >> 1;
                    
                    if(keep_reg == 1)
                        cnt <= 8;
                    
                    else
                        cnt <= cnt + 1;
                end
            end
        end        
    end

    else
    begin
        cnt <= -1;
        tx_axis_mac_tvalid <= 0; 
        tx_axis_mac_tlast <= 0;   
    end
      
end

endmodule

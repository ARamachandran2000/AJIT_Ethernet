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
output reg [N2 - 1 : 0] tx_axis_mac_tdata;    
output reg tx_axis_mac_tvalid;
output reg tx_axis_mac_tlast ;   
output reg tx_axis_mac_tuser; 
input tx_axis_mac_tready;

input [N1 - 1 : 0] tx_axis_tdata;
input [7 : 0] tx_axis_tkeep; 
input tx_axis_tvalid;
input tx_axis_tuser;
input tx_axis_tlast;
output reg tx_axis_tready;



integer cnt = -1;



reg [N1 - 1 : 0] data_reg;
reg [7 : 0] keep_reg;
reg last_reg;
reg user_reg;


always@(posedge clk)
begin
    if(cnt == -1) //State to get the data
    begin
        tx_axis_tready <= 1;
        tx_axis_mac_tvalid <= 0;

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


    else if(cnt >= 0 && cnt < 64) // Send Data Bytes state
    begin
        tx_axis_tready <= 0;
        if(last_reg != 1)
        begin
            tx_axis_mac_tdata <= data_reg[(cnt) +: 8];
            tx_axis_mac_tvalid <= 1;
            tx_axis_mac_tlast <= 0;
            tx_axis_mac_tuser <=  0;
            if (tx_axis_mac_tready == 1) 
            begin
                cnt <= cnt + 8;
            end           
        end

        else if(last_reg == 1)
        begin
            if(keep_reg == 8'b00000001)
            begin
                tx_axis_mac_tdata <= data_reg [ 7 : 0];
                tx_axis_mac_tvalid <= 1;
                tx_axis_mac_tlast <= 1;
                tx_axis_mac_tuser <=  user_reg;

                if(tx_axis_mac_tready == 1)
                begin
                    cnt = 64;
                end 
            end

            else if(keep_reg == 8'b00000011)
            begin
                tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                tx_axis_mac_tvalid <= 1;
                tx_axis_mac_tlast <= cnt == 8 ? 1 : 0;
                tx_axis_mac_tuser <=  cnt == 8 ? user_reg : 0;

                if(tx_axis_mac_tready == 1)
                begin
                    cnt = cnt + 8;
                    if(cnt == 16)
                    cnt = 64;
                end
                
            end

            else if(keep_reg == 8'b00000111)
            begin
                    tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                    tx_axis_mac_tvalid <= 1;
                    tx_axis_mac_tlast <= cnt == 16 ? 1 : 0;
                    tx_axis_mac_tuser <=  cnt == 16 ? user_reg : 0;
    
                    if(tx_axis_mac_tready == 1)
                    begin
                        cnt = cnt + 8;
                        if(cnt == 24)
                            cnt = 64;
                    end
                    
            end

            else if(keep_reg == 8'b00001111)
            begin
                    tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                    tx_axis_mac_tvalid <= 1;
                    tx_axis_mac_tlast <= cnt == 24 ? 1 : 0;
                    tx_axis_mac_tuser <=  cnt == 24 ? user_reg : 0;
    
                    if(tx_axis_mac_tready == 1)
                    begin
                        cnt = cnt + 8;
                        if(cnt == 32)
                            cnt = 64;
                    end
                        
            end


            else if(keep_reg == 8'b00011111)
                begin
                        tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                        tx_axis_mac_tvalid <= 1;
                        tx_axis_mac_tlast <= cnt == 32 ? 1 : 0;
                        tx_axis_mac_tuser <=  cnt == 32 ? user_reg : 0;
        
                        if(tx_axis_mac_tready == 1)
                        begin
                            cnt = cnt + 8;
                            if(cnt == 40)
                                cnt = 64;
                        end
                            
                end    
                
                else if(keep_reg == 8'b00111111)
                    begin
                            tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                            tx_axis_mac_tvalid <= 1;
                            tx_axis_mac_tlast <= cnt == 40 ? 1 : 0;
                            tx_axis_mac_tuser <=  cnt == 40 ? user_reg : 0;
            
                            if(tx_axis_mac_tready == 1)
                            begin
                                cnt = cnt + 8;
                                if(cnt == 48)
                                    cnt = 64;
                            end
                                
                    end 
                    
                    else if(keep_reg == 8'b01111111)
                        begin
                                tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                                tx_axis_mac_tvalid <= 1;
                                tx_axis_mac_tlast <= cnt == 48 ? 1 : 0;
                                tx_axis_mac_tuser <=  cnt == 48 ? user_reg : 0;
                                
                
                                if(tx_axis_mac_tready == 1)
                                begin
                                    cnt = cnt + 8;
                                    if(cnt == 56)
                                        cnt = 64;
                                end
                                    
                        end
                    
                        
                        else if(keep_reg == 8'b11111111)
                            begin
                                    tx_axis_mac_tdata <= data_reg [ cnt +: 8];
                                    tx_axis_mac_tvalid <= 1;
                                    tx_axis_mac_tlast <= cnt == 56 ? 1 : 0;
                                    tx_axis_mac_tuser <=  cnt == 56 ? user_reg : 0;
                                    
                                    if(tx_axis_mac_tready == 1)
                                    begin
                                        cnt = cnt + 8;
                                    end
                                        
                            end  

            
            
        end
            
    end
    

    else
    begin
        cnt <= -1;
        tx_axis_mac_tvalid <= 0;    
    end

end












endmodule





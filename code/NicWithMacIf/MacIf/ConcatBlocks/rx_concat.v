`timescale 1ns/1ps

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

parameter S_0 = 0;
parameter S_1 = 1;
parameter S_2 = 2;
parameter S_3 = 3;
parameter S_4 = 4;
parameter S_5 = 5;
parameter S_6 = 6;
parameter S_7 = 7;



input clk;
input rx_axis_mac_tvalid;
input [N1-1 : 0] rx_axis_mac_tdata;
input rx_axis_mac_tlast;
input rx_axis_mac_tuser;

output reg [S-1 : 0] rx_axis_tkeep  ;
output reg [N2-1 : 0] rx_axis_tdata ;  
output reg rx_axis_tvalid ;       
output reg rx_axis_tuser  ;       
output reg rx_axis_tlast  ;       



reg [3 : 0] curr_state = S_0;
reg last_state_valid = 0;
reg last_state_last = 0;
reg last_state_tuser = 0;

reg [S - 1 : 0] s0_reg;
reg [2*S - 1 : 0] s1_reg;
reg [3*S - 1 : 0] s2_reg;
reg [4*S - 1 : 0] s3_reg;
reg [5*S - 1 : 0] s4_reg;
reg [6*S - 1 : 0] s5_reg;
reg [7*S - 1 : 0] s6_reg;
reg [8*S - 1 : 0] s7_reg;

reg s0_valid;
reg [1 : 0]s1_valid;
reg [2 : 0]s2_valid;
reg [3 : 0]s3_valid;
reg [4 : 0]s4_valid;
reg [5 : 0]s5_valid;
reg [6 : 0]s6_valid;
reg [7 : 0]s7_valid;


always@(posedge clk)
begin
    if(curr_state == S_0)
    begin
        rx_axis_tvalid <= 0;
        if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
        begin
            s0_reg <= rx_axis_mac_tdata;
            curr_state <= S_1;
            last_state_last <= 0;
            s0_valid <= 1;
        end

        else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
        begin
            s0_reg <= rx_axis_mac_tdata;
            curr_state <= S_1;
            last_state_last <= 1;
            s0_valid <= 1;
            last_state_tuser <= rx_axis_mac_tuser;
        end

        else
        begin
            curr_state <= S_0;
            last_state_last <= 0;
            last_state_tuser <= 0;
            s0_valid <= 0;
        end
    end

    else if(curr_state == S_1)
    begin
        if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
        begin
            s1_reg <= {rx_axis_mac_tdata,s0_reg};
            curr_state <= S_2;
            last_state_last <= 0;
            last_state_tuser <= 0;
            s1_valid <= {1'b1,s0_valid};
        end

        else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
        begin
            s1_reg <= {rx_axis_mac_tdata,s0_reg};
            curr_state <= S_2;
            last_state_last <= 1;
            s1_valid <= {1'b1,s0_valid};
            last_state_tuser <= rx_axis_mac_tuser;
        end

        else if(last_state_last == 1)
        begin
            s1_reg <= {8'b0,s0_reg};
            curr_state <= S_2;
            last_state_last <= 1;
            last_state_tuser <= last_state_tuser;
            s1_valid <= {1'b0,s0_valid};
            
        end

        else
        begin
            curr_state <= S_1;
            last_state_last <= 0;last_state_tuser <= 0;
            s1_valid <= 0;
            
        end
        
    end

    else if(curr_state == S_2)
        begin
            if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
            begin
                s2_reg <= {rx_axis_mac_tdata,s1_reg};
                curr_state <= S_3;
                last_state_last <= 0;
                last_state_tuser <= 0;
                s2_valid <= {1'b1,s1_valid};
            end
    
            else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
            begin
                s2_reg <= {rx_axis_mac_tdata,s1_reg};
                curr_state <= S_3;
                last_state_last <= 1;
                s2_valid <= {1'b1,s1_valid};
                last_state_tuser <= rx_axis_mac_tuser;
            end
    
            else if(last_state_last == 1)
            begin
                s3_reg <= {8'b0,s1_reg};
                curr_state <= S_3;
                last_state_last <= 1;last_state_tuser <= last_state_tuser;
                s2_valid <= {1'b0,s1_valid};
                
            end
    
            else
            begin
                curr_state <= S_2;
                last_state_last <= 0;last_state_tuser <= 0;
                s2_valid <= 0;
                
            end
            
        end
   
        else if(curr_state == S_3)
            begin
                if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
                begin
                    s3_reg <= {rx_axis_mac_tdata,s2_reg};
                    curr_state <= S_4;
                    last_state_last <= 0;
                    last_state_tuser <= 0;
                    s3_valid <= {1'b1,s2_valid};
                end
        
                else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
                begin
                    s3_reg <= {rx_axis_mac_tdata,s2_reg};
                    curr_state <= S_4;
                    last_state_last <= 1;
                    s3_valid <= {1'b1,s2_valid};
                    last_state_tuser <= rx_axis_mac_tuser;
                end
        
                else if(last_state_last == 1)
                begin
                    s3_reg <= {8'b0,s2_reg};
                    curr_state <= S_4;
                    last_state_last <= 1;last_state_tuser <= last_state_tuser;
                    s3_valid <= {1'b0,s2_valid};
                    
                end
        
                else
                begin
                    curr_state <= S_3;
                    last_state_last <= 0;last_state_tuser <= 0;
                    s3_valid <= 0;
                    
                end
                
            end

       else if(curr_state == S_4)
            begin
                if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
                begin
                    s4_reg <= {rx_axis_mac_tdata,s3_reg};
                    curr_state <= S_5;
                    last_state_last <= 0;
                    last_state_tuser <= 0;
                    s4_valid <= {1'b1,s3_valid};
                end
        
                else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
                begin
                    s4_reg <= {rx_axis_mac_tdata,s3_reg};
                    curr_state <= S_5;
                    last_state_last <= 1;
                    s4_valid <= {1'b1,s3_valid};
                    last_state_tuser <= rx_axis_mac_tuser;
                end
        
                else if(last_state_last == 1)
                begin
                    s4_reg <= {8'b0,s3_reg};
                    curr_state <= S_5;
                    last_state_last <= 1;last_state_tuser <= last_state_tuser;
                    s4_valid <= {1'b0,s3_valid};
                    
                end
        
                else
                begin
                    curr_state <= S_5;
                    last_state_last <= 0;last_state_tuser <= 0;
                    s4_valid <= 0;
                    
                end
                
            end
        

            else if(curr_state == S_5)
                begin
                    if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
                    begin
                        s5_reg <= {rx_axis_mac_tdata,s4_reg};
                        curr_state <= S_6;
                        last_state_last <= 0;
                        last_state_tuser <= 0;
                        s5_valid <= {1'b1,s4_valid};
                    end
            
                    else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
                    begin
                        s5_reg <= {rx_axis_mac_tdata,s4_reg};
                        curr_state <= S_6;
                        last_state_last <= 1;
                        s5_valid <= {1'b1,s4_valid};
                        last_state_tuser <= rx_axis_mac_tuser;
                    end
            
                    else if(last_state_last == 1)
                    begin
                        s5_reg <= {8'b0,s4_reg};
                        curr_state <= S_6;
                        last_state_last <= 1;last_state_tuser <= last_state_tuser;
                        s5_valid <= {1'b0,s4_valid};
                        
                    end
            
                    else
                    begin
                        curr_state <= S_6;
                        last_state_last <= 0;last_state_tuser <= 0;
                        s5_valid <= 0;
                        
                    end
                    
                end

                else if(curr_state == S_6)
                    begin
                        if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
                        begin
                            s6_reg <= {rx_axis_mac_tdata,s5_reg};
                            curr_state <= S_7;
                            last_state_last <= 0;
                            last_state_tuser <= 0;
                            s6_valid <= {1'b1,s5_valid};
                        end
                
                        else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
                        begin
                            s6_reg <= {rx_axis_mac_tdata,s5_reg};
                            curr_state <= S_7;
                            last_state_last <= 1;last_state_tuser <= last_state_tuser;
                            s6_valid <= {1'b1,s5_valid};
                            last_state_tuser <= rx_axis_mac_tuser;
                        end
                
                        else if(last_state_last == 1)
                        begin
                            s6_reg <= {8'b0,s5_reg};
                            curr_state <= S_7;
                            last_state_last <= 1;
                            s6_valid <= {1'b0,s5_valid};
                            
                        end
                
                        else
                        begin
                            curr_state <= S_6;
                            last_state_last <= 0;
                            s6_valid <= 0;last_state_tuser <= 0;
                            
                        end
                        
                    end

                else if(curr_state == S_7)
                begin
                    if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 0)
                    begin
                        s7_reg = {rx_axis_mac_tdata,s6_reg};
                        curr_state = S_0;
                        last_state_last = 0;
                        last_state_tuser <= 0;
                        s7_valid = {1'b1,s6_valid};

                        rx_axis_tdata = s7_reg;
                        rx_axis_tkeep = s7_valid;
                        rx_axis_tvalid = 1;
                        rx_axis_tlast = 0;
                        rx_axis_tuser = 0;

                    end

                    else if(rx_axis_mac_tvalid == 1 && rx_axis_mac_tlast == 1)
                    begin
                            s7_reg = {rx_axis_mac_tdata,s5_reg};
                            curr_state = S_0;
                            last_state_last = 1;
                            s7_valid = {1'b1,s6_valid};

                            rx_axis_tdata = s7_reg;
                            rx_axis_tkeep = s7_valid;
                            rx_axis_tvalid = 1;
                            rx_axis_tlast = 1;
                            rx_axis_tuser = rx_axis_mac_tuser;

                    end

                    else if(last_state_last == 1)
                    begin
                        s7_reg = {8'b0,s6_reg};
                        curr_state = S_0;
                        last_state_last = 1;
                        s7_valid = {1'b0,s6_valid};

                        rx_axis_tdata = s7_reg;
                        rx_axis_tkeep = s7_valid;
                        rx_axis_tvalid = 1;
                        rx_axis_tlast = 1;
                        rx_axis_tuser = last_state_tuser;
                        
                    end

                    else
                    begin
                            curr_state <= S_7;
                            last_state_last <= 0;
                            last_state_tuser <= 0;
                            s7_valid <= 0;
                            
                    end




                end


end















endmodule

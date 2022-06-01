`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 02:51:21 PM
// Design Name: 
// Module Name: diff_refclk_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module diff_refclk_gen
(

input clk_156_25, // Connect to output of Clk WIzard 1

output refclk_p,refclk_n // AK8, AK7


);

assign refclk_p = clk_156_25;
assign refclk_n = !clk_156_25;



endmodule

// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Mon Oct 31 15:07:14 2022
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/vivadoRunDir/ip_ex/axi_ethernet_0_ex/axi_ethernet_0_ex.srcs/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_6/bd_5d9f_0_c_shift_ram_0_0_stub.v
// Design      : bd_5d9f_0_c_shift_ram_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_13,Vivado 2019.1" *)
module bd_5d9f_0_c_shift_ram_0_0(D, CLK, CE, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="D[0:0],CLK,CE,SCLR,Q[0:0]" */;
  input [0:0]D;
  input CLK;
  input CE;
  input SCLR;
  output [0:0]Q;
endmodule

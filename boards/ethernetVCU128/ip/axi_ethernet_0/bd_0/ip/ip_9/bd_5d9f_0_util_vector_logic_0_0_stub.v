// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Mon Oct 31 15:07:11 2022
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/vivadoRunDir/ip_ex/axi_ethernet_0_ex/axi_ethernet_0_ex.srcs/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_9/bd_5d9f_0_util_vector_logic_0_0_stub.v
// Design      : bd_5d9f_0_util_vector_logic_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2019.1" *)
module bd_5d9f_0_util_vector_logic_0_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Res[0:0]" */;
  input [0:0]Op1;
  output [0:0]Res;
endmodule

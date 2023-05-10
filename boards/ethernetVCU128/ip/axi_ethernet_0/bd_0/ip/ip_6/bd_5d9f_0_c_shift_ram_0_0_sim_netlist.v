// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Mon Oct 31 15:07:14 2022
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/harshad/vivadoRunDir/ip_ex/axi_ethernet_0_ex/axi_ethernet_0_ex.srcs/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_6/bd_5d9f_0_c_shift_ram_0_0_sim_netlist.v
// Design      : bd_5d9f_0_c_shift_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_5d9f_0_c_shift_ram_0_0,c_shift_ram_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module bd_5d9f_0_c_shift_ram_0_0
   (D,
    CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency data_bitwidth format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} DATA_WIDTH 1}" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "1" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "virtexuplusHBM" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bd_5d9f_0_c_shift_ram_0_0_c_shift_ram_v12_0_13 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "1" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "1" *) 
(* C_XDEVICEFAMILY = "virtexuplusHBM" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module bd_5d9f_0_c_shift_ram_0_0_c_shift_ram_v12_0_13
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [0:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "1" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "virtexuplusHBM" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bd_5d9f_0_c_shift_ram_0_0_c_shift_ram_v12_0_13_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
klQ5h9hgPT4p1YBkLUYG8lguTKRhX0z2xODTfvC0iZ4ANS2ufXQ4XxirL31R7wyoNNR1hd7rMjwq
bhFP3bRYRg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
m0Wn8/fGtoK5/3nNxNBBvNhfylkjw8jAoTERkIzypaD+FUTSQmf52TpAbVY1LPDo/g6d8tzIrR8n
vZ2G5ckAbcwDRGFF5wpZ/kzyANCTceWo7S+WbzLbzhWkG5fkJbJk/tafbSvqruxodmgtrUI2IZDv
n7Mrf4GRIdC1iTgv+oM=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mC2bSkADVOO0t7I1BTHPnOuMcPIdeypycvBkfsUtXFD/WSov2Pt6qF5xMTcs6woq+465yEDvey00
mpX9JC1ypEuHaZI+dtH7s+A4vYLXy34kFLryTKJtqycAy6XqNtTegvy4giaDFwDn7LgsamHSf/4D
cVGL06Ul6gm+ZOMvzok6Y9TBltlEkZOZ4GncKspHPcn3EJar4GdDxKcPll1RqSFbA2m7bWz6jPV3
uOD6IWnIflyobdLIsuB8hse3kjXBG5sl6X8AP4armpo9TNNnRIRG2FoI6g16Sj6zldS9XF54ge/w
jnsP0vce7kfzvP1LjtFrWdW0raW61dIddZVz5A==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LC8srWyP8+H+elFwWxNw8UhEF94Tx3vV4OlwBcwFszd9xuvwYRipLEwY4ar7HEoCwJI7beW6k6I1
ntJSXGEnPMgIDe7PadSQIz6gi9ErRHWRhWD6bEDNd/ZjFQuOakXk78jzxOTKuOpQ+ExjdHImyPzK
mDR0BnkVc/QiSO7zpOf3yjx9Vzb0Fba6OgXg0iLPz1MUr0ahYIc0MAkw4pRBo6IH5ilqVbkgNQcT
G4z/0OSzsBxipE9o1elAez7CnehtEQ66g6i3JpIIwqwnpZNQ9otSnS8LN/spRcQLOUuBq9ynGkPL
sF7EUF1gLkTFFMGgnZgawWi0V0jhiHQkJuLKPQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ijV0yStg7uRIl3uzK8/hlbIaWGHa9aPC5Eu/o1vErrwtArYsGFt3RCyG/S90FB6jkuLgqwPR8ZlQ
P9t/F2FWmEkwwjGbdrRKFfpbkjh5HVn0vvLKCP3SiVHXCOWxxb5z8BV+yCNdpgdnsHFecK1M8ydQ
C530kRu3UD1LcnZcWJi41LcJAc5rvlw/SP1gbl+I1qsRNEHsb+MK5vyjgwBZAqKyqi7/UK1VEPdq
myeWeCRrU0GqEq5y/PHBMknv1SqNe0d5qzG1rmAtC4df+iivMCc9xuHsCA7iqoe+ZKnMmnA/8F6+
nY+gx8AQNplCeFxWppKH952fIYplHtE2rKQyVQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
saHlQAxOuJkLItpv5N3fJoJP3EdR34QNYHtUBFx7fcQy8HAUaZ/9Tlt2kfpn9r/pk1MmJ7uf4z73
LyaG/PWw7v3yH/KIVSLeIxiaSHoVfdWH1/RDH6k3DTDNbWSJDOjGSvMTThUKe899F8IXTD5jKxCh
frGB3Io0W4klQV7ADEw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RFiy0rrSiVrZMC725S3XkUSDuMS7Z+xog1sOwADnIBmdCChtYLUQVO9oPjXIujfg3bBFTH3qzII3
Y63fFMSZnnzk+ups3RPMBqEPPdMQSwlpDzsvhCOwYHe/rsOPZvqd7lL6QOKoA3mS9TZIP+mOaTKd
vzQiVyfS0rs+QHdJcw49jD5y7Dc3clQHD9xZMAMUHa5v8hzX4IOcnkSUOLpsZptR/WM7rcMnTzCL
x6m2UC+xSrwrb5vEz9cePMHx9NJyO2DBG0HTEDzGQQkrOCJJjvBxtB3r/E7/3eWGHvMwphSJnfCd
PfvYXz88X+ZVCW9dTNfc75jI7ogVMSunmtUuMw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cg98h2X51WOxgDlPaq+ammro/TTKRj4K8zARf4L0WnI0OLv6wn0ZhCy499UYL2iJ1PbTdoIdGGeE
7V1BMIaVVNUAM+TnWzNBOP5orrhU8/pUncSs7YEXtO7nq+RWfJg4V7mvXJzR2N8kvzSG9nH9jMXB
uFlXy3NBaL9n+got7S7fV9e8+Eix4g9C35Nq3P5O/ijtnridDkBPBNO6XepY2JUmoo/S3slDZSAF
MWiYQt6fn7ns8nbxYCGddqaz9TPjxmeKnV/vSMgfSB4B5Zy+iFevHv3mtDOWJ7J1UosWld1BbY0N
t0waANS/lShBTptmTWbh7xMIhb1J/Ume7F35Aw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AJ6Az64zqsz57WyL0dxk4d1k0GDg9SuUDeEbNEu7ZWIdkDJ64k9/iIifNjfuk2ivSFThGa5DGydz
6RPW3qtFbifJ/PprxcEm3vf0awue0nl/p3y9ZAodpIWa5KnMS5mr29ofo3hMZlx+yR5V5hmk4ylJ
hmRCDtyaWYEGXYJ+qUgNbUG46wwBXTrQcMRrPzfSnu9cNs2lwG8iseSjSqksVdjjsKyZgsVkMdAI
f42JZnQ5OSqIi1XSTqPBZr9th1Ybv+0IJxvZNegAqIJPUQW1IxnOcQoX7ksgx+1S+/jiKJzxMUH5
JRGzQ1EBhzuaYMi4Dw/+bd9fh66x7Rwq1iLnNQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4672)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

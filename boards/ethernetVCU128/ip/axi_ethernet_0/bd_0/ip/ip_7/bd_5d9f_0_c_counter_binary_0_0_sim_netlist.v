// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Mon Oct 31 15:07:15 2022
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/harshad/vivadoRunDir/ip_ex/axi_ethernet_0_ex/axi_ethernet_0_ex.srcs/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_7/bd_5d9f_0_c_counter_binary_0_0_sim_netlist.v
// Design      : bd_5d9f_0_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_5d9f_0_c_counter_binary_0_0,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module bd_5d9f_0_c_counter_binary_0_0
   (CLK,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 24}" *) output [23:0]Q;

  wire CLK;
  wire [23:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "24" *) 
  (* C_XDEVICEFAMILY = "virtexuplusHBM" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1100000000000000000000" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1100000000000000000000" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bd_5d9f_0_c_counter_binary_0_0_c_counter_binary_v12_0_13 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1100000000000000000000" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1100000000000000000000" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "24" *) 
(* C_XDEVICEFAMILY = "virtexuplusHBM" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module bd_5d9f_0_c_counter_binary_0_0_c_counter_binary_v12_0_13
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [23:0]L;
  output THRESH0;
  output [23:0]Q;

  wire CLK;
  wire [23:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "24" *) 
  (* C_XDEVICEFAMILY = "virtexuplusHBM" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1100000000000000000000" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1100000000000000000000" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bd_5d9f_0_c_counter_binary_0_0_c_counter_binary_v12_0_13_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XfMJ/lrMxMQMTM7qNuErYIjkS3oNLgQdyfy34JZw9XLjobNUahN0WEXsZCXjL/wMYp+lo6iQa1bW
D+GBSH/J/6LVKhhn5kom2bL/kSj3mo9CekhrV/h+kjyiO3TRHYeNjp6gTJr43ysS3Up7+xViUWkK
1U0whkIUQZ72WLgMBnJp2zyAHXyQBlOXwaPDqdJT2zKVhw/anct7aBmHHM41fEjzfFaOwdzV9Xtz
iHCJWE+CCtIpvjGnhzGhUXl8Yb/6KKyGQjDFNrvxcmc/3sSnsRi7p/lL+meJ7hsEpSPlfWcYrfs0
t3y1Sv5zmY2jfH4TrDGPMCh2+QHvQZiZsYgzHw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ntcKpMqqIJX2RKw9lxRV6ZoTzUFfzUKmYjiS51jeaJQyf4HjID5dyp+UaMUgC74x3ZYPD276CgSf
VIxXwApiZXPqkRWDLkNzXYTp+qdAcp3XKKdaPm6432VTwA31bS13Q3JthJrYuNy7Fp0Sr5GGy2BZ
G9shS9kv39X1iuWBiU7CdKnnpfqy59K3GzjYCzlj90q+fzTza819LfPp7r8l1MF0WRgoTzykMH4J
NMfhglbmT62RUxIpwkoCwlVmZoMyPSIZyNYjfVFB3xdYLCqIYhg/CfjvuLbktZsrKP6pvqMBzjjK
IfAYf0xnP3J/KEmDbxNQ5Cx/rq6mqOvcMjNO3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11776)
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

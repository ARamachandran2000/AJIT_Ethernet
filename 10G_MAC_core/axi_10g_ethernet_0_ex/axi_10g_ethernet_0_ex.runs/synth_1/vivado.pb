
?
Command: %s
53*	vivadotcl2`
Lsynth_design -top axi_10g_ethernet_0_example_design -part xc7vx690tffg1761-22default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2%
xc7vx690t-ffg17612default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2%
xc7vx690t-ffg17612default:defaultZ17-349h px? 
?
?The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2017.072default:default2
-17322default:defaultZ17-1223h px? 
?
%s*synth2?
?Starting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1257.754 ; gain = 67.000 ; free physical = 1249 ; free virtual = 11010
2default:defaulth px? 
?
synthesizing module '%s'638*oasys25
!axi_10g_ethernet_0_example_design2default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
632default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter MAC_WIDTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter TKEEP_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter NIC_WIDTH bound to: 73 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter FIFO_SIZE bound to: 1024 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys21
axi_10g_ethernet_0_sync_block2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_block.v2default:default2
642default:default8@Z8-638h px? 
d
%s
*synth2L
8	Parameter C_NUM_SYNC_REGS bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
shreg_extract2default:default2
no2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_block.v2default:default2
732default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_block.v2default:default2
732default:default8@Z8-5534h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys21
axi_10g_ethernet_0_sync_block2default:default2
12default:default2
12default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_block.v2default:default2
642default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2(
mac_to_nic_interface2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/new/mac_to_nic_interface.v2default:default2
232default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter MAC_WIDTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter TKEEP_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter NIC_WIDTH bound to: 73 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys2$
mac_rx_interface2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_rx_interface.v2default:default2
232default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter MAC_WIDTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter TKEEP_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter NIC_WIDTH bound to: 73 - type: integer 
2default:defaulth p
x
? 
?
+Unused sequential element %s was removed. 
4326*oasys2"
write_data_reg2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_rx_interface.v2default:default2
1522default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
mac_rx_interface2default:default2
22default:default2
12default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_rx_interface.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2$
mac_tx_interface2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_tx_interface.v2default:default2
212default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter MAC_WIDTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter TKEEP_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter NIC_WIDTH bound to: 73 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
mac_tx_interface2default:default2
32default:default2
12default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_tx_interface.v2default:default2
212default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2(
mac_to_nic_interface2default:default2
42default:default2
12default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/new/mac_to_nic_interface.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys21
axi_10g_ethernet_0_fifo_block2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_fifo_block.v2default:default2
622default:default8@Z8-638h px? 
a
%s
*synth2I
5	Parameter FIFO_SIZE bound to: 1024 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys2&
axi_10g_ethernet_02default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/synth_1/.Xil/Vivado-44327-ajit4-ProLiant-ML10/realtime/axi_10g_ethernet_0_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
axi_10g_ethernet_02default:default2
52default:default2
12default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/synth_1/.Xil/Vivado-44327-ajit4-ProLiant-ML10/realtime/axi_10g_ethernet_0_stub.v2default:default2
62default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys21
axi_10g_ethernet_0_xgmac_fifo2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_xgmac_fifo.v2default:default2
1022default:default8@Z8-638h px? 
d
%s
*synth2L
8	Parameter TX_FIFO_SIZE bound to: 1024 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter RX_FIFO_SIZE bound to: 1024 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys2/
axi_10g_ethernet_0_axi_fifo2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
822default:default8@Z8-638h px? 
a
%s
*synth2I
5	Parameter FIFO_SIZE bound to: 1024 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_TX bound to: 1 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter ADDR_WIDTH bound to: 10 - type: integer 
2default:defaulth p
x
? 
M
%s
*synth25
!	Parameter IS_RX bound to: 1'b0 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys21
axi_10g_ethernet_0_sync_reset2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
622default:default8@Z8-638h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
SHREG_EXTRACT2default:default2
NO2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
702default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
702default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
SHREG_EXTRACT2default:default2
NO2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
722default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
722default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
SHREG_EXTRACT2default:default2
NO2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
742default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
742default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
SHREG_EXTRACT2default:default2
NO2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
762default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
762default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
SHREG_EXTRACT2default:default2
NO2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
782default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
782default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2!
SHREG_EXTRACT2default:default2
NO2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
802default:default8@Z8-5534h px? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ASYNC_REG2default:default2
TRUE2default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
802default:default8@Z8-5534h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys21
axi_10g_ethernet_0_sync_reset2default:default2
62default:default2
12default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_sync_reset.v2default:default2
622default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2/
axi_10g_ethernet_0_fifo_ram2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_fifo_ram.v2default:default2
602default:default8@Z8-638h px? 
`
%s
*synth2H
4	Parameter ADDR_WIDTH bound to: 10 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter RAM_DEPTH bound to: 1024 - type: integer 
2default:defaulth p
x
? 
?
"Detected attribute (* %s = "%s" *)3982*oasys2
	ram_style2default:default2
block2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_fifo_ram.v2default:default2
782default:default8@Z8-5534h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2/
axi_10g_ethernet_0_fifo_ram2default:default2
72default:default2
12default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_fifo_ram.v2default:default2
602default:default8@Z8-256h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2$
ignore_frame_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
2422default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2/
axi_10g_ethernet_0_axi_fifo2default:default2
82default:default2
12default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
822default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2?
+axi_10g_ethernet_0_axi_fifo__parameterized02default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
822default:default8@Z8-638h px? 
a
%s
*synth2I
5	Parameter FIFO_SIZE bound to: 1024 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_TX bound to: 0 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter ADDR_WIDTH bound to: 10 - type: integer 
2default:defaulth p
x
? 
M
%s
*synth25
!	Parameter IS_RX bound to: 1'b1 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2?
+axi_10g_ethernet_0_axi_fifo__parameterized02default:default2
82default:default2
12default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
822default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys21
axi_10g_ethernet_0_xgmac_fifo2default:default2
92default:default2
12default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_xgmac_fifo.v2default:default2
1022default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys21
axi_10g_ethernet_0_fifo_block2default:default2
102default:default2
12default:default2?
r/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_fifo_block.v2default:default2
622default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2/
axi_10g_ethernet_0_clocking2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_clocking.v2default:default2
622default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
IBUFDS2default:default2O
9/home/harshad/Vivado/2017.1/scripts/rt/data/unisim_comp.v2default:default2
144852default:default8@Z8-638h px? 
g
%s
*synth2O
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter DIFF_TERM bound to: FALSE - type: string 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter DQS_BIAS bound to: FALSE - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
IBUFDS2default:default2
112default:default2
12default:default2O
9/home/harshad/Vivado/2017.1/scripts/rt/data/unisim_comp.v2default:default2
144852default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
MMCME2_BASE2default:default2O
9/home/harshad/Vivado/2017.1/scripts/rt/data/unisim_comp.v2default:default2
208792default:default8@Z8-638h px? 
e
%s
*synth2M
9	Parameter BANDWIDTH bound to: OPTIMIZED - type: string 
2default:defaulth p
x
? 
i
%s
*synth2Q
=	Parameter CLKFBOUT_MULT_F bound to: 5.000000 - type: float 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKFBOUT_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKIN1_PERIOD bound to: 5.000000 - type: float 
2default:defaulth p
x
? 
j
%s
*synth2R
>	Parameter CLKOUT0_DIVIDE_F bound to: 8.000000 - type: float 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT0_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT0_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT1_DIVIDE bound to: 8 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT1_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT1_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT2_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT2_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT2_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT3_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT3_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT3_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT4_CASCADE bound to: FALSE - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT4_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT4_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT4_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT5_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT5_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT5_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT6_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT6_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT6_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter DIVCLK_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter REF_JITTER1 bound to: 0.050000 - type: float 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter STARTUP_WAIT bound to: FALSE - type: string 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
MMCME2_BASE2default:default2
122default:default2
12default:default2O
9/home/harshad/Vivado/2017.1/scripts/rt/data/unisim_comp.v2default:default2
208792default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
BUFG2default:default2O
9/home/harshad/Vivado/2017.1/scripts/rt/data/unisim_comp.v2default:default2
6072default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
BUFG2default:default2
132default:default2
12default:default2O
9/home/harshad/Vivado/2017.1/scripts/rt/data/unisim_comp.v2default:default2
6072default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2/
axi_10g_ethernet_0_clocking2default:default2
142default:default2
12default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_clocking.v2default:default2
622default:default8@Z8-256h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
frame_error2default:default25
!axi_10g_ethernet_0_example_design2default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
952default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
gen_active_flash2default:default25
!axi_10g_ethernet_0_example_design2default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
962default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2&
check_active_flash2default:default25
!axi_10g_ethernet_0_example_design2default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
972default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2"
rx_axis_tready2default:default25
!axi_10g_ethernet_0_example_design2default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
1552default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys25
!axi_10g_ethernet_0_example_design2default:default2
152default:default2
12default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
632default:default8@Z8-256h px? 
?
!design %s has unconnected port %s3331*oasys2/
axi_10g_ethernet_0_clocking2default:default2!
tx_mmcm_reset2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2
frame_error2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2$
gen_active_flash2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2&
check_active_flash2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2"
enable_pat_gen2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2$
enable_pat_check2default:defaultZ8-3331h px? 
?
%s*synth2?
?Finished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1298.254 ; gain = 107.500 ; free physical = 1253 ; free virtual = 11014
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2 
fifo_block_i2default:default2'
rx_axis_fifo_tready2default:default2?
v/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.v2default:default2
2612default:default8@Z8-3295h px?
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1298.254 ; gain = 107.500 ; free physical = 1256 ; free virtual = 11017
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
22default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
Y
Loading part %s157*device2&
xc7vx690tffg1761-22default:defaultZ21-403h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/synth_1/.Xil/Vivado-44327-ajit4-ProLiant-ML10/dcp19/axi_10g_ethernet_0_in_context.xdc2default:default22
fifo_block_i/ethernet_core_i	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/synth_1/.Xil/Vivado-44327-ajit4-ProLiant-ML10/dcp19/axi_10g_ethernet_0_in_context.xdc2default:default22
fifo_block_i/ethernet_core_i	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default8Z20-179h px? 
?
No cells matched '%s'.
180*	planAhead2^
Jget_cells -hierarchical -filter {NAME =~ pattern_generator*sync1_r_reg[0]}2default:default2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2
152default:default8@Z12-180h px?
?
Finished Parsing XDC File [%s]
178*designutils2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default8Z20-178h px? 
?
?One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2G
3.Xil/axi_10g_ethernet_0_example_design_propImpl.xdc2default:defaultZ1-498h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2G
3.Xil/axi_10g_ethernet_0_example_design_propImpl.xdc2default:defaultZ1-236h px? 
8
Deriving generated clocks
2*timingZ38-2h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
!Unisim Transformation Summary:
%s111*project2h
T  A total of 1 instances were transformed.
  MMCME2_BASE => MMCME2_ADV: 1 instances
2default:defaultZ1-111h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2
00:00:00.012default:default2
1800.0902default:default2
0.0002default:default2
8382default:default2
106012default:defaultZ17-722h px? 
?
?Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002default:default20
fifo_block_i/ethernet_core_i2default:default2
dclk2default:default2
8.0002default:defaultZ38-316h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:24 ; elapsed = 00:00:35 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 934 ; free virtual = 10697
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Loading part: xc7vx690tffg1761-2
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:24 ; elapsed = 00:00:35 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 934 ; free virtual = 10697
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:24 ; elapsed = 00:00:35 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 935 ; free virtual = 10698
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3142default:default8@Z8-5818h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2 
rd_state_reg2default:default2/
axi_10g_ethernet_0_axi_fifo2default:defaultZ8-802h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
v
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
wr_rem2default:defaultZ8-5546h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2!
rd_frames_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3112default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
rd_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
4372default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
wr_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5552default:default8@Z8-6014h px? 
?
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3142default:default8@Z8-5818h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2 
rd_state_reg2default:default2?
+axi_10g_ethernet_0_axi_fifo__parameterized02default:defaultZ8-802h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
v
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
wr_rem2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
rd_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2!
rd_frames_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3112default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
rd_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
4372default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
wr_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5552default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                  iSTATE |                              000 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE0 |                              001 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE1 |                              010 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE2 |                              011 |                              011
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE3 |                              100 |                              100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
rd_state_reg2default:default2

sequential2default:default2/
axi_10g_ethernet_0_axi_fifo2default:defaultZ8-3354h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                  iSTATE |                              000 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE0 |                              001 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE1 |                              010 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE2 |                              011 |                              011
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE3 |                              100 |                              100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
rd_state_reg2default:default2

sequential2default:default2?
+axi_10g_ethernet_0_axi_fifo__parameterized02default:defaultZ8-3354h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2 
rd_state_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3532default:default8@Z8-6014h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:25 ; elapsed = 00:00:35 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 927 ; free virtual = 10690
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit       Adders := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     10 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 2     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 38    
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               73 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               68 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               28 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 26    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 76    
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	              68K Bit         RAMs := 2     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     73 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     28 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 22    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
V
%s
*synth2>
*Module axi_10g_ethernet_0_example_design 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               28 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 2     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     28 Bit        Muxes := 1     
2default:defaulth p
x
? 
R
%s
*synth2:
&Module axi_10g_ethernet_0_sync_block 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
? 
E
%s
*synth2-
Module mac_rx_interface 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               73 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     73 Bit        Muxes := 2     
2default:defaulth p
x
? 
E
%s
*synth2-
Module mac_tx_interface 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               73 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 7     
2default:defaulth p
x
? 
R
%s
*synth2:
&Module axi_10g_ethernet_0_sync_reset 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 7     
2default:defaulth p
x
? 
P
%s
*synth28
$Module axi_10g_ethernet_0_fifo_ram 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               68 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	              68K Bit         RAMs := 1     
2default:defaulth p
x
? 
P
%s
*synth28
$Module axi_10g_ethernet_0_axi_fifo 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     10 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 19    
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 16    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
`
%s
*synth2H
4Module axi_10g_ethernet_0_axi_fifo__parameterized0 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     10 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 19    
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 17    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2p
\Part Resources:
DSPs: 3600 (col length:200)
BRAMs: 2940 (col length: RAMB18 200 RAMB36 100)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
merging register '%s' into '%s'3619*oasys2)
mni/rxi/reset_reg_reg2default:default2)
mni/txi/reset_reg_reg2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_rx_interface.v2default:default2
802default:default8@Z8-4471h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2.
mni/rxi/rx_axis_resetn_reg2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_rx_interface.v2default:default2
812default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2)
mni/rxi/reset_reg_reg2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_rx_interface.v2default:default2
802default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2.
mni/txi/tx_axis_resetn_reg2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/imports/verilog_mac_if/mac_tx_interface.v2default:default2
862default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2O
;fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/wr_addr_diff_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5502default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2N
:fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/fifo_status_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5722default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2R
>fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/wr_addr_diff_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5502default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2Q
=fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/fifo_status_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5722default:default8@Z8-6014h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2E
1fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/wr_rem2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2H
4fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/wr_rem2default:defaultZ8-5546h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2J
6fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/wr_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5552default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2L
8fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/rd_frames_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3112default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2J
6fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/rd_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
4372default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2M
9fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/wr_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
5552default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2O
;fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/rd_frames_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
3112default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2M
9fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/rd_addr_reg2default:default2?
p/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_axi_fifo.v2default:default2
4372default:default8@Z8-6014h px? 
?
!design %s has unconnected port %s3331*oasys2/
axi_10g_ethernet_0_clocking2default:default2!
tx_mmcm_reset2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2
frame_error2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2$
gen_active_flash2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2&
check_active_flash2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2"
enable_pat_gen2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys25
!axi_10g_ethernet_0_example_design2default:default2$
enable_pat_check2default:defaultZ8-3331h px? 
?
PSwapped enable and write-enable on %s RAM instances of RAM %s to conserve power
3784*oasys2
22default:default2T
@fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/fifo_ram_inst/ram_reg2default:defaultZ8-4652h px? 
?
PSwapped enable and write-enable on %s RAM instances of RAM %s to conserve power
3784*oasys2
22default:default2W
Cfifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/fifo_ram_inst/ram_reg2default:defaultZ8-4652h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2O
;\fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/drop_frame_reg 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2P
<\fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/rd_stall_reg 2default:defaultZ8-3333h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2V
Bfifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/wr_axis_tvalid_prev_reg2default:default25
!axi_10g_ethernet_0_example_design2default:defaultZ8-3332h px?
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2T
@fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/wr_axis_tlast_reg_reg2default:default25
!axi_10g_ethernet_0_example_design2default:defaultZ8-3332h px?
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2M
9fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/drop_frame_reg2default:default25
!axi_10g_ethernet_0_example_design2default:defaultZ8-3332h px?
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2N
:fifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/rd_stall_reg2default:default25
!axi_10g_ethernet_0_example_design2default:defaultZ8-3332h px?
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:26 ; elapsed = 00:00:37 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 911 ; free virtual = 10673
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
e
%s*synth2M
9
Block RAM: Preliminary Mapping  Report (see note below)
2default:defaulth px? 
?
%s*synth2?
?+-----------------------------+------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px? 
?
%s*synth2?
?|Module Name                  | RTL Object | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth px? 
?
%s*synth2?
?+-----------------------------+------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px? 
?
%s*synth2?
?|axi_10g_ethernet_0_fifo_ram: | ram_reg    | 1 K x 68               | W |   | 1 K x 68(WRITE_FIRST)  |   | R | Port A and B     | 0      | 2      | 
2default:defaulth px? 
?
%s*synth2?
?|axi_10g_ethernet_0_fifo_ram: | ram_reg    | 1 K x 68               | W |   | 1 K x 68(WRITE_FIRST)  |   | R | Port A and B     | 0      | 2      | 
2default:defaulth px? 
?
%s*synth2?
?+-----------------------------+------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2G
3fifo_block_i/ethernet_core_i/areset_datapathclk_out2default:default2P
<fifo_block_i/ethernet_core_i/bbstub_areset_datapathclk_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2<
(fifo_block_i/ethernet_core_i/coreclk_out2default:default2E
1fifo_block_i/ethernet_core_i/bbstub_coreclk_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2>
*fifo_block_i/ethernet_core_i/gtrxreset_out2default:default2G
3fifo_block_i/ethernet_core_i/bbstub_gtrxreset_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2>
*fifo_block_i/ethernet_core_i/gttxreset_out2default:default2G
3fifo_block_i/ethernet_core_i/bbstub_gttxreset_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2@
,fifo_block_i/ethernet_core_i/m_axis_rx_tlast2default:default2I
5fifo_block_i/ethernet_core_i/bbstub_m_axis_rx_tlast/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2@
,fifo_block_i/ethernet_core_i/m_axis_rx_tuser2default:default2I
5fifo_block_i/ethernet_core_i/bbstub_m_axis_rx_tuser/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2A
-fifo_block_i/ethernet_core_i/m_axis_rx_tvalid2default:default2J
6fifo_block_i/ethernet_core_i/bbstub_m_axis_rx_tvalid/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2=
)fifo_block_i/ethernet_core_i/qplllock_out2default:default2F
2fifo_block_i/ethernet_core_i/bbstub_qplllock_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2?
+fifo_block_i/ethernet_core_i/qplloutclk_out2default:default2H
4fifo_block_i/ethernet_core_i/bbstub_qplloutclk_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2B
.fifo_block_i/ethernet_core_i/qplloutrefclk_out2default:default2K
7fifo_block_i/ethernet_core_i/bbstub_qplloutrefclk_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2G
3fifo_block_i/ethernet_core_i/reset_counter_done_out2default:default2P
<fifo_block_i/ethernet_core_i/bbstub_reset_counter_done_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2>
*fifo_block_i/ethernet_core_i/resetdone_out2default:default2G
3fifo_block_i/ethernet_core_i/bbstub_resetdone_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2D
0fifo_block_i/ethernet_core_i/rx_statistics_valid2default:default2M
9fifo_block_i/ethernet_core_i/bbstub_rx_statistics_valid/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2=
)fifo_block_i/ethernet_core_i/rxrecclk_out2default:default2F
2fifo_block_i/ethernet_core_i/bbstub_rxrecclk_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2A
-fifo_block_i/ethernet_core_i/s_axis_tx_tready2default:default2J
6fifo_block_i/ethernet_core_i/bbstub_s_axis_tx_tready/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2;
'fifo_block_i/ethernet_core_i/tx_disable2default:default2D
0fifo_block_i/ethernet_core_i/bbstub_tx_disable/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2D
0fifo_block_i/ethernet_core_i/tx_statistics_valid2default:default2M
9fifo_block_i/ethernet_core_i/bbstub_tx_statistics_valid/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys24
 fifo_block_i/ethernet_core_i/txn2default:default2=
)fifo_block_i/ethernet_core_i/bbstub_txn/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys24
 fifo_block_i/ethernet_core_i/txp2default:default2=
)fifo_block_i/ethernet_core_i/bbstub_txp/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2>
*fifo_block_i/ethernet_core_i/txuserrdy_out2default:default2G
3fifo_block_i/ethernet_core_i/bbstub_txuserrdy_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2>
*fifo_block_i/ethernet_core_i/txusrclk2_out2default:default2G
3fifo_block_i/ethernet_core_i/bbstub_txusrclk2_out/O2default:defaultZ8-5578h px? 
?
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys2=
)fifo_block_i/ethernet_core_i/txusrclk_out2default:default2F
2fifo_block_i/ethernet_core_i/bbstub_txusrclk_out/O2default:defaultZ8-5578h px? 
?
$%s for constraint at line %s of %s.
3321*oasys24
 set_false_path : Empty from list2default:default2
222default:default2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2
222default:default8@Z8-3321h px? 
?
$%s for constraint at line %s of %s.
3321*oasys22
set_false_path : Empty to list2default:default2
222default:default2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2?
x/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc2default:default2
222default:default8@Z8-3321h px? 
?
SMoved %s constraints on hierarchical pins to their respective driving/loading pins
4235*oasys2
222default:defaultZ8-5819h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:32 ; elapsed = 00:00:43 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 784 ; free virtual = 10547
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Timing Optimization : Time (s): cpu = 00:00:33 ; elapsed = 00:00:44 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 777 ; free virtual = 10540
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2V
Bfifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/fifo_ram_inst/ram_reg_02default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2V
Bfifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/fifo_ram_inst/ram_reg_12default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2Y
Efifo_block_i/ethernet_mac_fifo_i/rx_fifo_inst/fifo_ram_inst/ram_reg_12default:defaultZ8-4480h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Technology Mapping : Time (s): cpu = 00:00:33 ; elapsed = 00:00:45 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 764 ; free virtual = 10527
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished IO Insertion : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
T
%s
*synth2<
(+------+-------------------+----------+
2default:defaulth p
x
? 
T
%s
*synth2<
(|      |BlackBox name      |Instances |
2default:defaulth p
x
? 
T
%s
*synth2<
(+------+-------------------+----------+
2default:defaulth p
x
? 
T
%s
*synth2<
(|1     |axi_10g_ethernet_0 |         1|
2default:defaulth p
x
? 
T
%s
*synth2<
(+------+-------------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
P
%s*synth28
$+------+-------------------+------+
2default:defaulth px? 
P
%s*synth28
$|      |Cell               |Count |
2default:defaulth px? 
P
%s*synth28
$+------+-------------------+------+
2default:defaulth px? 
P
%s*synth28
$|1     |axi_10g_ethernet_0 |     1|
2default:defaulth px? 
P
%s*synth28
$|2     |BUFG               |     1|
2default:defaulth px? 
P
%s*synth28
$|3     |CARRY4             |    16|
2default:defaulth px? 
P
%s*synth28
$|4     |LUT1               |     5|
2default:defaulth px? 
P
%s*synth28
$|5     |LUT2               |    85|
2default:defaulth px? 
P
%s*synth28
$|6     |LUT3               |    39|
2default:defaulth px? 
P
%s*synth28
$|7     |LUT4               |    85|
2default:defaulth px? 
P
%s*synth28
$|8     |LUT5               |    61|
2default:defaulth px? 
P
%s*synth28
$|9     |LUT6               |    47|
2default:defaulth px? 
P
%s*synth28
$|10    |MMCME2_BASE        |     1|
2default:defaulth px? 
P
%s*synth28
$|11    |RAMB36E1           |     4|
2default:defaulth px? 
P
%s*synth28
$|12    |FDPE               |    20|
2default:defaulth px? 
P
%s*synth28
$|13    |FDRE               |  1058|
2default:defaulth px? 
P
%s*synth28
$|14    |IBUF               |    83|
2default:defaulth px? 
P
%s*synth28
$|15    |IBUFDS             |     1|
2default:defaulth px? 
P
%s*synth28
$|16    |OBUF               |    81|
2default:defaulth px? 
P
%s*synth28
$|17    |OBUFT              |     3|
2default:defaulth px? 
P
%s*synth28
$+------+-------------------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
?
%s
*synth2x
d+------+--------------------------------------+--------------------------------------------+------+
2default:defaulth p
x
? 
?
%s
*synth2x
d|      |Instance                              |Module                                      |Cells |
2default:defaulth p
x
? 
?
%s
*synth2x
d+------+--------------------------------------+--------------------------------------------+------+
2default:defaulth p
x
? 
?
%s
*synth2x
d|1     |top                                   |                                            |  2199|
2default:defaulth p
x
? 
?
%s
*synth2x
d|2     |  sync_insert_error                   |axi_10g_ethernet_0_sync_block__1            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|3     |  sync_coreclk_enable_custom_preamble |axi_10g_ethernet_0_sync_block__2            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|4     |  sync_pcs_loopback                   |axi_10g_ethernet_0_sync_block__3            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|5     |  axi_lite_clocking_i                 |axi_10g_ethernet_0_clocking                 |     3|
2default:defaulth p
x
? 
?
%s
*synth2x
d|6     |  reset_error_sync_reg                |axi_10g_ethernet_0_sync_block               |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|7     |  fifo_block_i                        |axi_10g_ethernet_0_fifo_block               |  1635|
2default:defaulth p
x
? 
?
%s
*synth2x
d|8     |    ethernet_mac_fifo_i               |axi_10g_ethernet_0_xgmac_fifo               |   964|
2default:defaulth p
x
? 
?
%s
*synth2x
d|9     |      i_tx_fifo                       |axi_10g_ethernet_0_axi_fifo                 |   494|
2default:defaulth p
x
? 
?
%s
*synth2x
d|10    |        rd_store_sync                 |axi_10g_ethernet_0_sync_block__4            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|11    |        \GRAY_SYNC[0].sync_gray_addr  |axi_10g_ethernet_0_sync_block__5            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|12    |        \GRAY_SYNC[1].sync_gray_addr  |axi_10g_ethernet_0_sync_block__6            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|13    |        \GRAY_SYNC[2].sync_gray_addr  |axi_10g_ethernet_0_sync_block__7            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|14    |        \GRAY_SYNC[3].sync_gray_addr  |axi_10g_ethernet_0_sync_block__8            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|15    |        \GRAY_SYNC[4].sync_gray_addr  |axi_10g_ethernet_0_sync_block__9            |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|16    |        \GRAY_SYNC[5].sync_gray_addr  |axi_10g_ethernet_0_sync_block__10           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|17    |        \GRAY_SYNC[6].sync_gray_addr  |axi_10g_ethernet_0_sync_block__11           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|18    |        \GRAY_SYNC[7].sync_gray_addr  |axi_10g_ethernet_0_sync_block__12           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|19    |        \GRAY_SYNC[8].sync_gray_addr  |axi_10g_ethernet_0_sync_block__13           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|20    |        \GRAY_SYNC[9].sync_gray_addr  |axi_10g_ethernet_0_sync_block__14           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|21    |        fifo_ram_inst                 |axi_10g_ethernet_0_fifo_ram_1               |    88|
2default:defaulth p
x
? 
?
%s
*synth2x
d|22    |        rd_reset_gen                  |axi_10g_ethernet_0_sync_reset_2             |     9|
2default:defaulth p
x
? 
?
%s
*synth2x
d|23    |        wr_reset_gen                  |axi_10g_ethernet_0_sync_reset_3             |     8|
2default:defaulth p
x
? 
?
%s
*synth2x
d|24    |      rx_fifo_inst                    |axi_10g_ethernet_0_axi_fifo__parameterized0 |   470|
2default:defaulth p
x
? 
?
%s
*synth2x
d|25    |        rd_store_sync                 |axi_10g_ethernet_0_sync_block__15           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|26    |        \GRAY_SYNC[0].sync_gray_addr  |axi_10g_ethernet_0_sync_block__16           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|27    |        \GRAY_SYNC[1].sync_gray_addr  |axi_10g_ethernet_0_sync_block__17           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|28    |        \GRAY_SYNC[2].sync_gray_addr  |axi_10g_ethernet_0_sync_block__18           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|29    |        \GRAY_SYNC[3].sync_gray_addr  |axi_10g_ethernet_0_sync_block__19           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|30    |        \GRAY_SYNC[4].sync_gray_addr  |axi_10g_ethernet_0_sync_block__20           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|31    |        \GRAY_SYNC[5].sync_gray_addr  |axi_10g_ethernet_0_sync_block__21           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|32    |        \GRAY_SYNC[6].sync_gray_addr  |axi_10g_ethernet_0_sync_block__22           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|33    |        \GRAY_SYNC[7].sync_gray_addr  |axi_10g_ethernet_0_sync_block__23           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|34    |        \GRAY_SYNC[8].sync_gray_addr  |axi_10g_ethernet_0_sync_block__24           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|35    |        \GRAY_SYNC[9].sync_gray_addr  |axi_10g_ethernet_0_sync_block__25           |     5|
2default:defaulth p
x
? 
?
%s
*synth2x
d|36    |        fifo_ram_inst                 |axi_10g_ethernet_0_fifo_ram                 |    84|
2default:defaulth p
x
? 
?
%s
*synth2x
d|37    |        rd_reset_gen                  |axi_10g_ethernet_0_sync_reset               |     9|
2default:defaulth p
x
? 
?
%s
*synth2x
d|38    |        wr_reset_gen                  |axi_10g_ethernet_0_sync_reset_0             |    10|
2default:defaulth p
x
? 
?
%s
*synth2x
d|39    |  mni                                 |mac_to_nic_interface                        |   311|
2default:defaulth p
x
? 
?
%s
*synth2x
d|40    |    rxi                               |mac_rx_interface                            |   149|
2default:defaulth p
x
? 
?
%s
*synth2x
d|41    |    txi                               |mac_tx_interface                            |   162|
2default:defaulth p
x
? 
?
%s
*synth2x
d+------+--------------------------------------+--------------------------------------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.090 ; gain = 609.336 ; free physical = 770 ; free virtual = 10534
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 35 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 1800.090 ; gain = 107.500 ; free physical = 826 ; free virtual = 10590
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:34 ; elapsed = 00:00:46 . Memory (MB): peak = 1800.098 ; gain = 609.336 ; free physical = 828 ; free virtual = 10593
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1052default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
!Unisim Transformation Summary:
%s111*project2h
T  A total of 1 instances were transformed.
  MMCME2_BASE => MMCME2_ADV: 1 instances
2default:defaultZ1-111h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1092default:default2
502default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:362default:default2
00:01:282default:default2
1800.0982default:default2
652.1482default:default2
7832default:default2
105482default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/synth_1/axi_10g_ethernet_0_example_design.dcp2default:defaultZ17-1381h px? 
?
?report_utilization: Time (s): cpu = 00:00:00.11 ; elapsed = 00:00:00.14 . Memory (MB): peak = 1824.102 ; gain = 0.000 ; free physical = 792 ; free virtual = 10557
*commonh px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Apr 28 19:13:02 20222default:defaultZ17-206h px? 


End Record

?
Command: %s
53*	vivadotcl2P
<write_bitstream -force axi_10g_ethernet_0_example_design.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2%
xc7vx690t-ffg17612default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2%
xc7vx690t-ffg17612default:defaultZ17-349h px? 
?
?The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2017.072default:default2
-17322default:defaultZ17-1223h px? 
?	
Evaluation License Warning: %s1585*	planAhead2?
?This design contains one or more IP cores that use separately licensed features. If the design has been configured to make use of evaluation features, please note that these features will cease to function after a certain period of time. Please consult the core datasheet to determine whether the core which you have configured will be affected. Evaluation features should NOT be used in production systems.

Evaluation cores found in this design:
    IP core 'axi_10g_ethernet_0' (bd_efdb_0) was generated with multiple features:
        IP feature 'ten_gig_eth_mac' was enabled using a bought license.
        IP feature 'ten_gig_eth_pcs_pma_basekr' was enabled using a design_linking license.
    IP core 'axi_10g_ethernet_0' (bd_efdb_0) was generated with multiple features:
        IP feature 'ten_gig_eth_mac@2016.04' was enabled using a bought license.
        IP feature 'ten_gig_eth_pcs_pma_basekr@2015.04' was enabled using a design_linking license.
    IP core 'bd_efdb_0_xpcs_0' (ten_gig_eth_pcs_pma_v6_0_8) was generated using a design_linking license.
2default:defaultZ12-1790h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
z
Command: %s
53*	vivadotcl2I
5report_drc (run_mandatory_drcs) for: bitstream_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px? 
?
?Unspecified I/O Standard: 165 out of 171 logical ports use I/O standard (IOSTANDARD) value 'DEFAULT', instead of a user assigned specific value. This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all I/O standards. This design will fail to generate a bitstream unless all logical ports have a user specified I/O standard value defined. To allow bitstream creation with unspecified I/O standard values (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks NSTD-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run. Problem ports: %s.%s*DRC2?
 "J
RX_FIFO_pipe_read_data[72:0]RX_FIFO_pipe_read_data2default:default"L
TX_FIFO_pipe_write_data[72:0]TX_FIFO_pipe_write_data2default:default"(
clk_in_pclk_in_p2default:default"(
clk_in_nclk_in_n2default:default"B
RX_FIFO_pipe_read_reqRX_FIFO_pipe_read_req2default:default"B
RX_FIFO_pipe_read_ackRX_FIFO_pipe_read_ack2default:default"D
TX_FIFO_pipe_write_reqTX_FIFO_pipe_write_req2default:default"D
TX_FIFO_pipe_write_ackTX_FIFO_pipe_write_ack2default:default"0
pcs_loopbackpcs_loopback2default:default".
reset_errorreset_error2default:default"0
insert_errorinsert_error2default:default"8
serialized_statsserialized_stats2default:default">
sim_speedup_controlsim_speedup_control2default:default"D
enable_custom_preambleenable_custom_preamble2default:default"*
frame_errorframe_error2default:..."/
(the first 15 of 21 listed)2default:default2default:default2(
 DRC|Pin Planning2default:default8ZNSTD-1h px? 
?
?Unconstrained Logical Port: 171 out of 171 logical ports have no user assigned specific location constraint (LOC). This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all pin locations. This design will fail to generate a bitstream unless all logical ports have a user specified site LOC constraint defined.  To allow bitstream creation with unspecified pin locations (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks UCIO-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run.  Problem ports: %s.%s*DRC2?
 "J
RX_FIFO_pipe_read_data[72:0]RX_FIFO_pipe_read_data2default:default"L
TX_FIFO_pipe_write_data[72:0]TX_FIFO_pipe_write_data2default:default"(
clk_in_pclk_in_p2default:default"(
clk_in_nclk_in_n2default:default"(
refclk_prefclk_p2default:default"(
refclk_nrefclk_n2default:default"
rxprxp2default:default"B
RX_FIFO_pipe_read_reqRX_FIFO_pipe_read_req2default:default"B
RX_FIFO_pipe_read_ackRX_FIFO_pipe_read_ack2default:default"D
TX_FIFO_pipe_write_reqTX_FIFO_pipe_write_req2default:default"D
TX_FIFO_pipe_write_ackTX_FIFO_pipe_write_ack2default:default"0
pcs_loopbackpcs_loopback2default:default"
rxnrxn2default:default".
reset_errorreset_error2default:default",
insert_errorinsert_error2default:..."/
(the first 15 of 27 listed)2default:default2default:default2(
 DRC|Pin Planning2default:default8ZUCIO-1h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "?
?fifo_block_i/ethernet_core_i/inst/xpcs/inst/ten_gig_eth_pcs_pma_block_i/bd_efdb_0_xpcs_0_local_clock_reset_block/sim_speedup_controller_inst/load_sim_value_control?fifo_block_i/ethernet_core_i/inst/xpcs/inst/ten_gig_eth_pcs_pma_block_i/bd_efdb_0_xpcs_0_local_clock_reset_block/sim_speedup_controller_inst/load_sim_value_control2default:default2default:default2?
 "?
?fifo_block_i/ethernet_core_i/inst/xpcs/inst/ten_gig_eth_pcs_pma_block_i/bd_efdb_0_xpcs_0_local_clock_reset_block/sim_speedup_controller_inst/simple_delay_inst_i_1/O?fifo_block_i/ethernet_core_i/inst/xpcs/inst/ten_gig_eth_pcs_pma_block_i/bd_efdb_0_xpcs_0_local_clock_reset_block/sim_speedup_controller_inst/simple_delay_inst_i_1/O2default:default2default:default2?
 "?
?fifo_block_i/ethernet_core_i/inst/xpcs/inst/ten_gig_eth_pcs_pma_block_i/bd_efdb_0_xpcs_0_local_clock_reset_block/sim_speedup_controller_inst/simple_delay_inst_i_1	?fifo_block_i/ethernet_core_i/inst/xpcs/inst/ten_gig_eth_pcs_pma_block_i/bd_efdb_0_xpcs_0_local_clock_reset_block/sim_speedup_controller_inst/simple_delay_inst_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
_No routable loads: 3 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2?
 "V
reset_error_sync_reg/sync1_r[4]reset_error_sync_reg/sync1_r[4]2default:default"P
sync_insert_error/sync1_r[4]sync_insert_error/sync1_r[4]2default:default"\
"axi_lite_clocking_i/tx_mmcm_locked"axi_lite_clocking_i/tx_mmcm_locked2default:default2default:default2=
 %DRC|Implementation|Routing|Chip Level2default:default8Z	RTSTAT-10h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
f
DRC finished with %s
1905*	planAhead2(
2 Errors, 3 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
R
+Error(s) found during DRC. Bitgen not run.
1345*	planAheadZ12-1345h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
812default:default2
92default:default2
22default:default2
32default:defaultZ4-41h px? 
Q

%s failed
30*	vivadotcl2#
write_bitstream2default:defaultZ4-43h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
write_bitstream: 2default:default2
00:00:062default:default2
00:00:232default:default2
3144.8552default:default2
0.0002default:default2
1842default:default2
95192default:defaultZ17-722h px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Apr 28 19:18:34 20222default:defaultZ17-206h px? 


End Record
#set AHIR_RELEASE $::env(AHIR_RELEASE)
#set AJIT_PROJECT_HOME $::env(AJIT_PROJECT_HOME)

# edit this to pick up lib vhdl files from ../vhdl_libs
read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
# etc...
read_vhdl -library simpleUartLib $AJIT_PROJECT_HOME/processor/vhdl/lib/simpleUartLib.vhdl

read_verilog


############# CONSTRAINT FILE ###########
read_xdc ../constraints/kc705_dram_spi_flash_xadc.xdc

############# IP CORE FILES #############
set_property part xc7k325tffg900-2 [current_project]
set_property board_part xilinx.com:kc705:part0:1.1 [current_project]

################### standlone proto core ################
# read from ../ip/
read_ip ../mig7/mig_7series_0/mig_7series_0.xci
read_ip ../axi_protocol_converter/axi_protocol_converter_0/axi_protocol_converter_0.xci
read_ip ../ila/ila_0/ila_0.xci

#read_ip ../ip/clk_wiz_0.xci

## core edif file
read_edif ../ngc/processor_1x2x32.ngc 

############### SYNTHESIZE ##############
synth_design -fsm_extraction off  -top dram_spi_wrapper -part xc7k325tffg900-2
write_checkpoint -force PostSynthCheckpoint.dcp
report_timing_summary -file timing.postsynth.rpt -nworst 4

report_utilization -file utilization_post_synth.rpt
report_utilization -hierarchical -file utilization_post_synth.hierarchical.rpt
opt_design
opt_design
place_design
phys_opt_design
phys_opt_design
route_design
phys_opt_design
phys_opt_design
route_design
phys_opt_design  -directive Explore
route_design     -directive Explore
write_checkpoint -force PostPlaceRouteCheckpoint.dcp
report_timing_summary -file timing.rpt -nworst 10 -verbose
report_utilization -file utilization_post_place_and_route.rpt
report_utilization -hierarchical -file utilization_post_place_and_route.hierarchical.rpt
write_bitstream -force processor_1x2x32.with_flash_and_dram.kc705.bit

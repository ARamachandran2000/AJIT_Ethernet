#set AHIR_RELEASE $::env(AHIR_RELEASE)
#set AJIT_PROJECT_HOME $::env(AJIT_PROJECT_HOME)

#create_project -in memory 

read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
read_vhdl -library simpleUartLib ../vhdl_libs/simpleUartLib.vhdl
read_vhdl -library GenericCoreAddonLib ../vhdl_libs/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl

read_vhdl -library ahir_system_global_packagelib ../vhdl/ahir_system_global_packagelib.vhdl
read_vhdl -library DualClockedQueuelib ../vhdl_libs/DualClockedQueuelib.vhdl

## should read_vhdl be used for mac_rx,mac_tx verilog files?
read_verilog ../vhdl/mac_rx_interface.v
read_verilog ../vhdl/mac_tx_interface.v
read_verilog ../vhdl/mac_engine.v
read_vhdl ../vhdl/nic.vhdl
read_vhdl ../vhdl/top_level.vhdl
############# CONSTRAINT FILE ###########
read_xdc ../constraints/vc709_constraints.xdc

############# IP CORE FILES #############
set_property part xc7vx690tffg1761-2 [current_project]
set_property board_part xilinx.com:vc709:part0:1.5 [current_project]

# set:q up the link to the processor ngc.
read_edif ../ngc/processor_1x1x32.ngc

#read_ip   ../../standalone_navic_with_mock_adcs/ip/ClkWiz/ClkWiz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
#read_ip ../ip/ClkWiz80MHz/ClockingWizFor80MHz/ClockingWizFor80MHz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci

read_ip ../ip/ClkWiz156_25MHz/ClockingWizFor156_25MHz/ClockingWizFor156_25MHz.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.xci

read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_req/fifo_generator_acb_req.xci
read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
############### SYNTHESIZE ##############
synth_design -top top_level -part xc7vx690tffg1761-2 
write_checkpoint -force PostSynthCheckpoint.dcp
report_timing_summary -file timing.postsynth.rpt -nworst 4

report_utilization -file utilization_post_synth.rpt
report_utilization -hierarchical -file utilization_post_synth.hierarchical.rpt

opt_design
place_design
phys_opt_design
phys_opt_design
route_design
phys_opt_design
phys_opt_design  -directive Explore

report_timing_summary -file timing.rpt -nworst 10 -verbose
report_utilization -file utilization_post_place_and_route.rpt
report_utilization -hierarchical -file utilization_post_place_and_route.hierarchical.rpt
write_bitstream -force v0_1x1x32.nic.sram4MB.vc709.bit


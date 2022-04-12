set AHIR_RELEASE $::env(AHIR_RELEASE)
#set AJIT_PROJECT_HOME $::env(AJIT_PROJECT_HOME)

#create_project -in memory 

read_vhdl -library ahir $AHIR_RELEASE/vhdl/ahir.vhdl
read_vhdl -library ahir_ieee_proposed $AHIR_RELEASE/vhdl/aHiR_ieee_proposed.vhdl
#read_vhdl -library AjitCustom $AJIT_PROJECT_HOME/processor/vhdl/lib/AjitCustom.vhdl
#read_vhdl -library simpleUartLib $AJIT_PROJECT_HOME/processor/vhdl/lib/simpleUartLib.vhdl
#read_vhdl -library GenericCoreAddonLib $AJIT_PROJECT_HOME/cores/building_blocks/outside_sys/lib/GenericCoreAddOnLib.vhdl
#read_vhdl -library GenericGlueStuff $AJIT_PROJECT_HOME/processor/Aa_v3/modules/lib/GenericGlueStuff.vhdl
#read_vhdl -library GlueModules $AJIT_PROJECT_HOME/processor/Aa_v3/modules/lib/GlueModules.vhdl

read_vhdl -library GenericCoreAddonLib ../vhdl_libs/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl

read_vhdl ../vhdl/top_level.vhdl
############# CONSTRAINT FILE ###########
read_xdc ../constraints/vc709_constraints.xdc

############# IP CORE FILES #############
set_property part xc7vx690tffg1761-2 [current_project]
set_property board_part xilinx.com:vc709:part0:1.5 [current_project]

# set up the link to the processor ngc.
read_edif ../ngc/processor_1x1x32.set_associative.ngc

#read_ip   ../../standalone_navic_with_mock_adcs/ip/ClkWiz/ClkWiz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
read_ip ../ip/ClkWiz80MHz/ClockingWizFor80MHz/ClockingWizFor80MHz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci

read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_req/fifo_generator_acb_req.xci
read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
read_ip ../ip//FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
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
write_bitstream -force v0_1x1x32.sram4MB.vc709.bit


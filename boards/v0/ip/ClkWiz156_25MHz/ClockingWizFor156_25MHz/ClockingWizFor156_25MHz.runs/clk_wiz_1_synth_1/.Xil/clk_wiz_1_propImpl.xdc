set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/v0/ip/ClkWiz156_25MHz/ClockingWizFor156_25MHz/ClockingWizFor156_25MHz.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.xdc rfile:../../../ClockingWizFor156_25MHz.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.05

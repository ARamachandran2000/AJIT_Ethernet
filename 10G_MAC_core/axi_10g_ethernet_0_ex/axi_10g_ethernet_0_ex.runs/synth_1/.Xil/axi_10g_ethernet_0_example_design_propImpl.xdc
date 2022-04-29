set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/imports/axi_10g_ethernet_0_example_design.xdc rfile:../../../imports/axi_10g_ethernet_0_example_design.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_in_p 0.050
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ pattern_generator*sync1_r_reg[0]}]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.2000 -datapath_only  -from [get_cells {fifo_block_i/ethernet_mac_fifo_i/*/rd_addr_gray_reg_reg[*]}] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_case_analysis 0 [get_ports sim_speedup_control]

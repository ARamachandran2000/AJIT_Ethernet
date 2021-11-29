# PART is virtex7 xc7vx690tffg1761-2


#######################################################
# Clock/period constraints                            #
#######################################################
# Main transmit clock/period constraints

create_clock -period 5.000 [get_ports clk_in_p]
set_input_jitter clk_in_p 0.050
create_clock -period 3.200 [get_ports refclk_p]

#######################################################
# Synchronizer False paths
#######################################################
set_false_path -to [get_cells -hierarchical -filter {NAME =~ pattern_generator*sync1_r_reg[0]}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ reset_error_sync_reg*sync1_r_reg[0]}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *shared_clock_reset_block*sync1_r_reg[*]}] -filter {NAME =~ *PRE}]

#######################################################
# FIFO level constraints
#######################################################

set_false_path -from [get_cells fifo_block_i/ethernet_mac_fifo_i/*/wr_store_frame_tog_reg] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
set_max_delay 3.2000 -datapath_only  -from [get_cells {fifo_block_i/ethernet_mac_fifo_i/*/rd_addr_gray_reg_reg[*]}] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells {fifo_block_i/ethernet_mac_fifo_i/*/*/reset_async*_reg}]]
set_false_path -from [get_cells fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/rd_avail_reg] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
#set_false_path -from [get_clocks rx_dcm_clk0] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/i_tx_fifo/fifo_ram_inst/rd_data_reg[*]]
# false path from the write domain to the read domain of the fifos
set_false_path -from [get_pins -filter {name =~ *CLKBWRCLK} -of [get_cells -hierarchical -filter {name =~ */i_tx_fifo/fifo_ram_inst/ram_reg_0}]] -to [get_cells -hierarchical -filter {name =~ */i_tx_fifo/rd_axis_tdata_reg[*]}]
set_false_path -from [get_pins -filter {name =~ *CLKBWRCLK} -of [get_cells -hierarchical -filter {name =~ */i_tx_fifo/fifo_ram_inst/ram_reg_1}]] -to [get_cells -hierarchical -filter {name =~ */i_tx_fifo/rd_axis_tdata_reg[*]}]
set_false_path -from [get_pins -filter {name =~ *CLKBWRCLK} -of [get_cells -hierarchical -filter {name =~ */rx_fifo_inst/fifo_ram_inst/ram_reg_0}]] -to [get_cells -hierarchical -filter {name =~ */rx_fifo_inst/rd_axis_tdata_reg[*]}]
set_false_path -from [get_pins -filter {name =~ *CLKBWRCLK} -of [get_cells -hierarchical -filter {name =~ */rx_fifo_inst/fifo_ram_inst/ram_reg_1}]] -to [get_cells -hierarchical -filter {name =~ */rx_fifo_inst/rd_axis_tdata_reg[*]}]
# in the 32 bit MAC the tx data is only read out every other cycle so it can therefore be classed as a multicycle path
set_multicycle_path -setup 2 -through  [get_pins -filter {name =~ *DOBDO[31]} -of [get_cells -hierarchical -filter {name =~ */i_tx_fifo/fifo_ram_inst/ram_reg_1}]]
set_multicycle_path -hold 1 -through  [get_pins -filter {name =~ *DOBDO[31]} -of [get_cells -hierarchical -filter {name =~ */i_tx_fifo/fifo_ram_inst/ram_reg_1}]]
set_multicycle_path -setup 2 -through  [get_pins -filter {name =~ *DOBDO[30]} -of [get_cells -hierarchical -filter {name =~ */i_tx_fifo/fifo_ram_inst/ram_reg_1}]]
set_multicycle_path -hold 1 -through  [get_pins -filter {name =~ *DOBDO[30]} -of [get_cells -hierarchical -filter {name =~ */i_tx_fifo/fifo_ram_inst/ram_reg_1}]]

#######################################################
# I/O constraints                                     #
#######################################################

# These inputs can be connected to dip switches or push buttons on an
# appropriate board.

set_false_path -from [get_ports reset]
set_false_path -from [get_ports reset_error]
set_false_path -from [get_ports insert_error]
set_false_path -from [get_ports pcs_loopback]
set_false_path -from [get_ports enable_pat_gen]
set_false_path -from [get_ports enable_pat_check]
set_false_path -from [get_ports enable_custom_preamble]
set_case_analysis 0  [get_ports sim_speedup_control]

# These outputs can be connected to LED's or headers on an
# appropriate board.

set_false_path -to [get_ports core_ready]
set_false_path -to [get_ports coreclk_out]
set_false_path -to [get_ports qplllock_out]
set_false_path -to [get_ports frame_error]
set_false_path -to [get_ports gen_active_flash]
set_false_path -to [get_ports check_active_flash]
set_false_path -to [get_ports serialized_stats]


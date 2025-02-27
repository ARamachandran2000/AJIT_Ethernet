set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/v0/constraints/vc709_constraints.xdc rfile:../../constraints/vc709_constraints.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/v0/ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_req/fifo_generator_acb_req_clocks.xdc rfile:../../ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_req/fifo_generator_acb_req_clocks.xdc id:2 order:LATE scoped_inst:DualClockedQueue_ACB_req_instance/dual_clock_fifo/U0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/v0/ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_resp/fifo_generator_acb_resp_clocks.xdc rfile:../../ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_acb_resp/fifo_generator_acb_resp_clocks.xdc id:3 order:LATE scoped_inst:DualClockedQueue_ACB_resp_inst/dual_clock_fifo/U0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/v0/ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_req/fifo_generator_afb_req_clocks.xdc rfile:../../ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_req/fifo_generator_afb_req_clocks.xdc id:4 order:LATE scoped_inst:DualClockedQueue_AFB_req_inst/dual_clock_fifo/U0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/v0/ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_resp/fifo_generator_afb_resp_clocks.xdc rfile:../../ip/FIFO_Generators/FIFO_Generators.srcs/sources_1/ip/fifo_generator_afb_resp/fifo_generator_afb_resp_clocks.xdc id:5 order:LATE scoped_inst:DualClockedQueue_AFB_resp_inst/dual_clock_fifo/U0} [current_design]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H19 [get_ports clk_p]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G18 [get_ports clk_n]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks -include_generated_clocks clk_out1*] -to [get_clocks -include_generated_clocks clk_out2*]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks -include_generated_clocks clk_out2*] -to [get_clocks -include_generated_clocks clk_out1*]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L29 [get_ports {DEBUG_UART_TX}]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L30 [get_ports {DEBUG_UART_RX}]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR40 [get_ports reset_clk]
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU38 [get_ports reset]
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV30 [get_ports {CPU_RESET}]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY33 [get_ports {DEBUG_MODE}]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA31 [get_ports {SINGLE_STEP_MODE}]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AM39 [get_ports {CPU_MODE[1]}]
set_property src_info {type:XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN39 [get_ports {CPU_MODE[0]}]
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V30 [get_ports {SERIAL_UART_RX}]
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V31 [get_ports {SERIAL_UART_TX}]
set_property src_info {type:SCOPED_XDC file:2 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_ACB_req_instance/dual_clock_fifo/U0/rd_clk]]]
set_property src_info {type:SCOPED_XDC file:2 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_ACB_req_instance/dual_clock_fifo/U0/wr_clk]]]
set_property src_info {type:SCOPED_XDC file:3 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_ACB_resp_inst/dual_clock_fifo/U0/rd_clk]]]
set_property src_info {type:SCOPED_XDC file:3 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_ACB_resp_inst/dual_clock_fifo/U0/wr_clk]]]
set_property src_info {type:SCOPED_XDC file:4 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_AFB_req_inst/dual_clock_fifo/U0/rd_clk]]]
set_property src_info {type:SCOPED_XDC file:4 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_AFB_req_inst/dual_clock_fifo/U0/wr_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_AFB_resp_inst/dual_clock_fifo/U0/rd_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins DualClockedQueue_AFB_resp_inst/dual_clock_fifo/U0/wr_clk]]]
current_instance DualClockedQueue_ACB_req_instance/dual_clock_fifo/U0
set_property src_info {type:SCOPED_XDC file:2 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] 6.400
set_property src_info {type:SCOPED_XDC file:2 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}] 6.400
current_instance
current_instance DualClockedQueue_ACB_resp_inst/dual_clock_fifo/U0
set_property src_info {type:SCOPED_XDC file:3 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] 6.400
set_property src_info {type:SCOPED_XDC file:3 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}] 6.400
current_instance
current_instance DualClockedQueue_AFB_req_inst/dual_clock_fifo/U0
set_property src_info {type:SCOPED_XDC file:4 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] 6.400
set_property src_info {type:SCOPED_XDC file:4 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}] 6.400
current_instance
current_instance DualClockedQueue_AFB_resp_inst/dual_clock_fifo/U0
set_property src_info {type:SCOPED_XDC file:5 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] 6.400
set_property src_info {type:SCOPED_XDC file:5 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_bus_skew -from [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells {inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}] 6.400

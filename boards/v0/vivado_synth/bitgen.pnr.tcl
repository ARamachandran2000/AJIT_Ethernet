open_checkpoint PostSynthCheckpoint.dcp


opt_design
place_design
phys_opt_design
phys_opt_design

route_design -directive NoTimingRelaxation
route_design -directive Explore
phys_opt_design
phys_opt_design  -directive Explore
phys_opt_design  -directive AggressiveExplore

report_timing_summary -file timing.rpt -nworst 10 -verbose
report_utilization -file utilization_post_place_and_route.rpt
report_utilization -hierarchical -file utilization_post_place_and_route.hierarchical.rpt
write_bitstream -force v0_1x1x32.nic.sram4MB.vc709.bit


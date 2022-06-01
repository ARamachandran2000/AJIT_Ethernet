vlib work
vlib msim

vlib msim/ten_gig_eth_mac_v15_1_2
vlib msim/xil_defaultlib
vlib msim/ten_gig_eth_pcs_pma_v6_0_8
vlib msim/xlconstant_v1_1_3

vmap ten_gig_eth_mac_v15_1_2 msim/ten_gig_eth_mac_v15_1_2
vmap xil_defaultlib msim/xil_defaultlib
vmap ten_gig_eth_pcs_pma_v6_0_8 msim/ten_gig_eth_pcs_pma_v6_0_8
vmap xlconstant_v1_1_3 msim/xlconstant_v1_1_3

vlog -work ten_gig_eth_mac_v15_1_2 -64 -incr \
"../../../ipstatic/hdl/ten_gig_eth_mac_v15_1_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_0/ten_gig_eth_mac_v15_1_1/hdl/bd_efdb_0_xmac_0_core.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_0/synth/bd_efdb_0_xmac_0_block.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_0/synth/bd_efdb_0_xmac_0.v" \

vlog -work ten_gig_eth_pcs_pma_v6_0_8 -64 -incr \
"../../../ipstatic/hdl/ten_gig_eth_pcs_pma_v6_0_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_gtwizard_gth_10gbaser_gt.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_gtwizard_gth_10gbaser_multi_gt.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_ff_synchronizer_rst.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_ff_synchronizer.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_local_clock_and_reset.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_sim_speedup_controller.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_cable_pull_logic.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_block.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_support.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_shared_clock_and_reset.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_gt_common.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0_ff_synchronizer_rst2.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/synth/bd_efdb_0_xpcs_0.v" \

vlog -work xlconstant_v1_1_3 -64 -incr \
"../../../ipstatic/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_2/sim/bd_efdb_0_dcm_locked_driver_0.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_3/sim/bd_efdb_0_pma_pmd_type_driver_0.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/hdl/bd_efdb_0.v" \
"../../../../axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/sim/axi_10g_ethernet_0.v" \

vlog -work xil_defaultlib \
"glbl.v"


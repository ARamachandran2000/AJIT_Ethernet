vlib work
vlib msim

vlib msim/xbip_utils_v3_0_7
vlib msim/xbip_pipe_v3_0_3
vlib msim/xbip_bram18k_v3_0_3
vlib msim/mult_gen_v12_0_12
vlib msim/axi_lite_ipif_v3_0_4
vlib msim/tri_mode_ethernet_mac_v9_0_7
vlib msim/xil_defaultlib

vmap xbip_utils_v3_0_7 msim/xbip_utils_v3_0_7
vmap xbip_pipe_v3_0_3 msim/xbip_pipe_v3_0_3
vmap xbip_bram18k_v3_0_3 msim/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 msim/mult_gen_v12_0_12
vmap axi_lite_ipif_v3_0_4 msim/axi_lite_ipif_v3_0_4
vmap tri_mode_ethernet_mac_v9_0_7 msim/tri_mode_ethernet_mac_v9_0_7
vmap xil_defaultlib msim/xil_defaultlib

vcom -work xbip_utils_v3_0_7 -64 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -64 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_3 -64 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_12 -64 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vlog -work tri_mode_ethernet_mac_v9_0_7 -64 -incr \
"../../../ipstatic/hdl/tri_mode_ethernet_mac_v9_0_rfs.v" \

vcom -work tri_mode_ethernet_mac_v9_0_7 -64 -93 \
"../../../ipstatic/hdl/tri_mode_ethernet_mac_v9_0_rfs.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/common/tri_mode_ethernet_mac_0_block_reset_sync.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/common/tri_mode_ethernet_mac_0_block_sync_block.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_axi4_lite_ipif_top.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_axi4_lite_ipif_wrapper.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_clk_en_gen.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/physical/tri_mode_ethernet_mac_0_rgmii_v2_0_if.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/statistics/tri_mode_ethernet_mac_0_vector_decode.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_block.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_support.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_support_clocking.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_support_resets.v" \
"../../../../TEMAC_IP_with_Bridge.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0.v" \

vlog -work xil_defaultlib \
"glbl.v"


onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+tri_mode_ethernet_mac_0 -L xbip_utils_v3_0_7 -L xbip_pipe_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L axi_lite_ipif_v3_0_4 -L tri_mode_ethernet_mac_v9_0_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tri_mode_ethernet_mac_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {tri_mode_ethernet_mac_0.udo}

run -all

endsim

quit -force

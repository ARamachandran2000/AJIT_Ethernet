# source /vivado/Vivado/2014.4/settings64.sh
source ~/digitalbashrc
#source /home/Xilinx_2017.1/Vivado/2017.1/settings64.sh
source ~/Vivado/2017.1/settings64.sh
vivado -mode batch -source bitgen.pnr.tcl

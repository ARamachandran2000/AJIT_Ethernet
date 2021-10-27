rm -rf .Aa
mkdir .Aa
#link 
AaLinkExtMem src/decls.aa src/rx_from_mac.aa |vcFormat > .Aa/rx_from_mac.linked.aa
#aa2c model
TOPMODULES="-T rx_from_mac -T read_from_tb -T send_to_tb"
rm -rf aa2c
mkdir aa2c
Aa2C $TOPMODULES .Aa/rx_from_mac.linked.aa -o aa2c/
#
# optimize
#
AaOpt -B .Aa/rx_from_mac.linked.aa | vcFormat > .Aa/rx_from_mac.opt.aa
#
# to virtual circuit
#
rm -rf .vC/
mkdir .vC/
Aa2VC -O -C .Aa/rx_from_mac.opt.aa | vcFormat > .vC/rx_from_mac.vc
#
# to VHDL
#
rm -rf vhdl/
mkdir vhdl/
vc2vhdl -U -O -v -a -C -e ahir_system -w -s modelsim $TOPMODULES -f .vC/rx_from_mac.vc
vhdlFormat < ahir_system_global_package.unformatted_vhdl > vhdl/ahir_system_global_pakage.vhdl
vhdlFormat < ahir_system.unformatted_vhdl > vhdl/ahir_system.vhdl
vhdlFormat < ahir_system_test_bench.unformatted_vhdl > vhdl/ahir_system_test_bench.vhdl
rm -f *.unformatted_vhdl

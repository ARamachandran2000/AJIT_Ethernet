rm -rf .Aa
mkdir .Aa
#link 
AaLinkExtMem  src/prog.aa |vcFormat > .Aa/prog.linked.aa
#aa2c model
TOPMODULES="-T rx_fifo_reader -T read_from_tb -T send_to_tb"
rm -rf aa2c
mkdir aa2c
Aa2C $TOPMODULES .Aa/prog.linked.aa -o aa2c/
#
# optimize
#
AaOpt -B .Aa/prog.linked.aa | vcFormat > .Aa/prog.opt.aa
#
# to virtual circuit
#
rm -rf .vC/
mkdir .vC/
Aa2VC -O -C .Aa/prog.opt.aa | vcFormat > .vC/prog.vc
#
# to VHDL
#
rm -rf vhdl/
mkdir vhdl/
vc2vhdl -U -O -v -a -C -e ahir_system -w -s modelsim $TOPMODULES -f .vC/prog.vc
vhdlFormat < ahir_system_global_package.unformatted_vhdl > vhdl/ahir_system_global_pakage.vhdl
vhdlFormat < ahir_system.unformatted_vhdl > vhdl/ahir_system.vhdl
vhdlFormat < ahir_system_test_bench.unformatted_vhdl > vhdl/ahir_system_test_bench.vhdl
rm -f *.unformatted_vhdl

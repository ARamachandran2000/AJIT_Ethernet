hierSys2Vhdl -s ghdl -o vhdl ../pipes.aa -a nic.hsys 

vhdlFormat < vhdl/nic_lib/nic.unformatted_vhdl > vhdl/nic_lib/nic.vhdl
vhdlFormat < vhdl/testbench/nic_test_bench.unformatted_vhdl > vhdl/testbench/nic_test_bench.vhdl
#vhdlFormat < vhdl/memory_subsys_lib/memory_subsys.unformatted_vhdl > vhdl/memory_subsys_lib/memory_subsys.vhdl

rm -rf vhdl/*/*.unformatted_vhdl

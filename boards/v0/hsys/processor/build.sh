hierSys2Vhdl -s ghdl -o vhdl ../pipes.aa -a processor_1x1x32.hsys 

vhdlFormat < vhdl/ajit_processor_lib/processor_1x1x32.unformatted_vhdl > vhdl/ajit_processor_lib/processor_1x1x32.vhdl
vhdlFormat < vhdl/testbench/processor_1x1x32_test_bench.unformatted_vhdl > vhdl/testbench/processor_1x1x32_test_bench.vhdl
#vhdlFormat < vhdl/memory_subsys_lib/memory_subsys.unformatted_vhdl > vhdl/memory_subsys_lib/memory_subsys.vhdl

rm -rf vhdl/*/*.unformatted_vhdl

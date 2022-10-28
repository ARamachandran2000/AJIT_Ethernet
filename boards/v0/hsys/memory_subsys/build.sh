hierSys2Vhdl -s ghdl -o vhdl ../pipes.aa -a GlueModules/GlueModules.hsys acb_sram_22/acb_sram_22.hsys memory_subsys.hsys  

vhdlFormat < vhdl/memory_subsys_lib/memory_subsys.unformatted_vhdl > vhdl/memory_subsys_lib/memory_subsys.vhdl
vhdlFormat < vhdl/testbench/memory_subsys_test_bench.unformatted_vhdl > vhdl/testbench/memory_subsys_test_bench.vhdl
#vhdlFormat < vhdl/memory_subsys_lib/memory_subsys.unformatted_vhdl > vhdl/memory_subsys_lib/memory_subsys.vhdl

rm -rf vhdl/*/*.unformatted_vhdl

hierSys2Vhdl -s ghdl -o vhdl pipes.aa -a memory_subsys/GlueModules/GlueModules.hsys memory_subsys/acb_sram_22/acb_sram_22.hsys memory_subsys/memory_subsys.hsys uart/mySelfTuningUart.hsys nic/nic.hsys processor/processor_1x1x32.hsys v0.hsys 

vhdlFormat < vhdl/v0_lib/v0_base.unformatted_vhdl > vhdl/v0_lib/v0_base.vhdl
vhdlFormat < vhdl/testbench/v0_base_test_bench.unformatted_vhdl > vhdl/testbench/v0_base_test_bench.vhdl
vhdlFormat < vhdl/memory_subsys_lib/memory_subsys.unformatted_vhdl > vhdl/memory_subsys_lib/memory_subsys.vhdl

rm -rf vhdl/*/*.unformatted_vhdl

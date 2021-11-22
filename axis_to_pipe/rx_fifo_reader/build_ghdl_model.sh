AHIR_LIB=$AHIR_RELEASE/lib
VHDL_LIB=$AHIR_RELEASE/vhdl
ghdl --clean
ghdl --remove
ghdl -i --work=GhdlLink  $VHDL_LIB/GhdlLink.vhdl
ghdl -i --work=aHiR_ieee_proposed  $VHDL_LIB/aHiR_ieee_proposed.vhdl
ghdl -i --work=ahir  $VHDL_LIB/ahir.vhdl
ghdl -i --work=work hw/vhdl/ahir_system_global_package.vhdl
ghdl -i --work=work hw/vhdl/ahir_system.vhdl
ghdl -i --work=work hw/vhdl/ahir_system_test_bench.vhdl
ghdl -m --work=work -Wl,-L$AHIR_LIB -Wl,-lVhpi ahir_system_test_bench 

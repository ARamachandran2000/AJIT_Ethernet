# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=../../../code/NicWithMacIf/Nic
TESTBENCH=./testbench
all: HW 
TOVC:aalink aa2vc 
VC2VHDL: vc2vhdl  vhdlsim
AA2VHDLSIM: aa2vc  vc2vhdl  vhdlsim
TOVHDL:TOVC vc2vhdl

TOPMODULES=-T nicRxFromMacDaemon -T read_from_tb -T send_header_to_tb -T send_packet_to_tb



# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  vhdlsim

AA2VHDL: aa2vc vc2vhdl vhdlsim

# Aa to vC
aalink: $(SRC)/rx_from_mac.aa 
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/rx_from_mac.aa | vcFormat > rx_from_mac.linked.aa
	AaOpt -B rx_from_mac.linked.aa | vcFormat > rx_from_mac.linked.opt.aa

aa2vc: rx_from_mac.linked.opt.aa
	Aa2VC -O -C rx_from_mac.linked.opt.aa | vcFormat > rx_from_mac.vc

# vC to VHDL
vc2vhdl: rx_from_mac.vc
	vc2vhdl -D -O -S 4 -I 2 -v -a -C -e ahir_system -w -s ghdl $(TOPMODULES) -f rx_from_mac.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < ahir_system_global_package.unformatted_vhdl > ahir_system_global_package.vhdl
	vhdlFormat < ahir_system.unformatted_vhdl > ahir_system.vhdl
	vhdlFormat < ahir_system_test_bench.unformatted_vhdl > ahir_system_test_bench.vhdl

# build testbench and ghdl executable
# note the use of libVhpi in building the testbench.
vhdlsim: ahir_system.vhdl ahir_system_test_bench.vhdl $(TESTBENCH)/testbench.c vhdlCStubs.h vhdlCStubs.c
	gcc -c vhdlCStubs.c  -I$(SRC) -I./ -I$(AHIR_INCLUDE)
	gcc -c $(TESTBENCH)/testbench.c -I$(AHIR_INCLUDE) -I$(SRC) -I./
	gcc -o testbench_hw testbench.o vhdlCStubs.o  -L$(AHIR_LIB) -lSocketLibPipeHandler -lpthread
	ghdl --clean
	ghdl --remove
	ghdl -i --work=GhdlLink  $(VHDL_LIB)/GhdlLink.vhdl
	ghdl -i --work=aHiR_ieee_proposed  $(VHDL_LIB)/aHiR_ieee_proposed.vhdl
	ghdl -i --work=ahir  $(VHDL_LIB)/ahir.vhdl
	ghdl -i --work=work ahir_system_global_package.vhdl
	ghdl -i --work=work ahir_system.vhdl
	ghdl -i --work=work ahir_system_test_bench.vhdl
	ghdl -m --work=work -Wl,-L$(AHIR_LIB) -Wl,-lVhpi ahir_system_test_bench 

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw ahir_system_test_bench vhpi.log *.aa *.vc *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot

PHONY: all clean	

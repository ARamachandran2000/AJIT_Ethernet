TOPMODULES=-T memSwitchDaemon
AA2CPREFIX=switch_lib_ajitn_mem_switch
AA2C_C_FILE=$(AA2CPREFIX)aa_c_model.c
AA2CFILES=./Aa/pipes.aa ./Aa/bank_access_incl.aa ./Aa/memory_access_incl.aa ./Aa/memory_controller.aa 
AA2VHDLFILES=-A ./Aa/pipes.aa -A ./Aa/.memory_access.preprocessed.aa -A ./Aa/memory_controller.aa 
CUSTOMFNLIB=$(AJIT_PROJECT_HOME)/processor/vhdl/lib/AjitCustom

all: aa2c/switch_lib_ajitn_mem_switch_aa_c_model.c

aa2c/switch_lib_ajitn_mem_switch_aa_c_model.c: $(AA2CFILES)
	AaPreprocess  -I ./Aa ./Aa/memory_access.aa -o ./Aa/.memory_access.preprocessed.aa 
	buildFromSources.py -B -s ghdl -U -a ajitn_mem_switch  -W switch_lib -E to_vhdl  $(TOPMODULES) $(AA2VHDLFILES) -F $(CUSTOMFNLIB) 


clean:
	rm -rf vhdl/* aa2c/* *.c *.h *.txt .Aa .vC  .objhw .memory_controller.preprocessed.aa .handler.*

PHONY: all clean

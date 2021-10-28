#
# build AA2C testbench
#
rm -rf obj_aa2c
mkdir obj_aa2c
gcc -c testbench/testbench.c -DAA2C -I includes -I hw/aa2c/ -I $AHIR_RELEASE/include  -o obj_aa2c/testbench.o
gcc -c hw/aa2c/aa_c_model.c -DAA2C -I includes -I hw/aa2c/ -I $AHIR_RELEASE/include  -o obj_aa2c/aa_c_model.o
gcc -o bin/testbench_aa2c obj_aa2c/testbench.o obj_aa2c/aa_c_model.o -L$AHIR_RELEASE/lib -lBitVectors -lSockPipes -lPipeHandlerDebugPthreads -lpthread


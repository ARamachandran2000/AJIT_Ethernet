// write testbench for testing design of NIC.

#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<pthread.h>

#include<pthreadUtils.h>
#include<Pipes.h>
#include<pipeHandler.h>

#ifndef COMPILE_TEST_ONLY
#ifndef AA2C
	#include "vhdlCStubs.h"
#else
	#include "aa_c_model.h"
#endif
#endif



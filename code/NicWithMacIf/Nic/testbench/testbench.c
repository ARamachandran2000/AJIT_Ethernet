// Testbench for testing design of NIC.
//--------------------------------------
//	This testbench aims for travel of a single packet(say ping)
//		through designed NIC.
//
// General Includes
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

// Algorithm :
//	step1:	Initialise all queues and write data to peripheral bus(algortihm) 
//	step2:	MAC_to_NIC thread generates packet and starts sending it to tester.aa(pipes)
//	step2:	Memory thread reads req_pipes and generate appropriate resp.
//	step2:	Processor thread reads rx_queue's data and writes it to tx_queue
//	step3:	NIC_to_MAC thread reads pipe/s and checks if the received data is same as
//			sent data.
//
//  The MAC -> NIC connection should operate at full speed during the test.

// Local includes
#include "InterfaceDataStructures.h"
#include "header.h"
#include "MAC.h"
#include "Memory.h"
#include "Processor.h"


int __err_flg_ = 0;

int main(int argc, char *argv[]){	
	if(argc < 2)
	{
		fprintf(stderr,"Usage: %s [trace-file]\n trace-file=null,"
			" for no trace, stdout for stdout\n",argv[0]);
		return(1);
	}

	FILE* fp = NULL;
	if(strcmp(argv[1],"stdout") == 0)
	{
		fp = stdout;
	}
	else if(strcmp(argv[1], "null") != 0)
	{
		fp = fopen(argv[1],"w");
		if(fp == NULL)
		{
			fprintf(stderr,"Error: could not open trace file %s \n",argv[1]);
			return(1);
		}
	}
	
#ifndef COMPILE_TEST_ONLY
#ifdef AA2C
	init_pipe_handler();
	start_deamons(fp,0);
#endif
#endif
	memoryInit();
	configureSystem();
	// declare and start threads
	// mac side
	PTHREAD_DECL(mac_tx);
	PTHREAD_CREATE(mac_tx);
	PTHREAD_DECL(mac_rx);
	PTHREAD_CREATE(mac_rx);
	
	// cpu
	PTHREAD_DECL(cpu_thread);
	PTHREAD_CREATE(cpu_thread);

	// memory
	PTHREAD_DECL(memory_model);
	PTHREAD_CREATE(memory_model);
	
	PTHREAD_JOIN(mac_rx);
	PTHREAD_JOIN(memory_model);
	PTHREAD_JOIN(cpu_thread);
	PTHREAD_JOIN(mac_rx);

	if(!__err_flg)
		fprintf(stderr,"\n\nSUCCESS...!!!\n\n");
}

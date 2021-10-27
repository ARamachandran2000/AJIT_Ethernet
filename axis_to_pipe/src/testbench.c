#include<stdio.h>
#include<signal.h>
#include<stdlib.h>
#include<stdint.h>
#include<pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>

/*
#ifndef SW
#include "vhdlCStubs.h"
#else 
#include "aa_c_model.h"
#endif*/


#define BUF_SIZE 128

uint64_t mac_data[BUF_SIZE];
uint64_t out_data[BUF_SIZE];


void Reader()
{
	read_uint64_n("out_data",out_data,BUF_SIZE);
}

DEFINE_THREAD(Reader);


int main(int argc, char*argv[])
{

	#ifdef SW
		init_pipe_handler();
		start_daemons(NULL,0);
	#endif
	
	int I;
	
	for(I=0; I<(BUF_SIZE-1); I++)
	{

		mac_data[I] = 0x0000000FFFFFFFFF;
	}
	
	mac_data[I] = mac_data[I] = 0x0000001FFFFFFFFF;

	PTHREAD_DECL(Reader);
	PTHREAD_CREATE(Reader);
	
	write_uint64_n("mac_data",mac_data,BUF_SIZE);
	
	for(I=0; I<(BUF_SIZE); I++)
	{

		fprintf(stderr,"out_data[%d] = %h.\n",I,out_data[I]);
	}
	
	
}




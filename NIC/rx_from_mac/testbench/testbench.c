#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<pthread.h>

#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>


#ifndef COMPILE_TEST_ONLY
#ifndef AA2C
	#include "vhdlCStubs.h"
#else
	#include "aa_c_model.h"
#endif
#endif

#define SIZE_OF_PACKET_IN_BITS	64
#define MAX_PACKET_COUNT	64
#define MAX_PACKET_LENGTH_IN_BYTES	1500
#define MAX_HEADER_LENGTH_IN_WORDS	15

void mac_tx(){
	int header_len_in_words = 5;
	//while(1){
		int pkt_len_in_bytes = header_len_in_words*4 + 26;
		uint64_t data;
		data = 0x0aaaaaaaaf;
		write_uint64("tb_in_pipe", data);
		data = 0x0bbbbaaaaf;
		write_uint64("tb_in_pipe", data);
		data = 0x0bbbbbbbbf;
		write_uint64("tb_in_pipe", data);
		data = 0x0aa54ccccf;
		write_uint64("tb_in_pipe", data);
		data = 0x0aaaa002ef;
		write_uint64("tb_in_pipe", data);
		pkt_len_in_bytes -= 2;
		while(pkt_len_in_bytes > 4){
			data = 0x0aaaaaaaaf;
			write_uint64("tb_in_pipe", data);
			pkt_len_in_bytes -= 4;
		}
		switch(pkt_len_in_bytes){
			case 1:
				data = 0x1000000aa1;
				write_uint64("tb_in_pipe", data);
				break;
			case 2:
				data = 0x10000aaaa3;
				write_uint64("tb_in_pipe", data);
				break;
			case 3:
				data = 0x100aaaaaa7;
				write_uint64("tb_in_pipe", data);
		 		break;
			default:
				data = 0x1aaaaaaaaf;
				write_uint64("tb_in_pipe", data);
		}	
		fprintf(stderr,"\npacket_sent");
	//}
}DEFINE_THREAD(mac_tx);

void readHeader(){
	uint64_t header[8];
	fprintf(stderr,"\nReading Header");
	
	header[0] = read_uint64("tb_out_pipe");
	fprintf(stderr,"0x%lx\t",header[0]);
	fprintf(stderr,"\nHeader 1 read complete");
	// 0xaaaaaaaa002eaa54
	//int header_len = (header[0] >> 4) & 0x0f;
	int header_len = (5+3)*8;
	fprintf(stderr, "\nHeader_len = %d", header_len);
	header_len -= 2;
	int i = 1;
	int j;
	fprintf(stderr, "\nHeader_len = %d", header_len);
	while(header_len > 0){
		//fprintf(stderr,"\nReading Header again");
		header[i] = read_uint64("tb_out_pipe");
		fprintf(stderr,"0x%lx\t",header[i]);
		//fprintf(stderr,"\nHeader read going on");
		header_len -= 4;
		fprintf(stderr, "\nHeader_len = %d", header_len);
		i++;
	} 
	fprintf(stderr,"Header:\n");
	for(j = 0; j < i; j++){
		fprintf(stderr,"0x%lx\t",header[j]);
	}
	
}DEFINE_THREAD(readHeader);


int main(int argc, char *argv[]){
	if(argc < 2)
	{
		fprintf(stderr,"Usage: %s [trace-file] \n trace-file=null,"
				" for no trace, stdout for stdout\n", argv[0]);
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
			fprintf(stderr,"Error: could not open trace file %s\n", argv[1]);
			return(1);
		}
	}		
#ifndef COMPILE_TEST_ONLY
#ifdef AA2C
	init_pipe_handler();
	start_daemons(fp,0);
#endif
#endif

	PTHREAD_DECL(mac_tx);
	PTHREAD_CREATE(mac_tx);
	PTHREAD_DECL(readHeader);
	PTHREAD_CREATE(readHeader);
	PTHREAD_JOIN(mac_tx);
	PTHREAD_JOIN(readHeader);
}

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
	int header_len_in_words = 6;
	fprintf(stderr,"\nSending Packets....\n");
	int pkt_cnt = 0;
	while(pkt_cnt < 1){
		//fprintf(stderr,"\n:Packet length = %d\n", pkt_len);
		int pkt_len_in_bytes = header_len_in_words*4 + 26 + 24;
		uint64_t data;
		data = 0x0aaaaaaaaf;
		write_uint64("tb_in_pipe", data);
		data = 0x0bbbbaaaaf;
		write_uint64("tb_in_pipe", data);
		data = 0x0bbbbbbbbf;
		write_uint64("tb_in_pipe", data);
		//data = 0x0aa540046f; // 2e -> 46
		data = (data & 0x1ffff0000f) | (pkt_len_in_bytes << 4);
		write_uint64("tb_in_pipe", data);
		data = 0x0aaaa002ef;
		write_uint64("tb_in_pipe", data);
		pkt_len_in_bytes -= 2;
		while(pkt_len_in_bytes > 4){
			data = 0x07aaaaaaaf;
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
		fprintf(stderr,"\npacket[%d] sent...",pkt_cnt);
		pkt_cnt++;
	}
}DEFINE_THREAD(mac_tx);

void readHeader(){
	int pkt_cnt = 0;
	while(pkt_cnt < 1){
		uint64_t header[207];
	//	fprintf(stderr,"\nReading Header\n");
		header[0] = read_uint64("tb_out_pipe");
	//	fprintf(stderr,"\n0x%lx\n",header[0]);
		header[1] = read_uint64("tb_out_pipe");
	//	fprintf(stderr,"0x%lx\n",header[1]);
		header[2] = read_uint64("tb_out_pipe");
	//	fprintf(stderr,"0x%lx\n",header[2]);
		header[3] = read_uint64("tb_out_pipe");
	//	fprintf(stderr,"0x%lx\n",header[3]); 
		int pkt_len = (header[3] >> 4 ) & 0xffff;
		int header_len = (header[3] >> 24)&0xf;
		//header_len -=2
	//	fprintf(stderr,"Packet_length = %d,Header_length = %d",pkt_len, header_len);
		int i = 4;
		int j;
		while(header_len > 0){
			header[i] = read_uint64("tb_out_pipe");
	//		fprintf(stderr,"\n0x%lx,i=%d\n",header[i],i);
			header_len -= 1;
				i++;
		} 
		fprintf(stderr,"\nHeader[%d]:\n",pkt_cnt);
		for(j = 0; j < i; j++){
			fprintf(stderr,"0x%lx\t",header[j]);
		}
		fprintf(stderr,"\n");
		pkt_cnt++;
	}
}DEFINE_THREAD(readHeader);

void readPacket(){
	int pkt_cnt = 0;
	while(pkt_cnt < 1){
		uint64_t packet[65535];
	//	fprintf(stderr,"\nReading Packet\n");
		packet[0] = read_uint64("tb_out_packet_pipe");
	//	fprintf(stderr,"\n0x%lx\n", packet[0]);
		packet[1] = read_uint64("tb_out_packet_pipe");	
	//	fprintf(stderr,"\n0x%lx\n", packet[1]);	
		packet[2] = read_uint64("tb_out_packet_pipe");	
	//	fprintf(stderr,"\n0x%lx\n", packet[2]);	
		packet[3] = read_uint64("tb_out_packet_pipe");	
	//	fprintf(stderr,"\n0x%lx\n", packet[3]);
		int pkt_len = (packet[3] >> 4 ) & 0xffff;
		int i = 4;
		int j;
		while(pkt_len > 0){
			packet[i] = read_uint64("tb_out_packet_pipe");
			//fprintf(stderr,"\n0x%lx",packet[i]);
			pkt_len -= 4;
			i++;
		}
		fprintf(stderr,"\nPacket[%d]:\n",pkt_cnt);
		for(j = 0; j < i; j++){
			fprintf(stderr,"0x%lx\t",packet[j]);
		}
		fprintf(stderr,"\n");
		pkt_cnt++;
	}

}DEFINE_THREAD(readPacket);

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
	PTHREAD_DECL(readPacket);
	PTHREAD_CREATE(readPacket);
	PTHREAD_DECL(readHeader);
	PTHREAD_CREATE(readHeader);
	PTHREAD_JOIN(mac_tx);
	PTHREAD_JOIN(readHeader);
	PTHREAD_JOIN(readPacket);
}

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
#define MIN_HEADER_LENGTH_IN_WORDS	5
#define MIN_PACKET_LENGTH_IN_BYTES	26
#define MAX_PACKET_LENGTH_IN_BYTES	1500
#define MAX_HEADER_LENGTH_IN_WORDS	15

#define TOTAL_PACKET_TO_BE_SENT		10

int __err_flg = 0;

uint64_t initial_pkts[3] = {0x0aaaaaaaaf,0x0bbbbaaaaf,0x0bbbbbbbbf};


//
//	Sends packets to tb_to_nic_parser pipe
//
void mac_tx(){
	fprintf(stderr,"\n Sending Packets....\n");
	char pipe_to_send[20];
	sprintf(pipe_to_send,"tb_to_nic_parser");
	int pkt_cnt = 0;
	while(pkt_cnt < TOTAL_PACKET_TO_BE_SENT ){
		int header_len_in_words = rand()%MAX_HEADER_LENGTH_IN_WORDS;
		header_len_in_words = (header_len_in_words < MIN_HEADER_LENGTH_IN_WORDS)? 
						MIN_HEADER_LENGTH_IN_WORDS:header_len_in_words;
		uint64_t pkt_len_in_bytes = rand()%MAX_PACKET_LENGTH_IN_BYTES;
		pkt_len_in_bytes = (pkt_len_in_bytes < MIN_PACKET_LENGTH_IN_BYTES)?
						MIN_PACKET_LENGTH_IN_BYTES:pkt_len_in_bytes;
		// adding header length in packet length
		pkt_len_in_bytes += (uint16_t)header_len_in_words*4; 
		write_uint64_n(pipe_to_send,initial_pkts,3);
		uint64_t data;
		data = 0x000000000f;
		data = data = (data & 0x100000000f) | (pkt_len_in_bytes << 4)|(header_len_in_words << 24);
		write_uint64(pipe_to_send,data);
		pkt_len_in_bytes -= 2;
		int cnt = 1;
		while(pkt_len_in_bytes>4){
			data = (data & 0x100000000f) | (cnt << 4);
			write_uint64(pipe_to_send,data);
			cnt++;
			pkt_len_in_bytes -= 4;
		}
		// for last packet tlast should be set to 1
		//  tkeep should changed depending on number of
		//   remaining bytes.
		switch(pkt_len_in_bytes){
			case 0: break;
			case 1:
				data = 0x1000000cc1;
				write_uint64(pipe_to_send, data);
				break;
			case 2:
				data = 0x10000cccc3;
				write_uint64(pipe_to_send, data);
				break;
			case 3:
				data = 0x100cccccc7;
				write_uint64(pipe_to_send, data);
				break;
			case 4:
				data = 0x1ccccccccf;
				write_uint64(pipe_to_send, data);
				break;
			default:
				fprintf(stderr,"\n__Some Error__\n");
		}
		pkt_cnt++;
	}
}DEFINE_THREAD(mac_tx);

//
//	Reads header data from nic_parser_to_tb_header pipe
//		and checks if received data is correct.
//
void readHeader(){
	int pkt_cnt = 0;
	char pipe_to_read[20];
	sprintf(pipe_to_read,"nic_parser_to_tb_header");
	while(pkt_cnt < TOTAL_PACKET_TO_BE_SENT ){
		uint64_t header[207];
		header[0] = read_uint64(pipe_to_read);
		header[1] = read_uint64(pipe_to_read);
		header[2] = read_uint64(pipe_to_read);
		header[3] = read_uint64(pipe_to_read);
		uint16_t pkt_len = (header[3] >> 4 ) & 0xffff;
		int header_len = (header[3] >> 24)&0xf;
		int i;
		int cnt = 1;
		if(header_len<=0){
			fprintf(stderr,"\nWrong header lenght = %d received\n",header_len);
			__err_flg = 1;
		}
		for(i = 4; header_len > 0; i++,cnt++){
			header[i] = read_uint64(pipe_to_read);
			header_len -= 1;
			if(((header[i] >> 4)& 0xffffffff) != cnt){
				__err_flg = 1;
				break;
			}
		}
		if(__err_flg){
			fprintf(stderr,"\nError in Received header : MISSMATCH\n");
			break;
		}
		fprintf(stderr,"\nReceived Header[%d]",pkt_cnt);
		pkt_cnt++;
	}
}DEFINE_THREAD(readHeader);

//
//	Reads packet data from nic_parser_to_tb_packet pipe
//		and checks if received data is correct.
void readPacket(){
	int pkt_cnt = 0;
	char pipe_to_read[20];
	sprintf(pipe_to_read,"nic_parser_to_tb_packet");
	while(pkt_cnt < TOTAL_PACKET_TO_BE_SENT ){
		uint64_t packet[65535];
		packet[0] = read_uint64(pipe_to_read);
		packet[1] = read_uint64(pipe_to_read);
		packet[2] = read_uint64(pipe_to_read);
		packet[3] = read_uint64(pipe_to_read);
		uint16_t pkt_len = (packet[3] >> 4 ) & 0xffff;
		pkt_len -= 2;
		int i;
		int cnt = 1;
		if(pkt_len<=4){
			fprintf(stderr,"\nWrong packet length = %d received\n",pkt_len);
			__err_flg = 1;
		}
		for(i = 4; pkt_len > 4; i++,cnt++){
			packet[i] = read_uint64(pipe_to_read);
			pkt_len -= 4;
			if(((packet[i] >> 4)& 0xffffffff) != cnt){
				__err_flg = 1;
				break;
			}
		}
		packet[i] = read_uint64(pipe_to_read);
		if(__err_flg){
			fprintf(stderr,"\nError in Received packet : MISSMATCH\n");
			break;
		}
		fprintf(stderr,"\nReceived Packet[%d]",pkt_cnt);
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
		//pkt_cnt++;
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

	if(!__err_flg)
		fprintf(stderr,"\n\nSUCCESS...!!!\n\n");
}

// Write Memory related threads, functions here
#include "InterfaceDataStructures.h"
//
// We will model 16 Queues, each of which require
// 256x8 bytes = 2KB.
//
// Q0 occupies 0 to 255
// Q1 occupies 256 to 511 etc..
//
//
// Also, we need to model buffers.
// Each buffer is 2KB (256 x 8).
// We use 16 buffers.
//
uint64_t memory_array[2*256*16];

void writeMemory(uint32_t, uint64_t, uint8_t);

// access memory utility for reading as well as writing data
//	Output : 65 bit 
//	Input  : 110 bit
//		1. 1  bit lock
//		2. 1  bit rwbar
//		3. 8  bit byte_mask
//		4. 36 bit memory_address(will be converted to 36 bit inside function)
//		5. 64 bit wdata

void memory_model(Queue* free, Queue* Rx, Queue* Tx)
{
	char mem_req_pipe_0[25], mem_req_pipe_1[25];
	char mem_resp_pipe_0[25], mem_resp_pipe_1[25];
	// req and resp pipes.
	sprintf(mem_req_pipe_0,"tester_to_mem_model_req0"); 	//64 bit
	sprintf(mem_req_pipe_1,"tester_ro_mem_model_req1"); 	//64 bit
	sprintf(mem_resp_pipe_0,"mem_model_to_tester_resp0");	//64 bit
	sprintf(mem_resp_pipe_1,"mem_model_to_tester_resp1");	// 8 bit
	char memory_is_locked = 0;
	uint64_t req0,req1,rdata;
	while(1)
	{
		// read requests,
		// 0 is LSB,1 is MSB
		req0 = read_uint64(mem_req_pipe_0);
		req1 = read_uint64(mem_req_pipe_1);
		char lock  = (req1 >> 45) & 0x1; 
		char rwbar = (req1 >> 44) & 0x1;
		uint32_t addr = (req1 >> 4) & 0xfffffff;
		uint8_t bmask = (req1 >> 36) & 0xff;
		if(rwbar)
			rdata = *(addr);
		else
			// need to add bmask logic.
			writeMemory(addr,req0,bmask);//req0 is wdata.
		// responce
		int error = 0;
		write_uint8("mem_model_to_tester_resp1",error);
		write_uint64("mem_model_to_tester_resp0",rdata);
	}	
}

// function to write data to memory using bytemask.
//  addr = byte address.
void writeMemory(uint64_t addr, uint64_t wdata,uint8_t bmask){
	memory_array[(addr >> 3)] = wdata; // ILLUSTRATION PURPOSES..
	uint64_t rdata = *(addr); // NO!
	uint64_t data = 0;
	int i = 0;
	for(i = 0; i < 8; i++){
		// if bit is 1 modify corresponding byte.
		if((bmsak>>i) &0x1){
			rdata = (rdata & (0xffffffffffffff00 <<(i*8)));
			rdata |= (wdata & (0x00000000000000ff<< (i*8))); 	
		}
		else
			rdata = rdata;
	}
	*(addr) = rdata; // modified rdata
}

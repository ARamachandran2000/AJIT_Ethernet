// Write Memory related threads, functions here
#include "InterfaceDataStructures.h"
#include<pthreadUtils.h>
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
//
// Allocate 8 locks.... = 1 double word.
//
uint64_t memory_array[(2*256*16) + 1];

// access memory utility for reading as well as writing data
//	Output : 65 bit 
//	Input  : 110 bit
//		1. 1  bit lock
//		2. 1  bit rwbar
//		3. 8  bit byte_mask
//		4. 36 bit memory_address(will be converted to 36 bit inside function)
//		5. 64 bit wdata

// memory lock status, 
// 	index -> 
//		0 : cpu, 
//		1 : memory.
int memory_lock_status[] = {0,0};
pthread_mutex_t mutex_memory_lock = PTHREAD_MUTEX_INITIALIZER;
int accessMemory(uint8_t requerster_id,
			uint8_t lock,
			uint8_t read_write_bar,
			uint8_t byte_mask,
			uint64_t addr,
			uint64_t wdata,
			uint64_t* rdata);
{
	int __error_flg = 0;
	// LOCK MUTEX
	pthread_mutex_lock(&mutex_memory_lock);
	// PERFORM MEMORY OPERATION
	if(memory_lock_status[0] || memory_lock_status[1])
	{
		// memory is locked.
		if((lock == 0) && (memory_lock_status[requester_id] == 1))
			// unlock memory.
			memory_lock_status[requester_id] = 0;
		else
			__error_flg = 1;
	}
	// memory is unlocked but requester requetsed to lock.
	else if(lock == 1) 
		// lock the memory
		memory_lock_status[requester_id] = 1;
	// checek if there was error due memory lock
	if(!__error_flg)
	{
		// no error due to memory locking
		if(read_write_bar)
			// read data
			*(rdata) = memory_array[addr]; 
		else 
		{	
			// read data so tha it will be modified based on byte_mask
			uint64_t tmp_rdata = memory_array[addr];
			int index = 0;
			for(index = 0; index < 8; index++)
			{
				// modify data depending on byte_mask
				if((byte_mask>>index) & 0x1)
				{
					// need to rethink a bit
					tmp_rdata = (tmp_rdata & (0xffffffffffffff00 <<(i*8)));
					tmp_rdata |= (wdata & (0x00000000000000ff<< (i*8))); 
				}
				else
					tmp_rdata = tmp_rdata;
					
			}
			// write data
			wdata = tmp_rdata;
			memory_array[addr] = wdata;
		}
	}
	// UNLOCK MUTEX
	pthread_mutex_unlock(&mutex_memory_lock);
	return(__error_flg);
}


// reads request from pipes(corresping to requester_id)
void getReqFromTester(uint8_t requester_id,
			uint8_t* lock,
			uint8_t* rwbar,
			uint8_t* bmask,
			uint64_t* addr,
			uint64_t* wdata)
{
	// pipes
	char req_pipe0[30], req_pipe1[30];
	sprintf(req_pipe0,"mem_req%d_pipe0",(int)requester_id);//64 bit wide
	sprintf(req_pipe1,"mem_req%d_pipe1",(int)requester_id);//64 bit wide
	
	uint64_t req1;
	// read pipes
	*(wdata) = read_uint64(req_pipe0);
	req1 = read_uint64(req_pipe1);
	*(lock)  = (req1 >> 45) & 0x01; 
	*(rwbar) = (req1 >> 44) & 0x01;
	*(addr) = req1 & 0xfffffffff;
	*(bmask) = (req1 >> 36) & 0xff;
}

// sends responce to pipes(corresping to requester_id)
void sendResponceToTester(uint8_t requester_id, int error, uint64_t rdata)
{	
	// pipes
	char resp_pipe0[30], resp_pipe1[30];
	sprintf(resp_pipe0,"mem_resp%d_pipe0",(int)requester_id);// 64 bit wide
	sprintf(resp_pipe1,"mem_resp%d_pipe1",(int)requester_id);//  8 bit wide

	write_uint64(resp_pipe0,rdata);
	write_uint64(resp_pipe1,error);
}

// this function reads request, performs memory operation and then sends responce. 
void memoryServiceModel(uint8_t requester_id);
{
	uint8_t lock_tester,rwbar_tester,bmask_tester;
	uint64_t addr_tester, wdata_tester, rdata;
	while(1)
	{
		// reads request from pipes
		getReqFromTester(requester_id,&lock_tester,&rwbar_tester,&bmask_tester,&addr_tester,&wdata_tester);
		// read/write from/to memory.
		status = accessMemory(requester_id,lock_tester,rwbar_tester,bmask_tester,addr_tester,wdata_tetser,&rdata);
		// write responce
		sendResponceToTester(requester_id,status,rdata);
	}
}

// this daemon will serve memory requests from nic.
void nicMemoryServiceDaemon()
{
	uint8_t nic_id = 1;
	memoryServiceModel(nic_id);
}DEFINE_THREAD(nicMemoryServiceDaemon);

// this daemon will serve memory requests from cpu.
void cpuMemoryServiceDaemon()
{
	uint8_t cpu_id = 0;
	memoryServiceModel(cpu_id);
}DEFINE_THREAD(cpuMemoryServiceDaemon);


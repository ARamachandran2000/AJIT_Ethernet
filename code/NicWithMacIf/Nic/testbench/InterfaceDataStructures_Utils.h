
char DEBUG = 0; // 0 for no print and 1 for print

// function declerations,
//  defined in register_config.c
uint64_t getSliceFromWord(uint64_t, uint8_t, uint8_t );
uint32_t setSliceOfWord_32(uint32_t, uint8_t, uint8_t, uint32_t);
uint64_t setSliceOfWord_64(uint64_t, uint8_t, uint8_t, uint64_t);

// Indicates Offsets of Queues in Memory
/*
#define FREE_QUEUE 0
#define RX_QUEUE   32
#define TX_QUEUE   64
*/
// For number of buffer
// if you change NUM_OF_BUFFERS then make same change to QUEUE_SIZE_MESK in ../src/decls.aa
#define NUM_OF_BUFFERS	8 // should be miltiple of 4 
		 	  // 3/2 = 1		+ 3%2 = 1	= 2 * 8 = 16 + 16 = 32
#define QUEUE_LENGTH	16 + 4*NUM_OF_BUFFERS	//32
#define FREE_QUEUE 	0		
#define RX_QUEUE	(FREE_QUEUE + QUEUE_LENGTH) // 0 + 32 = 32
#define TX_QUEUE	(RX_QUEUE + QUEUE_LENGTH) // 32 + 32 = 64

// should be multiple of 16
#define BUF_SIZE	80//192
#define BUF_0 (TX_QUEUE + QUEUE_LENGTH)/16 // (64 + 32)/16 = 6

#define BUF_1 BUF_0 + (BUF_SIZE / 16) // 6   +   (192/16 = 12) = 18 
#define BUF_2 BUF_1 + (BUF_SIZE / 16) // 18  +   (192/16

/*
#define BUF_0 96/16
#define BUF_1 288/16
#define BUF_2 480/16
*/
#define NUMBER_OF_ENTRIES NUM_OF_BUFFERS

// sends requestes and reads responces(for queue functions such as pop push) 
void ReqRespMemory(
			uint8_t lock,
			uint8_t read_write_bar,
			uint8_t byte_mask,
			uint64_t addr,
			uint64_t wdata,
			uint8_t * status, 
			uint64_t *  rdata)
{
	char req_pipe0[25], req_pipe1[25],resp_pipe0[25],resp_pipe1[25];

	sprintf(req_pipe0,"mem_req%d_pipe0_tester",0);//64 bit wide
	sprintf(req_pipe1,"mem_req%d_pipe1_tester",0);//64 bit wide
	sprintf(resp_pipe0,"mem_resp%d_pipe0_tester",0);// 64 bit wide
	sprintf(resp_pipe1,"mem_resp%d_pipe1_tester",0);//  8 bit wide

	uint64_t req1 = 0;
	uint64_t req0 = wdata;
	*(status) = 1;
	req1 = setSliceOfWord_64(req1, 45,45,(uint64_t)lock); // Lock
	req1 = setSliceOfWord_64(req1, 44,44,read_write_bar); // Read Write Set
	req1 = setSliceOfWord_64(req1, 43,36,byte_mask); // Byte Mask
	req1 = setSliceOfWord_64(req1, 35,0,addr); // Addr
	
	(DEBUG == 1) && fprintf(stderr, "Interface_Data_Structures : req_resp_mem : req0 = %lx, req1 = %lx\n",req0,req1);	
	while(*(status) == 1)
	{
		write_uint64(req_pipe0,req0);
		write_uint64(req_pipe1,req1);
	
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [ReqRespMemory] : Request Sent = %lx, %lx. \n",req0, req1);
		
		*(rdata) = read_uint64(resp_pipe0);
			//fprintf(stderr, "CPU_THREAD [ReqRespMemory] : Response Received = %d, 0x%lx. \n",*status,*rdata);
		*status = read_uint8(resp_pipe1);
	
		//fprintf(stderr, "CPU_THREAD [ReqRespMemory] : Response Received = %d, 0x%lx. \n",*status,*rdata);
	}
	
}



// initialises queues
void initQueue(uint64_t queue_offset,uint32_t number_of_entries)
{

	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD [initQueue] : Initializing Queue %d. \n",queue_offset);
	uint64_t rdata;
	uint8_t status;
	// Set Lock and Number of Entries
	uint64_t lock_entries = 0;
	lock_entries = setSliceOfWord_64(lock_entries, 31,0,number_of_entries);	
	//memory_array [queue_offset] = lock_entries;
	ReqRespMemory (0,0,0xFF,queue_offset,lock_entries,&status,&rdata);
	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD [initQueue] : Read lock_entries = %d. \n",lock_entries);
	
	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD [initQueue] : Initializing Pointers %d. \n",queue_offset);
	// Set Read and Write Pointers
	uint64_t pointers = 0;
	pointers = setSliceOfWord_64(pointers, 31,0,0);
	pointers = setSliceOfWord_64(pointers, 63,32,0);
	//memory_array [queue_offset + 8] = pointers;
	ReqRespMemory (0,0,0xFF,queue_offset+8,pointers,&status,&rdata);

}

void acquireMutex(uint64_t queue_offset)
{
	uint64_t rdata;
	uint8_t status;
	uint32_t mutex_val = 1;
	while(mutex_val == 1)
	{
		fprintf(stderr,"acquiring mutex\n");
		ReqRespMemory(1,1,0xff,queue_offset,0,&status,&rdata);
		mutex_val = (rdata >> 32) & 0xffffffff;
		fprintf(stderr,"acquiring mutex : mutex_val = %d rdata = 0x%lx\n",mutex_val,rdata);
	}
	fprintf(stderr,"got mutex\n");
	mutex_val = 1;
	rdata = rdata | ((uint64_t)mutex_val << 32);
	ReqRespMemory(0,0,0xff,queue_offset,rdata,&status,&rdata);
}


void releaseMutex(uint64_t queue_offset)
{
	uint64_t rdata;
	uint8_t status;
	ReqRespMemory(0,0,0xf0,queue_offset,(uint64_t)0,&status,&rdata);
}
// push data in queue
int push(uint64_t queue_offset, uint32_t buffer_address)
{

	int ret_val = 0;
	uint64_t pointers;
	uint64_t rdata;
	uint64_t wdata = 0;
	uint8_t status;
	uint8_t bmask = 0;
	uint32_t  write_pointer,read_pointer;
	
	acquireMutex(queue_offset);

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+8,0,&status,&pointers);
	

	write_pointer = getSliceFromWord(pointers, 63, 32);
	read_pointer  = getSliceFromWord(pointers, 31, 0);

	uint32_t next_pointer = (write_pointer + 1) % (NUMBER_OF_ENTRIES);

	uint64_t element_pair_address = queue_offset + 16 + ((write_pointer >> 1)<<3) ;
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [push] : buffer_address = %lx,Queue_Offset = %lx Read Pointers = pointerss = 0x%lx, next_pointer = 0x%lx, pair_addr = 0x%lx write_pointer = 0x%lx, queue_offset = 0x%lx. \n",buffer_address,queue_offset,pointers,next_pointer,element_pair_address,write_pointer,queue_offset);

	if(next_pointer != read_pointer) // Check Full Condition
	{
		ret_val = 1;
		ReqRespMemory (0,1,0xFF,element_pair_address,0,&status,&wdata);


		if((write_pointer & 0x000001) == 1) // Check if we are writing even or odd word
						   // Need to Verify
		{
			bmask = 0x0F;
			wdata = setSliceOfWord_64(wdata,31,0,(uint64_t)buffer_address);
		}

		else
		{
			//fprintf(stderr, "CPU_THREAD [push] : Buffer Writing.\n");
			bmask = 0xF0;
			wdata = setSliceOfWord_64(wdata,63,32,(uint64_t)buffer_address);
		}
	

		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [push] : NP = %d, RP = %d wdata = %lx. \n",next_pointer,read_pointer,wdata);


		//memory_array[write_pointer] = data;
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [push] : Wdata = %lx, buffer_address = %lx. \n",wdata,buffer_address);

		ReqRespMemory (0,0,0xFF,element_pair_address,wdata,&status,&rdata);

		pointers = setSliceOfWord_64(pointers, 63,32,next_pointer);
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [push] : pointers = %lx. \n",pointers);
		//memory_array[queue_offset + 1] = pointers;
		ReqRespMemory (0,0,0xFF,queue_offset + 8,pointers,&status,&rdata);
	}

	releaseMutex(queue_offset);
	return(ret_val);
	
};


// pop from queue
int pop(uint64_t queue_offset , uint32_t* buf_address)
{
	int ret_val = 0;
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;
	
	acquireMutex(queue_offset);
	
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [pop] : got pop request queue_offset = %lx\n", queue_offset);
	//uint64_t pointers = memory_array [queue_offset + 1];
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [pop] : reading memory with (queue_offset+8) = %lx\n", (queue_offset+8));
	ReqRespMemory (0,1,0xFF,queue_offset+8,0,&status,&pointers);

	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	uint64_t element_pair_address = queue_offset + 16 + ((read_pointer >> 1)<<3) ;
	
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [pop] : write_pointer = 0x%lx, read_pointer = 0x%lx element_pair_address = 0x%lx prev_Status = %lx , pointers = %lx\n", write_pointer,read_pointer,element_pair_address, status,pointers);
	if(write_pointer != read_pointer)
	{
		
		
		ret_val = 1;
		ReqRespMemory (0,1,0xFF,element_pair_address,0,&status,&rdata);
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [pop] : queue not empty rdata = %lx\n",rdata);
		//buf_data = memory_array[read_pointer];
		if((read_pointer & 0x1) == 1)
		{
			*buf_address = getSliceFromWord(rdata,31,0);
		}
		else
		{
			*buf_address = getSliceFromWord(rdata,63,32);
		}
			
		
		read_pointer = (read_pointer + 1) % (NUMBER_OF_ENTRIES);
		
		pointers = setSliceOfWord_64(pointers, 31,0,read_pointer);
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [pop] : queue not empty rdata = %lx buffer address = %lx, Queue Offset = %lx, pointers = %lx\n",rdata,*buf_address,queue_offset,pointers);
		//memory_array[queue_offset + 1] = pointers;
		ReqRespMemory (0,0,0xFF,queue_offset + 8,pointers,&status,&rdata);
			

	}
	
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [pop] : queue empty ret_val= 0x%lx\n", ret_val);

	releaseMutex(queue_offset);
	return(ret_val);

}

// check if queue is empty
int checkEmpty(uint64_t queue_offset)
{
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+8,0,&status,&pointers);
	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	
	return (write_pointer == read_pointer);

};

// check if queue is full
int checkFull(uint32_t queue_offset)
{
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+8,0,&status,&pointers);

	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	
	uint32_t next_pointer = (write_pointer + 1) & (NUMBER_OF_ENTRIES - 1);

	return (next_pointer == read_pointer);

};





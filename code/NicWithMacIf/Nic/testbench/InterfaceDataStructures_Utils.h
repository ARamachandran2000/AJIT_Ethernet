
// function declerations,
//  defined in register_config.c
uint64_t getSliceFromWord(uint64_t, uint8_t, uint8_t );
uint32_t setSliceOfWord_32(uint32_t, uint8_t, uint8_t, uint32_t);
uint64_t setSliceOfWord_64(uint64_t, uint8_t, uint8_t, uint64_t);

// Indicates Offsets of Queues in Memory
#define FREE_QUEUE 0
#define RX_QUEUE   32
#define TX_QUEUE   64


#define BUF_0 96/16
#define BUF_1 288/16
#define BUF_2 480/16

#define NUMBER_OF_ENTRIES 3

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
	char req_pipe0[20], req_pipe1[20],resp_pipe0[20],resp_pipe1[20];

	sprintf(req_pipe0,"mem_req%d_pipe0",0);//64 bit wide
	sprintf(req_pipe1,"mem_req%d_pipe1",0);//64 bit wide
	sprintf(resp_pipe0,"mem_resp%d_pipe0",0);// 64 bit wide
	sprintf(resp_pipe1,"mem_resp%d_pipe1",0);//  8 bit wide

	uint64_t req1 = 0;
	uint64_t req0 = wdata;

	req1 = setSliceOfWord_64(req1, 45,45,(uint64_t)lock); // Lock
	req1 = setSliceOfWord_64(req1, 44,44,read_write_bar); // Read Write Set
	req1 = setSliceOfWord_64(req1, 43,36,byte_mask); // Byte Mask
	req1 = setSliceOfWord_64(req1, 35,0,addr); // Addr
	
	fprintf(stderr, "Interface_Data_Structures : req_resp_mem : req0 = %lx, req1 = %lx\n",req0,req1);	
	write_uint64(req_pipe0,req0);
	write_uint64(req_pipe1,req1);
	
	fprintf(stderr, "CPU_THREAD [ReqRespMemory] : Request Sent = %d. \n",byte_mask);

	
	*(rdata) = read_uint64(resp_pipe0);
	*status = read_uint8(resp_pipe1);

	fprintf(stderr, "CPU_THREAD [ReqRespMemory] : Response Received = %d, %d. \n",*status,*rdata);

	
}



// initialises queues
void initQueue(uint64_t queue_offset,uint32_t number_of_entries)
{

	fprintf(stderr, "CPU_THREAD [initQueue] : Initializing Queue %d. \n",queue_offset);
	uint64_t rdata;
	uint8_t status;
	// Set Lock and Number of Entries
	uint64_t lock_entries = 0;
	lock_entries = setSliceOfWord_64(lock_entries, 31,0,number_of_entries);	
	//memory_array [queue_offset] = lock_entries;
	ReqRespMemory (0,0,0xFF,queue_offset,lock_entries,&status,&rdata);
	fprintf(stderr, "CPU_THREAD [initQueue] : Read lock_entries = %d. \n",lock_entries);
	
	
	// Set Read and Write Pointers
	uint64_t pointers = 0;
	pointers = setSliceOfWord_64(pointers, 31,0,0);
	pointers = setSliceOfWord_64(pointers, 63,32,0);
	//memory_array [queue_offset + 8] = pointers;
	ReqRespMemory (0,0,0xFF,queue_offset+8,pointers,&status,&rdata);

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

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+8,0,&status,&pointers);
	fprintf(stderr, "CPU_THREAD [push] : Read Pointers = %d. \n",pointers);

	write_pointer = getSliceFromWord(pointers, 63, 32);
	read_pointer  = getSliceFromWord(pointers, 31, 0);

	uint32_t next_pointer = (write_pointer + 1) & (NUMBER_OF_ENTRIES);

	uint64_t element_pair_address = queue_offset + 16 + (write_pointer >> 1)<<3 ;
	
	ReqRespMemory (0,1,0xFF,element_pair_address,0,&status,&wdata);


	if((write_pointer&0x1) == 1) // Check if we are writing even or odd word
					   // Need to Verify
	{
		bmask = 0x0F;
		wdata = setSliceOfWord_64(wdata,31,0,buffer_address);
	}

	else
	{
		bmask = 0xF0;
		wdata = setSliceOfWord_64(wdata,63,32,buffer_address);
	}

	fprintf(stderr, "CPU_THREAD [push] : NP = %d, RP = %d. \n",next_pointer,read_pointer);

	if(next_pointer != read_pointer) // Check Full Condition
	{
		ret_val = 1;
		//memory_array[write_pointer] = data;
		fprintf(stderr, "CPU_THREAD [push] : Wdata = %d. \n",wdata);

		ReqRespMemory (0,0,0xFF,element_pair_address,wdata,&status,&rdata);

		pointers = setSliceOfWord_64(pointers, 63,32,next_pointer);
		//memory_array[queue_offset + 1] = pointers;
		ReqRespMemory (0,0,0xFF,queue_offset + 8,pointers,&status,&rdata);
	}

	return(ret_val);
};


// pop from queue
int pop(uint64_t queue_offset , uint32_t* buf_address)
{
	int ret_val = 0;
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+8,0,&status,&pointers);

	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	uint64_t element_pair_address = queue_offset + 16 + (read_pointer >> 1)<<3 ;
	
	if(write_pointer != read_pointer)
	{
		ret_val = 1;
		ReqRespMemory (0,1,0xFF,element_pair_address,0,&status,&rdata);
		//buf_data = memory_array[read_pointer];
		if((read_pointer & 0x1) == 1)
		{
			*buf_address = getSliceFromWord(rdata,31,0);
		}
		else
		{
			*buf_address = getSliceFromWord(rdata,63,32);
		}
			
		
		read_pointer = (read_pointer + 1) & (NUMBER_OF_ENTRIES - 1);
		
		pointers = setSliceOfWord_64(pointers, 31,0,read_pointer);
		
		//memory_array[queue_offset + 1] = pointers;
		ReqRespMemory (0,0,0xFF,queue_offset + 8,pointers,&status,&rdata);
			

	}


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





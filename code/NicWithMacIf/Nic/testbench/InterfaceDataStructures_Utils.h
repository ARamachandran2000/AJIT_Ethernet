#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____

// Indicates Offsets of Queues in Memory
#define FREE_QUEUE 0
#define RX_QUEUE 18
#define TX_QUEUE 36


#define QUEUE_SIZE 16


void ReqRespMemory(
			uint8_t lock,
			uint8_t read_write_bar,
			uint8_t byte_mask,
			uint64_t addr,
			uint64_t wdata,
			uint8_t * status, 
			uint64_t *  rdata)
{

	sprintf(req_pipe0,"mem_req%d_pipe0",0);//64 bit wide
	sprintf(req_pipe1,"mem_req%d_pipe1",0);//64 bit wide
	sprintf(resp_pipe0,"mem_resp%d_pipe0",0);// 64 bit wide
	sprintf(resp_pipe1,"mem_resp%d_pipe1",0);//  8 bit wide

	uint64_t req1 = 0;
	uint64_t req0 = wdata;
	req1 = setSliceOfWord_64(req1, 45,45,lock); // Lock
	req1 = setSliceOfWord_64(req1, 44,44,read_write_bar); // Read Write Set
	req1 = setSliceOfWord_64(req1, 43,36,byte_mask); // Byte Mask
	req1 = setSliceOfWord_64(req1, 35,0,addr); // Addr

	
	write_uint64(req_pipe0,req0);
	write_uint64(req_pipe1,req1);

	
	*(rdata) = read_uint64(resp_pipe0);
	*status = read_uint8(resp_pipe1);

	
}




void initQueue(uint64_t queue_offset,uint32_t number_of_entries)
{
	uint64_t rdata;
	uint8_t status;
	// Set Lock and Number of Entries
	uint64_t lock_entries = 0;
	lock_entries = setSliceOfWord_64(lock_entries, 31,0,number_of_entries);	
	//memory_array [queue_offset] = lock_entries;
	ReqRespMemory (0,0,0xFF,queue_offset,lock_entries,&status,&rdata);

	
	
	// Set Read and Write Pointers
	uint64_t pointers = 0;
	pointers = setSliceOfWord_64(pointers, 31,0,queue_offset + 2);
	pointers = setSliceOfWord_64(pointers, 63,32,queue_offset + 2);
	//memory_array [queue_offset + 1] = pointers;
	ReqRespMemory (0,0,0xFF,queue_offset+1,pointers,&status,&rdata);

}

int push(uint64_t queue_offset, uint64_t data,uint8_t bmask)
{

	int ret_val = 0;
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;
	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+1,0,&status,&pointers);

	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	uint32_t next_pointer = (write_pointer + 1)
	
	// Loop Around (Circular Queue)
	if(next_pointer == (queue_offset + 2 + QUEUE_SIZE))
		next_pointer = queue_offset + 2;

	if(next_pointer != read_pointer)
	{
		ret_val = 1;
		//memory_array[write_pointer] = data;
		ReqRespMemory (0,0,bmask,write_pointer,data,&status,&rdata);
		pointers = setSliceOfWord_64(pointers, 63,32,next_pointer);
		//memory_array[queue_offset + 1] = pointers;
		ReqRespMemory (0,0,0xFF,queue_offset + 1,pointers,&status,&rdata);
	}

	return(ret_val);
};



int pop(uint64_t queue_offset , uint64_t* buf_data)
{
	int ret_val = 0;
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+1,0,&status,&pointers);
	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	
	if(write_pointer != read_pointer)
	{
		ret_val = 1;
		buf_data = memory_array[read_pointer];
		
		if((read_pointer + 1) == (queue_offset + 2 + QUEUE_SIZE))
			read_pointer = queue_offset + 2;
		else
			read_pointer = read_pointer + 1;
		
		pointers = setSliceOfWord_64(pointers, 31,0,read_pointer);
		
		memory_array[queue_offset + 1] = pointers;
		ReqRespMemory (0,0,0xFF,queue_offset + 1,pointers,&status,&rdata);
			

	}


	return(ret_val);

}


int checkEmpty(uint64_t queue_offset)
{
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+1,0,&status,&pointers);
	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	
	return (write_pointer == read_pointer);

};

int checkFull(uint64_t queue_offset)
{
	uint64_t pointers;
	uint64_t rdata;
	uint8_t status;

	//uint64_t pointers = memory_array [queue_offset + 1];
	ReqRespMemory (0,1,0xFF,queue_offset+1,0,&status,&pointers);

	uint32_t write_pointer = getSliceFromWord(pointers, 63, 32);
	uint32_t read_pointer  = getSliceFromWord(pointers, 31, 0);
	
	uint32_t next_pointer = (write_pointer + 1)
	
	// Loop Around (Circular Queue)
	if(next_pointer == (queue_offset + 2 + QUEUE_SIZE))
		next_pointer = queue_offset + 2;

	return (next_pointer == read_pointer);

};





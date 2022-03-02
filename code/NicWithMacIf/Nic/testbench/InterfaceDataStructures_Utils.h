#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____

// Indicates Offsets of Queues in Memory
#define FREE_QUEUE 0
#define RX_QUEUE 18
#define TX_QUEUE 36


#define QUEUE_SIZE 16

// LSB of memory Index stores lower address and MSB stores higher address (Little Endian)

void initQueue(uint64_t queue_offset,uint32_t number_of_entries)
{

	// Set Lock and Number of Entries
	uint64_t lock_entries = 0;
	lock_entries = setSliceOfWord_64(lock_entries, 31,0,number_of_entries);	
	memory_array [queue_offset] = lock_entries;
	
	// Set Read and Write Pointers
	uint64_t pointers = 0;
	pointers = setSliceOfWord_64(pointers, 31,0,queue_offset + 2);
	pointers = setSliceOfWord_64(pointers, 63,32,queue_offset + 2);
	memory_array [queue_offset + 1] = pointers;

}

int push(uint64_t queue_offset, uint32_t * data)
{

	int ret_val = 0;
	uint64_t pointers = memory_array [queue_offset + 1];

	uint32_t write_pointer = getSliceFromWord(pointers, 31, 0);
	uint32_t read_pointer  = getSliceFromWord(pointers, 63, 32);
	uint32_t next_pointer = (write_pointer + 1)
	
	// Loop Around (Circular Queue)
	if(next_pointer == (queue_offset + 2 + QUEUE_SIZE))
		next_pointer = queue_offset + 2;

	if(next_pointer != read_pointer)
	{
		ret_val = 1;
		memory_array[write_pointer] = data;
		pointers = setSliceOfWord_64(pointers, 31,0,next_pointer);
		
		memory_array[queue_offset + 1] = pointers;
	}

	return(ret_val);
};



int pop(uint64_t queue_offset , uint32_t* buf_data)
{
	int ret_val = 0;

	uint64_t pointers = memory_array [queue_offset + 1];
	uint32_t write_pointer = getSliceFromWord(pointers, 31, 0);
	uint32_t read_pointer  = getSliceFromWord(pointers, 63, 32);
	
	if(write_pointer != read_pointer)
	{
		ret_val = 1;
		buf_data = memory_array[read_pointer];
		
		if((read_pointer + 1) == (queue_offset + 2 + QUEUE_SIZE))
			read_pointer = queue_offset + 2;
		else
			read_pointer = read_pointer + 1;
		
		pointers = setSliceOfWord_64(pointers, 63,32,read_pointer);
		
		memory_array[queue_offset + 1] = pointers;
			

	}


	return(ret_val);

}


int checkEmpty(uint64_t queue_offset)
{
	uint64_t pointers = memory_array [queue_offset + 1];
	uint32_t write_pointer = getSliceFromWord(pointers, 31, 0);
	uint32_t read_pointer  = getSliceFromWord(pointers, 63, 32);
	
	return (write_pointer == read_pointer);

};

int checkFull(uint64_t queue_offset)
{
	uint64_t pointers = memory_array [queue_offset + 1];
	uint32_t write_pointer = getSliceFromWord(pointers, 31, 0);
	uint32_t read_pointer  = getSliceFromWord(pointers, 63, 32);
	
	uint32_t next_pointer = (write_pointer + 1)
	
	// Loop Around (Circular Queue)
	if(next_pointer == (queue_offset + 2 + QUEUE_SIZE))
		next_pointer = queue_offset + 2;

	return (next_pointer == read_pointer);

};





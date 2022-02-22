#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____

typedef struct  __FreeBufferQueue {
	uint32_t acquire_mutex;
	uint32_t number_of_entries;

	uint32_t write_pointer;
	uint32_t read_pointer;

	// software will allocate... and maybe reallocate.
	uint32_t* buffers;
}FreeBufferQueue;

typedef struct __RxandTxQueues {
	uint32_t number_of_entries;
	
	uint32_t write_pointer;
	uint32_t read_pointer;
	
	uint32_t* pointers;
}RxandTxQueues;

void initFreeBufferQueue(FreeBufferQueue* Q, uint32_t number_of_entries)
{
	Q->acquire_mutex = 0;
	Q->write_pointer = 0;
	Q->read_pointer = 0;
	Q->number_of_entries = number_of_entries;
}

void initRxandTxQueues(RxandTxQueues* Q, uint32_t number_of_entries)
{
	Q->acquire_mutex = 0;
	Q->write_pointer = 0;
	Q->read_pointer = 0;
	Q->number_of_entries = number_of_entries;
}


// return 1 on success.
int pushIntoFreeBufferQueue(FreeBufferQueue* , uint32_t);

// return 1 on success.
int popFromFreeBufferQueue (FreeBufferQueue* , uint32_t*);

// return 1 on success
int pushIntoRxandTxQueues(RxandTxQueues*, uint32_t);

// return 1 on success
int popFromRxandTxQueues (RxandTxQueues*, uint32_t*);


#endif

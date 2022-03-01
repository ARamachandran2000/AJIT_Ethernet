// Configs the Registers, Creates Free Buffers, swaps MAC addresses and pushes to the Queues

#define BUF_LENGTH 200
#define QUEUE_SIZE 10

void cpu_model(FreeBufferQueue *  free, 
				RxandTxBufferQueues * Rx, RxandTxBufferQueues * Tx)

{

// First Create a Few Buffers to Push Into Free Queue

uint32_t * buffer_0 = (uint32_t*) malloc(BUF_LENGTH * sizeof(uint32_t));
uint32_t * buffer_1 = (uint32_t*) malloc(BUF_LENGTH * sizeof(uint32_t));
uint32_t * buffer_2 = (uint32_t*) malloc(BUF_LENGTH * sizeof(uint32_t));

uint32_t * temp_buffer = NULL;


// Initialise Free, Rx and Tx Queues

initFreeBufferQueue(free, QUEUE_SIZE);
initRxandTxQueues(Rx, QUEUE_SIZE);
initRxandTxQueues(Tx, QUEUE_SIZE);


// Push Buffer Pointers to Free Queue
pushIntoFreeBufferQueue(free , buffer_0)
pushIntoFreeBufferQueue(free , buffer_1)
pushIntoFreeBufferQueue(free , buffer_2)



// Config NIC Registers Here.....(Discuss Tomorrow)




// 


while(1)
{

// If Rx Queue has data then pop and push to Tx Queue (For now not swapping Addresses to reduce complexity since we are just simulating to check the NIC functionality)
	if(popFromRxandTxQueues (Rx,temp_buffer)))
	{
		pushIntoRxandTxQueues(Tx, temp_buffer);
	}	
}

}

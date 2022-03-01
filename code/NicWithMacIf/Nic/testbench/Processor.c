// Configs the Registers, Creates Free Buffers, swaps MAC addresses and pushes to the Queues

#include "InterfaceDataStructures.h"

#define BUF_LENGTH 200
#define QUEUE_SIZE 10

<<<<<<< HEAD
void cpu_model(FreeBufferQueue *  free, 
				RxandTxBufferQueues * Rx, RxandTxBufferQueues * Tx)

{

// First Create a Few Buffers to Push Into Free Queue

uint32_t * buffer_0 = (uint32_t*) malloc(BUF_LENGTH * sizeof(uint32_t));
uint32_t * buffer_1 = (uint32_t*) malloc(BUF_LENGTH * sizeof(uint32_t));
uint32_t * buffer_2 = (uint32_t*) malloc(BUF_LENGTH * sizeof(uint32_t));

uint32_t * temp_buffer = NULL;


// Initialise Free, Rx and Tx Queues

initQueue(free, QUEUE_SIZE);
initQueue(Rx, QUEUE_SIZE);
initQueue(Tx, QUEUE_SIZE);


// Push Buffer Pointers to Free Queue
push(free , buffer_0)
push(free , buffer_1)
push(free , buffer_2)

// Config NIC Registers Here.....(Discuss Tomorrow)




// 

while(1)
{

// If Rx Queue has data then pop and push to Tx Queue (For now not swapping Addresses to reduce complexity since we are just simulating to check the NIC functionality)
	if(~checkEmpty(Rx)
	{
		pop (Rx,temp_buffer)
		push(Tx, temp_buffer);
	}	
}

}

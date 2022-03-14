// Configs the Registers, Creates Free Buffers, swaps MAC addresses and pushes to the Queues

//#include "header.h"


#define BUF_LENGTH 256

// Buffers area start from index 56 and length of 256 indices
void cpu_model()
{

	// Initialise Free, Rx and Tx Queues

	initQueue(FREE_QUEUE, QUEUE_SIZE);
	initQueue(RX_QUEUE, QUEUE_SIZE);
	initQueue(TX_QUEUE, QUEUE_SIZE);


	// Create Buffers to store Data
	uint64_t buffer_0 = 55;
	uint64_t buffer_1 = buffer_0 + BUF_LENGTH;
	uint64_t buffer_2 = buffer_1 + BUF_LENGTH;
	uint64_t buffer_3 = buffer_2 + BUF_LENGTH;

	// Push Buffer Pointers to Free Queue for access by NIC
	push(FREE_QUEUE , buffer_0);//,0x0F)
	push(FREE_QUEUE , buffer_1);//,0xFF)
	push(FREE_QUEUE , buffer_2);//,0x0F)
	push(FREE_QUEUE , buffer_3);//,0xFF)

	// Config NIC Registers
	register_config (RX_QUEUE, TX_QUEUE, FREE_QUEUE);
	
	uint32_t buffer_with_packet = 0;

	while(1)
	{

		// If Rx Queue has data then pop and push to Tx Queue 
		//	(For now not swapping Addresses to reduce 
		//		complexity since we are just simulating 
		//		to check the NIC functionality)
		if(pop (RX_QUEUE, &buffer_with_packet))	
			push(TX_QUEUE, buffer_with_packet);
		// If no data, then sleep for 5 seconds and try again
		else
			sleep(5);	
	}
}

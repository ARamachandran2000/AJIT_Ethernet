// Configs the Registers, Creates Free Buffers, swaps MAC addresses and pushes to the Queues

// all these will be moved to header.h
#define BUF_LENGTH 190
#define QUEUE_SIZE 3
void cpu_model()
{
	fprintf(stderr, "CPU_THREAD : started \n");
	// Initialise Free, Rx and Tx Queues

	initQueue(FREE_QUEUE, QUEUE_SIZE);
	initQueue(RX_QUEUE, QUEUE_SIZE);
	initQueue(TX_QUEUE, QUEUE_SIZE);

	fprintf(stderr, "CPU_THREAD : Init queue done. \n");
	

	// Push Buffer Pointers to Free Queue for access by NIC
	push(FREE_QUEUE , BUF_0);
	push(FREE_QUEUE , BUF_1);
	push(FREE_QUEUE , BUF_2);;

	fprintf(stderr, "CPU_THREAD : pushed buffers to free queue \n");
	// Config NIC Registers
	fprintf(stderr, "CPU_THREAD : configuring NIC registers\n");
	register_config (RX_QUEUE, TX_QUEUE, FREE_QUEUE);
	
	uint32_t buffer_with_packet = 0;

	while(1)
	{

		// If Rx Queue has data then pop and push to Tx Queue 
		//	(For now not swapping Addresses to reduce 
		//		complexity since we are just simulating 
		//		to check the NIC functionality)
		if(pop (RX_QUEUE, &buffer_with_packet)){
			fprintf(stderr, "Processor : got rx queue sendint it to txx queue\n");	
			push(TX_QUEUE, buffer_with_packet);
		}
		// If no data, then sleep for 5 seconds and try again
		else{
			fprintf(stderr, "Processor : Sleeping\n");	
			sleep(1);	
		}
	}
}

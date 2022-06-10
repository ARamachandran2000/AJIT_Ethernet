// Configs the Registers, Creates Free Buffers, swaps MAC addresses and pushes to the Queues

// all these will be moved to header.h
void cpu_model()
{
	fprintf(stderr, "CPU_THREAD : started \n");
	// Initialise Free, Rx and Tx Queues

	// for march test on nic regs.	
//	writeNicReg();
//	readNicReg();


	initQueue(FREE_QUEUE, NUMBER_OF_ENTRIES);
	initQueue(RX_QUEUE, NUMBER_OF_ENTRIES);
	initQueue(TX_QUEUE, NUMBER_OF_ENTRIES);

	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD : Init queue done. \n");
	

	// Push Buffer Pointers to Free Queue for access by NIC
	push(FREE_QUEUE , BUF_0);
	push(FREE_QUEUE , BUF_1);
	push(FREE_QUEUE , BUF_2);
	int ret_val = push(FREE_QUEUE , BUF_3);
	
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD : pushed buffers to free queue last_ret_val = %d\n",ret_val);
	// Config NIC Registers
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD : configuring NIC registers\n");
	
	register_config (RX_QUEUE, TX_QUEUE, FREE_QUEUE);
	MAC_ENABLE = 1;	
	uint32_t buffer_with_packet = 0;

	while(1)
	{

		// If Rx Queue has data then pop and push to Tx Queue 
		//	(For now not swapping Addresses to reduce 
		//		complexity since we are just simulating 
		//		to check the NIC functionality)
		if(pop (RX_QUEUE, &buffer_with_packet)){
			(DEBUG == 1) && fprintf(stderr, "CPU_THREAD : Got RX_Q = %lx and buffer_with_packet = %lx pointer sending it to TX_Q\n", RX_QUEUE, buffer_with_packet);	
			push(TX_QUEUE, buffer_with_packet);
		}
		// If no data, then sleep for 5 seconds and try again
		else{

			fprintf(stderr, "CPU_THREAD : Sleeping\n");	
			//sleep(1);	
			int k;
			for(k = 0 ; k < 250000000; k++);
			//readNicReg();
		}
	}
}

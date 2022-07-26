#include<stdio.h>
#include <stdint.h>
#include "nic_utilities.h"


// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 180 // 80

int main()
{
	
	__ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	ee_printf ("Started\n");

	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 8;
	CortosQueueHeader* free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* rx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* tx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);

	// allocate buffers
	uint8_t* Buffers[3];
	int i;
	for(i = 0; i < 3; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
	}

	msgs_written = cortos_writeMessages(free_queue, Buffers, 3);

	nicRegInit(free_queue,rx_queue,tx_queue);

	
	uint32_t eth_hdr[4];
        loadEthernetHeader(free_queue,&eth_hdr);
	ee_printf("eth_hdr[0] = 0x%x\n", eth_hdr[0]);
	ee_printf("eth_hdr[1] = 0x%x\n", eth_hdr[1]);
        ee_printf("eth_hdr[2] = 0x%x\n", eth_hdr[2]);
	ee_printf("eth_hdr[3] = 0x%x\n", eth_hdr[3]);


	uint32_t buffer_with_packet = 0;
	while(1){
		
		uint32_t data[1];
		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1)){

			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			ee_printf("Number of Packets transmitted = %d", readNicReg(21));
		}	
		else
		{
			int k = 0;
			for(k = 0; k < 2500000; k++);
		}
		if(readNicReg(21) == 100)
			break;
	}
	writeNicReg(0,0);

	// free queue
	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < 3; i++)
	{
		cortos_brel(Buffers[i]);
	}
	return(0);
}


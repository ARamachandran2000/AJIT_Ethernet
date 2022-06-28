#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include "cortos_queue.h"
// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 80 // 80
#define QUEUE_LENGTH 16 + 4 * NUMBER_OF_BUFFERS


//#define NIC_START_ADDR 0xFFFF5000
//#define NIC_END_ADDR   0xFFFF50FF
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1fffffff


uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
void readMemory(uint64_t);


void nicRegConfig(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue)
{
	ee_printf("NIC_REG[22]=0x%x\n",readNicReg(22));
	writeNicReg(1,1);			//NIC_REG[1] = 1;//NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)Rx_Queue);	//NIC_REG[2] = Rx_Queue;
	writeNicReg(10,(uint32_t)Tx_Queue);	//NIC_REG[10] = Tx_Queue;
	writeNicReg(18,(uint32_t)Free_Queue);	//NIC_REG[18] = Free_Queue;
	// start NIC
	writeNicReg(0,1); 			//NIC_REG[0] = 1;
	ee_printf("NIC_regs: [1]=0x%x,[2]=0x%x,[10]=0x%x,[18]=0x%x,[0]=0x%x,"
			"[21]=0x%x,[22]=0x%x\n",readNicReg(1),readNicReg(2),
			readNicReg(10),readNicReg(18),readNicReg(0),readNicReg(21),readNicReg(22));
}	
void readNicRegs()
{
	int i;
	for(i = 0; i < 64; i++)
	{
		
		ee_printf("NIC_REG[%d] = 0x%x\n",i,readNicReg(i));
	}
}

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	ee_printf ("Started\n");
	
	// allocate buffers
	uint8_t* Buffers[3];
	int i;
	for(i = 0; i < 3; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
	}
	
	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 8;
	CortosQueueHeader* free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* rx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* tx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	
	msgs_written = cortos_writeMessages(free_Queue, Buffers, 3);


	nicRegConfig(free_queue,rx_queue,tx_queue);
	

	ee_printf ("Configuration Done. NIC has started\n");
	uint32_t buffer_with_packet = 0;
	while(1){
		
		ee_printf ("In the loop.\n");
		//readNicRegs();	
		uint8_t data[1];
		if(cortos_readMessages(rx_queue, data, 1)){

			msgs_written = cortos_writeMessages(tx_queue, data, 1);
			ee_printf ("Written to Tx queue.\nNIC_REG[21]=0x%x\n",readNicReg(21));
		}	
		else
		{
			ee_printf ("Reading Rx_Queue\n");
			int k = 0;
			for(k = 0; k < 2500000; k++);
			ee_printf ("Nothing in Rx queue.\nNIC_REG[21]=0x%x\n",readNicReg(21));
			ee_printf ("Free Queue : mutex =%u, num_of_entries=%u, wp =%u, rp =%u.\n",
					Free_Queue->acquire_mutex,Free_Queue->number_of_entries,
						Free_Queue->write_pointer,Free_Queue->read_pointer);
		}
	}
	return(0);
}

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	//data = __ajit_load_word_mmu_bypass__(&NIC_REG[index]);
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}


void writeNicReg(uint32_t index, uint32_t value)
{
	//__ajit_store_word_mmu_bypass__(value,&NIC_REG[index]);
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}


void readMemory(uint64_t phy_addr)
{
	uint32_t data;
        data = __ajit_load_word_from_physical_address__(phy_addr);
	ee_printf ("data at addr = 0x%lx%lx is 0x%x\n",phy_addr,phy_addr,data);
}

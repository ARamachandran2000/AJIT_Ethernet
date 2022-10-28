#include<stdio.h>
#include <stdint.h>
#include "ajit_access_routines.h"
#include "core_portme.h"
#include <cortos.h>


#define MEM_START_ADDR 0x3FFC00 // 3ffff8 - 3ffe00 = 1f8 = 
uint32_t* MEM = MEM_START_ADDR;
void printMemory(void);
//#include "nic_utils.h"

#define NO_OF_PKTS 1000

//char Tcontaints[10][20] = {"Before Nic Enable","After Nic Enable","After completion","After reading queue","After writing queue",".",".",".",".","."};

uint64_t T[10],t[11];
int I = 0;
int INIT = NO_OF_PKTS;


// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 300 // 80

// NIC register start and end  addresses
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1FFFFFFF

// pointer to NIC regs
uint32_t* NIC_REG = NIC_START_ADDR;

uint32_t cortos_writeMessagesNew(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_acquire_buzy(hdr->lock);
  }

  uint32_t writeIndex     = hdr->writeIndex;
  uint32_t readIndex     = hdr->readIndex;
  uint32_t length         = hdr->length;
  uint32_t* queuePtr       = (uint32_t*)(hdr + 1);
  uint32_t newWriteIndex = (writeIndex+1) % length;
  // if writeIndex+1 == readIndex don't push
  uint32_t queue_full = (newWriteIndex == readIndex);
  
  if(queue_full)
  {
	if (!(hdr->misc & SINGLE_RW_QUEUE)) {
		cortos_lock_release(hdr->lock); // release lock
 	 }
	return 0;
  }
  else		// push
  {
	*(queuePtr + writeIndex) = *msgs; 
	hdr->writeIndex = newWriteIndex;
  }
  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_release(hdr->lock);		// release lock
  }
  return 1;
}



uint32_t cortos_readMessagesNew(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_acquire_buzy(hdr->lock);
  }

  uint32_t readIndex      = hdr->readIndex;
  uint32_t writeIndex      = hdr->writeIndex;
  uint32_t length         = hdr->length;
  uint8_t* queuePtr       = (uint8_t*)(hdr + 1);
  uint32_t queue_empty    = (writeIndex == readIndex);

  if(queue_empty)
  {
	if (!(hdr->misc & SINGLE_RW_QUEUE)) {
   		 cortos_lock_release(hdr->lock);              // RELEASE LOCK
  	}
	return 0;
  }
  else
  {
	*msgs = *(queuePtr + readIndex);
    	readIndex = (readIndex+1) % length;
  }

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_release(hdr->lock);              // RELEASE LOCK
  }
  return 1;
}



uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}

void readNicRegs()
{
	int i;
	for(i = 0; i < 64; i++)
	{
		
		ee_printf("NIC_REG[%d] = 0x%x\n",i,readNicReg(i));
	}
}

void writeNicReg(uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}


inline void nicRegInit(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue)
{
	writeNicReg(1,1);				//NIC_REG[1]  <- NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)Rx_Queue);		//NIC_REG[2]  <- Rx_Queue pointer;
	writeNicReg(10,(uint32_t)Tx_Queue);		//NIC_REG[10] <- Tx_Queue pointer;
	writeNicReg(18,(uint32_t)Free_Queue);		//NIC_REG[18] <- Free_Queue pointer;
	// start NIC					//NIC_REG[0]  <- NIC_Control (1 -> starts NIC,


	T[I++] = cortos_get_clock_time();	
	writeNicReg(0,1); 				//			      0 -> stops NIC);
	T[I++] = cortos_get_clock_time();	
}

// to load Ethernet header frmo memory
void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr)
{
	eth_hdr[0] = buffer_addr[2]; // 2
	eth_hdr[1] = buffer_addr[3]; // 3
	eth_hdr[2] = buffer_addr[4];
	eth_hdr[3] = buffer_addr[5];
}

// to read control data of the buffer
void readBufControlData(uint32_t *buffer_addr, uint16_t *packetSize, uint8_t *lastTkeep)
{
	uint32_t data[1];
	data[0] = buffer_addr[1];
	*packetSize = (data[0] >> 8) & 0xffff;
	*lastTkeep = data[0] & 0xff; 
}

// to modify control data of the buffer
void writeBufControlData(uint32_t *buffer_addr, uint16_t packetSize, uint8_t lastTkeep)
{
	uint32_t new_data[1];
	new_data[0] = (uint32_t)((packetSize << 8) | lastTkeep);
	ee_printf("control data = 0x%08x\n",new_data[0]);
	buffer_addr[1] = new_data[0];
}

int main()
{
	
	__ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	ee_printf ("\n*********Started*********\n");

	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 112; // 112
	CortosQueueHeader* free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* rx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* tx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	
	rx_queue->misc = 1;
	tx_queue->misc = 1;
	
	// allocate buffers
	uint8_t* Buffers[length];
	uint8_t * BUF[length];
	int i;
	for(i = 0; i < length; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		BUF[i] = Buffers[i];
	}


	ee_printf("Buffers[0] = 0x%08x\n",Buffers[0]);
	msgs_written = cortos_writeMessages(free_queue, BUF, length-1);


	writeNicReg(1,1);				//NIC_REG[1]  <- NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)rx_queue);		//NIC_REG[2]  <- Rx_Queue pointer;
	writeNicReg(10,(uint32_t)tx_queue);		//NIC_REG[10] <- Tx_Queue pointer;
	writeNicReg(18,(uint32_t)free_queue);		//NIC_REG[18] <- Free_Queue pointer;
	// start NIC					//NIC_REG[0]  <- NIC_Control (1 -> starts NIC,

	T[0] = cortos_get_clock_time();	
	writeNicReg(0,1); 				//			      0 -> stops NIC);
	
	T[1] = cortos_get_clock_time();	

	uint32_t data[10];
	while(INIT){

		// read rx queue		
		if(cortos_readMessagesNew(rx_queue, (uint8_t*)&data, 1)) {
			/*while(1)
			{
				if(cortos_writeMessagesNew(tx_queue, (uint8_t*)&data, 1))
				{
					INIT--;
					break;
				}
			}*/
			cortos_writeMessagesNew(tx_queue, (uint8_t*)&data, 1);
			INIT--;	
		}
		//else
		//{
		//	ee_printf(".");
		//}					
	}
	while(1){
		if(readNicReg(21) == NO_OF_PKTS)
		{
			
			T[2] = cortos_get_clock_time();	
	
			uint32_t tl,th, tl_old = 0,th_old = 0;
			int i;
			ee_printf("No_of_pksts = %d \t No_of_Buffers = %d\n",NO_OF_PKTS,length);
			for(i = 0; i < 3; i++)
			{
				tl = T[i] & 0xffffffff;
				th = T[i] >> 32;
				ee_printf("\tT[%d] = %u %u\tdiff = %u %u\n",i,th,tl,(th - th_old),(tl - tl_old));
				tl_old = tl;
				th_old = th;
			}
			break;

		}
	}
	// set control reg to 0
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

void printMemory()
{
	int i = 0;
	ee_printf("i = %u",i);
	for(i=0; i<256; i+=2) // 0x40000 
	{
		ee_printf("i = %u",i);
		ee_printf("Data at location 0x%x is = 0x%08x%08x\n",(MEM+i),MEM[i],MEM[i+1]);
		//readMemory((uint64_t)(MEM+i));
	}
}

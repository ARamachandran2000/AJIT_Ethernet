#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"

// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 80 // 80
#define QUEUE_LENGTH 16 + 4 * NUMBER_OF_BUFFERS


//#define NIC_START_ADDR 0xFFFF5000
//#define NIC_END_ADDR   0xFFFF50FF
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1fffffff


uint32_t* NIC_REG = NIC_START_ADDR;
typedef struct __BufferQueueHeader{
	uint32_t acquire_mutex;
	uint32_t number_of_entries;
	
	uint32_t write_pointer;
	uint32_t read_pointer;

//	uint32_t* buffers;
}BufferQueueHeader;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
void readMemory(uint64_t);
// initialization of queues
void initBufferQueue(BufferQueueHeader* Q, uint32_t number_of_entries)
{
	Q->acquire_mutex = 0; //(uint32_t)cortos_reserveLock(1);
	Q->read_pointer  = 0;
	Q->write_pointer = 0;
	Q->number_of_entries = number_of_entries;
}


void acquireMutex(BufferQueueHeader* Q)
{
	uint32_t mutex_val = Q->acquire_mutex;
	// loop till mutex is not available
	while(mutex_val == 1)
	{
		mutex_val = Q->acquire_mutex;
	}
	Q->acquire_mutex = 1;
}


void releaseMutex(BufferQueueHeader* Q)
{
	Q->acquire_mutex = 0;
}


// returns 0 on success
int pushIntoBufferQueue(BufferQueueHeader* Q, uint32_t buf_ptr)
{
	int ret_val = 1;
	acquireMutex(Q);
	uint32_t* queue_ptr = (uint32_t*)(Q+1);
	uint32_t* dest;
	uint32_t nwp = (Q->write_pointer + 1) & (Q->number_of_entries - 1);
	if(nwp != Q->read_pointer)
	{
		ret_val = 0;
		dest = queue_ptr + Q->write_pointer;
		*dest = buf_ptr;
		ee_printf("written buf_ptr = 0x%lx at dest = 0x%lx\n",buf_ptr,dest);
		Q->write_pointer = nwp;
	}
	releaseMutex(Q);
	return(ret_val);
}

// returns 0 on success
int popFromBufferQueue(BufferQueueHeader* Q, uint32_t* buf)
{
	int ret_val = 1;
	acquireMutex(Q);
	uint32_t* queue_ptr = (uint32_t*)(Q + 1);
	uint32_t* src;
	if(Q->write_pointer != Q->read_pointer)
	{
		ret_val = 0;
		src = queue_ptr + Q -> read_pointer;
		*buf = *src;
		Q->read_pointer = (Q->read_pointer + 1) & (Q->number_of_entries - 1);
	}

	releaseMutex(Q);
	return(ret_val);
}

void nicRegConfig(BufferQueueHeader* Free_Queue, BufferQueueHeader* Rx_Queue,BufferQueueHeader* Tx_Queue)
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
	uint8_t* rx_queue;
	uint8_t* tx_queue;
	uint8_t* free_queue;
	//for(i = 0; i < 64; i++)
	//{
	//	if(i != 22)
	//	NIC_REG[i] = i;
	//}	
	rx_queue = (uint8_t*)cortos_bget_ncram(QUEUE_LENGTH);
	tx_queue = (uint8_t*)cortos_bget_ncram(QUEUE_LENGTH);
	free_queue = (uint8_t*)cortos_bget_ncram(QUEUE_LENGTH);
	
	ee_printf ("All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[1]=0x%lx,\n\tBuffer[2]=0x%lx,"
			"\n\tBuffer[3]=0x%lx,\n\tBuffer[4]=0x%lx,\n\tBuffer[5]=0x%lx,"
			"\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n",Buffers[0],
			Buffers[1],Buffers[2],Buffers[3],Buffers[4],Buffers[5],rx_queue,tx_queue,free_queue);

	BufferQueueHeader* Free_Queue;
	BufferQueueHeader* Tx_Queue;
	BufferQueueHeader* Rx_Queue;
	
	Free_Queue = (BufferQueueHeader*) free_queue;	
	Tx_Queue = (BufferQueueHeader*) tx_queue;
	Rx_Queue = (BufferQueueHeader*) rx_queue;
	
	ee_printf ("Initializing the Queues.\tFree_Queue=0x%lx\n",Free_Queue);
	// initialize Queues
	initBufferQueue(Free_Queue, NUMBER_OF_BUFFERS);
	initBufferQueue(Tx_Queue, NUMBER_OF_BUFFERS);
	initBufferQueue(Rx_Queue, NUMBER_OF_BUFFERS);
	ee_printf ("Queues Initialized,\n Pushing free buffers.\n");

	// push free buffers to free queues
	pushIntoBufferQueue(Free_Queue,Buffers[0]);
	pushIntoBufferQueue(Free_Queue,Buffers[2]);
	pushIntoBufferQueue(Free_Queue,Buffers[4]);
	ee_printf ("Pushed free buffers,\n Configuring NIC registers.\n");

	// read regs
	//readNicRegs();

	// configure nic registers
	nicRegConfig(Free_Queue,Rx_Queue,Tx_Queue);
	
	//readNicRegs();	

	ee_printf ("Configuration Done. NIC has started\n");
	*Buffers[0] = 0x34;
	uint32_t buffer_with_packet = 0;
	while(1){
		
		ee_printf ("In the loop.\n");
		//readNicRegs();	
		if(popFromBufferQueue(Rx_Queue,&buffer_with_packet)){
			ee_printf ("Reading Rx_Queue\n");
			int k = 0;
			for(k = 0; k < 2500000; k++);
			ee_printf ("Nothing in Rx queue.\nNIC_REG[21]=0x%x\n",readNicReg(21));
			ee_printf ("Free Queue : mutex =%u, num_of_entries=%u, wp =%u, rp =%u.\n",
					Free_Queue->acquire_mutex,Free_Queue->number_of_entries,
						Free_Queue->write_pointer,Free_Queue->read_pointer);
			readMemory(((uint64_t)Free_Queue<<3));
			readMemory((	((uint64_t)Free_Queue<<3) + 4));
			readMemory((	((uint64_t)Free_Queue<<3) + 8));
			readMemory((	((uint64_t)Free_Queue<<3) + 12));
		}	
		else
		{
			pushIntoBufferQueue(Tx_Queue,buffer_with_packet);
			ee_printf ("Written to Tx queue.\nNIC_REG[21]=0x%x\n",readNicReg(21));
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

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}
void writeNicReg(uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}
void nicRegInit(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue)
{
	writeNicReg(1,1);					//NIC_REG[1]  <- NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)Rx_Queue);			//NIC_REG[2]  <- Rx_Queue pointer;
	writeNicReg(10,(uint32_t)Tx_Queue);			//NIC_REG[10] <- Tx_Queue pointer;
	writeNicReg(18,(uint32_t)Free_Queue);			//NIC_REG[18] <- Free_Queue pointer;
	// start NIC
	writeNicReg(0,1); 					//NIC_REG[0]  <- NIC_Control  ( 1 -> starts NIC, 0 stops NIC);

	ee_printf("NIC_regs: [1]=0x%x,[2]=0x%x,[10]=0x%x,[18]=0x%x,[0]=0x%x,"
			"[21]=0x%x,[22]=0x%x\n",readNicReg(1),readNicReg(2),
			readNicReg(10),readNicReg(18),readNicReg(0),readNicReg(21),readNicReg(22));
}	

// to load Ethernet header
// 		eth_hdr should be array of length 2 and width 64.
//		ethernet header is written to eth_hdr array.
void loadEthernetHeader(uint32_t *buffer_addr, uint64_t *eth_hdr)
{
	eth_hdr[0] = (((uint64_t)buffer_addr[1] << 32) | buffer_addr[2]);	
	eth_hdr[1] = (((uint64_t)buffer_addr[3] << 32) | buffer_addr[4]);	
}



// to load payload
void loadPayload(uint32_t *buffer_addr , uint64_t *payload);

// to read control data of the buffer
void readBufControlData(uint32_t *buffer_addr, uint16_t *packetSize, uint16_t *lastTkeep);

// to modify control data of the buffer
void writeBufControlData(uint32_t *buffer_addr, uint16_t packetSize, uint16_t lastTkeep);














#ifndef NIC_UTILITIES_H
#define NIC_UTILITIES_H

#include "ajit_access_routines.h"
#include "core_portme.h"
#include <cortos.h>

/*
***********************************************************
  All functions are written considering signle NIC system
some may get modified for multiple NIC system. 
***********************************************************
*/


// NIC register start and end  addresses
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1FFFFFFF

// pointer to NIC regs
uint32_t* NIC_REG = NIC_START_ADDR;

// To read value stored in NIC registers
//    valid regIndex values are 0 - 64.
//    returns the value stored in register.
uint32_t readNicReg( uint32_t regIndex);

// To write value to NIC registers
void writeNicReg(uint32_t regIndex, uint32_t value);


// To initializre NIC registes
void nicRegInit(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue);

// to load Ethernet header
// 		eth_hdr should be array of length 2 and width 64.
//		ethernet header is written to eth_hdr array.
void loadEthernetHeader(uint32_t *buffer_addr, uint64_t *eth_hdr);

// to load payload
void loadPayload(uint32_t *buffer_addr , uint64_t *payload);

// to read control data of the buffer
void readBufControlData(uint32_t *buffer_addr, uint16_t *packetSize, uint16_t *lastTkeep);

// to modify control data of the buffer
void writeBufControlData(uint32_t *buffer_addr, uint16_t packetSize, uint16_t lastTkeep);


#endif

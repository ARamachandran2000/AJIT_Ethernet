#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____


// 24 byte header
typedef struct _CortosQueueHeader{
	uint32_t totalMsgs; // current total messeges
	uint32_t readIndex;
	uint32_t writeIndex; 
	uint32_t length;
	uint32_t msgSizeInBytes;
	uint8_t *lock;
}CortosQueueHeader;


// Reserve a cortos Queue
//	msgSizeInBytes - size of each msg in Bytes.
//	length - number of msgs queue can hold.
//	nc - if 1 , allocates queue in ncram region
//		else uses cacheable region.
//	Return pointer to header of the queue.
//	Queue starts immidiately after the header.
CortosQueueHeader* cortos_reserveQueue(uint32_t msgSizeInBytes, uint32_t length, uint8_t nc);

// free a reserved queue
void cortos_freeQueue(CortosQueueHeader *hdr);

// write one or more messages
// - Return number of msgs written from *msgs
uint32_t cortos_writeMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count);


// read one or more messages
// - returns number of msgs read into *msgs
uint32_t cortos_readMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count);

#endif

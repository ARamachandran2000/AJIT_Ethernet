// all global declerations and constants declerations are to be written here

#include "InterfaceDataStructures.h"
// consider 64KB memory
//	64K * 8 bits = 64 * 8192 bits
uint64_t Memory[8192];

FreeBufferQueue free_buf_queue;
RxandTBufferQueues rx_queue, tx_queue;

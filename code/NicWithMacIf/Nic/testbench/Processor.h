// Write processor related threads/functions here

#include "InterfaceDataStructures.h"


// functions to perform all initial activities.
//	initialises all the queues.
//	sends control information to nic.
void systemInit();


// Packet processing(will just read rx_queue and write that data to tx_queue)
void processorCore();

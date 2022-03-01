#include "InterfaceDataStructures.h"

// configuration of nic registers.
void register_config (void);

// MAC functions.
//---------------
//  pushes packet to nic.
void macToNicData(void);

// pulls packet from nic.
void nicToMacData(void);

// Processor function.
//----------------------
//	models the cpu.
//	arg1 = base pointer of free queue
//	arg2 = base pointer of rx queue
//	arg3 = base pointer of tx queue
void cpu_model(FreeBufferQueue*, 
		RxandTxBufferQueues*, 
		RxandTxBufferQueues*);

// Memory function.
//-----------------
//	models memory
//	arg1 = base pointer of free queue
//	arg2 = base pointer of rx queue
//	arg3 = base pointer of tx queue
void memory_model(FreeBufferQueue *, 
		  RxandTxBufferQueues*, 
		  RxandTxBufferQueues*);


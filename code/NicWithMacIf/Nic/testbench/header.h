#include "InterfaceDataStructures.h"

// configuration of nic registers.
void register_config (uint32_t, uint32_t, uint32_t);

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
void cpu_model(Queue*, Queue*, Queue*);

// Memory function.
//-----------------
//	models memory
//	arg1 = base pointer of free queue
//	arg2 = base pointer of rx queue
//	arg3 = base pointer of tx queue
void memory_model(Queue*, Queue*, Queue*);


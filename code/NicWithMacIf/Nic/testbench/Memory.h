// Write Memory related threads, functions here

#include "InterfaceDataStructures.h"


// access memory utility for reading as well as writing data
//	Output : 64 bit rdata
//	Input  : 
//		1. 1  bit lock
//		2. 1  bit rwbar
//		3. 8  bit byte_mask
//		4. 32 bit memory_address(will be converted to 36 bit inside function)
//		5. 64 bit wdata
uint64_t accessMemory(char, char, int, uint32_t, uint64_t);

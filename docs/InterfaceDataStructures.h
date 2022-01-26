#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____

#define MAX_NUMBER_OF_PACKETS 64

//
// Software will initialize this data structure.
//     flags[I] = 0 for all I
//
//
// Software will set the address of this data
// structure in the NICs.
//
typedef struct __PacketStorageRecord {
	// flags
	// [63:56]: unused.
	// [55:40]: length in bytes
	// [39:24]: buffer_ID.
	// [23:16]: Destination NIC-ID
	// [15:8]:  Source  NIC-ID
	// [7:4]:   unused.
	// 3: drop (0) / forward (1)
	// 2: not-processed (0)/ processed (1)
	// 1: not-filled (0)/ filled (1) by NIC
	// 0: free (0) /allocated (1)
	uint64_t flags [ MAX_NUMBER_OF_PACKETS ];

	// data array.
	uint64_t data_array [ MAX_NUMBER_OF_PACKETS * 2048 ];

} PacketStorageRecord;




#endif

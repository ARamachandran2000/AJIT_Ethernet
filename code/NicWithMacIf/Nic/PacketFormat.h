#ifndef PacketFormat_h___
#define PacketFormat_h___

typedef struct NicPacket__ {
	// dwords [0] is the control dword.
	// what is the format?
	//

	// dwords [1], dwords [2] keep the 
	// Ethernet packet header
	// what is the format?

	// dwords[3 ... 255] keep packet data
	// (note: last index and byte mask are
	// stored in dwords[0] as indicated above.

	uint64_t dwords[256];
} NicPacket;

void getPacketControlInfo 
	(NicPacket* np,
		uint8_t *index_of_last_dword,
		uint8_t *byte_mask_of_last_dword);
void getPacketHeader (NicPacket* np, uint64_t* h0, uint64_t* h1);
uint64_t getPacketDataDword (NicPacket* np, uint8_t index);

void setPacketControlInfo 
	(NicPacket* np,
		uint8_t index_of_last_dword,
		uint8_t byte_mask_of_last_dword);
void setPacketHeader (NicPacket* np, uint64_t h0, uint64_t h1);
void setPacketDataDword (NicPacket* np, uint8_t index, uint64_t wdata);


#endif

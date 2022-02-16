#ifndef PacketFormat_h___
#define PacketFormat_h___

#define HEADER_BYTE_MASK 0x00_00_00_00_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF;
typedef struct NicPacket__ {
	// dwords [0] is the control dword.
	// what is the format?
	//	dword[0][63:20] = Unused 
	//	dword[0][19: 8] = packet_size
	//	dword[0][ 7: 0] = last_tkeep(byte mask of last word)

	// dwords [1], dwords [2] keep the 
	// Ethernet packet header
	// what is the format?
	//	dword[1][47:0]  = Dest_MAC_Addr[47:0] & 
	//	dword[1][63:48] = Src_MAC_Addr[47:32]
	//
	//	dword[2][63:48] = unused
	//	dword[2][47:32] = Payload_length[7:0]
	//	dword[2][31: 0] = Src_MAC_Addr[31:0]
	
	// dwords[3 ... 255] keep packet data
	// (note: last index and byte mask are
	// stored in dwords[0] as indicated above.
	uint64_t dwords[256];
} NicPacket;



uint64_t getSliceFromWord (uint64_t word, uint8_t high, uint8_t low)
{

	word = word << (63 - high); // First remove extra bits in MSB 
	word = word >> ((63 - high) + low); // Then remove extra bits in LSB
	return word;


}


uint64_t setSliceOfWord (uint64_t word, uint8_t high, uint8_t low, uint8_t wval)
{

	uint64_t word_mask = -1;
	word_mask = word_mask >> (63 - high + low);
	wval = wval & word_mask;
	wval = wval << low;

	word_mask = word_mask <<low;
	word = word & (~word_mask);
	word = word | value;
	return word;

}

void getPacketControlInfo 
	(NicPacket* np,
		uint8_t *index_of_last_dword,
		uint8_t *byte_mask_of_last_dword)


{
	
	uint64_t control_info = np->dwords[0];
	*byte_mask_of_last_dword = getSliceFromWord(control_info,7,0);
	*index_of_last_dword = getSliceFromWord(control_info,15,8);

}

void getPacketHeader (NicPacket* np, uint64_t* h0, uint64_t* h1)
{
	uint64_t header_0 = np->dwords[1];
	uint64_t header_1 = np->dwords[2];	
	
	*h0 = header_0;
	*h1 = header_1 & (HEADER_BYTE_MASK);

}

// get the index'th payload dword (index starts from 0)
uint64_t getPacketDataDword (NicPacket* np, uint8_t index)
{
	//
	// check that no overflow of the buffer 
	// occurs.
	//
	return np->dwords[index];
}


void setPacketControlInfo 
	(NicPacket* np,
		uint8_t index_of_last_dword,
		uint8_t byte_mask_of_last_dword)
{

	uint64_t control_info = 0;
	control_info = setSliceOfWord(control_info,7,0,byte_mask_of_last_dword);
	control_info = setSliceOfWord(control_info,15,8,index_of_last_dword);
	np -> dwords[0] = control_info;
	
}

void setPacketHeader (NicPacket* np, uint64_t h0, uint64_t h1)
{
	
	np->dwords[1] = h0;
	np->dwords[2] = h1;

}

void setPacketDataDword (NicPacket* np, uint8_t index, uint64_t wdata)
{
	np->dwords[index]  = wdata;
}


#endif

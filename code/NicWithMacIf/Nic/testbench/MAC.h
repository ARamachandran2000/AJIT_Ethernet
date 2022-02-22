// Write MAC related threads and declerations here.

// add includes
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include<Pipes.h>

#define MAX_PACKET_LENGTH_IN_BYTES	1500
int __err_flag_ = 0;
// lets have static address for now
uint64_t destination_mac_address = 1;
uint64_t source_mac_address = 2; 
// This function genreates and transmits packet from MAC to NIC
//	actual MAC sends	73 bits 	at a time.
//			----------------------
//			1bit	64bits	8bits
//			tlast	tdata	tkeep	
//	form C direct transfer of 73 bits to a pipe is not possible.
//	since this function uses two pipes to transmit that data.
//	pipes :
//		1.mac_to_nic_data_1[ 8:0] = data[72:64]	-- 16 bit wide
//						(top 7 bits are unused)
//
//		2.mac_to_nic_data_0[63:0] = data[63:0]	-- 64 bit wide
//	 	
void MAC_To_NIC_data(void)
{
	char pipe_to_send0[20], pipe_to_send1[20];
	sprintf(pipe_to_send0,"mac_to_nic_data_0");
	sprintf(pipe_to_send1,"mac_to_nic_data_1");
	while(1){
		uint64_t data_64 = 0;
		uint16_t data_16 = 0;
	
		// fixed length packet
		uint16_t length_in_bytes = 20 + 30; // 20 bytes is min ip header length
		
		// ethernet header 0
		//-------------------
		//	data_64 = {src_mac_addr[7:0] & dest_mac_addr[47:0] & tkeep}
		//		src_mac_addr[7:0]				dest_mac_addr[47:0]	   tkeep
		data_64 = ((source_mac_address & 0x00000000000000ff)<<56) | (destination_mac_address<<8) | (0xff);
		//	data_16 = {tlast & src_mac_addr[15:8]}
		data_16 = ((source_mac_address & 0x000000000000ff00)>>8);
		// send to pipes
		write_uint64(pipe_to_send0,data_64);
		write_uint16(pipe_to_send1,data_16);
		// clear all bits
		data_64 = 0; data_16 = 0;
		
		// ethernet header 1 + 16 bits from payload
		//-----------------------------------------
		//	data_64 = {IHL & version & length_in_bytes & src_mac_addr[47:15] & tkeep}
		//	IHL(IP Header Length = 5) , version = 4
		data_64 = ((5 << 60) | (4 << 56) | (lenght_in_bytes << 40) | ((source_mac_address & 0x0000ffffffff0000)<<8) | (0xff));
		data_16 = 0; // considering type of service = 0 for now	
		// send to pipes
		write_uint64(pipe_to_send0,data_64);
		write_uint16(pipe_to_send1,data_16);
		// clear all bits
		data_64 = 0; data_16 = 0;

		// payload
		//------------
		//	payload remaining = 50 - 2 = 48
		int i;
		for(i = 0; i < (length_in_bytes-8); i+=8)
		{
			// send dummy data (1 to packet_len)
			// will be usefull while checking back
			data_64 = (i << 8) | (0xff);
			data_16 = 0; 
			write_uint64(pipe_to_send0, data_64);
			write_uint16(pipe_to_send1, data_16);		
		}
		// for last 64 bit word , tlast = 1;
		// clear all bits
		data_64 = 0; data_16 = 0;
		data_64 = (i << 8) | (0xff);
		// tlast = 1
		data_16 = (1 << 8); 
		// write data to pipe
		write_uint64(pipe_to_send0, data_64);
		write_uint16(pipe_to_send1, data_16);		
	}
}

// This function receives packet from NIC and checks it it's correct
//	actual NIC sends	73 bits 	at a time.
//			----------------------
//			1bit	64bits	8bits
//			tlast	tdata	tkeep	
//	form C direct transfer of 73 bits to a pipe is not possible.
//	since this function uses two pipes to receive that data.
//	pipes :
//		1.nic_to_mac_data_1[ 8:0] = data[72:64]	-- 16 bit wide
//						(top 7 bits are unused)
//
//		2.nic_to_mac_data_0[63:0] = data[63:0]	-- 64 bit wide

void NIC_to_MAC_data(void)
{
	char pipe_to_recv0[20], pipe_to_recv1[20];
	sprintf(pipe_to_recv0,"nic_to_mac_data_0");
	sprintf(pipe_to_recv1,"nic_to_mac_data_1");
	while(1){
		uint64_t data_64;
		uint16_t data_16,length_in_bytes;
		
		data_64 = read_uint64(pipe_to_recv0);
		data_16 = read_uint64(pipe_to_recv1);
		
		uint64_t received_src_mac_addr, received_dest_mac_adddr;
	
		// reconstruct received mac addresses.
		received_dest_mac_addr = (data_64 >> 8) & 0x0000ffffffffffff;
		received_src_mac_addr = ((data_64 >> 56) & 0x00000000000000ff) | ((data_16 << 8) & 0x000000000000ff00);
		
		// read pipes		
		data_64 = read_uint64(pipe_to_recv0);
		data_16 = read_uint64(pipe_to_recv1);
		// update remaing bits of src mac addr.
		received_src_mac_addr = (data_64 >> 8) & 0x00000000ffffffff;
		if((received_src_mac_addres != source_mac_address) || (received_dest_mac_addr != destination_mac_address)){
			__err_flag_ = 1; break;}

		length_in_bytes = (data_64 >> 40) & 0x00000000000000ff;
	
		int i;
		for(i = 0; i < (length_in_bytes - 8); i += 8)
		{
			data_64 = read_uint64(pipe_to_recv0);
			data_16 = read_uint64(pipe_to_recv1);
			if(((data_64 >> 8) & 0xff) != i){
				fprintf(stderr,"\nData Missmatch Expected = %d, Received = %d\n", i,data_64);
				__err_flag_ = 1;
				break;
			}
		}
		// read last word
		data_64 = read_uint64(pipe_to_recv0);
		data_16 = read_uint64(pipe_to_recv1);
		if(((data_64 >> 8) & 0xff) != i)
		{	
			fprintf(stderr,"\nData Missmatch Expected = %d, Received = %d\n", i,data_64);
			__err_flag_ = 1;
			break;
		}
	}
}

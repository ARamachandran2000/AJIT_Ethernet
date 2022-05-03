#include <stdlib.h>
#include <stdint.h>
#include "ajit_access_routines.h"
#include "core_portme.h"

#define NIC_REG_ADDR 	0x400000
#define NUM_OF_SERVERS	1


uint64_t* NIC_REG = NIC_REG_ADDR

int main () 
{
	// enable the serial device.
	//   from ajit_access_routines...
	__ajit_write_serial_control_register__ ( TX_ENABLE );

	uint32_t * FREE_Q,TX_Q,RX_Q;
		
	ee_printf("Configuring  NIC_REG[]\n");

	*(NIC_REG) = (NUMBER_OF_SERVERS << 32);
	*(NIC_REG + 1) = RX_Q;
	*(NIC_REG + 5) = TX_Q;
	uint64_t free_q_addr = ((*(NIC_REG)) >> 32) & 0x00000000ffffffff;
	uint64_t rx_q_addr = (*(NIC_REG + 1)) & 0x00000000ffffffff;
	uint64_t tx_q_addr = (*(NIC_REG + 5)) & 0x00000000ffffffff;

	ee_printf("free_q_addr = 0x%x,\t rx_q_addr = 0x%x,\t tx_q_addr= 0x%x\n",free_q_addr,rx_q_addr,tx_q_addr);

	return(0);
}

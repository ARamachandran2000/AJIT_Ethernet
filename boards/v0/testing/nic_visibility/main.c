#include <stdlib.h>
#include <stdint.h>
#include "ajit_access_routines.h"
#include "core_portme.h"

#define NIC_REG_ADDR 0x400000

uint64_t* NIC_REG = NIC_REG_ADDR

int main () 
{
	// enable the serial device.
	//   from ajit_access_routines...
	__ajit_write_serial_control_register__ ( TX_ENABLE );

	//
	// in core_portme...
	//
	ee_printf("Writing 10 to NIC_REG[0]\n");

	*(NIC_REG) = 10;

	uint64_t rdata = *(NIC_REG)

	ee_printf("rdata from  NIC_REG[0] = 0x%x\n",rdata);

	return(0);
}



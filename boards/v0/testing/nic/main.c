#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"

#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR 0x1FFFFFFF
//#define NIC_START_ADDR 0x0ffff5000

uint32_t* NIC_REG = NIC_START_ADDR;

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	cortos_printf ("Writing DATA\n");
	*NIC_REG =1110;
	uint32_t data = NIC_REG[0];
	cortos_printf ("DATA = %u\n",data);

	uint8_t a[8];
	cortos_printf ("array0=0x%x,array1=0x%x,array2=0x%x,array3=0x%x,array4=0x%x,array5=0x%x,"
				"array6=0x%x,array7=0x%x",a,&a[1],&a[2],&a[3],&a[4],&a[5],&a[6],&a[7]);

	
	uint32_t b[8];
	cortos_printf ("array0=0x%x,array1=0x%x,array2=0x%x,array3=0x%x,array4=0x%x,array5=0x%x,"
				"array6=0x%x,array7=0x%x",b,&b[1],&b[2],&b[3],&b[4],&b[5],&b[6],&b[7]);
	return(0);
}

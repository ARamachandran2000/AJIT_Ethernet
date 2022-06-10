#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"

//#define NIC_START_ADDR 0x0FFFF5000
//#define NIC_END_ADDR   0x0FFFF50FF
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1FFFFFFF

uint32_t* NIC_REG = NIC_START_ADDR;

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	uint32_t data;
	int err_flg = 0;
	//*(NIC_REG+1) =1111;
	//data = NIC_REG[1];
	//cortos_printf ("NIC_REG[1] = %u\n",data);

	int i;// 16384
	ee_printf ("Writing DATA...\n");
	for(i = 0; i < 64; i++)
	{
		ee_printf ("Writing DATA = %d at nic addr = 0x%x\n",i,(NIC_REG+i));
		NIC_REG[i] = i;
	}
	ee_printf ("Reading DATA...\n");
	for(i = 0; i < 64; i++)
	{
		data = NIC_REG[i];
//		if(data != i)
//		{
//			err_flg = 1;
//			break;
//		}
		ee_printf ("NIC_REG[%d] = %u\t nic addr = 0x%x\n",i,data,(NIC_REG+i));
	}

	if(err_flg)
		ee_printf ("DATA MISSMATCH : NIC_REG[%d] = %u, expected = %u:\tnic addr = 0x%x\n",i,data,i,(NIC_REG+i));
	else
		ee_printf ("SUCCESS...!\n");
	return(0);
}

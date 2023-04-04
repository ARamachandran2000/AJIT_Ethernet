#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"

#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR 0x1FFFFFFF
//#define NIC_START_ADDR 0x0ffff5000

uint32_t* NIC_REG = NIC_START_ADDR;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);


int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	cortos_printf ("Writing DATA\n");
	//*NIC_REG =1110;
	writeNicReg(0,1110);
	//uint32_t data = NIC_REG[0];
	uint32_t data = readNicReg(0);
	cortos_printf ("DATA = %u\n",data);

	uint32_t* addr = (uint32_t*)cortos_bget_ncram(1);

	cortos_printf("addr = 0x%x\n",addr);

	*addr = 0xabcdabcd;

	cortos_printf("value = 0x%lx\n",*addr);
	
	return(0);
}

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	//data = __ajit_load_word_mmu_bypass__(&NIC_REG[index]);
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}


void writeNicReg(uint32_t index, uint32_t value)
{
	//__ajit_store_word_mmu_bypass__(value,&NIC_REG[index]);
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}


//inline void __ajit_store_word_mmu_bypass__(uint32_t value, uint32_t addr);
//inline uint32_t __ajit_load_word_mmu_bypass__(uint32_t addr);

//inline void	 __ajit_store_word_to_physical_address__(uint32_t value, uint64_t physical_address);
//inline uint32_t  __ajit_load_word_from_physical_address__(uint64_t physical_address);

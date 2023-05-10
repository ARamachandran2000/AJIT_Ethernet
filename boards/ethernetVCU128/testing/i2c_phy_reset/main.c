#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"

#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1FFFFFFF

#define I2C_CONFIG_REG 0x011000000 // 
#define I2C_COMMAND_REG 0x011000004
#define I2C_STATUS_REG 0x011000008

#define RWBAR_SHIFT 31
#define WRITE_MASK_SHIFT 29
#define DEV_ADDR_SHIFT 16
#define DEV_REG_ADDR_SHIFT 8



#define DEV_ADDR 0x20
#define READ 1
#define WRITE 0

#define SET_REG_ADDR_AND_READ 2
#define SET_REG_ADDR_AND_WRITE 3

uint32_t* NIC_REG = NIC_START_ADDR;
uint32_t* I2C_REG = I2C_CONFIG_REG;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
uint32_t readI2CReg(uint32_t);
void writeI2CReg(uint32_t, uint32_t);
uint32_t ajit_configure_i2c_masterN (uint32_t, uint32_t );
uint32_t ajit_i2c_master_is_readyN();
void     ajit_i2c_master_write_commandN (uint32_t);
uint32_t  ajit_i2c_master_read_statusN  ();

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	uint32_t data;
	int err_flg = 0;
	uint32_t status = 0, cmnd = 0;
	uint8_t wdata = 0, rdata = 0;
	ajit_configure_i2c_masterN(100000000, 400000);

	cortos_printf("reg[0] = 0x%x, expected = 0x%x\n", readI2CReg(0), (100000000/400000)>>2);
	int I;

	// write loop
	cortos_printf("Writing I2C slave regs\n");
	for( I = 0x00 ; I < 0x08; I++)
	{	
		cmnd = (WRITE << RWBAR_SHIFT) | (SET_REG_ADDR_AND_WRITE << WRITE_MASK_SHIFT) | (DEV_ADDR << DEV_ADDR_SHIFT) | (I << DEV_REG_ADDR_SHIFT) | (I+1);
		writeI2CReg(1,cmnd);

		while(ajit_i2c_master_is_readyN() != 0x01);
		
		status = readI2CReg(2);
		rdata = status & 0xff;
		cortos_printf("REG[%d] : reg data = 0x%x & status = 0x%lx\n",I, rdata, status);
	}


	// read loop
	cortos_printf("Reading from I2C slave regs\n");
	for( I = 0 ; I < 0x08; I++)
	{	
		cmnd = (READ << RWBAR_SHIFT) | (SET_REG_ADDR_AND_WRITE << WRITE_MASK_SHIFT) | (DEV_ADDR << DEV_ADDR_SHIFT) | (I << DEV_REG_ADDR_SHIFT) | (wdata);
		writeI2CReg(1,cmnd);

		while(ajit_i2c_master_is_readyN() != 0x01);
		
		status = readI2CReg(2);
		rdata = status & 0xff;
		cortos_printf("REG[%d] : reg data = 0x%x & status = 0x%lx cmnd = 0x%x cmnd_reg = 0x%x\n",I, rdata, status,cmnd,readI2CReg(1));
	}

	return(0);
}

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}
void writeNicReg(uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}

uint32_t readI2CReg(uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&I2C_REG[index]);
	return data;
}
void writeI2CReg(uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&I2C_REG[index]);
}


uint32_t ajit_configure_i2c_masterN (uint32_t clock_frequency, uint32_t i2c_clock_frequency)
{
        uint32_t div_value = ((clock_frequency / i2c_clock_frequency) >> 2);
        //*((uint32_t*) I2C_CONFIG_REG) = div_value;
	writeI2CReg(0,div_value);
        return(0);
}

uint32_t ajit_i2c_master_is_readyN()
{
        //uint32_t status = *((uint32_t*) I2C_STATUS_REG); //ADDR_I2C_MASTER_STATUS_REGISTER);
        uint32_t status = readI2CReg(2);
        uint32_t ret_val = ((status & 0x400) != 0);
        return(ret_val);
}

void     ajit_i2c_master_write_commandN (uint32_t command)
{
        //*((uint32_t*) I2C_COMMAND_REG) = command;
	writeI2CReg(1,command);
}

uint32_t  ajit_i2c_master_read_statusN  ()
{
        //uint32_t status = *((uint32_t*) I2C_STATUS_REG);
        uint32_t status = readI2CReg(2);
        return(status);
}

/*
int march_test_i2c_slave_ram ()
{
        int I;
        int ret_val = 0;

        ajit_configure_i2c_master (80000000, 400000);
        for(I  = 0; I < 256; I++)
        {
                ajit_i2c_master_access_slave_memory_device (0x38, 0,    (uint8_t) I, (uint8_t) I);
        }
        for(I  = 0; I < 256; I++)
        {
                uint8_t R = ajit_i2c_master_access_slave_memory_device (0x38, 1, (uint8_t) I, 0);
                if(R != I)
                {
                        ret_val = 1;
                        ee_printf("Error: i2c march expected %d, received %d.\n", I, R);
                        break;
                }
        }
        return(ret_val);
}*/


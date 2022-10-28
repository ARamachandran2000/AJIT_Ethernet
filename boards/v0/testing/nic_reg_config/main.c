#include <stdlib.h>
#include <stdint.h>
#include "ajit_access_routines.h"
#include "core_portme.h"
#include <cortos.h>


int main () 
{
	// enable the serial device.
	//   from ajit_access_routines...
	__ajit_write_serial_control_register__ ( TX_ENABLE );

	uint8_t* Buffers[3];
	int i;
	for(i = 0; i < 0; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(80);
	}

	CortosQueueHeader* queue = cortos_reserveQueue(4,8,1);
	CortosQueueHeader* queue1 = cortos_reserveQueue(4,8,1);
	uint32_t msgs[3] = {1,2,3};
	uint32_t data[3];
	uint32_t msgs_written;
	
	msgs_written = cortos_writeMessages(queue,(uint8_t*)msgs,3);
	ee_printf("return = %u\n",msgs_written);
	cortos_readMessages(queue,(uint8_t*)data,1);
	for(i = 0; i < 1; i++)
	{
		ee_printf("data[%d] = %u\n",i,data[i]);
	}
	
	ee_printf("queue : queue->totalMsgs=%u,readIndex=%u,writeIndex=%u,length=%u,msgSizeInBytes=%u\n",
			queue->totalMsgs,queue->readIndex,queue->writeIndex,queue->length,queue->msgSizeInBytes);	
	ee_printf("addresses queue=0x%x queue1=0x%x: queue->totalMsgs=0x%x,readIndex=0x%x,writeIndex=0x%x,length=0x%x,msgSizeInBytes=0x%x\n",
			queue,queue1,&queue->totalMsgs,&queue->readIndex,&queue->writeIndex,&queue->length,&queue->msgSizeInBytes);	
	return(0);
}

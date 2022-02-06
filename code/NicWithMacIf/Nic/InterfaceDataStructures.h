#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____

struct  __BufferQueue {
	uint32_t acquire_mutex;
	uint32_t number_of_entries;

	uint32_t write_pointer;
	uint32_t read_pointer;

	// software will allocate... and maybe reallocate.
	uint32_t* buffers;
};

void initBufferQueue(BufferQueue* Q, uint32_t number_of_entries)
{
	Q->acquire_mutex = 0;
	Q->write_pointer = 0;
	Q->read_pointer = 0;
	Q->number_of_entries = number_of_entries;
}

// return 0 on success.
int pushIntoBufferQueue(BufferQueue* Q, uint32_t buf_ptr)
{
	int ret_val = 1;
	__LOCK__(Q->acquire_mutex);
	uint32_t nwp = (Q->write_pointer + 1) & (Q->number_of_entries - 1);
	if(nwp != Q->read_pointer)
	{
		ret_val = 0;
		buffers[Q->write_pointer] = buf_ptr;
		Q->write_pointer = nwp;
	}
	__UNLOCK__(Q->acquire_mutex);

	return(ret_val);
}

// return 0 on success.
int popFromBufferQueue (BufferQueue* Q, uint32_t* buf)
{
	int ret_val = 1;
	__LOCK__(Q->acquire_mutex);
	if(Q->write_pointer != Q->read_pointer)
	{
		ret_val = 0;
		*buf = Q->buffers[Q->read_pointer];
		Q->read_pointer = (Q->read_pointer + 1) & (Q->number_of_entries - 1);
	}
	__UNLOCK__(Q->acquire_mutex);
	return(ret_val);
}






#endif

#ifndef InterfaceDataStructures_h____
#define InterfaceDataStructures_h____

typedef struct __Queue {
	uint32_t  acquire_mutex;
	uint32_t  number_of_entries;
	uint32_t  write_pointer;
	uint32_t  read_pointer;
	uint64_t  buffer_pointer;
} Queue;

void mutex_lock(uint32_t  * mutex_var)
{

	// Spin Until LOCKED
	while(*mutex_var == 1)
	{
		
	};

	*mutex_var = 1;
	return;
}


void mutex_unlock(uint32_t  * mutex_var)
{
	*mutex_var = 0;
	return;
}


void initQueue(Queue * Q, uint32_t number_of_entries)
{
	Q->acquire_mutex = 0;
	Q->write_pointer = 0;
	Q->read_pointer = 0;
	Q->number_of_entries = number_of_entries;
}


int push(Queue* Q , uint32_t * data)
{
	mutex_lock(&Q->acquire_mutex);
	int ret_val = 0;
	uint32_t next_pointer = (Q->write_pointer + 1) & (Q->number_of_entries - 1);
	if(next_pointer != Q->read_pointer)
	{
		ret_val = 1;
		buffers[Q->write_pointer] = data;
		Q->write_pointer = next_pointer;
	}
	mutex_unlock(&Q->acquire_mutex);

	return(ret_val);
};

// return 1 on success.
int pop(Queue* Q , uint32_t* buf_data)
{
	int ret_val = 0;

	mutex_lock(&Q->acquire_mutex);

	if(Q->write_pointer != Q->read_pointer)
	{
		ret_val = 1;
		buf_data = Q->buffers[Q->read_pointer];
		Q->read_pointer = (Q->read_pointer + 1) & (Q->number_of_entries - 1);
	}

	mutex_unlock(&Q->acquire_mutex);
	return(ret_val);

}

int checkEmpty(Queue* Q)
{
	
	return (Q->write_pointer == Q->read_pointer);

};

int checkFull(Queue* Q)
{

	return (((Q->write_pointer + 1) & (Q->number_of_entries - 1) ) == Q->read_pointer);

};












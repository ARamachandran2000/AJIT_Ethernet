#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
void _set_trace_file(FILE* fp);
void __init_aa_globals__(); 
void global_storage_initializer_();
void _global_storage_initializer__();
void _isWriteToHeader_(bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void _load_buffer1_(bit_vector* , bit_vector* );
void _load_buffer2_(bit_vector* , bit_vector* );
void _nextDESTMAC_(bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void _nextLSTATE_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* , bit_vector* , bit_vector* );
void _nextSRCMAC_(bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void nicRxFromMacDaemon();
void _nicRxFromMacDaemon_();
void read_from_tb();
void _read_from_tb_();
void rx_fifo_reader();
void _rx_fifo_reader_();
void send_header_to_tb();
void _send_header_to_tb_();
void send_packet_to_tb();
void _send_packet_to_tb_();
void _send_to_nic1_(bit_vector*);
void _send_to_nic2_(bit_vector*);
void start_daemons(FILE* fp, int trace_on);
void stop_daemons();

#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
void _set_trace_file(FILE* fp);
void __init_aa_globals__(); 
void _AccessRegister_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void NicRegisterAccessDaemon();
void _NicRegisterAccessDaemon_();
void ReceiveEngineDaemon();
void _ReceiveEngineDaemon_();
void SoftwareRegisterAccessDaemon();
void _SoftwareRegisterAccessDaemon_();
void _UpdateRegister_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void _accessMemory_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void _acquireMutex_(bit_vector*, bit_vector* );
void _delay_time_(bit_vector*, bit_vector* );
void _getQueueElement_(bit_vector*, bit_vector*, bit_vector* );
void _getQueuePointers_(bit_vector*, bit_vector* , bit_vector* );
void _getTxPacketPointerFromServer_(bit_vector*, bit_vector* , bit_vector* );
void global_storage_initializer_();
void _global_storage_initializer__();
void _loadBuffer_(bit_vector*, bit_vector* );
void macToNicInterface();
void _macToNicInterface_();
void memoryToNicInterface();
void _memoryToNicInterface_();
void _nextLSTATE_(bit_vector*, bit_vector*, bit_vector* );
void nicRxFromMacDaemon();
void _nicRxFromMacDaemon_();
void nicToMacInterface();
void _nicToMacInterface_();
void nicToMemoryInterface();
void _nicToMemoryInterface_();
void nicToProcessorInterface();
void _nicToProcessorInterface_();
void _popFromQueue_(bit_vector*, bit_vector*, bit_vector* , bit_vector* );
void _populateRxQueue_(bit_vector*);
void processorToNicInterface();
void _processorToNicInterface_();
void _pushIntoQueue_(bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void _releaseMutex_(bit_vector*);
void _setQueueElement_(bit_vector*, bit_vector*, bit_vector*);
void _setQueuePointers_(bit_vector*, bit_vector*, bit_vector*);
void transmitEngineDaemon();
void _transmitEngineDaemon_();
void _transmitPacket_(bit_vector*, bit_vector* );
void _writeControlInformationToMem_(bit_vector*, bit_vector*, bit_vector*);
void _writeEthernetHeaderToMem_(bit_vector*, bit_vector* );
void _writePayloadToMem_(bit_vector*, bit_vector*, bit_vector* , bit_vector* , bit_vector* );
void start_daemons(FILE* fp, int trace_on);
void stop_daemons();

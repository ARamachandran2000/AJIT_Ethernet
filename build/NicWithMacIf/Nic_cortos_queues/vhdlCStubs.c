#include <vhdlCStubs.h>
void NicRegisterAccessDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call NicRegisterAccessDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void ReceiveEngineDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call ReceiveEngineDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void SoftwareRegisterAccessDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call SoftwareRegisterAccessDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void global_storage_initializer_()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call global_storage_initializer_ ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void macToNicInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call macToNicInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void memoryToNicInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call memoryToNicInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void memoryToProcessorInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call memoryToProcessorInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void nicRxFromMacDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call nicRxFromMacDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void nicToMacInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call nicToMacInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void nicToMemoryInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call nicToMemoryInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void nicToProcessorInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call nicToProcessorInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void processorToMemoryInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call processorToMemoryInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void processorToNicInterface()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call processorToNicInterface ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void transmitEngineDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call transmitEngineDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}

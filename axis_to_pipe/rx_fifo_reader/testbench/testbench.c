#include<stdio.h>

#include<stdlib.h>

#include<stdint.h>

#include<pthread.h>

#include <pthreadUtils.h>

#include <Pipes.h>

#include <pipeHandler.h>


#ifndef COMPILE_TEST_ONLY
#ifndef AA2C
#include "vhdlCStubs.h"

#else
#include "aa_c_model.h"

#endif
#endif

#define SIZE_OF_PACKET_IN_BITS 64
#define MAX_PACKET_COUNT 64
#define MAX_PACKET_LENGTH_IN_BYTES 1500
#define MAX_HEADER_LENGTH_IN_WORDS 15

#define NORMAL_WORD 0x0aaaaaaaaf
#define LAST_WORD 0x1000000aa1
#define ERROR_WORD 0x1FFFFFFFF0

void mac_tx() {

  uint64_t data;

  int total_packets = 100;
  int num = 1;
  data = NORMAL_WORD;
  write_uint64("tb_in_pipe", data);
  num += 1;

  while (num <= total_packets) {
    //fprintf(stderr,"%d sent\n",num);
    if (num % 10 == 0)
      data = LAST_WORD;
    else
      data = NORMAL_WORD;

    write_uint64("tb_in_pipe", data);
    num += 1;
    fprintf(stderr, "\n%d", num);

  }

  fprintf(stderr, "\npacket_sent");
}
DEFINE_THREAD(mac_tx);

void readHeader() {
  uint64_t packet;
  int cnt = 0;
  fprintf(stderr, "\nReading Header");
  int total_packets = 110;
  while (cnt < total_packets) {
    packet = read_uint64("tb_out_pipe");
    cnt += 1;
    fprintf(stderr, "%d = 0x%lx\n", cnt, packet);
  }
  fprintf(stderr, "\npacket_sent");
}
DEFINE_THREAD(readHeader);

int main(int argc, char * argv[]) {
  if (argc < 2) {
    fprintf(stderr, "Usage: %s [trace-file] \n trace-file=null,"
      " for no trace, stdout for stdout\n", argv[0]);
    return (1);
  }

  FILE * fp = NULL;
  if (strcmp(argv[1], "stdout") == 0) {
    fp = stdout;
  } else if (strcmp(argv[1], "null") != 0) {
    fp = fopen(argv[1], "w");
    if (fp == NULL) {
      fprintf(stderr, "Error: could not open trace file %s\n", argv[1]);
      return (1);
    }
  }
  #ifndef COMPILE_TEST_ONLY
  #ifdef AA2C
  init_pipe_handler();
  start_daemons(fp, 0);
  #endif
  #endif

  PTHREAD_DECL(mac_tx);
  PTHREAD_CREATE(mac_tx);
  PTHREAD_DECL(readHeader);
  PTHREAD_CREATE(readHeader);
  PTHREAD_JOIN(mac_tx);
  PTHREAD_JOIN(readHeader);

}

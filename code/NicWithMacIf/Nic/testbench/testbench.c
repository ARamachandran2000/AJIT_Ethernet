// Testbench for testing design of NIC.
//--------------------------------------
//	This testbench aims for travel of a single packet(say ping)
//		through designed NIC.
//

// General Includes
#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<pthread.h>

#include<pthreadUtils.h>
#include<Pipes.h>
#include<pipeHandler.h>

#ifndef COMPILE_TEST_ONLY
#ifndef AA2C
	#include "vhdlCStubs.h"
#else
	#include "aa_c_model.h"
#endif
#endif

// Algorithm :
//	step1:	Initialise all queues and write data to peripheral bus(algortihm) 
//	step2:	MAC_to_NIC thread generates packet and starts sending it to tester.aa(pipes)
//	step2:	Memory thread reads req_pipes and generate appropriate resp.
//	step2:	Processor thread reads rx_queue's data and writes it to tx_queue
//	step3:	NIC_to_MAC thread reads pipe/s and checks if the received data is same as
//			sent data.
//
//  The MAC -> NIC connection should operate at full speed during the test.

// Local includes
#include "InterfaceDataStructures.h"
#include "MAC.h"
#include "Memory.h"
#include "Processor.h"


 

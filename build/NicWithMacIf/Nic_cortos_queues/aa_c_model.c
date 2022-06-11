#include <pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <aa_c_model_internal.h>
#include <aa_c_model.h>
FILE* __report_log_file__ = NULL;
int __trace_on__ = 0;
void _set_trace_file(FILE* fp) {
__report_log_file__ = fp;
}
bit_vector _BAD_PACKET_DATA;
#define BAD_PACKET_DATA (_BAD_PACKET_DATA)

bit_vector _FULL_BYTE_MASK;
#define FULL_BYTE_MASK (_FULL_BYTE_MASK)

bit_vector _HEADER_TKEEP;
#define HEADER_TKEEP (_HEADER_TKEEP)

bit_vector _QUEUE_SIZE_MASK;
#define QUEUE_SIZE_MASK (_QUEUE_SIZE_MASK)

bit_vector _RX_QUEUES_REG_START_OFFSET;
#define RX_QUEUES_REG_START_OFFSET (_RX_QUEUES_REG_START_OFFSET)

bit_vector _S0;
#define S0 (_S0)

bit_vector _S1;
#define S1 (_S1)

bit_vector _S2;
#define S2 (_S2)

bit_vector _TX_QUEUES_REG_START_OFFSET;
#define TX_QUEUES_REG_START_OFFSET (_TX_QUEUES_REG_START_OFFSET)

bit_vector _WAIT_TIME;
#define WAIT_TIME (_WAIT_TIME)

bit_vector _nic_registers[64];
#define nic_registers (_nic_registers)

void __init_aa_globals__() 
{
register_pipe("AFB_NIC_REQUEST", 20, 8, 0);\
register_pipe("AFB_NIC_RESPONSE", 10, 8, 0);\
init_static_bit_vector(&(BAD_PACKET_DATA), 64);\
bit_vector_clear(&BAD_PACKET_DATA);\
BAD_PACKET_DATA.val.byte_array[0] = 255;\
BAD_PACKET_DATA.val.byte_array[1] = 255;\
BAD_PACKET_DATA.val.byte_array[2] = 255;\
BAD_PACKET_DATA.val.byte_array[3] = 255;\
BAD_PACKET_DATA.val.byte_array[4] = 255;\
BAD_PACKET_DATA.val.byte_array[5] = 255;\
BAD_PACKET_DATA.val.byte_array[6] = 255;\
BAD_PACKET_DATA.val.byte_array[7] = 255;\
register_signal("CONTROL_REGISTER", 32);\
register_signal("FREE_Q", 36);\
init_static_bit_vector(&(FULL_BYTE_MASK), 8);\
bit_vector_clear(&FULL_BYTE_MASK);\
FULL_BYTE_MASK.val.byte_array[0] = 255;\
init_static_bit_vector(&(HEADER_TKEEP), 8);\
bit_vector_clear(&HEADER_TKEEP);\
HEADER_TKEEP.val.byte_array[0] = 63;\
register_signal("LAST_READ_TX_QUEUE_INDEX", 6);\
register_signal("LAST_WRITTEN_RX_QUEUE_INDEX", 6);\
register_pipe("MEMORY_TO_NIC_RESPONSE", 18, 8, 0);\
register_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE", 12, 8, 0);\
register_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE", 10, 8, 0);\
register_pipe("NIC_TO_MEMORY_REQUEST", 28, 8, 0);\
register_signal("NUMBER_OF_SERVERS", 32);\
init_static_bit_vector(&(QUEUE_SIZE_MASK), 32);\
bit_vector_clear(&QUEUE_SIZE_MASK);\
QUEUE_SIZE_MASK.val.byte_array[0] = 8;\
init_static_bit_vector(&(RX_QUEUES_REG_START_OFFSET), 6);\
bit_vector_clear(&RX_QUEUES_REG_START_OFFSET);\
RX_QUEUES_REG_START_OFFSET.val.byte_array[0] = 2;\
init_static_bit_vector(&(S0), 2);\
bit_vector_clear(&S0);\
init_static_bit_vector(&(S1), 2);\
bit_vector_clear(&S1);\
S1.val.byte_array[0] = 1;\
init_static_bit_vector(&(S2), 2);\
bit_vector_clear(&S2);\
S2.val.byte_array[0] = 2;\
init_static_bit_vector(&(TX_QUEUES_REG_START_OFFSET), 6);\
bit_vector_clear(&TX_QUEUES_REG_START_OFFSET);\
TX_QUEUES_REG_START_OFFSET.val.byte_array[0] = 10;\
init_static_bit_vector(&(WAIT_TIME), 10);\
bit_vector_clear(&WAIT_TIME);\
WAIT_TIME.val.byte_array[0] = 10;\
register_pipe("control_word_request_pipe_0", 2, 32, 0);\
register_pipe("control_word_request_pipe_1", 2, 64, 0);\
register_pipe("control_word_response_pipe", 2, 64, 0);\
register_pipe("mac_to_nic_data", 20, 8, 0);\
register_pipe("mac_to_nic_data_0", 2, 64, 0);\
register_pipe("mac_to_nic_data_1", 2, 16, 0);\
register_pipe("mem_req0_pipe0", 2, 64, 0);\
register_pipe("mem_req0_pipe0_tester", 2, 64, 0);\
register_pipe("mem_req0_pipe1", 2, 64, 0);\
register_pipe("mem_req0_pipe1_tester", 2, 64, 0);\
register_pipe("mem_req1_pipe0", 2, 64, 0);\
register_pipe("mem_req1_pipe1", 2, 64, 0);\
register_pipe("mem_resp0_pipe0", 2, 64, 0);\
register_pipe("mem_resp0_pipe0_tester", 2, 64, 0);\
register_pipe("mem_resp0_pipe1", 2, 8, 0);\
register_pipe("mem_resp0_pipe1_tester", 2, 8, 0);\
register_pipe("mem_resp1_pipe0", 2, 64, 0);\
register_pipe("mem_resp1_pipe1", 2, 8, 0);\
init_static_bit_vector(&(nic_registers[0]), 32);\
init_static_bit_vector(&(nic_registers[1]), 32);\
init_static_bit_vector(&(nic_registers[2]), 32);\
init_static_bit_vector(&(nic_registers[3]), 32);\
init_static_bit_vector(&(nic_registers[4]), 32);\
init_static_bit_vector(&(nic_registers[5]), 32);\
init_static_bit_vector(&(nic_registers[6]), 32);\
init_static_bit_vector(&(nic_registers[7]), 32);\
init_static_bit_vector(&(nic_registers[8]), 32);\
init_static_bit_vector(&(nic_registers[9]), 32);\
init_static_bit_vector(&(nic_registers[10]), 32);\
init_static_bit_vector(&(nic_registers[11]), 32);\
init_static_bit_vector(&(nic_registers[12]), 32);\
init_static_bit_vector(&(nic_registers[13]), 32);\
init_static_bit_vector(&(nic_registers[14]), 32);\
init_static_bit_vector(&(nic_registers[15]), 32);\
init_static_bit_vector(&(nic_registers[16]), 32);\
init_static_bit_vector(&(nic_registers[17]), 32);\
init_static_bit_vector(&(nic_registers[18]), 32);\
init_static_bit_vector(&(nic_registers[19]), 32);\
init_static_bit_vector(&(nic_registers[20]), 32);\
init_static_bit_vector(&(nic_registers[21]), 32);\
init_static_bit_vector(&(nic_registers[22]), 32);\
init_static_bit_vector(&(nic_registers[23]), 32);\
init_static_bit_vector(&(nic_registers[24]), 32);\
init_static_bit_vector(&(nic_registers[25]), 32);\
init_static_bit_vector(&(nic_registers[26]), 32);\
init_static_bit_vector(&(nic_registers[27]), 32);\
init_static_bit_vector(&(nic_registers[28]), 32);\
init_static_bit_vector(&(nic_registers[29]), 32);\
init_static_bit_vector(&(nic_registers[30]), 32);\
init_static_bit_vector(&(nic_registers[31]), 32);\
init_static_bit_vector(&(nic_registers[32]), 32);\
init_static_bit_vector(&(nic_registers[33]), 32);\
init_static_bit_vector(&(nic_registers[34]), 32);\
init_static_bit_vector(&(nic_registers[35]), 32);\
init_static_bit_vector(&(nic_registers[36]), 32);\
init_static_bit_vector(&(nic_registers[37]), 32);\
init_static_bit_vector(&(nic_registers[38]), 32);\
init_static_bit_vector(&(nic_registers[39]), 32);\
init_static_bit_vector(&(nic_registers[40]), 32);\
init_static_bit_vector(&(nic_registers[41]), 32);\
init_static_bit_vector(&(nic_registers[42]), 32);\
init_static_bit_vector(&(nic_registers[43]), 32);\
init_static_bit_vector(&(nic_registers[44]), 32);\
init_static_bit_vector(&(nic_registers[45]), 32);\
init_static_bit_vector(&(nic_registers[46]), 32);\
init_static_bit_vector(&(nic_registers[47]), 32);\
init_static_bit_vector(&(nic_registers[48]), 32);\
init_static_bit_vector(&(nic_registers[49]), 32);\
init_static_bit_vector(&(nic_registers[50]), 32);\
init_static_bit_vector(&(nic_registers[51]), 32);\
init_static_bit_vector(&(nic_registers[52]), 32);\
init_static_bit_vector(&(nic_registers[53]), 32);\
init_static_bit_vector(&(nic_registers[54]), 32);\
init_static_bit_vector(&(nic_registers[55]), 32);\
init_static_bit_vector(&(nic_registers[56]), 32);\
init_static_bit_vector(&(nic_registers[57]), 32);\
init_static_bit_vector(&(nic_registers[58]), 32);\
init_static_bit_vector(&(nic_registers[59]), 32);\
init_static_bit_vector(&(nic_registers[60]), 32);\
init_static_bit_vector(&(nic_registers[61]), 32);\
init_static_bit_vector(&(nic_registers[62]), 32);\
init_static_bit_vector(&(nic_registers[63]), 32);\
register_pipe("nic_rx_to_header", 20, 8, 0);\
register_pipe("nic_rx_to_packet", 20, 8, 0);\
register_pipe("nic_to_mac_data_0", 2, 64, 0);\
register_pipe("nic_to_mac_data_1", 2, 16, 0);\
register_pipe("nic_to_mac_transmit_pipe", 20, 8, 0);\
}
void _AccessRegister_(bit_vector* __prwbar, bit_vector* __pbmask, bit_vector* __pregister_index, bit_vector* __pwdata, bit_vector*  __prdata)
{
MUTEX_DECL(_AccessRegister_series_block_stmt_80_c_mutex_);
MUTEX_LOCK(_AccessRegister_series_block_stmt_80_c_mutex_);
_AccessRegister_inner_inarg_prep_macro__; 
// $report (AccessRegister In_Access_Register )
_AccessRegister_stmt_88_c_macro_; 
// 	$volatile request := ((rwbar && bmask) && (register_index && wdata)) $buffering 1
_AccessRegister_assign_stmt_97_c_macro_; 
// $report (AccessRegister Request 	 rwbar rwbar 	 bmask bmask 	 register_index register_index 	 wdata wdata )
_AccessRegister_stmt_102_c_macro_; 
// 	NIC_REQUEST_REGISTER_ACCESS_PIPE := request $buffering 1// bits of buffering = 43. 
_AccessRegister_assign_stmt_105_c_macro_; 
// $report (AccessRegister Request_Sent )
_AccessRegister_stmt_106_c_macro_; 
// 	response := NIC_RESPONSE_REGISTER_ACCESS_PIPE $buffering 1// bits of buffering = 33. 
_AccessRegister_assign_stmt_109_c_macro_; 
// $report (AccessRegister Response 	 response response )
_AccessRegister_stmt_111_c_macro_; 
// 	$volatile status := ( $slice response 32 32 )  $buffering 1
_AccessRegister_assign_stmt_115_c_macro_; 
// 	$volatile rdata := ( $slice response 31 0 )  $buffering 1
_AccessRegister_assign_stmt_119_c_macro_; 
_AccessRegister_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_AccessRegister_series_block_stmt_80_c_mutex_);
}
void _NicRegisterAccessDaemon_()
{
MUTEX_DECL(_NicRegisterAccessDaemon_series_block_stmt_201_c_mutex_);
MUTEX_LOCK(_NicRegisterAccessDaemon_series_block_stmt_201_c_mutex_);
_NicRegisterAccessDaemon_inner_inarg_prep_macro__; 
_NicRegisterAccessDaemon_branch_block_stmt_202_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 123
__declare_static_bit_vector(konst_256,1);\
bit_vector_clear(&konst_256);\
konst_256.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 125
_NicRegisterAccessDaemon_merge_stmt_204_c_preamble_macro_; 
_NicRegisterAccessDaemon_merge_stmt_204_c_postamble_macro_; 
// 			req := NIC_REQUEST_REGISTER_ACCESS_PIPE $buffering 1// bits of buffering = 43. 
_NicRegisterAccessDaemon_assign_stmt_207_c_macro_; 
// $report (NicRegisterAccessDaemon Request_Received )
_NicRegisterAccessDaemon_stmt_208_c_macro_; 
// 			$volatile rwbar := ( $slice req 42 42 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_212_c_macro_; 
// 			$volatile bmask := ( $slice req 41 38 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_216_c_macro_; 
// 			$volatile index := ( $slice req 37 32 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_220_c_macro_; 
// 			$volatile wdata := ( $slice req 31 0 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_224_c_macro_; 
// 			rval := nic_registers[index] $buffering 1// bits of buffering = 32. 
_NicRegisterAccessDaemon_assign_stmt_228_c_macro_; 
// $report (NicRegisterAccessDaemon Request 			 rval rval 			 index index )
_NicRegisterAccessDaemon_stmt_231_c_macro_; 
// 			$guard (~rwbar) $call UpdateRegister (bmask rval wdata index ) (wval ) 
_NicRegisterAccessDaemon_call_stmt_238_c_macro_; 
// 			$volatile rdata := ( $mux rwbar rval  ($bitcast ($uint<32>) _b0  ) )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_245_c_macro_; 
// 			$volatile resp := (($bitcast ($uint<1>) _b0  ) && rdata) $buffering 1
_NicRegisterAccessDaemon_assign_stmt_251_c_macro_; 
// 			NIC_RESPONSE_REGISTER_ACCESS_PIPE := resp $buffering 1// bits of buffering = 33. 
_NicRegisterAccessDaemon_assign_stmt_254_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_256);\
konst_256.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_256)) break;
} 
}
_NicRegisterAccessDaemon_branch_block_stmt_202_c_export_apply_macro_;
}
_NicRegisterAccessDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_NicRegisterAccessDaemon_series_block_stmt_201_c_mutex_);
}
void NicRegisterAccessDaemon()
{
_NicRegisterAccessDaemon_outer_arg_decl_macro__;
_NicRegisterAccessDaemon_();
_NicRegisterAccessDaemon_outer_op_xfer_macro__;
}


void _ReceiveEngineDaemon_()
{
MUTEX_DECL(_ReceiveEngineDaemon_series_block_stmt_1327_c_mutex_);
MUTEX_LOCK(_ReceiveEngineDaemon_series_block_stmt_1327_c_mutex_);
_ReceiveEngineDaemon_inner_inarg_prep_macro__; 
// 	LAST_WRITTEN_RX_QUEUE_INDEX := 0  $buffering 1// bits of buffering = 6. 
_ReceiveEngineDaemon_assign_stmt_1330_c_macro_; 
_ReceiveEngineDaemon_branch_block_stmt_1331_c_export_decl_macro_; 
{
// $report (ReceiveEngineDaemon waiting_for_control )
_ReceiveEngineDaemon_stmt_1332_c_macro_; 
// merge  file nic.linked.aa, line 436
_ReceiveEngineDaemon_merge_stmt_1333_c_preamble_macro_; 
_ReceiveEngineDaemon_merge_stmt_1333_c_postamble_macro_; 
// if statement :  file nic.linked.aa, line 0
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1335,32);\
__declare_static_bit_vector(konst_1336,32);\
bit_vector_clear(&konst_1336);\
__declare_static_bit_vector(BITSEL_u32_u1_1337,1);\
__declare_static_bit_vector(NOT_u1_u1_1338,1);\
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1335));\
bit_vector_clear(&konst_1336);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1335), &(konst_1336), &(BITSEL_u32_u1_1337));\
bit_vector_not( &(BITSEL_u32_u1_1337), &(NOT_u1_u1_1338));\
if (has_undefined_bit(&NOT_u1_u1_1338)) {fprintf(stderr, "Error: variable NOT_u1_u1_1338 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_1338));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_1338)) { 
/* 			$place[not_enabled_yet_loopback]
*/  goto not_enabled_yet_loopback_1331;
} 
else {
 ;
}
// $report (ReceiveEngineDaemon got_the__control )
_ReceiveEngineDaemon_stmt_1341_c_macro_; 
{
// do-while:   file nic.linked.aa, line 442
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1406,32);\
__declare_static_bit_vector(konst_1407,32);\
bit_vector_clear(&konst_1407);\
__declare_static_bit_vector(BITSEL_u32_u1_1408,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 444
_ReceiveEngineDaemon_merge_stmt_1343_c_preamble_macro_; 
_ReceiveEngineDaemon_merge_stmt_1343_c_postamble_macro_; 
// $report (ReceiveEngineDaemon called_pop_From_queue )
_ReceiveEngineDaemon_stmt_1344_c_macro_; 
// 			$call popFromQueue (($bitcast ($uint<1>) _b1  ) FREE_Q ) (rx_buffer_pointer_32 status ) 
_ReceiveEngineDaemon_call_stmt_1350_c_macro_; 
// $report (ReceiveEngineDaemon rx_buffer 			 rx_buffer_pointer_32 rx_buffer_pointer_32 )
_ReceiveEngineDaemon_stmt_1352_c_macro_; 
// 			$volatile rx_buffer_pointer_36 := (rx_buffer_pointer_32 && ($bitcast ($uint<4>) _b0  )) $buffering 1
_ReceiveEngineDaemon_assign_stmt_1358_c_macro_; 
// $report (ReceiveEngineDaemon rx_buffer_val 			 rx_buffer_pointer_36 rx_buffer_pointer_36 )
_ReceiveEngineDaemon_stmt_1360_c_macro_; 
// $report (ReceiveEngineDaemon calling_loadBuffer 			 status status 			 rx_buffer_pointer_36 rx_buffer_pointer_36 			 rx_buffer_pointer_32 rx_buffer_pointer_32 )
_ReceiveEngineDaemon_stmt_1364_c_macro_; 
// 			$guard (~status) $call loadBuffer (rx_buffer_pointer_36 ) (bad_packet_identifier ) 
_ReceiveEngineDaemon_call_stmt_1368_c_macro_; 
// 			$volatile ok_flag := (( ~ status ) & ( ~ bad_packet_identifier )) $buffering 1
_ReceiveEngineDaemon_assign_stmt_1375_c_macro_; 
// 			$volatile free_flag := (( ~ status ) & bad_packet_identifier) $buffering 1
_ReceiveEngineDaemon_assign_stmt_1381_c_macro_; 
// 			$volatile cond := (ok_flag == 1 ) $buffering 1
_ReceiveEngineDaemon_assign_stmt_1386_c_macro_; 
// $report (ReceiveEngineDaemon populating_rx_queue 			 ok_flag ok_flag 			 cond cond )
_ReceiveEngineDaemon_stmt_1389_c_macro_; 
// $report (ReceiveEngineDaemon running_ok_flag )
_ReceiveEngineDaemon_stmt_1390_c_macro_; 
// 			$guard (ok_flag) $call populateRxQueue (rx_buffer_pointer_36 ) () 
_ReceiveEngineDaemon_call_stmt_1393_c_macro_; 
// $report (ReceiveEngineDaemon pushing_into_free_q 			 free_flag free_flag )
_ReceiveEngineDaemon_stmt_1395_c_macro_; 
// 			$guard (free_flag) $call pushIntoQueue (($bitcast ($uint<1>) _b1  ) FREE_Q ( $slice rx_buffer_pointer_36 35 4 )  ) (push_status ) 
_ReceiveEngineDaemon_call_stmt_1403_c_macro_; 
// $report (ReceiveEngineDaemon completed_iteration_in_receive_engine )
_ReceiveEngineDaemon_stmt_1404_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1406));\
bit_vector_clear(&konst_1407);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1406), &(konst_1407), &(BITSEL_u32_u1_1408));\
if (has_undefined_bit(&BITSEL_u32_u1_1408)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1408 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1408));assert(0);} \

if (!bit_vector_to_uint64(0, &BITSEL_u32_u1_1408)) break;
} 
}
/* 		$place[disable_loopback]
*/  goto disable_loopback_1331;
_ReceiveEngineDaemon_branch_block_stmt_1331_c_export_apply_macro_;
}
_ReceiveEngineDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_ReceiveEngineDaemon_series_block_stmt_1327_c_mutex_);
}
void ReceiveEngineDaemon()
{
_ReceiveEngineDaemon_outer_arg_decl_macro__;
_ReceiveEngineDaemon_();
_ReceiveEngineDaemon_outer_op_xfer_macro__;
}


void _SoftwareRegisterAccessDaemon_()
{
MUTEX_DECL(_SoftwareRegisterAccessDaemon_series_block_stmt_1412_c_mutex_);
MUTEX_LOCK(_SoftwareRegisterAccessDaemon_series_block_stmt_1412_c_mutex_);
_SoftwareRegisterAccessDaemon_inner_inarg_prep_macro__; 
// $report (SoftwareRegisterAccessDaemon started_SoftwareRegisterAccessDaemon )
_SoftwareRegisterAccessDaemon_stmt_1413_c_macro_; 
_SoftwareRegisterAccessDaemon_branch_block_stmt_1414_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 474
__declare_static_bit_vector(konst_1577,1);\
bit_vector_clear(&konst_1577);\
konst_1577.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 476
_SoftwareRegisterAccessDaemon_merge_stmt_1416_c_preamble_macro_; 
// 			$phi INIT := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  ($bitcast ($uint<1>) _b1  ) $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1417_c_macro_; 
// 			$phi control_register := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  check_control_regsiter $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1423_c_macro_; 
// 			$phi free_q := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  check_free_q $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1428_c_macro_; 
// 			$phi num_server := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  check_num_server $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1433_c_macro_; 
_SoftwareRegisterAccessDaemon_merge_stmt_1416_c_postamble_macro_; 
// $report (SoftwareRegisterAccessDaemon looping_in_SoftwareRegisterAccessDaemon )
_SoftwareRegisterAccessDaemon_stmt_1439_c_macro_; 
// 			control_data := nic_registers[0 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1443_c_macro_; 
// $report (SoftwareRegisterAccessDaemon control 			 control_data control_data )
_SoftwareRegisterAccessDaemon_stmt_1445_c_macro_; 
// 			$volatile update_control_register_pipe := (( ~ INIT ) | (INIT & control_register)) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1453_c_macro_; 
// 			$volatile update_free_q_pipe := (( ~ INIT ) | (INIT & free_q)) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1461_c_macro_; 
// 			$volatile update_server_num := (( ~ INIT ) | (INIT & num_server)) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1469_c_macro_; 
// 			$guard (update_control_register_pipe) CONTROL_REGISTER := nic_registers[0 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1474_c_macro_; 
// 			$guard (update_free_q_pipe) FREE_Q_32 := nic_registers[18 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1479_c_macro_; 
// 			$guard (update_free_q_pipe) FREE_Q := ($bitcast ($uint<36>) (FREE_Q_32 && ($bitcast ($uint<3>) _b0  )) ) $buffering 1// bits of buffering = 36. 
_SoftwareRegisterAccessDaemon_assign_stmt_1487_c_macro_; 
// 			$guard (update_server_num) NUMBER_OF_SERVERS := nic_registers[1 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1492_c_macro_; 
// 			req := AFB_NIC_REQUEST $buffering 1// bits of buffering = 74. 
_SoftwareRegisterAccessDaemon_assign_stmt_1495_c_macro_; 
// $report (SoftwareRegisterAccessDaemon got_afb_req 			 req req )
_SoftwareRegisterAccessDaemon_stmt_1497_c_macro_; 
// 			$volatile lock := ( $slice req 73 73 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1501_c_macro_; 
// 			$volatile rwbar := ( $slice req 72 72 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1505_c_macro_; 
// 			$volatile bmask := ( $slice req 71 68 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1509_c_macro_; 
// 			$volatile addr := ( $slice req 67 32 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1513_c_macro_; 
// 			$volatile wdata := ( $slice req 31 0 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1517_c_macro_; 
// 			$volatile index := ( $slice addr 7 2 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1521_c_macro_; 
// 			$volatile check_control_regsiter := ((index == 0 ) & (rwbar == 0 )) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1530_c_macro_; 
// 			$volatile check_free_q := ((index == 18 ) & (rwbar == 0 )) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1539_c_macro_; 
// 			$volatile check_num_server := ((index == 1 ) & (rwbar == 0 )) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1548_c_macro_; 
// 			rval := nic_registers[index] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1552_c_macro_; 
// 			$guard (~rwbar) $call UpdateRegister (bmask rval wdata index ) (wval ) 
_SoftwareRegisterAccessDaemon_call_stmt_1559_c_macro_; 
// 			$volatile rdata := ( $mux rwbar rval  ($bitcast ($uint<32>) _b0  ) )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1566_c_macro_; 
// 			$volatile resp := (($bitcast ($uint<1>) _b0  ) && rdata) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1572_c_macro_; 
// 			AFB_NIC_RESPONSE := resp $buffering 1// bits of buffering = 33. 
_SoftwareRegisterAccessDaemon_assign_stmt_1575_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1577);\
konst_1577.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1577)) break;
} 
}
_SoftwareRegisterAccessDaemon_branch_block_stmt_1414_c_export_apply_macro_;
}
_SoftwareRegisterAccessDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_SoftwareRegisterAccessDaemon_series_block_stmt_1412_c_mutex_);
}
void SoftwareRegisterAccessDaemon()
{
_SoftwareRegisterAccessDaemon_outer_arg_decl_macro__;
_SoftwareRegisterAccessDaemon_();
_SoftwareRegisterAccessDaemon_outer_op_xfer_macro__;
}


void _UpdateRegister_(bit_vector* __pbmask, bit_vector* __prval, bit_vector* __pwdata, bit_vector* __pindex, bit_vector*  __pwval)
{
MUTEX_DECL(_UpdateRegister_series_block_stmt_121_c_mutex_);
MUTEX_LOCK(_UpdateRegister_series_block_stmt_121_c_mutex_);
_UpdateRegister_inner_inarg_prep_macro__; 
// 	$volatile b0 := ( $slice bmask 3 3 )  $buffering 1
_UpdateRegister_assign_stmt_130_c_macro_; 
// 	$volatile b1 := ( $slice bmask 2 2 )  $buffering 1
_UpdateRegister_assign_stmt_134_c_macro_; 
// 	$volatile b2 := ( $slice bmask 1 1 )  $buffering 1
_UpdateRegister_assign_stmt_138_c_macro_; 
// 	$volatile b3 := ( $slice bmask 0 0 )  $buffering 1
_UpdateRegister_assign_stmt_142_c_macro_; 
// 	$volatile r0 := ( $slice rval 31 24 )  $buffering 1
_UpdateRegister_assign_stmt_146_c_macro_; 
// 	$volatile r1 := ( $slice rval 23 16 )  $buffering 1
_UpdateRegister_assign_stmt_150_c_macro_; 
// 	$volatile r2 := ( $slice rval 15 8 )  $buffering 1
_UpdateRegister_assign_stmt_154_c_macro_; 
// 	$volatile r3 := ( $slice rval 7 0 )  $buffering 1
_UpdateRegister_assign_stmt_158_c_macro_; 
// 	$volatile w0 := ( $slice wdata 31 24 )  $buffering 1
_UpdateRegister_assign_stmt_162_c_macro_; 
// 	$volatile w1 := ( $slice wdata 23 16 )  $buffering 1
_UpdateRegister_assign_stmt_166_c_macro_; 
// 	$volatile w2 := ( $slice wdata 15 8 )  $buffering 1
_UpdateRegister_assign_stmt_170_c_macro_; 
// 	$volatile w3 := ( $slice wdata 7 0 )  $buffering 1
_UpdateRegister_assign_stmt_174_c_macro_; 
// 	wval := ((( $mux b0 w0  r0 )  && ( $mux b1 w1  r1 ) ) && (( $mux b2 w2  r2 )  && ( $mux b3 w3  r3 ) )) $buffering 1// bits of buffering = 32. 
_UpdateRegister_assign_stmt_195_c_macro_; 
// 	nic_registers[index] := wval $buffering 1// bits of buffering = 32. 
_UpdateRegister_assign_stmt_199_c_macro_; 
_UpdateRegister_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_UpdateRegister_series_block_stmt_121_c_mutex_);
}
void _accessMemory_(bit_vector* __plock, bit_vector* __prwbar, bit_vector* __pbmask, bit_vector* __paddr, bit_vector* __pwdata, bit_vector*  __prdata)
{
MUTEX_DECL(_accessMemory_series_block_stmt_259_c_mutex_);
MUTEX_LOCK(_accessMemory_series_block_stmt_259_c_mutex_);
_accessMemory_inner_inarg_prep_macro__; 
// 	$volatile request := (((lock && rwbar) && bmask) && (addr && wdata)) $buffering 1
_accessMemory_assign_stmt_276_c_macro_; 
// 	NIC_TO_MEMORY_REQUEST := request $buffering 1// bits of buffering = 110. 
_accessMemory_assign_stmt_279_c_macro_; 
// 	response := MEMORY_TO_NIC_RESPONSE $buffering 1// bits of buffering = 65. 
_accessMemory_assign_stmt_282_c_macro_; 
// 	$volatile err := ( $slice response 64 64 )  $buffering 1
_accessMemory_assign_stmt_286_c_macro_; 
// 	$volatile rdata := ( $slice response 63 0 )  $buffering 1
_accessMemory_assign_stmt_290_c_macro_; 
// $report (accessMemory byte_mask 	 bmask bmask 	 rwbar rwbar 	 addr addr 	 wdata wdata 	 err err )
_accessMemory_stmt_296_c_macro_; 
_accessMemory_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_accessMemory_series_block_stmt_259_c_mutex_);
}
void _acquireLock_(bit_vector* __pq_base_address, bit_vector*  __pm_ok)
{
MUTEX_DECL(_acquireLock_series_block_stmt_298_c_mutex_);
MUTEX_LOCK(_acquireLock_series_block_stmt_298_c_mutex_);
_acquireLock_inner_inarg_prep_macro__; 
_acquireLock_branch_block_stmt_301_c_export_decl_macro_; 
{
// 		$volatile lock_address_pointer := (q_base_address + ($bitcast ($uint<36>) 20  )) $buffering 1
_acquireLock_assign_stmt_307_c_macro_; 
// merge  file nic.linked.aa, line 162
_acquireLock_merge_stmt_308_c_preamble_macro_; 
_acquireLock_merge_stmt_308_c_postamble_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b1  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) lock_address_pointer ($bitcast ($uint<64>) _b0  ) ) (msg_size_plus_lock ) 
_acquireLock_call_stmt_320_c_macro_; 
// 		$volatile lock_addr_32 := ( $slice msg_size_plus_lock 31 0 )  $buffering 1
_acquireLock_assign_stmt_324_c_macro_; 
// 		$volatile sel := ( $slice lock_addr_32 2 0 )  $buffering 1
_acquireLock_assign_stmt_329_c_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b1  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) (($bitcast ($uint<4>) _b0  ) && lock_addr_32) ($bitcast ($uint<64>) _b0  ) ) (lock_values ) 
_acquireLock_call_stmt_344_c_macro_; 
// 		$volatile l0 := ( $slice lock_values 63 56 )  $buffering 1
_acquireLock_assign_stmt_348_c_macro_; 
// 		$volatile l1 := ( $slice lock_values 55 48 )  $buffering 1
_acquireLock_assign_stmt_352_c_macro_; 
// 		$volatile l2 := ( $slice lock_values 47 40 )  $buffering 1
_acquireLock_assign_stmt_356_c_macro_; 
// 		$volatile l3 := ( $slice lock_values 39 32 )  $buffering 1
_acquireLock_assign_stmt_360_c_macro_; 
// 		$volatile l4 := ( $slice lock_values 31 24 )  $buffering 1
_acquireLock_assign_stmt_364_c_macro_; 
// 		$volatile l5 := ( $slice lock_values 23 16 )  $buffering 1
_acquireLock_assign_stmt_368_c_macro_; 
// 		$volatile l6 := ( $slice lock_values 15 8 )  $buffering 1
_acquireLock_assign_stmt_372_c_macro_; 
// 		$volatile l7 := ( $slice lock_values 7 0 )  $buffering 1
_acquireLock_assign_stmt_376_c_macro_; 
// 		$volatile lock_val := (((( $mux (sel == 0 ) l0  _b0  )  | ( $mux (sel == 1 ) l1  _b0  ) ) | (( $mux (sel == 2 ) l2  _b0  )  | ( $mux (sel == 3 ) l3  _b0  ) )) | ((( $mux (sel == 4 ) l4  _b0  )  | ( $mux (sel == 5 ) l5  _b0  ) ) | (( $mux (sel == 6 ) l6  _b0  )  | ( $mux (sel == 7 ) l7  _b0  ) ))) $buffering 1
_acquireLock_assign_stmt_433_c_macro_; 
// if statement :  file nic.linked.aa, line -1071776904
__declare_static_bit_vector(konst_436,8);\
bit_vector_clear(&konst_436);\
__declare_static_bit_vector(type_cast_437,8);\
bit_vector_clear(&type_cast_437);\
__declare_static_bit_vector(NOT_u8_u8_438,8);\
bit_vector_clear(&NOT_u8_u8_438);\
NOT_u8_u8_438.val.byte_array[0] = 255;\
__declare_static_bit_vector(EQ_u8_u1_439,1);\
bit_vector_clear(&konst_436);\
bit_vector_bitcast_to_bit_vector( &(type_cast_437), &(konst_436));\
bit_vector_not( &(type_cast_437), &(NOT_u8_u8_438));\
bit_vector_equal(0, &(lock_val), &(NOT_u8_u8_438), &(EQ_u8_u1_439));\
if (has_undefined_bit(&EQ_u8_u1_439)) {fprintf(stderr, "Error: variable EQ_u8_u1_439 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_439));assert(0);} \

if (bit_vector_to_uint64(0, &EQ_u8_u1_439)) { 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) lock_address_pointer ($bitcast ($uint<64>) _b0  ) ) (err ) 
_acquireLock_call_stmt_451_c_macro_; 
/* 			$place[loopback]
*/  goto loopback_301;
} 
else {
 ;
}
// 		$volatile s0 := (sel == 0 ) $buffering 1
_acquireLock_assign_stmt_458_c_macro_; 
// 		$volatile s1 := (sel == 1 ) $buffering 1
_acquireLock_assign_stmt_463_c_macro_; 
// 		$volatile s2 := (sel == 2 ) $buffering 1
_acquireLock_assign_stmt_468_c_macro_; 
// 		$volatile s3 := (sel == 3 ) $buffering 1
_acquireLock_assign_stmt_473_c_macro_; 
// 		$volatile s4 := (sel == 4 ) $buffering 1
_acquireLock_assign_stmt_478_c_macro_; 
// 		$volatile s5 := (sel == 5 ) $buffering 1
_acquireLock_assign_stmt_483_c_macro_; 
// 		$volatile s6 := (sel == 6 ) $buffering 1
_acquireLock_assign_stmt_488_c_macro_; 
// 		$volatile s7 := (sel == 7 ) $buffering 1
_acquireLock_assign_stmt_493_c_macro_; 
// 		$volatile new_bmask := (((( $mux s0 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s1 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) ) && (( $mux s2 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s3 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) )) && ((( $mux s4 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s5 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) ) && (( $mux s6 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s7 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) ))) $buffering 1
_acquireLock_assign_stmt_550_c_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) new_bmask (($bitcast ($uint<4>) _b0  ) && lock_addr_32) ( ~ ($bitcast ($uint<64>) _b0  ) ) ) (ignore ) 
_acquireLock_call_stmt_564_c_macro_; 
_acquireLock_branch_block_stmt_301_c_export_apply_macro_;
}
// 	m_ok := ($bitcast ($uint<1>) _b1  ) $buffering 1// bits of buffering = 1. 
_acquireLock_assign_stmt_569_c_macro_; 
_acquireLock_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_acquireLock_series_block_stmt_298_c_mutex_);
}
void _delay_time_(bit_vector* __pT, bit_vector*  __pdelay_done)
{
MUTEX_DECL(_delay_time_series_block_stmt_1212_c_mutex_);
MUTEX_LOCK(_delay_time_series_block_stmt_1212_c_mutex_);
_delay_time_inner_inarg_prep_macro__; 
_delay_time_branch_block_stmt_1215_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 384
__declare_static_bit_vector(konst_1230,32);\
bit_vector_clear(&konst_1230);\
__declare_static_bit_vector(UGT_u32_u1_1231,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 386
_delay_time_merge_stmt_1217_c_preamble_macro_; 
// 			$phi R := 			  nR $on   $loopback 			  T $on   $entry 
 // type of target is $uint<32>
_delay_time_phi_stmt_1218_c_macro_; 
_delay_time_merge_stmt_1217_c_postamble_macro_; 
// 			$volatile nR := (R - 1 ) $buffering 1
_delay_time_assign_stmt_1227_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1230);\
bit_vector_greater(0, &(R), &(konst_1230), &(UGT_u32_u1_1231));\
if (has_undefined_bit(&UGT_u32_u1_1231)) {fprintf(stderr, "Error: variable UGT_u32_u1_1231 has undefined value (%s) at test point.\n", to_string(&UGT_u32_u1_1231));assert(0);} \

if (!bit_vector_to_uint64(0, &UGT_u32_u1_1231)) break;
} 
}
// 		delay_done := 1  $buffering 1// bits of buffering = 1. 
_delay_time_assign_stmt_1234_c_macro_; 
_delay_time_branch_block_stmt_1215_c_export_apply_macro_;
}
_delay_time_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_delay_time_series_block_stmt_1212_c_mutex_);
}
void _getQueueElement_(bit_vector* __pq_base_address, bit_vector* __pread_index, bit_vector*  __pq_r_data)
{
MUTEX_DECL(_getQueueElement_series_block_stmt_624_c_mutex_);
MUTEX_LOCK(_getQueueElement_series_block_stmt_624_c_mutex_);
_getQueueElement_inner_inarg_prep_macro__; 
// 	$volatile buffer_address := (q_base_address + ($bitcast ($uint<36>) 24  )) $buffering 1
_getQueueElement_assign_stmt_633_c_macro_; 
// 	$volatile element_pair_address := (buffer_address + ($bitcast ($uint<36>) (( $slice read_index 31 1 )  && ($bitcast ($uint<3>) _b0  )) )) $buffering 1
_getQueueElement_assign_stmt_645_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) element_pair_address ($bitcast ($uint<64>) _b0  ) ) (element_pair ) 
_getQueueElement_call_stmt_657_c_macro_; 
// 	$volatile e0 := ( $slice element_pair 63 32 )  $buffering 1
_getQueueElement_assign_stmt_661_c_macro_; 
// 	$volatile e1 := ( $slice element_pair 31 0 )  $buffering 1
_getQueueElement_assign_stmt_665_c_macro_; 
// 	q_r_data := ( $mux (read_index [] 0 ) e1  e0 )  $buffering 1// bits of buffering = 32. 
_getQueueElement_assign_stmt_673_c_macro_; 
// $report (getQueueElement get_queue_element 	 q_r_data q_r_data 	 q_base_address q_base_address 	 read_index read_index 	 element_pair_address element_pair_address )
_getQueueElement_stmt_678_c_macro_; 
_getQueueElement_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getQueueElement_series_block_stmt_624_c_mutex_);
}
void _getQueueLength_(bit_vector* __pq_base_address, bit_vector*  __pQueue_Length)
{
MUTEX_DECL(_getQueueLength_series_block_stmt_602_c_mutex_);
MUTEX_LOCK(_getQueueLength_series_block_stmt_602_c_mutex_);
_getQueueLength_inner_inarg_prep_macro__; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) (q_base_address + 8 ) ($bitcast ($uint<64>) _b0  ) ) (wi_and_len ) 
_getQueueLength_call_stmt_618_c_macro_; 
// 	Queue_Length := ( $slice wi_and_len 31 0 )  $buffering 1// bits of buffering = 32. 
_getQueueLength_assign_stmt_622_c_macro_; 
_getQueueLength_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getQueueLength_series_block_stmt_602_c_mutex_);
}
void _getQueuePointers_(bit_vector* __pq_base_address, bit_vector*  __pwp, bit_vector*  __prp)
{
MUTEX_DECL(_getQueuePointers_series_block_stmt_571_c_mutex_);
MUTEX_LOCK(_getQueuePointers_series_block_stmt_571_c_mutex_);
_getQueuePointers_inner_inarg_prep_macro__; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) (q_base_address + 4 ) ($bitcast ($uint<64>) _b0  ) ) (wp_rp ) 
_getQueuePointers_call_stmt_588_c_macro_; 
// 	$volatile rp := ( $slice wp_rp 63 32 )  $buffering 1
_getQueuePointers_assign_stmt_592_c_macro_; 
// 	$volatile wp := ( $slice wp_rp 31 0 )  $buffering 1
_getQueuePointers_assign_stmt_596_c_macro_; 
// $report (getQueuePointers set 	 q_base_address q_base_address 	 wp wp 	 rp rp )
_getQueuePointers_stmt_600_c_macro_; 
_getQueuePointers_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getQueuePointers_series_block_stmt_571_c_mutex_);
}
void _getTxPacketPointerFromServer_(bit_vector* __pqueue_index, bit_vector*  __ppkt_pointer, bit_vector*  __pstatus)
{
MUTEX_DECL(_getTxPacketPointerFromServer_series_block_stmt_1580_c_mutex_);
MUTEX_LOCK(_getTxPacketPointerFromServer_series_block_stmt_1580_c_mutex_);
_getTxPacketPointerFromServer_inner_inarg_prep_macro__; 
// 	$volatile register_index := ($bitcast ($uint<6>) (queue_index + TX_QUEUES_REG_START_OFFSET) ) $buffering 1
_getTxPacketPointerFromServer_assign_stmt_1589_c_macro_; 
// 	$call AccessRegister (($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) register_index ($bitcast ($uint<32>) _b0  ) ) (tx_queue_pointer_32 ) 
_getTxPacketPointerFromServer_call_stmt_1599_c_macro_; 
// 	$volatile tx_queue_pointer_36 := (tx_queue_pointer_32 && ($bitcast ($uint<4>) _b0  )) $buffering 1
_getTxPacketPointerFromServer_assign_stmt_1605_c_macro_; 
// 	$call popFromQueue (($bitcast ($uint<1>) _b1  ) tx_queue_pointer_36 ) (pkt_pointer status ) 
_getTxPacketPointerFromServer_call_stmt_1611_c_macro_; 
// $report (getTxPacketPointerFromServer register_ind 	 register_index register_index 	 tx_queue_pointer_36 tx_queue_pointer_36 	 pkt_pointer pkt_pointer 	 status status )
_getTxPacketPointerFromServer_stmt_1616_c_macro_; 
_getTxPacketPointerFromServer_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getTxPacketPointerFromServer_series_block_stmt_1580_c_mutex_);
}
void _global_storage_initializer__()
{
MUTEX_DECL(_global_storage_initializer__series_block_stmt_1618_c_mutex_);
MUTEX_LOCK(_global_storage_initializer__series_block_stmt_1618_c_mutex_);
_global_storage_initializer__inner_inarg_prep_macro__; 
/* null */ ;
_global_storage_initializer__inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_global_storage_initializer__series_block_stmt_1618_c_mutex_);
}
void global_storage_initializer_()
{
_global_storage_initializer__outer_arg_decl_macro__;
_global_storage_initializer__();
_global_storage_initializer__outer_op_xfer_macro__;
}


void _loadBuffer_(bit_vector* __prx_buffer_pointer, bit_vector*  __pbad_packet_identifier)
{
MUTEX_DECL(_loadBuffer_series_block_stmt_1062_c_mutex_);
MUTEX_LOCK(_loadBuffer_series_block_stmt_1062_c_mutex_);
_loadBuffer_inner_inarg_prep_macro__; 
// 	$call writeEthernetHeaderToMem (rx_buffer_pointer ) (new_buf_pointer ) 
_loadBuffer_call_stmt_1067_c_macro_; 
// 	$call writePayloadToMem (rx_buffer_pointer new_buf_pointer ) (packet_size bad_packet_identifier last_keep ) 
_loadBuffer_call_stmt_1073_c_macro_; 
// 	$guard (~bad_packet_identifier) $call writeControlInformationToMem (rx_buffer_pointer packet_size last_keep ) () 
_loadBuffer_call_stmt_1078_c_macro_; 
_loadBuffer_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_loadBuffer_series_block_stmt_1062_c_mutex_);
}
void _macToNicInterface_()
{
MUTEX_DECL(_macToNicInterface_series_block_stmt_1621_c_mutex_);
MUTEX_LOCK(_macToNicInterface_series_block_stmt_1621_c_mutex_);
_macToNicInterface_inner_inarg_prep_macro__; 
_macToNicInterface_branch_block_stmt_1622_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 540
__declare_static_bit_vector(konst_1643,1);\
bit_vector_clear(&konst_1643);\
konst_1643.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 542
_macToNicInterface_merge_stmt_1624_c_preamble_macro_; 
// 			$phi rdata0 := 			  mac_to_nic_data_0 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_macToNicInterface_phi_stmt_1625_c_macro_; 
// 			$phi rdata1 := 			  mac_to_nic_data_1 $on   $entry ,   $loopback 
 // type of target is $uint<16>
_macToNicInterface_phi_stmt_1628_c_macro_; 
_macToNicInterface_merge_stmt_1624_c_postamble_macro_; 
// $report (macToNicInterface writing_data 			 rdata1 rdata1 			 rdata0 rdata0 )
_macToNicInterface_stmt_1634_c_macro_; 
// 			mac_to_nic_data := (( $slice rdata1 8 0 )  && rdata0) $buffering 1// bits of buffering = 73. 
_macToNicInterface_assign_stmt_1641_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1643);\
konst_1643.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1643)) break;
} 
}
_macToNicInterface_branch_block_stmt_1622_c_export_apply_macro_;
}
_macToNicInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_macToNicInterface_series_block_stmt_1621_c_mutex_);
}
void macToNicInterface()
{
_macToNicInterface_outer_arg_decl_macro__;
_macToNicInterface_();
_macToNicInterface_outer_op_xfer_macro__;
}


void _memoryToNicInterface_()
{
MUTEX_DECL(_memoryToNicInterface_series_block_stmt_1646_c_mutex_);
MUTEX_LOCK(_memoryToNicInterface_series_block_stmt_1646_c_mutex_);
_memoryToNicInterface_inner_inarg_prep_macro__; 
_memoryToNicInterface_branch_block_stmt_1647_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 560
__declare_static_bit_vector(konst_1665,1);\
bit_vector_clear(&konst_1665);\
konst_1665.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 562
_memoryToNicInterface_merge_stmt_1649_c_preamble_macro_; 
// 			$phi rdata0 := 			  mem_resp1_pipe0 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_memoryToNicInterface_phi_stmt_1650_c_macro_; 
// 			$phi rdata1 := 			  mem_resp1_pipe1 $on   $entry ,   $loopback 
 // type of target is $uint<8>
_memoryToNicInterface_phi_stmt_1653_c_macro_; 
_memoryToNicInterface_merge_stmt_1649_c_postamble_macro_; 
// 			MEMORY_TO_NIC_RESPONSE := ((rdata1 [] 0 ) && rdata0) $buffering 1// bits of buffering = 65. 
_memoryToNicInterface_assign_stmt_1663_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1665);\
konst_1665.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1665)) break;
} 
}
_memoryToNicInterface_branch_block_stmt_1647_c_export_apply_macro_;
}
_memoryToNicInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_memoryToNicInterface_series_block_stmt_1646_c_mutex_);
}
void memoryToNicInterface()
{
_memoryToNicInterface_outer_arg_decl_macro__;
_memoryToNicInterface_();
_memoryToNicInterface_outer_op_xfer_macro__;
}


void _memoryToProcessorInterface_()
{
MUTEX_DECL(_memoryToProcessorInterface_series_block_stmt_1668_c_mutex_);
MUTEX_LOCK(_memoryToProcessorInterface_series_block_stmt_1668_c_mutex_);
_memoryToProcessorInterface_inner_inarg_prep_macro__; 
_memoryToProcessorInterface_branch_block_stmt_1669_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 579
__declare_static_bit_vector(konst_1686,1);\
bit_vector_clear(&konst_1686);\
konst_1686.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 581
_memoryToProcessorInterface_merge_stmt_1671_c_preamble_macro_; 
// 			$phi rdata0 := 			  mem_resp0_pipe0 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_memoryToProcessorInterface_phi_stmt_1672_c_macro_; 
// 			$phi rdata1 := 			  mem_resp0_pipe1 $on   $entry ,   $loopback 
 // type of target is $uint<8>
_memoryToProcessorInterface_phi_stmt_1675_c_macro_; 
_memoryToProcessorInterface_merge_stmt_1671_c_postamble_macro_; 
// 			mem_resp0_pipe0_tester := rdata0 $buffering 1// bits of buffering = 64. 
_memoryToProcessorInterface_assign_stmt_1681_c_macro_; 
// 			mem_resp0_pipe1_tester := rdata1 $buffering 1// bits of buffering = 8. 
_memoryToProcessorInterface_assign_stmt_1684_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1686);\
konst_1686.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1686)) break;
} 
}
_memoryToProcessorInterface_branch_block_stmt_1669_c_export_apply_macro_;
}
_memoryToProcessorInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_memoryToProcessorInterface_series_block_stmt_1668_c_mutex_);
}
void memoryToProcessorInterface()
{
_memoryToProcessorInterface_outer_arg_decl_macro__;
_memoryToProcessorInterface_();
_memoryToProcessorInterface_outer_op_xfer_macro__;
}


void _nextLSTATE_(bit_vector* __pRX, bit_vector* __pLSTATE, bit_vector*  __pnLSTATE)
{
MUTEX_DECL(_nextLSTATE_series_block_stmt_1689_c_mutex_);
MUTEX_LOCK(_nextLSTATE_series_block_stmt_1689_c_mutex_);
_nextLSTATE_inner_inarg_prep_macro__; 
// 	$volatile tlast := ( $slice RX 72 72 )  $buffering 1
_nextLSTATE_assign_stmt_1696_c_macro_; 
// 	$volatile tdata := ( $slice RX 71 8 )  $buffering 1
_nextLSTATE_assign_stmt_1700_c_macro_; 
// 	$volatile tkeep := ( $slice RX 7 0 )  $buffering 1
_nextLSTATE_assign_stmt_1704_c_macro_; 
// 	$volatile last_word := (tlast == 1 ) $buffering 1
_nextLSTATE_assign_stmt_1709_c_macro_; 
// 	nLSTATE := ((( $mux (LSTATE == S0) S1  _b0  )  | ( $mux (LSTATE == S1) S2  _b0  ) ) | (( $mux ((LSTATE == S2) & ( ~ last_word )) S2  _b0  )  | ( $mux ((LSTATE == S2) & last_word) S0  _b0  ) )) $buffering 1
_nextLSTATE_assign_stmt_1743_c_macro_; 
_nextLSTATE_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nextLSTATE_series_block_stmt_1689_c_mutex_);
}
void _nicRxFromMacDaemon_()
{
MUTEX_DECL(_nicRxFromMacDaemon_series_block_stmt_1745_c_mutex_);
MUTEX_LOCK(_nicRxFromMacDaemon_series_block_stmt_1745_c_mutex_);
_nicRxFromMacDaemon_inner_inarg_prep_macro__; 
_nicRxFromMacDaemon_branch_block_stmt_1746_c_export_decl_macro_; 
{
// $report (nicRxFromMacDaemon waiting_for_control )
_nicRxFromMacDaemon_stmt_1747_c_macro_; 
// merge  file nic.linked.aa, line 611
_nicRxFromMacDaemon_merge_stmt_1748_c_preamble_macro_; 
_nicRxFromMacDaemon_merge_stmt_1748_c_postamble_macro_; 
// 		$call AccessRegister (($bitcast ($uint<1>) _b0  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) 22  ($bitcast ($uint<32>) _b0  ) ) (ignore_resp0 ) 
_nicRxFromMacDaemon_call_stmt_1758_c_macro_; 
// if statement :  file nic.linked.aa, line 33715232
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1760,32);\
__declare_static_bit_vector(konst_1761,32);\
bit_vector_clear(&konst_1761);\
__declare_static_bit_vector(BITSEL_u32_u1_1762,1);\
__declare_static_bit_vector(NOT_u1_u1_1763,1);\
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1760));\
bit_vector_clear(&konst_1761);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1760), &(konst_1761), &(BITSEL_u32_u1_1762));\
bit_vector_not( &(BITSEL_u32_u1_1762), &(NOT_u1_u1_1763));\
if (has_undefined_bit(&NOT_u1_u1_1763)) {fprintf(stderr, "Error: variable NOT_u1_u1_1763 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_1763));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_1763)) { 
/* 			$place[not_enabled_yet_loopback]
*/  goto not_enabled_yet_loopback_1746;
} 
else {
 ;
}
// $report (nicRxFromMacDaemon got_the__control )
_nicRxFromMacDaemon_stmt_1766_c_macro_; 
// 		$call AccessRegister (($bitcast ($uint<1>) _b0  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) 22  ($bitcast ($uint<32>) _b1  ) ) (ignore_resp1 ) 
_nicRxFromMacDaemon_call_stmt_1776_c_macro_; 
{
// do-while:   file nic.linked.aa, line 619
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1822,32);\
__declare_static_bit_vector(konst_1823,32);\
bit_vector_clear(&konst_1823);\
__declare_static_bit_vector(BITSEL_u32_u1_1824,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 621
_nicRxFromMacDaemon_merge_stmt_1778_c_preamble_macro_; 
// 			$phi LSTATE := 			  nLSTATE $on   $loopback 			  S0 $on   $entry 
 // type of target is $uint<2>
_nicRxFromMacDaemon_phi_stmt_1779_c_macro_; 
// 			$phi RX := 			  mac_to_nic_data $on   $entry ,   $loopback 
 // type of target is $uint<73>
_nicRxFromMacDaemon_phi_stmt_1783_c_macro_; 
_nicRxFromMacDaemon_merge_stmt_1778_c_postamble_macro_; 
// $report (nicRxFromMacDaemon data_is 			 RX RX 			 LSTATE LSTATE )
_nicRxFromMacDaemon_stmt_1789_c_macro_; 
//  $volatile 			$call nextLSTATE (RX LSTATE ) (nLSTATE ) 
_nicRxFromMacDaemon_call_stmt_1793_c_macro_; 
// 			$volatile write_to_header := ((LSTATE == S0) | (LSTATE == S1)) $buffering 1
_nicRxFromMacDaemon_assign_stmt_1802_c_macro_; 
// 			$guard (write_to_header) nic_rx_to_header := ( $mux (LSTATE == S1) (( $slice RX 72 8 )  && HEADER_TKEEP)  RX )  $buffering 1// bits of buffering = 73. 
_nicRxFromMacDaemon_assign_stmt_1814_c_macro_; 
// 			nic_rx_to_packet := RX $buffering 1// bits of buffering = 73. 
_nicRxFromMacDaemon_assign_stmt_1817_c_macro_; 
// $report (nicRxFromMacDaemon data_written_is 			 RX RX 			 nLSTATE nLSTATE )
_nicRxFromMacDaemon_stmt_1820_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1822));\
bit_vector_clear(&konst_1823);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1822), &(konst_1823), &(BITSEL_u32_u1_1824));\
if (has_undefined_bit(&BITSEL_u32_u1_1824)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1824 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1824));assert(0);} \

if (!bit_vector_to_uint64(0, &BITSEL_u32_u1_1824)) break;
} 
}
/* 		$place[disable_loopback]
*/  goto disable_loopback_1746;
_nicRxFromMacDaemon_branch_block_stmt_1746_c_export_apply_macro_;
}
_nicRxFromMacDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicRxFromMacDaemon_series_block_stmt_1745_c_mutex_);
}
void nicRxFromMacDaemon()
{
_nicRxFromMacDaemon_outer_arg_decl_macro__;
_nicRxFromMacDaemon_();
_nicRxFromMacDaemon_outer_op_xfer_macro__;
}


void _nicToMacInterface_()
{
MUTEX_DECL(_nicToMacInterface_series_block_stmt_1828_c_mutex_);
MUTEX_LOCK(_nicToMacInterface_series_block_stmt_1828_c_mutex_);
_nicToMacInterface_inner_inarg_prep_macro__; 
_nicToMacInterface_branch_block_stmt_1829_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 644
__declare_static_bit_vector(konst_1848,1);\
bit_vector_clear(&konst_1848);\
konst_1848.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 646
_nicToMacInterface_merge_stmt_1831_c_preamble_macro_; 
// 			$phi rdata := 			  nic_to_mac_transmit_pipe $on   $entry ,   $loopback 
 // type of target is $uint<73>
_nicToMacInterface_phi_stmt_1832_c_macro_; 
_nicToMacInterface_merge_stmt_1831_c_postamble_macro_; 
// $report (nicToMacInterface read_data_is 			 rdata rdata )
_nicToMacInterface_stmt_1837_c_macro_; 
// 			nic_to_mac_data_0 := ( $slice rdata 63 0 )  $buffering 1// bits of buffering = 64. 
_nicToMacInterface_assign_stmt_1841_c_macro_; 
// 			nic_to_mac_data_1 := ($bitcast ($uint<16>) ( $slice rdata 72 64 )  ) $buffering 1// bits of buffering = 16. 
_nicToMacInterface_assign_stmt_1846_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1848);\
konst_1848.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1848)) break;
} 
}
_nicToMacInterface_branch_block_stmt_1829_c_export_apply_macro_;
}
_nicToMacInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicToMacInterface_series_block_stmt_1828_c_mutex_);
}
void nicToMacInterface()
{
_nicToMacInterface_outer_arg_decl_macro__;
_nicToMacInterface_();
_nicToMacInterface_outer_op_xfer_macro__;
}


void _nicToMemoryInterface_()
{
MUTEX_DECL(_nicToMemoryInterface_series_block_stmt_1851_c_mutex_);
MUTEX_LOCK(_nicToMemoryInterface_series_block_stmt_1851_c_mutex_);
_nicToMemoryInterface_inner_inarg_prep_macro__; 
_nicToMemoryInterface_branch_block_stmt_1852_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 663
__declare_static_bit_vector(konst_1872,1);\
bit_vector_clear(&konst_1872);\
konst_1872.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 665
_nicToMemoryInterface_merge_stmt_1854_c_preamble_macro_; 
// 			$phi rdata := 			  NIC_TO_MEMORY_REQUEST $on   $entry ,   $loopback 
 // type of target is $uint<110>
_nicToMemoryInterface_phi_stmt_1855_c_macro_; 
_nicToMemoryInterface_merge_stmt_1854_c_postamble_macro_; 
// $report (nicToMemoryInterface writing_to_mem_pipe 			 rdata rdata )
_nicToMemoryInterface_stmt_1860_c_macro_; 
// 			mem_req1_pipe0 := ( $slice rdata 63 0 )  $buffering 1// bits of buffering = 64. 
_nicToMemoryInterface_assign_stmt_1864_c_macro_; 
// 			mem_req1_pipe1 := ($bitcast ($uint<64>) ( $slice rdata 109 64 )  ) $buffering 1// bits of buffering = 64. 
_nicToMemoryInterface_assign_stmt_1870_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1872);\
konst_1872.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1872)) break;
} 
}
_nicToMemoryInterface_branch_block_stmt_1852_c_export_apply_macro_;
}
_nicToMemoryInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicToMemoryInterface_series_block_stmt_1851_c_mutex_);
}
void nicToMemoryInterface()
{
_nicToMemoryInterface_outer_arg_decl_macro__;
_nicToMemoryInterface_();
_nicToMemoryInterface_outer_op_xfer_macro__;
}


void _nicToProcessorInterface_()
{
MUTEX_DECL(_nicToProcessorInterface_series_block_stmt_1875_c_mutex_);
MUTEX_LOCK(_nicToProcessorInterface_series_block_stmt_1875_c_mutex_);
_nicToProcessorInterface_inner_inarg_prep_macro__; 
_nicToProcessorInterface_branch_block_stmt_1876_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 682
__declare_static_bit_vector(konst_1888,1);\
bit_vector_clear(&konst_1888);\
konst_1888.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 684
_nicToProcessorInterface_merge_stmt_1878_c_preamble_macro_; 
// 			$phi rdata := 			  AFB_NIC_RESPONSE $on   $entry ,   $loopback 
 // type of target is $uint<33>
_nicToProcessorInterface_phi_stmt_1879_c_macro_; 
_nicToProcessorInterface_merge_stmt_1878_c_postamble_macro_; 
// 			control_word_response_pipe := ($bitcast ($uint<64>) rdata ) $buffering 1// bits of buffering = 64. 
_nicToProcessorInterface_assign_stmt_1886_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1888);\
konst_1888.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1888)) break;
} 
}
_nicToProcessorInterface_branch_block_stmt_1876_c_export_apply_macro_;
}
_nicToProcessorInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicToProcessorInterface_series_block_stmt_1875_c_mutex_);
}
void nicToProcessorInterface()
{
_nicToProcessorInterface_outer_arg_decl_macro__;
_nicToProcessorInterface_();
_nicToProcessorInterface_outer_op_xfer_macro__;
}


void _popFromQueue_(bit_vector* __plock, bit_vector* __pq_base_address, bit_vector*  __pq_r_data, bit_vector*  __pstatus)
{
MUTEX_DECL(_popFromQueue_series_block_stmt_843_c_mutex_);
MUTEX_LOCK(_popFromQueue_series_block_stmt_843_c_mutex_);
_popFromQueue_inner_inarg_prep_macro__; 
// 	$guard (lock) $call acquireLock (q_base_address ) (m_ok ) 
_popFromQueue_call_stmt_851_c_macro_; 
/* barrier */ ;
// 	$call getQueuePointers (q_base_address ) (write_index read_index ) 
_popFromQueue_call_stmt_856_c_macro_; 
// 	$volatile q_empty := (write_index == read_index) $buffering 1
_popFromQueue_assign_stmt_861_c_macro_; 
// 	$call getQueueLength (q_base_address ) (Queue_Length ) 
_popFromQueue_call_stmt_864_c_macro_; 
// 	$volatile round_off := (read_index == (Queue_Length - 1 )) $buffering 1
_popFromQueue_assign_stmt_871_c_macro_; 
// 	$volatile next_ri := ( $mux round_off 0   (read_index + 1 ) )  $buffering 1
_popFromQueue_assign_stmt_879_c_macro_; 
// 	$guard (~q_empty) $call getQueueElement (q_base_address read_index ) (q_r_data ) 
_popFromQueue_call_stmt_884_c_macro_; 
// 	$guard (~q_empty) $call setQueuePointers (q_base_address write_index next_ri ) () 
_popFromQueue_call_stmt_889_c_macro_; 
// $report (popFromQueue pop_data 	 q_base_address q_base_address 	 q_r_data q_r_data 	 q_empty q_empty 	 write_index write_index 	 read_index read_index 	 next_ri next_ri )
_popFromQueue_stmt_896_c_macro_; 
/* barrier */ ;
// 	$guard (lock) $call releaseLock (q_base_address ) () 
_popFromQueue_call_stmt_900_c_macro_; 
// 	status := q_empty $buffering 1// bits of buffering = 1. 
_popFromQueue_assign_stmt_903_c_macro_; 
_popFromQueue_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_popFromQueue_series_block_stmt_843_c_mutex_);
}
void _populateRxQueue_(bit_vector* __prx_buffer_pointer)
{
MUTEX_DECL(_populateRxQueue_series_block_stmt_1237_c_mutex_);
MUTEX_LOCK(_populateRxQueue_series_block_stmt_1237_c_mutex_);
_populateRxQueue_inner_inarg_prep_macro__; 
// $report (populateRxQueue started_populate_rx_queue_module 	 LAST_WRITTEN_RX_QUEUE_INDEX LAST_WRITTEN_RX_QUEUE_INDEX )
_populateRxQueue_stmt_1240_c_macro_; 
_populateRxQueue_branch_block_stmt_1241_c_export_decl_macro_; 
{
// merge  file nic.linked.aa, line 403
_populateRxQueue_merge_stmt_1242_c_preamble_macro_; 
// 			$phi q_index := 			  ((LAST_WRITTEN_RX_QUEUE_INDEX + 1 ) & ($bitcast ($uint<6>) (NUMBER_OF_SERVERS - 1 ) )) $on   $entry 			  n_q_index $on   loopback 
 // type of target is $uint<6>
_populateRxQueue_phi_stmt_1243_c_macro_; 
_populateRxQueue_merge_stmt_1242_c_postamble_macro_; 
// $report (populateRxQueue in_loop 		 q_index q_index )
_populateRxQueue_stmt_1256_c_macro_; 
// 		$volatile register_index := ($bitcast ($uint<6>) (q_index + RX_QUEUES_REG_START_OFFSET) ) $buffering 1
_populateRxQueue_assign_stmt_1262_c_macro_; 
// $report (populateRxQueue will_be_Accessing_register 		 register_index register_index )
_populateRxQueue_stmt_1264_c_macro_; 
// 		$call AccessRegister (($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) register_index ($bitcast ($uint<32>) _b0  ) ) (rx_queue_pointer_32 ) 
_populateRxQueue_call_stmt_1274_c_macro_; 
// 		$volatile rx_queue_pointer_36 := (rx_queue_pointer_32 && ($bitcast ($uint<4>) _b0  )) $buffering 1
_populateRxQueue_assign_stmt_1280_c_macro_; 
// $report (populateRxQueue got_rx_queue_pointer_pushing_to_rx_queue 		 rx_queue_pointer_32 rx_queue_pointer_32 		 rx_queue_pointer_36 rx_queue_pointer_36 		 NUMBER_OF_SERVERS NUMBER_OF_SERVERS )
_populateRxQueue_stmt_1284_c_macro_; 
// 		$call pushIntoQueue (($bitcast ($uint<1>) _b0  ) rx_queue_pointer_36 ( $slice rx_buffer_pointer 35 4 )  ) (push_status ) 
_populateRxQueue_call_stmt_1291_c_macro_; 
// 		n_q_index := ((q_index + 1 ) & ($bitcast ($uint<6>) (NUMBER_OF_SERVERS - 1 ) )) $buffering 1// bits of buffering = 6. 
_populateRxQueue_assign_stmt_1301_c_macro_; 
// $report (populateRxQueue written_to_rx_queue 		 n_q_index n_q_index 		 push_status push_status )
_populateRxQueue_stmt_1304_c_macro_; 
// if statement :  file nic.linked.aa, line 416
__declare_static_bit_vector(NOT_u1_u1_1307,1);\
bit_vector_not( &(push_status), &(NOT_u1_u1_1307));\
if (has_undefined_bit(&NOT_u1_u1_1307)) {fprintf(stderr, "Error: variable NOT_u1_u1_1307 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_1307));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_1307)) { 
// 			$call delay_time (32  ) (status ) 
_populateRxQueue_call_stmt_1310_c_macro_; 
// if statement :  file nic.linked.aa, line 0
__declare_static_bit_vector(konst_1313,1);\
bit_vector_clear(&konst_1313);\
__declare_static_bit_vector(EQ_u1_u1_1314,1);\
bit_vector_clear(&konst_1313);\
bit_vector_equal(0, &(status), &(konst_1313), &(EQ_u1_u1_1314));\
if (has_undefined_bit(&EQ_u1_u1_1314)) {fprintf(stderr, "Error: variable EQ_u1_u1_1314 has undefined value (%s) at test point.\n", to_string(&EQ_u1_u1_1314));assert(0);} \

if (bit_vector_to_uint64(0, &EQ_u1_u1_1314)) { 
/* 			$place[loopback]
*/  goto loopback_1241;
} 
else {
 ;
}
} 
else {
// 			LAST_WRITTEN_RX_QUEUE_INDEX := q_index $buffering 1// bits of buffering = 6. 
_populateRxQueue_assign_stmt_1320_c_macro_; 
// 			selected_q_index := q_index $buffering 1// bits of buffering = 6.  Orphaned statement with target selected_q_index ?? 
_populateRxQueue_assign_stmt_1323_c_macro_; 
}
_populateRxQueue_branch_block_stmt_1241_c_export_apply_macro_;
}
_populateRxQueue_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_populateRxQueue_series_block_stmt_1237_c_mutex_);
}
void _processorToMemoryInterface_()
{
MUTEX_DECL(_processorToMemoryInterface_series_block_stmt_1891_c_mutex_);
MUTEX_LOCK(_processorToMemoryInterface_series_block_stmt_1891_c_mutex_);
_processorToMemoryInterface_inner_inarg_prep_macro__; 
_processorToMemoryInterface_branch_block_stmt_1892_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 699
__declare_static_bit_vector(konst_1912,1);\
bit_vector_clear(&konst_1912);\
konst_1912.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 701
_processorToMemoryInterface_merge_stmt_1894_c_preamble_macro_; 
// 			$phi rdata0 := 			  mem_req0_pipe0_tester $on   $entry ,   $loopback 
 // type of target is $uint<64>
_processorToMemoryInterface_phi_stmt_1895_c_macro_; 
// 			$phi rdata1 := 			  mem_req0_pipe1_tester $on   $entry ,   $loopback 
 // type of target is $uint<64>
_processorToMemoryInterface_phi_stmt_1898_c_macro_; 
_processorToMemoryInterface_merge_stmt_1894_c_postamble_macro_; 
// $report (ProcessorToMemoryInterface writing_to_mem_pipe 			 rdata0 rdata0 			 rdata1 rdata1 )
_processorToMemoryInterface_stmt_1904_c_macro_; 
// 			mem_req0_pipe0 := rdata0 $buffering 1// bits of buffering = 64. 
_processorToMemoryInterface_assign_stmt_1907_c_macro_; 
// 			mem_req0_pipe1 := rdata1 $buffering 1// bits of buffering = 64. 
_processorToMemoryInterface_assign_stmt_1910_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1912);\
konst_1912.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1912)) break;
} 
}
_processorToMemoryInterface_branch_block_stmt_1892_c_export_apply_macro_;
}
_processorToMemoryInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_processorToMemoryInterface_series_block_stmt_1891_c_mutex_);
}
void processorToMemoryInterface()
{
_processorToMemoryInterface_outer_arg_decl_macro__;
_processorToMemoryInterface_();
_processorToMemoryInterface_outer_op_xfer_macro__;
}


void _processorToNicInterface_()
{
MUTEX_DECL(_processorToNicInterface_series_block_stmt_1915_c_mutex_);
MUTEX_LOCK(_processorToNicInterface_series_block_stmt_1915_c_mutex_);
_processorToNicInterface_inner_inarg_prep_macro__; 
_processorToNicInterface_branch_block_stmt_1916_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 720
__declare_static_bit_vector(konst_1937,1);\
bit_vector_clear(&konst_1937);\
konst_1937.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 722
_processorToNicInterface_merge_stmt_1918_c_preamble_macro_; 
// 			$phi rdata0 := 			  control_word_request_pipe_0 $on   $entry ,   $loopback 
 // type of target is $uint<32>
_processorToNicInterface_phi_stmt_1919_c_macro_; 
// 			$phi rdata1 := 			  control_word_request_pipe_1 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_processorToNicInterface_phi_stmt_1922_c_macro_; 
_processorToNicInterface_merge_stmt_1918_c_postamble_macro_; 
// $report (processorToNicInterface got_afb_Req 			 rdata0 rdata0 			 rdata1 rdata1 )
_processorToNicInterface_stmt_1928_c_macro_; 
// 			AFB_NIC_REQUEST := (( $slice rdata1 41 0 )  && rdata0) $buffering 1// bits of buffering = 74. 
_processorToNicInterface_assign_stmt_1935_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1937);\
konst_1937.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1937)) break;
} 
}
_processorToNicInterface_branch_block_stmt_1916_c_export_apply_macro_;
}
_processorToNicInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_processorToNicInterface_series_block_stmt_1915_c_mutex_);
}
void processorToNicInterface()
{
_processorToNicInterface_outer_arg_decl_macro__;
_processorToNicInterface_();
_processorToNicInterface_outer_op_xfer_macro__;
}


void _pushIntoQueue_(bit_vector* __plock, bit_vector* __pq_base_address, bit_vector* __pq_w_data, bit_vector*  __pstatus)
{
MUTEX_DECL(_pushIntoQueue_series_block_stmt_1147_c_mutex_);
MUTEX_LOCK(_pushIntoQueue_series_block_stmt_1147_c_mutex_);
_pushIntoQueue_inner_inarg_prep_macro__; 
// 	$guard (lock) $call acquireLock (q_base_address ) (m_ok ) 
_pushIntoQueue_call_stmt_1155_c_macro_; 
/* barrier */ ;
// $report (pushIntoQueue pushing_to_queue 	 q_w_data q_w_data 	 q_base_address q_base_address )
_pushIntoQueue_stmt_1159_c_macro_; 
// 	$call getQueuePointers (q_base_address ) (write_index read_index ) 
_pushIntoQueue_call_stmt_1163_c_macro_; 
// 	$call getQueueLength (q_base_address ) (Queue_Length ) 
_pushIntoQueue_call_stmt_1166_c_macro_; 
// 	$volatile round_off := (read_index == (Queue_Length - 1 )) $buffering 1
_pushIntoQueue_assign_stmt_1173_c_macro_; 
// 	$volatile next_wi := ( $mux round_off 0   (write_index + 1 ) )  $buffering 1
_pushIntoQueue_assign_stmt_1181_c_macro_; 
// 	$volatile q_full := (next_wi == read_index) $buffering 1
_pushIntoQueue_assign_stmt_1186_c_macro_; 
// $report (pushIntoQueue pushing_to_queue 	 q_w_data q_w_data 	 write_index write_index 	 read_index read_index 	 next_wi next_wi 	 q_full q_full )
_pushIntoQueue_stmt_1192_c_macro_; 
// 	$guard (~q_full) $call setQueueElement (q_base_address write_index q_w_data ) () 
_pushIntoQueue_call_stmt_1197_c_macro_; 
// 	$guard (~q_full) $call setQueuePointers (q_base_address next_wi read_index ) () 
_pushIntoQueue_call_stmt_1202_c_macro_; 
/* barrier */ ;
// 	$guard (lock) $call releaseLock (q_base_address ) () 
_pushIntoQueue_call_stmt_1206_c_macro_; 
// 	status := ( ~ q_full ) $buffering 1// bits of buffering = 1. 
_pushIntoQueue_assign_stmt_1210_c_macro_; 
_pushIntoQueue_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_pushIntoQueue_series_block_stmt_1147_c_mutex_);
}
void _releaseLock_(bit_vector* __pq_base_address)
{
MUTEX_DECL(_releaseLock_series_block_stmt_704_c_mutex_);
MUTEX_LOCK(_releaseLock_series_block_stmt_704_c_mutex_);
_releaseLock_inner_inarg_prep_macro__; 
// 	$volatile lock_address_pointer := (q_base_address + ($bitcast ($uint<36>) 20  )) $buffering 1
_releaseLock_assign_stmt_711_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) lock_address_pointer ($bitcast ($uint<64>) _b0  ) ) (msg_size_plus_lock ) 
_releaseLock_call_stmt_723_c_macro_; 
// 	$volatile lock_addr_32 := ( $slice msg_size_plus_lock 31 0 )  $buffering 1
_releaseLock_assign_stmt_727_c_macro_; 
// 	$volatile sel := ( $slice lock_addr_32 2 0 )  $buffering 1
_releaseLock_assign_stmt_731_c_macro_; 
// 	$volatile s0 := (sel == 0 ) $buffering 1
_releaseLock_assign_stmt_736_c_macro_; 
// 	$volatile s1 := (sel == 1 ) $buffering 1
_releaseLock_assign_stmt_741_c_macro_; 
// 	$volatile s2 := (sel == 2 ) $buffering 1
_releaseLock_assign_stmt_746_c_macro_; 
// 	$volatile s3 := (sel == 3 ) $buffering 1
_releaseLock_assign_stmt_751_c_macro_; 
// 	$volatile s4 := (sel == 4 ) $buffering 1
_releaseLock_assign_stmt_756_c_macro_; 
// 	$volatile s5 := (sel == 5 ) $buffering 1
_releaseLock_assign_stmt_761_c_macro_; 
// 	$volatile s6 := (sel == 6 ) $buffering 1
_releaseLock_assign_stmt_766_c_macro_; 
// 	$volatile s7 := (sel == 7 ) $buffering 1
_releaseLock_assign_stmt_771_c_macro_; 
// 	$volatile new_bmask := (((( $mux s0 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s1 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) ) && (( $mux s2 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s3 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) )) && ((( $mux s4 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s5 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) ) && (( $mux s6 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) )  && ( $mux s7 ($bitcast ($uint<1>) _b1  )  ($bitcast ($uint<1>) _b0  ) ) ))) $buffering 1
_releaseLock_assign_stmt_828_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b1  ) ($bitcast ($uint<1>) _b0  ) new_bmask (($bitcast ($uint<4>) _b0  ) && lock_addr_32) ($bitcast ($uint<64>) _b0  ) ) (ignore ) 
_releaseLock_call_stmt_841_c_macro_; 
_releaseLock_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_releaseLock_series_block_stmt_704_c_mutex_);
}
void _setQueueElement_(bit_vector* __pq_base_address, bit_vector* __pwrite_index, bit_vector* __pq_w_data)
{
MUTEX_DECL(_setQueueElement_series_block_stmt_1080_c_mutex_);
MUTEX_LOCK(_setQueueElement_series_block_stmt_1080_c_mutex_);
_setQueueElement_inner_inarg_prep_macro__; 
// 	$volatile buffer_address := (q_base_address + ($bitcast ($uint<36>) 24  )) $buffering 1
_setQueueElement_assign_stmt_1089_c_macro_; 
// 	$volatile element_pair_address := (buffer_address + ($bitcast ($uint<36>) (( $slice write_index 31 1 )  && ($bitcast ($uint<3>) _b0  )) )) $buffering 1
_setQueueElement_assign_stmt_1099_c_macro_; 
// 	$volatile bmask := ( $mux (write_index [] 0 ) (($bitcast ($uint<4>) _b0  ) && ( ~ ($bitcast ($uint<4>) _b0  ) ))  (( ~ ($bitcast ($uint<4>) _b0  ) ) && ($bitcast ($uint<4>) _b0  )) )  $buffering 1
_setQueueElement_assign_stmt_1117_c_macro_; 
// 	$volatile wval := ( $mux (write_index [] 0 ) (($bitcast ($uint<32>) _b0  ) && q_w_data)  (q_w_data && ($bitcast ($uint<32>) _b0  )) )  $buffering 1
_setQueueElement_assign_stmt_1131_c_macro_; 
// $report (setQueueElement addresses 	 element_pair_address element_pair_address 	 q_w_data q_w_data 	 bmask bmask 	 wval wval )
_setQueueElement_stmt_1136_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) bmask element_pair_address wval ) (ignore ) 
_setQueueElement_call_stmt_1145_c_macro_; 
_setQueueElement_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_setQueueElement_series_block_stmt_1080_c_mutex_);
}
void _setQueuePointers_(bit_vector* __pq_base_address, bit_vector* __pwp, bit_vector* __prp)
{
MUTEX_DECL(_setQueuePointers_series_block_stmt_680_c_mutex_);
MUTEX_LOCK(_setQueuePointers_series_block_stmt_680_c_mutex_);
_setQueuePointers_inner_inarg_prep_macro__; 
// $report (setQueuePointers set 	 q_base_address q_base_address 	 wp wp 	 rp rp )
_setQueuePointers_stmt_687_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) (q_base_address + 4 ) (rp && wp) ) (ignore ) 
_setQueuePointers_call_stmt_702_c_macro_; 
_setQueuePointers_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_setQueuePointers_series_block_stmt_680_c_mutex_);
}
void _transmitEngineDaemon_()
{
MUTEX_DECL(_transmitEngineDaemon_series_block_stmt_2069_c_mutex_);
MUTEX_LOCK(_transmitEngineDaemon_series_block_stmt_2069_c_mutex_);
_transmitEngineDaemon_inner_inarg_prep_macro__; 
// 	LAST_READ_TX_QUEUE_INDEX := 0  $buffering 1// bits of buffering = 6. 
_transmitEngineDaemon_assign_stmt_2072_c_macro_; 
_transmitEngineDaemon_branch_block_stmt_2073_c_export_decl_macro_; 
{
// merge  file nic.linked.aa, line 777
_transmitEngineDaemon_merge_stmt_2074_c_preamble_macro_; 
_transmitEngineDaemon_merge_stmt_2074_c_postamble_macro_; 
// if statement :  file nic.linked.aa, line 33975408
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_2076,32);\
__declare_static_bit_vector(konst_2077,32);\
bit_vector_clear(&konst_2077);\
__declare_static_bit_vector(BITSEL_u32_u1_2078,1);\
__declare_static_bit_vector(NOT_u1_u1_2079,1);\
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_2076));\
bit_vector_clear(&konst_2077);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_2076), &(konst_2077), &(BITSEL_u32_u1_2078));\
bit_vector_not( &(BITSEL_u32_u1_2078), &(NOT_u1_u1_2079));\
if (has_undefined_bit(&NOT_u1_u1_2079)) {fprintf(stderr, "Error: variable NOT_u1_u1_2079 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_2079));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_2079)) { 
/* 			$place[not_enabled_yet_loopback]
*/  goto not_enabled_yet_loopback_2073;
} 
else {
 ;
}
// $report (transmitEngineDaemon got_control )
_transmitEngineDaemon_stmt_2082_c_macro_; 
{
// do-while:   file nic.linked.aa, line 783
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_2161,32);\
__declare_static_bit_vector(konst_2162,32);\
bit_vector_clear(&konst_2162);\
__declare_static_bit_vector(BITSEL_u32_u1_2163,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 785
_transmitEngineDaemon_merge_stmt_2084_c_preamble_macro_; 
// 			$phi tx_q_index := 			  ((LAST_READ_TX_QUEUE_INDEX + 1 ) & ($bitcast ($uint<6>) (NUMBER_OF_SERVERS - 1 ) )) $on   $entry ,   $loopback 
 // type of target is $uint<6>
_transmitEngineDaemon_phi_stmt_2085_c_macro_; 
// 			$phi count := 			  ($bitcast ($uint<32>) _b1  ) $on   $entry 			  ncount $on   $loopback 
 // type of target is $uint<32>
_transmitEngineDaemon_phi_stmt_2095_c_macro_; 
_transmitEngineDaemon_merge_stmt_2084_c_postamble_macro_; 
// $report (transmitEngineDaemon trying_to_get_pointer_from_tx_queue 			 tx_q_index tx_q_index )
_transmitEngineDaemon_stmt_2102_c_macro_; 
// 			$call getTxPacketPointerFromServer (tx_q_index ) (pkt_pointer tx_flag ) 
_transmitEngineDaemon_call_stmt_2106_c_macro_; 
// 			$guard (~tx_flag) $call transmitPacket (pkt_pointer ) (transmitted_flag ) 
_transmitEngineDaemon_call_stmt_2110_c_macro_; 
// $guard (~tx_flag) $report (transmitEngineDaemon got_pointer_now_transmitting_packet 			 pkt_pointer pkt_pointer 			 tx_flag tx_flag )
_transmitEngineDaemon_stmt_2114_c_macro_; 
// $guard (~tx_flag) $report (transmitEngineDaemon packet_transmitted 			 transmitted_flag transmitted_flag )
_transmitEngineDaemon_stmt_2117_c_macro_; 
// 			$volatile push_pointer_back_to_free_Q := (( ~ tx_flag ) & transmitted_flag) $buffering 1
_transmitEngineDaemon_assign_stmt_2123_c_macro_; 
// $report (transmitEngineDaemon pushing_back_to_free_queue 			 push_pointer_back_to_free_Q push_pointer_back_to_free_Q 			 pkt_pointer pkt_pointer )
_transmitEngineDaemon_stmt_2126_c_macro_; 
// 			$guard (push_pointer_back_to_free_Q) $call pushIntoQueue (($bitcast ($uint<1>) _b1  ) FREE_Q pkt_pointer ) (push_status ) 
_transmitEngineDaemon_call_stmt_2133_c_macro_; 
// $guard (push_pointer_back_to_free_Q) $report (transmitEngineDaemon writing_count_to_reg_21 			 count count )
_transmitEngineDaemon_stmt_2136_c_macro_; 
// 			$guard (push_pointer_back_to_free_Q) $call AccessRegister (($bitcast ($uint<1>) _b0  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) 21  count ) (ignore_resp ) 
_transmitEngineDaemon_call_stmt_2146_c_macro_; 
// 			$volatile ncount := ( $mux push_pointer_back_to_free_Q (count + 1 )  count )  $buffering 1
_transmitEngineDaemon_assign_stmt_2154_c_macro_; 
// $report (transmitEngineDaemon pushed_back_to_free_queue 			 push_status push_status )
_transmitEngineDaemon_stmt_2156_c_macro_; 
// 			LAST_READ_TX_QUEUE_INDEX := tx_q_index $buffering 1// bits of buffering = 6. 
_transmitEngineDaemon_assign_stmt_2159_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_2161));\
bit_vector_clear(&konst_2162);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_2161), &(konst_2162), &(BITSEL_u32_u1_2163));\
if (has_undefined_bit(&BITSEL_u32_u1_2163)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_2163 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_2163));assert(0);} \

if (!bit_vector_to_uint64(0, &BITSEL_u32_u1_2163)) break;
} 
}
/* 		$place[disable_loopback]
*/  goto disable_loopback_2073;
_transmitEngineDaemon_branch_block_stmt_2073_c_export_apply_macro_;
}
_transmitEngineDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_transmitEngineDaemon_series_block_stmt_2069_c_mutex_);
}
void transmitEngineDaemon()
{
_transmitEngineDaemon_outer_arg_decl_macro__;
_transmitEngineDaemon_();
_transmitEngineDaemon_outer_op_xfer_macro__;
}


void _transmitPacket_(bit_vector* __ppacket_pointer, bit_vector*  __pstatus)
{
MUTEX_DECL(_transmitPacket_series_block_stmt_1940_c_mutex_);
MUTEX_LOCK(_transmitPacket_series_block_stmt_1940_c_mutex_);
_transmitPacket_inner_inarg_prep_macro__; 
// 	$volatile control_data_addr := ($bitcast ($uint<36>) (( $slice packet_pointer 31 0 )  && ($bitcast ($uint<4>) _b0  )) ) $buffering 1
_transmitPacket_assign_stmt_1950_c_macro_; 
// $report (transmitPacket control_data_addr_is 	 packet_pointer packet_pointer 	 control_data_addr control_data_addr )
_transmitPacket_stmt_1953_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) FULL_BYTE_MASK control_data_addr ($bitcast ($uint<64>) _b0  ) ) (control_data ) 
_transmitPacket_call_stmt_1963_c_macro_; 
// 	$volatile unused := ( $slice control_data 59 16 )  $buffering 1
_transmitPacket_assign_stmt_1968_c_macro_; 
// 	$volatile packet_size := ( $slice control_data 15 8 )  $buffering 1
_transmitPacket_assign_stmt_1972_c_macro_; 
// 	$volatile last_tkeep := ( $slice control_data 7 0 )  $buffering 1
_transmitPacket_assign_stmt_1976_c_macro_; 
// $report (transmitPacket control_data_received_is 	 packet_size packet_size 	 last_tkeep last_tkeep )
_transmitPacket_stmt_1979_c_macro_; 
_transmitPacket_branch_block_stmt_1980_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 747
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 749
_transmitPacket_merge_stmt_1982_c_preamble_macro_; 
// 			$phi count_down := 			  ncount_down $on   $loopback 			  (packet_size - 16 ) $on   $entry 
 // type of target is $uint<8>
_transmitPacket_phi_stmt_1983_c_macro_; 
// 			$phi mem_addr := 			  nmem_addr $on   $loopback 			  (control_data_addr + 24 ) $on   $entry 
 // type of target is $uint<36>
_transmitPacket_phi_stmt_1989_c_macro_; 
_transmitPacket_merge_stmt_1982_c_postamble_macro_; 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) FULL_BYTE_MASK mem_addr ($bitcast ($uint<64>) _b0  ) ) (data ) 
_transmitPacket_call_stmt_2005_c_macro_; 
// 			nic_to_mac_transmit_pipe := ((($bitcast ($uint<1>) _b0  ) && data) && FULL_BYTE_MASK) $buffering 1// bits of buffering = 73. 
_transmitPacket_assign_stmt_2013_c_macro_; 
// 			$volatile ncount_down := (count_down - 8 ) $buffering 1
_transmitPacket_assign_stmt_2018_c_macro_; 
// 			$volatile nmem_addr := (mem_addr + 8 ) $buffering 1
_transmitPacket_assign_stmt_2023_c_macro_; 
// $report (transmitPacket count_down_ 			 data data 			 count_down count_down 			 ncount_down ncount_down 			 mem_addr mem_addr 			 nmem_addr nmem_addr )
_transmitPacket_stmt_2029_c_macro_; 
// 			$volatile not_last_word := (ncount_down > 8 ) $buffering 1
_transmitPacket_assign_stmt_2034_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
if (has_undefined_bit(&not_last_word)) {fprintf(stderr, "Error: variable not_last_word has undefined value (%s) at test point.\n", to_string(&not_last_word));assert(0);} \

if (!bit_vector_to_uint64(0, &not_last_word)) break;
} 
}
// $report (transmitPacket accessing_last_word 		 nmem_addr nmem_addr )
_transmitPacket_stmt_2038_c_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) FULL_BYTE_MASK nmem_addr ($bitcast ($uint<64>) _b0  ) ) (last_word ) 
_transmitPacket_call_stmt_2048_c_macro_; 
// $report (transmitPacket sending_last_word 		 last_word last_word )
_transmitPacket_stmt_2050_c_macro_; 
// 		nic_to_mac_transmit_pipe := ((($bitcast ($uint<1>) _b1  ) && last_word) && last_tkeep) $buffering 1// bits of buffering = 73. 
_transmitPacket_assign_stmt_2058_c_macro_; 
// 		status := (packet_size == ($bitcast ($uint<8>) (nmem_addr - control_data_addr) )) $buffering 1// bits of buffering = 1. 
_transmitPacket_assign_stmt_2066_c_macro_; 
_transmitPacket_branch_block_stmt_1980_c_export_apply_macro_;
}
_transmitPacket_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_transmitPacket_series_block_stmt_1940_c_mutex_);
}
void _writeControlInformationToMem_(bit_vector* __pbase_buffer_pointer, bit_vector* __ppacket_size, bit_vector* __plast_keep)
{
MUTEX_DECL(_writeControlInformationToMem_series_block_stmt_1042_c_mutex_);
MUTEX_LOCK(_writeControlInformationToMem_series_block_stmt_1042_c_mutex_);
_writeControlInformationToMem_inner_inarg_prep_macro__; 
// 	$volatile control_data := ($bitcast ($uint<64>) (packet_size && last_keep) ) $buffering 1
_writeControlInformationToMem_assign_stmt_1051_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) FULL_BYTE_MASK base_buffer_pointer control_data ) (ignore_return ) 
_writeControlInformationToMem_call_stmt_1060_c_macro_; 
_writeControlInformationToMem_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_writeControlInformationToMem_series_block_stmt_1042_c_mutex_);
}
void _writeEthernetHeaderToMem_(bit_vector* __pbuf_pointer, bit_vector*  __pbuf_position)
{
MUTEX_DECL(_writeEthernetHeaderToMem_series_block_stmt_905_c_mutex_);
MUTEX_LOCK(_writeEthernetHeaderToMem_series_block_stmt_905_c_mutex_);
_writeEthernetHeaderToMem_inner_inarg_prep_macro__; 
_writeEthernetHeaderToMem_branch_block_stmt_908_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 279
__declare_static_bit_vector(konst_962,4);\
bit_vector_clear(&konst_962);\
konst_962.val.byte_array[0] = 1;\
__declare_static_bit_vector(ULE_u4_u1_963,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 280
_writeEthernetHeaderToMem_merge_stmt_910_c_preamble_macro_; 
// 			$phi buf_position := 			  (buf_pointer + 8 ) $on   $entry 			  nbuf_position $on   $loopback 
 // type of target is $uint<36>
_writeEthernetHeaderToMem_phi_stmt_911_c_macro_; 
// 			$phi I := 			  ($bitcast ($uint<4>) _b0  ) $on   $entry 			  nI $on   $loopback 
 // type of target is $uint<4>
_writeEthernetHeaderToMem_phi_stmt_917_c_macro_; 
// 			$phi ethernet_header := 			  nic_rx_to_header $on   $entry ,   $loopback 
 // type of target is $uint<73>
_writeEthernetHeaderToMem_phi_stmt_922_c_macro_; 
_writeEthernetHeaderToMem_merge_stmt_910_c_postamble_macro_; 
// $report (writeEthernetHeaderToMem received_eth_header_is 			 ethernet_header ethernet_header 			 buf_position buf_position )
_writeEthernetHeaderToMem_stmt_928_c_macro_; 
// 			$volatile last_bit := ( $slice ethernet_header 72 72 )  $buffering 1
_writeEthernetHeaderToMem_assign_stmt_932_c_macro_; 
// 			$volatile wdata := ( $slice ethernet_header 71 8 )  $buffering 1
_writeEthernetHeaderToMem_assign_stmt_936_c_macro_; 
// 			$volatile wkeep := ( $slice ethernet_header 7 0 )  $buffering 1
_writeEthernetHeaderToMem_assign_stmt_940_c_macro_; 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) wkeep buf_position wdata ) (ignore_return ) 
_writeEthernetHeaderToMem_call_stmt_949_c_macro_; 
// 			$volatile nI := (I + 1 ) $buffering 1
_writeEthernetHeaderToMem_assign_stmt_954_c_macro_; 
// 			$volatile nbuf_position := (buf_position + 8 ) $buffering 1
_writeEthernetHeaderToMem_assign_stmt_959_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_962);\
konst_962.val.byte_array[0] = 1;\
bit_vector_less_equal(0, &(nI), &(konst_962), &(ULE_u4_u1_963));\
if (has_undefined_bit(&ULE_u4_u1_963)) {fprintf(stderr, "Error: variable ULE_u4_u1_963 has undefined value (%s) at test point.\n", to_string(&ULE_u4_u1_963));assert(0);} \

if (!bit_vector_to_uint64(0, &ULE_u4_u1_963)) break;
} 
}
_writeEthernetHeaderToMem_branch_block_stmt_908_c_export_apply_macro_;
}
_writeEthernetHeaderToMem_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_writeEthernetHeaderToMem_series_block_stmt_905_c_mutex_);
}
void _writePayloadToMem_(bit_vector* __pbase_buf_pointer, bit_vector* __pbuf_pointer, bit_vector*  __ppacket_size_32, bit_vector*  __pbad_packet_identifier, bit_vector*  __plast_keep)
{
MUTEX_DECL(_writePayloadToMem_series_block_stmt_966_c_mutex_);
MUTEX_LOCK(_writePayloadToMem_series_block_stmt_966_c_mutex_);
_writePayloadToMem_inner_inarg_prep_macro__; 
_writePayloadToMem_branch_block_stmt_972_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 306
__declare_static_bit_vector(NOT_u1_u1_1015,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 308
_writePayloadToMem_merge_stmt_974_c_preamble_macro_; 
// 			$phi buf_position := 			  (buf_pointer + 8 ) $on   $entry 			  (buf_position + 8 ) $on   $loopback 
 // type of target is $uint<36>
_writePayloadToMem_phi_stmt_975_c_macro_; 
// 			$phi payload_data := 			  nic_rx_to_packet $on   $entry ,   $loopback 
 // type of target is $uint<73>
_writePayloadToMem_phi_stmt_983_c_macro_; 
_writePayloadToMem_merge_stmt_974_c_postamble_macro_; 
// 			$volatile last_bit := ( $slice payload_data 72 72 )  $buffering 1
_writePayloadToMem_assign_stmt_990_c_macro_; 
// 			$volatile wdata := ( $slice payload_data 71 8 )  $buffering 1
_writePayloadToMem_assign_stmt_994_c_macro_; 
// 			$volatile wkeep := ( $slice payload_data 7 0 )  $buffering 1
_writePayloadToMem_assign_stmt_998_c_macro_; 
// $report (writePayloadToMem writing_payload_to_mem 			 last_bit last_bit 			 wdata wdata 			 wkeep wkeep 			 buf_position buf_position )
_writePayloadToMem_stmt_1003_c_macro_; 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) wkeep buf_position wdata ) (ignore_return ) 
_writePayloadToMem_call_stmt_1012_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_not( &(last_bit), &(NOT_u1_u1_1015));\
if (has_undefined_bit(&NOT_u1_u1_1015)) {fprintf(stderr, "Error: variable NOT_u1_u1_1015 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_1015));assert(0);} \

if (!bit_vector_to_uint64(0, &NOT_u1_u1_1015)) break;
} 
}
_writePayloadToMem_branch_block_stmt_972_c_export_apply_macro_;
}
// 	$volatile bad_packet_identifier := ((tdata == BAD_PACKET_DATA) & (tkeep == 0 )) $buffering 1
_writePayloadToMem_assign_stmt_1025_c_macro_; 
// 	$volatile packet_size_8 := ($bitcast ($uint<8>) (buf_position - base_buf_pointer) ) $buffering 1
_writePayloadToMem_assign_stmt_1031_c_macro_; 
// 	$volatile packet_size_32 := packet_size_8 $buffering 1
_writePayloadToMem_assign_stmt_1034_c_macro_; 
// $report (writePayloadToMem packet_size_is 	 packet_size_8 packet_size_8 	 packet_size_32 packet_size_32 )
_writePayloadToMem_stmt_1037_c_macro_; 
// 	$volatile last_keep := tkeep $buffering 1
_writePayloadToMem_assign_stmt_1040_c_macro_; 
_writePayloadToMem_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_writePayloadToMem_series_block_stmt_966_c_mutex_);
}
DEFINE_THREAD(NicRegisterAccessDaemon);
PTHREAD_DECL(NicRegisterAccessDaemon);
DEFINE_THREAD(ReceiveEngineDaemon);
PTHREAD_DECL(ReceiveEngineDaemon);
DEFINE_THREAD(SoftwareRegisterAccessDaemon);
PTHREAD_DECL(SoftwareRegisterAccessDaemon);
DEFINE_THREAD(macToNicInterface);
PTHREAD_DECL(macToNicInterface);
DEFINE_THREAD(memoryToNicInterface);
PTHREAD_DECL(memoryToNicInterface);
DEFINE_THREAD(memoryToProcessorInterface);
PTHREAD_DECL(memoryToProcessorInterface);
DEFINE_THREAD(nicRxFromMacDaemon);
PTHREAD_DECL(nicRxFromMacDaemon);
DEFINE_THREAD(nicToMacInterface);
PTHREAD_DECL(nicToMacInterface);
DEFINE_THREAD(nicToMemoryInterface);
PTHREAD_DECL(nicToMemoryInterface);
DEFINE_THREAD(nicToProcessorInterface);
PTHREAD_DECL(nicToProcessorInterface);
DEFINE_THREAD(processorToMemoryInterface);
PTHREAD_DECL(processorToMemoryInterface);
DEFINE_THREAD(processorToNicInterface);
PTHREAD_DECL(processorToNicInterface);
DEFINE_THREAD(transmitEngineDaemon);
PTHREAD_DECL(transmitEngineDaemon);
void start_daemons(FILE* fp, int trace_on) {
__report_log_file__ = fp;
__trace_on__ = trace_on;
__init_aa_globals__(); 
PTHREAD_CREATE(NicRegisterAccessDaemon);
PTHREAD_CREATE(ReceiveEngineDaemon);
PTHREAD_CREATE(SoftwareRegisterAccessDaemon);
PTHREAD_CREATE(macToNicInterface);
PTHREAD_CREATE(memoryToNicInterface);
PTHREAD_CREATE(memoryToProcessorInterface);
PTHREAD_CREATE(nicRxFromMacDaemon);
PTHREAD_CREATE(nicToMacInterface);
PTHREAD_CREATE(nicToMemoryInterface);
PTHREAD_CREATE(nicToProcessorInterface);
PTHREAD_CREATE(processorToMemoryInterface);
PTHREAD_CREATE(processorToNicInterface);
PTHREAD_CREATE(transmitEngineDaemon);
}
void stop_daemons() {
PTHREAD_CANCEL(NicRegisterAccessDaemon);
PTHREAD_CANCEL(ReceiveEngineDaemon);
PTHREAD_CANCEL(SoftwareRegisterAccessDaemon);
PTHREAD_CANCEL(macToNicInterface);
PTHREAD_CANCEL(memoryToNicInterface);
PTHREAD_CANCEL(memoryToProcessorInterface);
PTHREAD_CANCEL(nicRxFromMacDaemon);
PTHREAD_CANCEL(nicToMacInterface);
PTHREAD_CANCEL(nicToMemoryInterface);
PTHREAD_CANCEL(nicToProcessorInterface);
PTHREAD_CANCEL(processorToMemoryInterface);
PTHREAD_CANCEL(processorToNicInterface);
PTHREAD_CANCEL(transmitEngineDaemon);
}

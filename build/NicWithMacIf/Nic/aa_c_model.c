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
register_pipe("AFB_NIC_REQUEST", 80, 8, 0);\
register_pipe("AFB_NIC_RESPONSE", 40, 8, 0);\
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
register_pipe("MEMORY_TO_NIC_RESPONSE", 18432, 8, 0);\
register_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE", 48, 8, 0);\
register_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE", 40, 8, 0);\
register_pipe("NIC_TO_MEMORY_REQUEST", 28672, 8, 0);\
register_signal("NUMBER_OF_SERVERS", 32);\
init_static_bit_vector(&(QUEUE_SIZE_MASK), 32);\
bit_vector_clear(&QUEUE_SIZE_MASK);\
QUEUE_SIZE_MASK.val.byte_array[0] = 3;\
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
register_pipe("control_word_request_pipe_0", 16, 32, 0);\
register_pipe("control_word_request_pipe_1", 16, 64, 0);\
register_pipe("control_word_response_pipe", 16, 64, 0);\
register_pipe("mac_to_nic_data", 20480, 8, 0);\
register_pipe("mac_to_nic_data_0", 2048, 64, 0);\
register_pipe("mac_to_nic_data_1", 2048, 16, 0);\
register_pipe("mem_req0_pipe0", 1024, 64, 0);\
register_pipe("mem_req0_pipe1", 1024, 64, 0);\
register_pipe("mem_req1_pipe0", 1024, 64, 0);\
register_pipe("mem_req1_pipe1", 1024, 64, 0);\
register_pipe("mem_resp0_pipe0", 1024, 64, 0);\
register_pipe("mem_resp0_pipe1", 1024, 8, 0);\
register_pipe("mem_resp1_pipe0", 1024, 64, 0);\
register_pipe("mem_resp1_pipe1", 1024, 8, 0);\
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
register_pipe("nic_rx_to_header", 20480, 8, 0);\
register_pipe("nic_rx_to_packet", 20480, 8, 0);\
register_pipe("nic_to_mac_data_0", 2048, 64, 0);\
register_pipe("nic_to_mac_data_1", 2048, 16, 0);\
register_pipe("nic_to_mac_transmit_pipe", 100, 8, 0);\
}
void _AccessRegister_(bit_vector* __prwbar, bit_vector* __pbmask, bit_vector* __pregister_index, bit_vector* __pwdata, bit_vector*  __prdata)
{
MUTEX_DECL(_AccessRegister_series_block_stmt_76_c_mutex_);
MUTEX_LOCK(_AccessRegister_series_block_stmt_76_c_mutex_);
_AccessRegister_inner_inarg_prep_macro__; 
// $report (AccessRegister In_Access_Register )
_AccessRegister_stmt_84_c_macro_; 
// 	$volatile request := ((rwbar && bmask) && (register_index && wdata)) $buffering 1
_AccessRegister_assign_stmt_93_c_macro_; 
// $report (AccessRegister Request 	 rwbar rwbar 	 bmask bmask 	 register_index register_index 	 wdata wdata )
_AccessRegister_stmt_98_c_macro_; 
// 	NIC_REQUEST_REGISTER_ACCESS_PIPE := request $buffering 1// bits of buffering = 43. 
_AccessRegister_assign_stmt_101_c_macro_; 
// $report (AccessRegister Request_Sent )
_AccessRegister_stmt_102_c_macro_; 
// 	response := NIC_RESPONSE_REGISTER_ACCESS_PIPE $buffering 1// bits of buffering = 33. 
_AccessRegister_assign_stmt_105_c_macro_; 
// $report (AccessRegister Response 	 response response )
_AccessRegister_stmt_107_c_macro_; 
// 	$volatile status := ( $slice response 32 32 )  $buffering 1
_AccessRegister_assign_stmt_111_c_macro_; 
// 	$volatile rdata := ( $slice response 31 0 )  $buffering 1
_AccessRegister_assign_stmt_115_c_macro_; 
_AccessRegister_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_AccessRegister_series_block_stmt_76_c_mutex_);
}
void _NicRegisterAccessDaemon_()
{
MUTEX_DECL(_NicRegisterAccessDaemon_series_block_stmt_197_c_mutex_);
MUTEX_LOCK(_NicRegisterAccessDaemon_series_block_stmt_197_c_mutex_);
_NicRegisterAccessDaemon_inner_inarg_prep_macro__; 
_NicRegisterAccessDaemon_branch_block_stmt_198_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 115
__declare_static_bit_vector(konst_252,1);\
bit_vector_clear(&konst_252);\
konst_252.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 117
_NicRegisterAccessDaemon_merge_stmt_200_c_preamble_macro_; 
_NicRegisterAccessDaemon_merge_stmt_200_c_postamble_macro_; 
// 			req := NIC_REQUEST_REGISTER_ACCESS_PIPE $buffering 1// bits of buffering = 43. 
_NicRegisterAccessDaemon_assign_stmt_203_c_macro_; 
// $report (NicRegisterAccessDaemon Request_Received )
_NicRegisterAccessDaemon_stmt_204_c_macro_; 
// 			$volatile rwbar := ( $slice req 42 42 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_208_c_macro_; 
// 			$volatile bmask := ( $slice req 41 38 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_212_c_macro_; 
// 			$volatile index := ( $slice req 37 32 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_216_c_macro_; 
// 			$volatile wdata := ( $slice req 31 0 )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_220_c_macro_; 
// 			rval := nic_registers[index] $buffering 1// bits of buffering = 32. 
_NicRegisterAccessDaemon_assign_stmt_224_c_macro_; 
// $report (NicRegisterAccessDaemon Request 			 rval rval 			 index index )
_NicRegisterAccessDaemon_stmt_227_c_macro_; 
// 			$guard (~rwbar) $call UpdateRegister (bmask rval wdata index ) (wval ) 
_NicRegisterAccessDaemon_call_stmt_234_c_macro_; 
// 			$volatile rdata := ( $mux rwbar rval  ($bitcast ($uint<32>) _b0  ) )  $buffering 1
_NicRegisterAccessDaemon_assign_stmt_241_c_macro_; 
// 			$volatile resp := (($bitcast ($uint<1>) _b0  ) && rdata) $buffering 1
_NicRegisterAccessDaemon_assign_stmt_247_c_macro_; 
// 			NIC_RESPONSE_REGISTER_ACCESS_PIPE := resp $buffering 1// bits of buffering = 33. 
_NicRegisterAccessDaemon_assign_stmt_250_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_252);\
konst_252.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_252)) break;
} 
}
_NicRegisterAccessDaemon_branch_block_stmt_198_c_export_apply_macro_;
}
_NicRegisterAccessDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_NicRegisterAccessDaemon_series_block_stmt_197_c_mutex_);
}
void NicRegisterAccessDaemon()
{
_NicRegisterAccessDaemon_outer_arg_decl_macro__;
_NicRegisterAccessDaemon_();
_NicRegisterAccessDaemon_outer_op_xfer_macro__;
}


void _ReceiveEngineDaemon_()
{
MUTEX_DECL(_ReceiveEngineDaemon_series_block_stmt_951_c_mutex_);
MUTEX_LOCK(_ReceiveEngineDaemon_series_block_stmt_951_c_mutex_);
_ReceiveEngineDaemon_inner_inarg_prep_macro__; 
// 	LAST_WRITTEN_RX_QUEUE_INDEX := 0  $buffering 1// bits of buffering = 6. 
_ReceiveEngineDaemon_assign_stmt_954_c_macro_; 
_ReceiveEngineDaemon_branch_block_stmt_955_c_export_decl_macro_; 
{
// $report (ReceiveEngineDaemon waiting_for_control )
_ReceiveEngineDaemon_stmt_956_c_macro_; 
// merge  file nic.linked.aa, line 384
_ReceiveEngineDaemon_merge_stmt_957_c_preamble_macro_; 
_ReceiveEngineDaemon_merge_stmt_957_c_postamble_macro_; 
// if statement :  file nic.linked.aa, line 0
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_959,32);\
__declare_static_bit_vector(konst_960,32);\
bit_vector_clear(&konst_960);\
__declare_static_bit_vector(BITSEL_u32_u1_961,1);\
__declare_static_bit_vector(NOT_u1_u1_962,1);\
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_959));\
bit_vector_clear(&konst_960);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_959), &(konst_960), &(BITSEL_u32_u1_961));\
bit_vector_not( &(BITSEL_u32_u1_961), &(NOT_u1_u1_962));\
if (has_undefined_bit(&NOT_u1_u1_962)) {fprintf(stderr, "Error: variable NOT_u1_u1_962 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_962));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_962)) { 
/* 			$place[not_enabled_yet_loopback]
*/  goto not_enabled_yet_loopback_955;
} 
else {
 ;
}
// $report (ReceiveEngineDaemon got_the__control )
_ReceiveEngineDaemon_stmt_965_c_macro_; 
{
// do-while:   file nic.linked.aa, line 390
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1028,32);\
__declare_static_bit_vector(konst_1029,32);\
bit_vector_clear(&konst_1029);\
__declare_static_bit_vector(BITSEL_u32_u1_1030,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 392
_ReceiveEngineDaemon_merge_stmt_967_c_preamble_macro_; 
_ReceiveEngineDaemon_merge_stmt_967_c_postamble_macro_; 
// $report (ReceiveEngineDaemon called_pop_From_queue )
_ReceiveEngineDaemon_stmt_968_c_macro_; 
// 			$call popFromQueue (($bitcast ($uint<1>) _b1  ) FREE_Q ) (rx_buffer_pointer_32 status ) 
_ReceiveEngineDaemon_call_stmt_974_c_macro_; 
// $report (ReceiveEngineDaemon rx_buffer 			 rx_buffer_pointer_32 rx_buffer_pointer_32 )
_ReceiveEngineDaemon_stmt_976_c_macro_; 
// 			$volatile rx_buffer_pointer_36 := (rx_buffer_pointer_32 && ($bitcast ($uint<4>) _b0  )) $buffering 1
_ReceiveEngineDaemon_assign_stmt_982_c_macro_; 
// $report (ReceiveEngineDaemon rx_buffer_val 			 rx_buffer_pointer_36 rx_buffer_pointer_36 )
_ReceiveEngineDaemon_stmt_984_c_macro_; 
// $report (ReceiveEngineDaemon calling_loadBuffer 			 status status )
_ReceiveEngineDaemon_stmt_986_c_macro_; 
// 			$guard (~status) $call loadBuffer (rx_buffer_pointer_36 ) (bad_packet_identifier ) 
_ReceiveEngineDaemon_call_stmt_990_c_macro_; 
// 			$volatile ok_flag := (( ~ status ) & ( ~ bad_packet_identifier )) $buffering 1
_ReceiveEngineDaemon_assign_stmt_997_c_macro_; 
// 			$volatile free_flag := (( ~ status ) & bad_packet_identifier) $buffering 1
_ReceiveEngineDaemon_assign_stmt_1003_c_macro_; 
// 			$volatile cond := (ok_flag == 1 ) $buffering 1
_ReceiveEngineDaemon_assign_stmt_1008_c_macro_; 
// $report (ReceiveEngineDaemon populating_rx_queue 			 ok_flag ok_flag 			 cond cond )
_ReceiveEngineDaemon_stmt_1011_c_macro_; 
// $report (ReceiveEngineDaemon running_ok_flag )
_ReceiveEngineDaemon_stmt_1012_c_macro_; 
// 			$guard (ok_flag) $call populateRxQueue (rx_buffer_pointer_36 ) () 
_ReceiveEngineDaemon_call_stmt_1015_c_macro_; 
// $report (ReceiveEngineDaemon pushing_into_free_q 			 free_flag free_flag )
_ReceiveEngineDaemon_stmt_1017_c_macro_; 
// 			$guard (free_flag) $call pushIntoQueue (($bitcast ($uint<1>) _b1  ) FREE_Q ( $slice rx_buffer_pointer_36 35 4 )  ) (push_status ) 
_ReceiveEngineDaemon_call_stmt_1025_c_macro_; 
// $report (ReceiveEngineDaemon completed_iteration_in_receive_engine )
_ReceiveEngineDaemon_stmt_1026_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1028));\
bit_vector_clear(&konst_1029);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1028), &(konst_1029), &(BITSEL_u32_u1_1030));\
if (has_undefined_bit(&BITSEL_u32_u1_1030)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1030 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1030));assert(0);} \

if (!bit_vector_to_uint64(0, &BITSEL_u32_u1_1030)) break;
} 
}
/* 		$place[disable_loopback]
*/  goto disable_loopback_955;
_ReceiveEngineDaemon_branch_block_stmt_955_c_export_apply_macro_;
}
_ReceiveEngineDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_ReceiveEngineDaemon_series_block_stmt_951_c_mutex_);
}
void ReceiveEngineDaemon()
{
_ReceiveEngineDaemon_outer_arg_decl_macro__;
_ReceiveEngineDaemon_();
_ReceiveEngineDaemon_outer_op_xfer_macro__;
}


void _SoftwareRegisterAccessDaemon_()
{
MUTEX_DECL(_SoftwareRegisterAccessDaemon_series_block_stmt_1034_c_mutex_);
MUTEX_LOCK(_SoftwareRegisterAccessDaemon_series_block_stmt_1034_c_mutex_);
_SoftwareRegisterAccessDaemon_inner_inarg_prep_macro__; 
// $report (SoftwareRegisterAccessDaemon started_SoftwareRegisterAccessDaemon )
_SoftwareRegisterAccessDaemon_stmt_1035_c_macro_; 
_SoftwareRegisterAccessDaemon_branch_block_stmt_1036_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 422
__declare_static_bit_vector(konst_1199,1);\
bit_vector_clear(&konst_1199);\
konst_1199.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 424
_SoftwareRegisterAccessDaemon_merge_stmt_1038_c_preamble_macro_; 
// 			$phi INIT := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  ($bitcast ($uint<1>) _b1  ) $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1039_c_macro_; 
// 			$phi control_register := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  check_control_regsiter $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1045_c_macro_; 
// 			$phi free_q := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  check_free_q $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1050_c_macro_; 
// 			$phi num_server := 			  ($bitcast ($uint<1>) _b0  ) $on   $entry 			  check_num_server $on   $loopback 
 // type of target is $uint<1>
_SoftwareRegisterAccessDaemon_phi_stmt_1055_c_macro_; 
_SoftwareRegisterAccessDaemon_merge_stmt_1038_c_postamble_macro_; 
// $report (SoftwareRegisterAccessDaemon looping_in_SoftwareRegisterAccessDaemon )
_SoftwareRegisterAccessDaemon_stmt_1061_c_macro_; 
// 			control_data := nic_registers[0 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1065_c_macro_; 
// $report (SoftwareRegisterAccessDaemon control 			 control_data control_data )
_SoftwareRegisterAccessDaemon_stmt_1067_c_macro_; 
// 			$volatile update_control_register_pipe := (( ~ INIT ) | (INIT & control_register)) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1075_c_macro_; 
// 			$volatile update_free_q_pipe := (( ~ INIT ) | (INIT & free_q)) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1083_c_macro_; 
// 			$volatile update_server_num := (( ~ INIT ) | (INIT & num_server)) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1091_c_macro_; 
// 			$guard (update_control_register_pipe) CONTROL_REGISTER := nic_registers[0 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1096_c_macro_; 
// 			$guard (update_free_q_pipe) FREE_Q_32 := nic_registers[18 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1101_c_macro_; 
// 			$guard (update_free_q_pipe) FREE_Q := ($bitcast ($uint<36>) (FREE_Q_32 && ($bitcast ($uint<3>) _b0  )) ) $buffering 1// bits of buffering = 36. 
_SoftwareRegisterAccessDaemon_assign_stmt_1109_c_macro_; 
// 			$guard (update_server_num) NUMBER_OF_SERVERS := nic_registers[1 ] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1114_c_macro_; 
// 			req := AFB_NIC_REQUEST $buffering 1// bits of buffering = 74. 
_SoftwareRegisterAccessDaemon_assign_stmt_1117_c_macro_; 
// $report (SoftwareRegisterAccessDaemon got_afb_req 			 req req )
_SoftwareRegisterAccessDaemon_stmt_1119_c_macro_; 
// 			$volatile lock := ( $slice req 73 73 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1123_c_macro_; 
// 			$volatile rwbar := ( $slice req 72 72 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1127_c_macro_; 
// 			$volatile bmask := ( $slice req 71 68 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1131_c_macro_; 
// 			$volatile addr := ( $slice req 67 32 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1135_c_macro_; 
// 			$volatile wdata := ( $slice req 31 0 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1139_c_macro_; 
// 			$volatile index := ( $slice addr 5 0 )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1143_c_macro_; 
// 			$volatile check_control_regsiter := ((index == 0 ) & (rwbar == 0 )) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1152_c_macro_; 
// 			$volatile check_free_q := ((index == 18 ) & (rwbar == 0 )) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1161_c_macro_; 
// 			$volatile check_num_server := ((index == 1 ) & (rwbar == 0 )) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1170_c_macro_; 
// 			rval := nic_registers[index] $buffering 1// bits of buffering = 32. 
_SoftwareRegisterAccessDaemon_assign_stmt_1174_c_macro_; 
// 			$guard (~rwbar) $call UpdateRegister (bmask rval wdata index ) (wval ) 
_SoftwareRegisterAccessDaemon_call_stmt_1181_c_macro_; 
// 			$volatile rdata := ( $mux rwbar rval  ($bitcast ($uint<32>) _b0  ) )  $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1188_c_macro_; 
// 			$volatile resp := (($bitcast ($uint<1>) _b0  ) && rdata) $buffering 1
_SoftwareRegisterAccessDaemon_assign_stmt_1194_c_macro_; 
// 			AFB_NIC_RESPONSE := resp $buffering 1// bits of buffering = 33. 
_SoftwareRegisterAccessDaemon_assign_stmt_1197_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1199);\
konst_1199.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1199)) break;
} 
}
_SoftwareRegisterAccessDaemon_branch_block_stmt_1036_c_export_apply_macro_;
}
_SoftwareRegisterAccessDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_SoftwareRegisterAccessDaemon_series_block_stmt_1034_c_mutex_);
}
void SoftwareRegisterAccessDaemon()
{
_SoftwareRegisterAccessDaemon_outer_arg_decl_macro__;
_SoftwareRegisterAccessDaemon_();
_SoftwareRegisterAccessDaemon_outer_op_xfer_macro__;
}


void _UpdateRegister_(bit_vector* __pbmask, bit_vector* __prval, bit_vector* __pwdata, bit_vector* __pindex, bit_vector*  __pwval)
{
MUTEX_DECL(_UpdateRegister_series_block_stmt_117_c_mutex_);
MUTEX_LOCK(_UpdateRegister_series_block_stmt_117_c_mutex_);
_UpdateRegister_inner_inarg_prep_macro__; 
// 	$volatile b0 := ( $slice bmask 3 3 )  $buffering 1
_UpdateRegister_assign_stmt_126_c_macro_; 
// 	$volatile b1 := ( $slice bmask 2 2 )  $buffering 1
_UpdateRegister_assign_stmt_130_c_macro_; 
// 	$volatile b2 := ( $slice bmask 1 1 )  $buffering 1
_UpdateRegister_assign_stmt_134_c_macro_; 
// 	$volatile b3 := ( $slice bmask 0 0 )  $buffering 1
_UpdateRegister_assign_stmt_138_c_macro_; 
// 	$volatile r0 := ( $slice rval 31 24 )  $buffering 1
_UpdateRegister_assign_stmt_142_c_macro_; 
// 	$volatile r1 := ( $slice rval 23 16 )  $buffering 1
_UpdateRegister_assign_stmt_146_c_macro_; 
// 	$volatile r2 := ( $slice rval 15 8 )  $buffering 1
_UpdateRegister_assign_stmt_150_c_macro_; 
// 	$volatile r3 := ( $slice rval 7 0 )  $buffering 1
_UpdateRegister_assign_stmt_154_c_macro_; 
// 	$volatile w0 := ( $slice wdata 31 24 )  $buffering 1
_UpdateRegister_assign_stmt_158_c_macro_; 
// 	$volatile w1 := ( $slice wdata 23 16 )  $buffering 1
_UpdateRegister_assign_stmt_162_c_macro_; 
// 	$volatile w2 := ( $slice wdata 15 8 )  $buffering 1
_UpdateRegister_assign_stmt_166_c_macro_; 
// 	$volatile w3 := ( $slice wdata 7 0 )  $buffering 1
_UpdateRegister_assign_stmt_170_c_macro_; 
// 	wval := ((( $mux b0 w0  r0 )  && ( $mux b1 w1  r1 ) ) && (( $mux b2 w2  r2 )  && ( $mux b3 w3  r3 ) )) $buffering 1// bits of buffering = 32. 
_UpdateRegister_assign_stmt_191_c_macro_; 
// 	nic_registers[index] := wval $buffering 1// bits of buffering = 32. 
_UpdateRegister_assign_stmt_195_c_macro_; 
_UpdateRegister_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_UpdateRegister_series_block_stmt_117_c_mutex_);
}
void _accessMemory_(bit_vector* __plock, bit_vector* __prwbar, bit_vector* __pbmask, bit_vector* __paddr, bit_vector* __pwdata, bit_vector*  __prdata)
{
MUTEX_DECL(_accessMemory_series_block_stmt_255_c_mutex_);
MUTEX_LOCK(_accessMemory_series_block_stmt_255_c_mutex_);
_accessMemory_inner_inarg_prep_macro__; 
// 	$volatile request := (((lock && rwbar) && bmask) && (addr && wdata)) $buffering 1
_accessMemory_assign_stmt_272_c_macro_; 
// $report (accessMemory byte_mask 	 bmask bmask 	 rwbar rwbar 	 addr addr 	 wdata wdata )
_accessMemory_stmt_277_c_macro_; 
// 	NIC_TO_MEMORY_REQUEST := request $buffering 1// bits of buffering = 110. 
_accessMemory_assign_stmt_280_c_macro_; 
// 	response := MEMORY_TO_NIC_RESPONSE $buffering 1// bits of buffering = 65. 
_accessMemory_assign_stmt_283_c_macro_; 
// 	$volatile err := ( $slice response 64 64 )  $buffering 1
_accessMemory_assign_stmt_287_c_macro_; 
// 	$volatile rdata := ( $slice response 63 0 )  $buffering 1
_accessMemory_assign_stmt_291_c_macro_; 
_accessMemory_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_accessMemory_series_block_stmt_255_c_mutex_);
}
void _acquireMutex_(bit_vector* __pq_base_address, bit_vector*  __pm_ok)
{
MUTEX_DECL(_acquireMutex_series_block_stmt_293_c_mutex_);
MUTEX_LOCK(_acquireMutex_series_block_stmt_293_c_mutex_);
_acquireMutex_inner_inarg_prep_macro__; 
_acquireMutex_branch_block_stmt_296_c_export_decl_macro_; 
{
// 		$volatile mutex_address := q_base_address $buffering 1
_acquireMutex_assign_stmt_299_c_macro_; 
// merge  file nic.linked.aa, line 154
_acquireMutex_merge_stmt_300_c_preamble_macro_; 
_acquireMutex_merge_stmt_300_c_postamble_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b1  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) mutex_address ($bitcast ($uint<64>) _b0  ) ) (mutex_plus_nentries ) 
_acquireMutex_call_stmt_312_c_macro_; 
// 		$volatile mutex_val := ( $slice mutex_plus_nentries 63 32 )  $buffering 1
_acquireMutex_assign_stmt_316_c_macro_; 
// if statement :  file nic.linked.aa, line 0
__declare_static_bit_vector(konst_319,32);\
bit_vector_clear(&konst_319);\
konst_319.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u32_u1_320,1);\
bit_vector_clear(&konst_319);\
konst_319.val.byte_array[0] = 1;\
bit_vector_equal(0, &(mutex_val), &(konst_319), &(EQ_u32_u1_320));\
if (has_undefined_bit(&EQ_u32_u1_320)) {fprintf(stderr, "Error: variable EQ_u32_u1_320 has undefined value (%s) at test point.\n", to_string(&EQ_u32_u1_320));assert(0);} \

if (bit_vector_to_uint64(0, &EQ_u32_u1_320)) { 
/* 			$place[loopback]
*/  goto loopback_296;
} 
else {
 ;
}
// 		$volatile wval := (($bitcast ($uint<32>) _b1  ) && ( $slice mutex_plus_nentries 31 0 ) ) $buffering 1
_acquireMutex_assign_stmt_329_c_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) mutex_address wval ) (ignore ) 
_acquireMutex_call_stmt_340_c_macro_; 
_acquireMutex_branch_block_stmt_296_c_export_apply_macro_;
}
// 	m_ok := ($bitcast ($uint<1>) _b1  ) $buffering 1// bits of buffering = 1. 
_acquireMutex_assign_stmt_345_c_macro_; 
_acquireMutex_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_acquireMutex_series_block_stmt_293_c_mutex_);
}
void _delay_time_(bit_vector* __pT, bit_vector*  __pdelay_done)
{
MUTEX_DECL(_delay_time_series_block_stmt_836_c_mutex_);
MUTEX_LOCK(_delay_time_series_block_stmt_836_c_mutex_);
_delay_time_inner_inarg_prep_macro__; 
_delay_time_branch_block_stmt_839_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 332
__declare_static_bit_vector(konst_854,32);\
bit_vector_clear(&konst_854);\
__declare_static_bit_vector(UGT_u32_u1_855,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 334
_delay_time_merge_stmt_841_c_preamble_macro_; 
// 			$phi R := 			  nR $on   $loopback 			  T $on   $entry 
 // type of target is $uint<32>
_delay_time_phi_stmt_842_c_macro_; 
_delay_time_merge_stmt_841_c_postamble_macro_; 
// 			$volatile nR := (R - 1 ) $buffering 1
_delay_time_assign_stmt_851_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_854);\
bit_vector_greater(0, &(R), &(konst_854), &(UGT_u32_u1_855));\
if (has_undefined_bit(&UGT_u32_u1_855)) {fprintf(stderr, "Error: variable UGT_u32_u1_855 has undefined value (%s) at test point.\n", to_string(&UGT_u32_u1_855));assert(0);} \

if (!bit_vector_to_uint64(0, &UGT_u32_u1_855)) break;
} 
}
// 		delay_done := 1  $buffering 1// bits of buffering = 1. 
_delay_time_assign_stmt_858_c_macro_; 
_delay_time_branch_block_stmt_839_c_export_apply_macro_;
}
_delay_time_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_delay_time_series_block_stmt_836_c_mutex_);
}
void _getQueueElement_(bit_vector* __pq_base_address, bit_vector* __pread_pointer, bit_vector*  __pq_r_data)
{
MUTEX_DECL(_getQueueElement_series_block_stmt_374_c_mutex_);
MUTEX_LOCK(_getQueueElement_series_block_stmt_374_c_mutex_);
_getQueueElement_inner_inarg_prep_macro__; 
// 	$volatile buffer_address := (q_base_address + ($bitcast ($uint<36>) 16  )) $buffering 1
_getQueueElement_assign_stmt_383_c_macro_; 
// 	$volatile element_pair_address := (buffer_address + ($bitcast ($uint<36>) (( $slice read_pointer 31 1 )  && ($bitcast ($uint<3>) _b0  )) )) $buffering 1
_getQueueElement_assign_stmt_396_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) element_pair_address ($bitcast ($uint<64>) _b0  ) ) (element_pair ) 
_getQueueElement_call_stmt_408_c_macro_; 
// 	$volatile e0 := ( $slice element_pair 63 32 )  $buffering 1
_getQueueElement_assign_stmt_412_c_macro_; 
// 	$volatile e1 := ( $slice element_pair 31 0 )  $buffering 1
_getQueueElement_assign_stmt_416_c_macro_; 
// 	q_r_data := ( $mux (read_pointer [] 0 ) e1  e0 )  $buffering 1// bits of buffering = 32. 
_getQueueElement_assign_stmt_424_c_macro_; 
// $report (getQueueElement get_queue_element 	 q_r_data q_r_data 	 q_base_address q_base_address 	 read_pointer read_pointer 	 element_pair_address element_pair_address )
_getQueueElement_stmt_429_c_macro_; 
_getQueueElement_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getQueueElement_series_block_stmt_374_c_mutex_);
}
void _getQueuePointers_(bit_vector* __pq_base_address, bit_vector*  __pwp, bit_vector*  __prp)
{
MUTEX_DECL(_getQueuePointers_series_block_stmt_347_c_mutex_);
MUTEX_LOCK(_getQueuePointers_series_block_stmt_347_c_mutex_);
_getQueuePointers_inner_inarg_prep_macro__; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) (q_base_address + 8 ) ($bitcast ($uint<64>) _b0  ) ) (wp_rp ) 
_getQueuePointers_call_stmt_364_c_macro_; 
// 	$volatile wp := ( $slice wp_rp 63 32 )  $buffering 1
_getQueuePointers_assign_stmt_368_c_macro_; 
// 	$volatile rp := ( $slice wp_rp 31 0 )  $buffering 1
_getQueuePointers_assign_stmt_372_c_macro_; 
_getQueuePointers_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getQueuePointers_series_block_stmt_347_c_mutex_);
}
void _getTxPacketPointerFromServer_(bit_vector* __pqueue_index, bit_vector*  __ppkt_pointer, bit_vector*  __pstatus)
{
MUTEX_DECL(_getTxPacketPointerFromServer_series_block_stmt_1202_c_mutex_);
MUTEX_LOCK(_getTxPacketPointerFromServer_series_block_stmt_1202_c_mutex_);
_getTxPacketPointerFromServer_inner_inarg_prep_macro__; 
// 	$volatile register_index := ($bitcast ($uint<6>) (queue_index + TX_QUEUES_REG_START_OFFSET) ) $buffering 1
_getTxPacketPointerFromServer_assign_stmt_1211_c_macro_; 
// 	$call AccessRegister (($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) register_index ($bitcast ($uint<32>) _b0  ) ) (tx_queue_pointer_32 ) 
_getTxPacketPointerFromServer_call_stmt_1221_c_macro_; 
// 	$volatile tx_queue_pointer_36 := (tx_queue_pointer_32 && ($bitcast ($uint<4>) _b0  )) $buffering 1
_getTxPacketPointerFromServer_assign_stmt_1227_c_macro_; 
// 	$call popFromQueue (($bitcast ($uint<1>) _b0  ) tx_queue_pointer_36 ) (pkt_pointer status ) 
_getTxPacketPointerFromServer_call_stmt_1233_c_macro_; 
// $report (getTxPacketPointerFromServer register_ind 	 register_index register_index 	 tx_queue_pointer_36 tx_queue_pointer_36 	 pkt_pointer pkt_pointer 	 status status )
_getTxPacketPointerFromServer_stmt_1238_c_macro_; 
_getTxPacketPointerFromServer_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_getTxPacketPointerFromServer_series_block_stmt_1202_c_mutex_);
}
void _global_storage_initializer__()
{
MUTEX_DECL(_global_storage_initializer__series_block_stmt_1240_c_mutex_);
MUTEX_LOCK(_global_storage_initializer__series_block_stmt_1240_c_mutex_);
_global_storage_initializer__inner_inarg_prep_macro__; 
/* null */ ;
_global_storage_initializer__inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_global_storage_initializer__series_block_stmt_1240_c_mutex_);
}
void global_storage_initializer_()
{
_global_storage_initializer__outer_arg_decl_macro__;
_global_storage_initializer__();
_global_storage_initializer__outer_op_xfer_macro__;
}


void _loadBuffer_(bit_vector* __prx_buffer_pointer, bit_vector*  __pbad_packet_identifier)
{
MUTEX_DECL(_loadBuffer_series_block_stmt_689_c_mutex_);
MUTEX_LOCK(_loadBuffer_series_block_stmt_689_c_mutex_);
_loadBuffer_inner_inarg_prep_macro__; 
// 	$call writeEthernetHeaderToMem (rx_buffer_pointer ) (new_buf_pointer ) 
_loadBuffer_call_stmt_694_c_macro_; 
// 	$call writePayloadToMem (rx_buffer_pointer new_buf_pointer ) (packet_size bad_packet_identifier last_keep ) 
_loadBuffer_call_stmt_700_c_macro_; 
// 	$guard (~bad_packet_identifier) $call writeControlInformationToMem (rx_buffer_pointer packet_size last_keep ) () 
_loadBuffer_call_stmt_705_c_macro_; 
_loadBuffer_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_loadBuffer_series_block_stmt_689_c_mutex_);
}
void _macToNicInterface_()
{
MUTEX_DECL(_macToNicInterface_series_block_stmt_1243_c_mutex_);
MUTEX_LOCK(_macToNicInterface_series_block_stmt_1243_c_mutex_);
_macToNicInterface_inner_inarg_prep_macro__; 
_macToNicInterface_branch_block_stmt_1244_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 488
__declare_static_bit_vector(konst_1265,1);\
bit_vector_clear(&konst_1265);\
konst_1265.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 490
_macToNicInterface_merge_stmt_1246_c_preamble_macro_; 
// 			$phi rdata0 := 			  mac_to_nic_data_0 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_macToNicInterface_phi_stmt_1247_c_macro_; 
// 			$phi rdata1 := 			  mac_to_nic_data_1 $on   $entry ,   $loopback 
 // type of target is $uint<16>
_macToNicInterface_phi_stmt_1250_c_macro_; 
_macToNicInterface_merge_stmt_1246_c_postamble_macro_; 
// $report (macToNicInterface writing_data 			 rdata1 rdata1 			 rdata0 rdata0 )
_macToNicInterface_stmt_1256_c_macro_; 
// 			mac_to_nic_data := (( $slice rdata1 8 0 )  && rdata0) $buffering 1// bits of buffering = 73. 
_macToNicInterface_assign_stmt_1263_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1265);\
konst_1265.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1265)) break;
} 
}
_macToNicInterface_branch_block_stmt_1244_c_export_apply_macro_;
}
_macToNicInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_macToNicInterface_series_block_stmt_1243_c_mutex_);
}
void macToNicInterface()
{
_macToNicInterface_outer_arg_decl_macro__;
_macToNicInterface_();
_macToNicInterface_outer_op_xfer_macro__;
}


void _memoryToNicInterface_()
{
MUTEX_DECL(_memoryToNicInterface_series_block_stmt_1268_c_mutex_);
MUTEX_LOCK(_memoryToNicInterface_series_block_stmt_1268_c_mutex_);
_memoryToNicInterface_inner_inarg_prep_macro__; 
_memoryToNicInterface_branch_block_stmt_1269_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 508
__declare_static_bit_vector(konst_1287,1);\
bit_vector_clear(&konst_1287);\
konst_1287.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 510
_memoryToNicInterface_merge_stmt_1271_c_preamble_macro_; 
// 			$phi rdata0 := 			  mem_resp1_pipe0 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_memoryToNicInterface_phi_stmt_1272_c_macro_; 
// 			$phi rdata1 := 			  mem_resp1_pipe1 $on   $entry ,   $loopback 
 // type of target is $uint<8>
_memoryToNicInterface_phi_stmt_1275_c_macro_; 
_memoryToNicInterface_merge_stmt_1271_c_postamble_macro_; 
// 			MEMORY_TO_NIC_RESPONSE := ((rdata1 [] 0 ) && rdata0) $buffering 1// bits of buffering = 65. 
_memoryToNicInterface_assign_stmt_1285_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1287);\
konst_1287.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1287)) break;
} 
}
_memoryToNicInterface_branch_block_stmt_1269_c_export_apply_macro_;
}
_memoryToNicInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_memoryToNicInterface_series_block_stmt_1268_c_mutex_);
}
void memoryToNicInterface()
{
_memoryToNicInterface_outer_arg_decl_macro__;
_memoryToNicInterface_();
_memoryToNicInterface_outer_op_xfer_macro__;
}


void _nextLSTATE_(bit_vector* __pRX, bit_vector* __pLSTATE, bit_vector*  __pnLSTATE)
{
MUTEX_DECL(_nextLSTATE_series_block_stmt_1290_c_mutex_);
MUTEX_LOCK(_nextLSTATE_series_block_stmt_1290_c_mutex_);
_nextLSTATE_inner_inarg_prep_macro__; 
// 	$volatile tlast := ( $slice RX 72 72 )  $buffering 1
_nextLSTATE_assign_stmt_1297_c_macro_; 
// 	$volatile tdata := ( $slice RX 71 8 )  $buffering 1
_nextLSTATE_assign_stmt_1301_c_macro_; 
// 	$volatile tkeep := ( $slice RX 7 0 )  $buffering 1
_nextLSTATE_assign_stmt_1305_c_macro_; 
// 	$volatile last_word := (tlast == 1 ) $buffering 1
_nextLSTATE_assign_stmt_1310_c_macro_; 
// 	nLSTATE := ((( $mux (LSTATE == S0) S1  _b0  )  | ( $mux (LSTATE == S1) S2  _b0  ) ) | (( $mux ((LSTATE == S2) & ( ~ last_word )) S2  _b0  )  | ( $mux ((LSTATE == S2) & last_word) S0  _b0  ) )) $buffering 1
_nextLSTATE_assign_stmt_1344_c_macro_; 
_nextLSTATE_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nextLSTATE_series_block_stmt_1290_c_mutex_);
}
void _nicRxFromMacDaemon_()
{
MUTEX_DECL(_nicRxFromMacDaemon_series_block_stmt_1346_c_mutex_);
MUTEX_LOCK(_nicRxFromMacDaemon_series_block_stmt_1346_c_mutex_);
_nicRxFromMacDaemon_inner_inarg_prep_macro__; 
_nicRxFromMacDaemon_branch_block_stmt_1347_c_export_decl_macro_; 
{
// $report (nicRxFromMacDaemon waiting_for_control )
_nicRxFromMacDaemon_stmt_1348_c_macro_; 
// merge  file nic.linked.aa, line 539
_nicRxFromMacDaemon_merge_stmt_1349_c_preamble_macro_; 
_nicRxFromMacDaemon_merge_stmt_1349_c_postamble_macro_; 
// if statement :  file nic.linked.aa, line 0
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1351,32);\
__declare_static_bit_vector(konst_1352,32);\
bit_vector_clear(&konst_1352);\
__declare_static_bit_vector(BITSEL_u32_u1_1353,1);\
__declare_static_bit_vector(NOT_u1_u1_1354,1);\
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1351));\
bit_vector_clear(&konst_1352);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1351), &(konst_1352), &(BITSEL_u32_u1_1353));\
bit_vector_not( &(BITSEL_u32_u1_1353), &(NOT_u1_u1_1354));\
if (has_undefined_bit(&NOT_u1_u1_1354)) {fprintf(stderr, "Error: variable NOT_u1_u1_1354 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_1354));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_1354)) { 
/* 			$place[not_enabled_yet_loopback]
*/  goto not_enabled_yet_loopback_1347;
} 
else {
 ;
}
// $report (nicRxFromMacDaemon got_the__control )
_nicRxFromMacDaemon_stmt_1357_c_macro_; 
{
// do-while:   file nic.linked.aa, line 545
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1403,32);\
__declare_static_bit_vector(konst_1404,32);\
bit_vector_clear(&konst_1404);\
__declare_static_bit_vector(BITSEL_u32_u1_1405,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 547
_nicRxFromMacDaemon_merge_stmt_1359_c_preamble_macro_; 
// 			$phi LSTATE := 			  S0 $on   $entry 			  nLSTATE $on   $loopback 
 // type of target is $uint<2>
_nicRxFromMacDaemon_phi_stmt_1360_c_macro_; 
// 			$phi RX := 			  mac_to_nic_data $on   $entry ,   $loopback 
 // type of target is $uint<73>
_nicRxFromMacDaemon_phi_stmt_1364_c_macro_; 
_nicRxFromMacDaemon_merge_stmt_1359_c_postamble_macro_; 
// $report (nicRxFromMacDaemon data_is 			 RX RX 			 LSTATE LSTATE )
_nicRxFromMacDaemon_stmt_1370_c_macro_; 
//  $volatile 			$call nextLSTATE (RX LSTATE ) (nLSTATE ) 
_nicRxFromMacDaemon_call_stmt_1374_c_macro_; 
// 			$volatile write_to_header := ((LSTATE == S0) | (LSTATE == S1)) $buffering 1
_nicRxFromMacDaemon_assign_stmt_1383_c_macro_; 
// 			$guard (write_to_header) nic_rx_to_header := ( $mux (LSTATE == S1) (( $slice RX 72 8 )  && HEADER_TKEEP)  RX )  $buffering 1// bits of buffering = 73. 
_nicRxFromMacDaemon_assign_stmt_1395_c_macro_; 
// 			nic_rx_to_packet := RX $buffering 1// bits of buffering = 73. 
_nicRxFromMacDaemon_assign_stmt_1398_c_macro_; 
// $report (nicRxFromMacDaemon data_written_is 			 RX RX 			 nLSTATE nLSTATE )
_nicRxFromMacDaemon_stmt_1401_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1403));\
bit_vector_clear(&konst_1404);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1403), &(konst_1404), &(BITSEL_u32_u1_1405));\
if (has_undefined_bit(&BITSEL_u32_u1_1405)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1405 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1405));assert(0);} \

if (!bit_vector_to_uint64(0, &BITSEL_u32_u1_1405)) break;
} 
}
/* 		$place[disable_loopback]
*/  goto disable_loopback_1347;
_nicRxFromMacDaemon_branch_block_stmt_1347_c_export_apply_macro_;
}
_nicRxFromMacDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicRxFromMacDaemon_series_block_stmt_1346_c_mutex_);
}
void nicRxFromMacDaemon()
{
_nicRxFromMacDaemon_outer_arg_decl_macro__;
_nicRxFromMacDaemon_();
_nicRxFromMacDaemon_outer_op_xfer_macro__;
}


void _nicToMacInterface_()
{
MUTEX_DECL(_nicToMacInterface_series_block_stmt_1409_c_mutex_);
MUTEX_LOCK(_nicToMacInterface_series_block_stmt_1409_c_mutex_);
_nicToMacInterface_inner_inarg_prep_macro__; 
_nicToMacInterface_branch_block_stmt_1410_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 570
__declare_static_bit_vector(konst_1429,1);\
bit_vector_clear(&konst_1429);\
konst_1429.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 572
_nicToMacInterface_merge_stmt_1412_c_preamble_macro_; 
// 			$phi rdata := 			  nic_to_mac_transmit_pipe $on   $entry ,   $loopback 
 // type of target is $uint<73>
_nicToMacInterface_phi_stmt_1413_c_macro_; 
_nicToMacInterface_merge_stmt_1412_c_postamble_macro_; 
// $report (nicToMacInterface read_data_is 			 rdata rdata )
_nicToMacInterface_stmt_1418_c_macro_; 
// 			nic_to_mac_data_0 := ( $slice rdata 63 0 )  $buffering 1// bits of buffering = 64. 
_nicToMacInterface_assign_stmt_1422_c_macro_; 
// 			nic_to_mac_data_1 := ($bitcast ($uint<16>) ( $slice rdata 72 64 )  ) $buffering 1// bits of buffering = 16. 
_nicToMacInterface_assign_stmt_1427_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1429);\
konst_1429.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1429)) break;
} 
}
_nicToMacInterface_branch_block_stmt_1410_c_export_apply_macro_;
}
_nicToMacInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicToMacInterface_series_block_stmt_1409_c_mutex_);
}
void nicToMacInterface()
{
_nicToMacInterface_outer_arg_decl_macro__;
_nicToMacInterface_();
_nicToMacInterface_outer_op_xfer_macro__;
}


void _nicToMemoryInterface_()
{
MUTEX_DECL(_nicToMemoryInterface_series_block_stmt_1432_c_mutex_);
MUTEX_LOCK(_nicToMemoryInterface_series_block_stmt_1432_c_mutex_);
_nicToMemoryInterface_inner_inarg_prep_macro__; 
_nicToMemoryInterface_branch_block_stmt_1433_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 589
__declare_static_bit_vector(konst_1453,1);\
bit_vector_clear(&konst_1453);\
konst_1453.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 591
_nicToMemoryInterface_merge_stmt_1435_c_preamble_macro_; 
// 			$phi rdata := 			  NIC_TO_MEMORY_REQUEST $on   $entry ,   $loopback 
 // type of target is $uint<110>
_nicToMemoryInterface_phi_stmt_1436_c_macro_; 
_nicToMemoryInterface_merge_stmt_1435_c_postamble_macro_; 
// $report (nicToMemoryInterface writing_to_mem_pipe 			 rdata rdata )
_nicToMemoryInterface_stmt_1441_c_macro_; 
// 			mem_req1_pipe0 := ( $slice rdata 63 0 )  $buffering 1// bits of buffering = 64. 
_nicToMemoryInterface_assign_stmt_1445_c_macro_; 
// 			mem_req1_pipe1 := ($bitcast ($uint<64>) ( $slice rdata 109 64 )  ) $buffering 1// bits of buffering = 64. 
_nicToMemoryInterface_assign_stmt_1451_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1453);\
konst_1453.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1453)) break;
} 
}
_nicToMemoryInterface_branch_block_stmt_1433_c_export_apply_macro_;
}
_nicToMemoryInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicToMemoryInterface_series_block_stmt_1432_c_mutex_);
}
void nicToMemoryInterface()
{
_nicToMemoryInterface_outer_arg_decl_macro__;
_nicToMemoryInterface_();
_nicToMemoryInterface_outer_op_xfer_macro__;
}


void _nicToProcessorInterface_()
{
MUTEX_DECL(_nicToProcessorInterface_series_block_stmt_1456_c_mutex_);
MUTEX_LOCK(_nicToProcessorInterface_series_block_stmt_1456_c_mutex_);
_nicToProcessorInterface_inner_inarg_prep_macro__; 
_nicToProcessorInterface_branch_block_stmt_1457_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 608
__declare_static_bit_vector(konst_1469,1);\
bit_vector_clear(&konst_1469);\
konst_1469.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 610
_nicToProcessorInterface_merge_stmt_1459_c_preamble_macro_; 
// 			$phi rdata := 			  AFB_NIC_RESPONSE $on   $entry ,   $loopback 
 // type of target is $uint<33>
_nicToProcessorInterface_phi_stmt_1460_c_macro_; 
_nicToProcessorInterface_merge_stmt_1459_c_postamble_macro_; 
// 			control_word_response_pipe := ($bitcast ($uint<64>) rdata ) $buffering 1// bits of buffering = 64. 
_nicToProcessorInterface_assign_stmt_1467_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1469);\
konst_1469.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1469)) break;
} 
}
_nicToProcessorInterface_branch_block_stmt_1457_c_export_apply_macro_;
}
_nicToProcessorInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_nicToProcessorInterface_series_block_stmt_1456_c_mutex_);
}
void nicToProcessorInterface()
{
_nicToProcessorInterface_outer_arg_decl_macro__;
_nicToProcessorInterface_();
_nicToProcessorInterface_outer_op_xfer_macro__;
}


void _popFromQueue_(bit_vector* __plock, bit_vector* __pq_base_address, bit_vector*  __pq_r_data, bit_vector*  __pstatus)
{
MUTEX_DECL(_popFromQueue_series_block_stmt_473_c_mutex_);
MUTEX_LOCK(_popFromQueue_series_block_stmt_473_c_mutex_);
_popFromQueue_inner_inarg_prep_macro__; 
// 	$guard (lock) $call acquireMutex (q_base_address ) (m_ok ) 
_popFromQueue_call_stmt_481_c_macro_; 
/* barrier */ ;
// 	$call getQueuePointers (q_base_address ) (write_pointer read_pointer ) 
_popFromQueue_call_stmt_486_c_macro_; 
// 	$volatile q_empty := (write_pointer == read_pointer) $buffering 1
_popFromQueue_assign_stmt_491_c_macro_; 
// 	$volatile round_off := (read_pointer == (QUEUE_SIZE_MASK - 1 )) $buffering 1
_popFromQueue_assign_stmt_498_c_macro_; 
// 	$volatile next_rp := ( $mux round_off 0   (read_pointer + 1 ) )  $buffering 1
_popFromQueue_assign_stmt_506_c_macro_; 
// 	$guard (~q_empty) $call getQueueElement (q_base_address read_pointer ) (q_r_data ) 
_popFromQueue_call_stmt_511_c_macro_; 
// 	$guard (~q_empty) $call setQueuePointers (q_base_address write_pointer next_rp ) () 
_popFromQueue_call_stmt_516_c_macro_; 
// $report (popFromQueue pop_data 	 q_base_address q_base_address 	 q_r_data q_r_data 	 q_empty q_empty 	 write_pointer write_pointer 	 read_pointer read_pointer 	 next_rp next_rp )
_popFromQueue_stmt_523_c_macro_; 
/* barrier */ ;
// 	$guard (lock) $call releaseMutex (q_base_address ) () 
_popFromQueue_call_stmt_527_c_macro_; 
// 	status := q_empty $buffering 1// bits of buffering = 1. 
_popFromQueue_assign_stmt_530_c_macro_; 
_popFromQueue_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_popFromQueue_series_block_stmt_473_c_mutex_);
}
void _populateRxQueue_(bit_vector* __prx_buffer_pointer)
{
MUTEX_DECL(_populateRxQueue_series_block_stmt_861_c_mutex_);
MUTEX_LOCK(_populateRxQueue_series_block_stmt_861_c_mutex_);
_populateRxQueue_inner_inarg_prep_macro__; 
// $report (populateRxQueue started_populate_rx_queue_module 	 LAST_WRITTEN_RX_QUEUE_INDEX LAST_WRITTEN_RX_QUEUE_INDEX )
_populateRxQueue_stmt_864_c_macro_; 
_populateRxQueue_branch_block_stmt_865_c_export_decl_macro_; 
{
// merge  file nic.linked.aa, line 351
_populateRxQueue_merge_stmt_866_c_preamble_macro_; 
// 			$phi q_index := 			  ((LAST_WRITTEN_RX_QUEUE_INDEX + 1 ) & ($bitcast ($uint<6>) (NUMBER_OF_SERVERS - 1 ) )) $on   $entry 			  n_q_index $on   loopback 
 // type of target is $uint<6>
_populateRxQueue_phi_stmt_867_c_macro_; 
_populateRxQueue_merge_stmt_866_c_postamble_macro_; 
// $report (populateRxQueue in_loop 		 q_index q_index )
_populateRxQueue_stmt_880_c_macro_; 
// 		$volatile register_index := ($bitcast ($uint<6>) (q_index + RX_QUEUES_REG_START_OFFSET) ) $buffering 1
_populateRxQueue_assign_stmt_886_c_macro_; 
// $report (populateRxQueue will_be_Accessing_register 		 register_index register_index )
_populateRxQueue_stmt_888_c_macro_; 
// 		$call AccessRegister (($bitcast ($uint<1>) _b1  ) ( ~ ($bitcast ($uint<4>) _b0  ) ) register_index ($bitcast ($uint<32>) _b0  ) ) (rx_queue_pointer_32 ) 
_populateRxQueue_call_stmt_898_c_macro_; 
// 		$volatile rx_queue_pointer_36 := (rx_queue_pointer_32 && ($bitcast ($uint<4>) _b0  )) $buffering 1
_populateRxQueue_assign_stmt_904_c_macro_; 
// $report (populateRxQueue got_rx_queue_pointer_pushing_to_rx_queue 		 rx_queue_pointer_32 rx_queue_pointer_32 		 rx_queue_pointer_36 rx_queue_pointer_36 		 NUMBER_OF_SERVERS NUMBER_OF_SERVERS )
_populateRxQueue_stmt_908_c_macro_; 
// 		$call pushIntoQueue (($bitcast ($uint<1>) _b0  ) rx_queue_pointer_36 ( $slice rx_buffer_pointer 35 4 )  ) (push_status ) 
_populateRxQueue_call_stmt_915_c_macro_; 
// 		n_q_index := ((q_index + 1 ) & ($bitcast ($uint<6>) (NUMBER_OF_SERVERS - 1 ) )) $buffering 1// bits of buffering = 6. 
_populateRxQueue_assign_stmt_925_c_macro_; 
// $report (populateRxQueue written_to_rx_queue 		 n_q_index n_q_index 		 push_status push_status )
_populateRxQueue_stmt_928_c_macro_; 
// if statement :  file nic.linked.aa, line 364
__declare_static_bit_vector(NOT_u1_u1_931,1);\
bit_vector_not( &(push_status), &(NOT_u1_u1_931));\
if (has_undefined_bit(&NOT_u1_u1_931)) {fprintf(stderr, "Error: variable NOT_u1_u1_931 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_931));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_931)) { 
// 			$call delay_time (32  ) (status ) 
_populateRxQueue_call_stmt_934_c_macro_; 
// if statement :  file nic.linked.aa, line 0
__declare_static_bit_vector(konst_937,1);\
bit_vector_clear(&konst_937);\
__declare_static_bit_vector(EQ_u1_u1_938,1);\
bit_vector_clear(&konst_937);\
bit_vector_equal(0, &(status), &(konst_937), &(EQ_u1_u1_938));\
if (has_undefined_bit(&EQ_u1_u1_938)) {fprintf(stderr, "Error: variable EQ_u1_u1_938 has undefined value (%s) at test point.\n", to_string(&EQ_u1_u1_938));assert(0);} \

if (bit_vector_to_uint64(0, &EQ_u1_u1_938)) { 
/* 			$place[loopback]
*/  goto loopback_865;
} 
else {
 ;
}
} 
else {
// 			LAST_WRITTEN_RX_QUEUE_INDEX := q_index $buffering 1// bits of buffering = 6. 
_populateRxQueue_assign_stmt_944_c_macro_; 
// 			selected_q_index := q_index $buffering 1// bits of buffering = 6.  Orphaned statement with target selected_q_index ?? 
_populateRxQueue_assign_stmt_947_c_macro_; 
}
_populateRxQueue_branch_block_stmt_865_c_export_apply_macro_;
}
_populateRxQueue_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_populateRxQueue_series_block_stmt_861_c_mutex_);
}
void _processorToNicInterface_()
{
MUTEX_DECL(_processorToNicInterface_series_block_stmt_1472_c_mutex_);
MUTEX_LOCK(_processorToNicInterface_series_block_stmt_1472_c_mutex_);
_processorToNicInterface_inner_inarg_prep_macro__; 
_processorToNicInterface_branch_block_stmt_1473_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 625
__declare_static_bit_vector(konst_1494,1);\
bit_vector_clear(&konst_1494);\
konst_1494.val.byte_array[0] = 1;\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 627
_processorToNicInterface_merge_stmt_1475_c_preamble_macro_; 
// 			$phi rdata0 := 			  control_word_request_pipe_0 $on   $entry ,   $loopback 
 // type of target is $uint<32>
_processorToNicInterface_phi_stmt_1476_c_macro_; 
// 			$phi rdata1 := 			  control_word_request_pipe_1 $on   $entry ,   $loopback 
 // type of target is $uint<64>
_processorToNicInterface_phi_stmt_1479_c_macro_; 
_processorToNicInterface_merge_stmt_1475_c_postamble_macro_; 
// $report (processorToNicInterface got_afb_Req 			 rdata0 rdata0 			 rdata1 rdata1 )
_processorToNicInterface_stmt_1485_c_macro_; 
// 			AFB_NIC_REQUEST := (( $slice rdata1 41 0 )  && rdata0) $buffering 1// bits of buffering = 74. 
_processorToNicInterface_assign_stmt_1492_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_1494);\
konst_1494.val.byte_array[0] = 1;\
if (!bit_vector_to_uint64(0, &konst_1494)) break;
} 
}
_processorToNicInterface_branch_block_stmt_1473_c_export_apply_macro_;
}
_processorToNicInterface_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_processorToNicInterface_series_block_stmt_1472_c_mutex_);
}
void processorToNicInterface()
{
_processorToNicInterface_outer_arg_decl_macro__;
_processorToNicInterface_();
_processorToNicInterface_outer_op_xfer_macro__;
}


void _pushIntoQueue_(bit_vector* __plock, bit_vector* __pq_base_address, bit_vector* __pq_w_data, bit_vector*  __pstatus)
{
MUTEX_DECL(_pushIntoQueue_series_block_stmt_774_c_mutex_);
MUTEX_LOCK(_pushIntoQueue_series_block_stmt_774_c_mutex_);
_pushIntoQueue_inner_inarg_prep_macro__; 
// 	$guard (lock) $call acquireMutex (q_base_address ) (m_ok ) 
_pushIntoQueue_call_stmt_782_c_macro_; 
/* barrier */ ;
// $report (pushIntoQueue pushing_to_queue 	 q_w_data q_w_data 	 q_base_address q_base_address )
_pushIntoQueue_stmt_786_c_macro_; 
// 	$call getQueuePointers (q_base_address ) (write_pointer read_pointer ) 
_pushIntoQueue_call_stmt_790_c_macro_; 
// 	$volatile round_off := (write_pointer == (QUEUE_SIZE_MASK - 1 )) $buffering 1
_pushIntoQueue_assign_stmt_797_c_macro_; 
// 	$volatile next_wp := ( $mux round_off 0   (write_pointer + 1 ) )  $buffering 1
_pushIntoQueue_assign_stmt_805_c_macro_; 
// 	$volatile q_full := (next_wp == read_pointer) $buffering 1
_pushIntoQueue_assign_stmt_810_c_macro_; 
// $report (pushIntoQueue pushing_to_queue 	 q_w_data q_w_data 	 write_pointer write_pointer 	 read_pointer read_pointer 	 next_wp next_wp 	 q_full q_full )
_pushIntoQueue_stmt_816_c_macro_; 
// 	$guard (~q_full) $call setQueueElement (q_base_address write_pointer q_w_data ) () 
_pushIntoQueue_call_stmt_821_c_macro_; 
// 	$guard (~q_full) $call setQueuePointers (q_base_address next_wp read_pointer ) () 
_pushIntoQueue_call_stmt_826_c_macro_; 
/* barrier */ ;
// 	$guard (lock) $call releaseMutex (q_base_address ) () 
_pushIntoQueue_call_stmt_830_c_macro_; 
// 	status := ( ~ q_full ) $buffering 1// bits of buffering = 1. 
_pushIntoQueue_assign_stmt_834_c_macro_; 
_pushIntoQueue_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_pushIntoQueue_series_block_stmt_774_c_mutex_);
}
void _releaseMutex_(bit_vector* __pq_base_address)
{
MUTEX_DECL(_releaseMutex_series_block_stmt_455_c_mutex_);
MUTEX_LOCK(_releaseMutex_series_block_stmt_455_c_mutex_);
_releaseMutex_inner_inarg_prep_macro__; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) (( ~ ($bitcast ($uint<4>) _b0  ) ) && ($bitcast ($uint<4>) _b0  )) q_base_address ($bitcast ($uint<64>) _b0  ) ) (ignore ) 
_releaseMutex_call_stmt_471_c_macro_; 
_releaseMutex_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_releaseMutex_series_block_stmt_455_c_mutex_);
}
void _setQueueElement_(bit_vector* __pq_base_address, bit_vector* __pwrite_pointer, bit_vector* __pq_w_data)
{
MUTEX_DECL(_setQueueElement_series_block_stmt_707_c_mutex_);
MUTEX_LOCK(_setQueueElement_series_block_stmt_707_c_mutex_);
_setQueueElement_inner_inarg_prep_macro__; 
// 	$volatile buffer_address := (q_base_address + ($bitcast ($uint<36>) 16  )) $buffering 1
_setQueueElement_assign_stmt_716_c_macro_; 
// 	$volatile element_pair_address := (buffer_address + ($bitcast ($uint<36>) (( $slice write_pointer 31 1 )  && ($bitcast ($uint<3>) _b0  )) )) $buffering 1
_setQueueElement_assign_stmt_726_c_macro_; 
// 	$volatile bmask := ( $mux (write_pointer [] 0 ) (($bitcast ($uint<4>) _b0  ) && ( ~ ($bitcast ($uint<4>) _b0  ) ))  (( ~ ($bitcast ($uint<4>) _b0  ) ) && ($bitcast ($uint<4>) _b0  )) )  $buffering 1
_setQueueElement_assign_stmt_744_c_macro_; 
// 	$volatile wval := ( $mux (write_pointer [] 0 ) (($bitcast ($uint<32>) _b0  ) && q_w_data)  (q_w_data && ($bitcast ($uint<32>) _b0  )) )  $buffering 1
_setQueueElement_assign_stmt_758_c_macro_; 
// $report (setQueueElement addresses 	 element_pair_address element_pair_address 	 q_w_data q_w_data 	 bmask bmask 	 wval wval )
_setQueueElement_stmt_763_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) bmask element_pair_address wval ) (ignore ) 
_setQueueElement_call_stmt_772_c_macro_; 
_setQueueElement_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_setQueueElement_series_block_stmt_707_c_mutex_);
}
void _setQueuePointers_(bit_vector* __pq_base_address, bit_vector* __pwp, bit_vector* __prp)
{
MUTEX_DECL(_setQueuePointers_series_block_stmt_431_c_mutex_);
MUTEX_LOCK(_setQueuePointers_series_block_stmt_431_c_mutex_);
_setQueuePointers_inner_inarg_prep_macro__; 
// $report (setQueuePointers set 	 q_base_address q_base_address 	 wp wp 	 rp rp )
_setQueuePointers_stmt_438_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) ( ~ ($bitcast ($uint<8>) _b0  ) ) (q_base_address + 8 ) (wp && rp) ) (ignore ) 
_setQueuePointers_call_stmt_453_c_macro_; 
_setQueuePointers_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_setQueuePointers_series_block_stmt_431_c_mutex_);
}
void _transmitEngineDaemon_()
{
MUTEX_DECL(_transmitEngineDaemon_series_block_stmt_1625_c_mutex_);
MUTEX_LOCK(_transmitEngineDaemon_series_block_stmt_1625_c_mutex_);
_transmitEngineDaemon_inner_inarg_prep_macro__; 
// 	LAST_READ_TX_QUEUE_INDEX := 0  $buffering 1// bits of buffering = 6. 
_transmitEngineDaemon_assign_stmt_1628_c_macro_; 
_transmitEngineDaemon_branch_block_stmt_1629_c_export_decl_macro_; 
{
// merge  file nic.linked.aa, line 682
_transmitEngineDaemon_merge_stmt_1630_c_preamble_macro_; 
_transmitEngineDaemon_merge_stmt_1630_c_postamble_macro_; 
// if statement :  file nic.linked.aa, line 35216640
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1632,32);\
__declare_static_bit_vector(konst_1633,32);\
bit_vector_clear(&konst_1633);\
__declare_static_bit_vector(BITSEL_u32_u1_1634,1);\
__declare_static_bit_vector(NOT_u1_u1_1635,1);\
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1632));\
bit_vector_clear(&konst_1633);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1632), &(konst_1633), &(BITSEL_u32_u1_1634));\
bit_vector_not( &(BITSEL_u32_u1_1634), &(NOT_u1_u1_1635));\
if (has_undefined_bit(&NOT_u1_u1_1635)) {fprintf(stderr, "Error: variable NOT_u1_u1_1635 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_1635));assert(0);} \

if (bit_vector_to_uint64(0, &NOT_u1_u1_1635)) { 
/* 			$place[not_enabled_yet_loopback]
*/  goto not_enabled_yet_loopback_1629;
} 
else {
 ;
}
// $report (transmitEngineDaemon got_control )
_transmitEngineDaemon_stmt_1638_c_macro_; 
{
// do-while:   file nic.linked.aa, line 688
__declare_static_bit_vector(RPIPE_CONTROL_REGISTER_1690,32);\
__declare_static_bit_vector(konst_1691,32);\
bit_vector_clear(&konst_1691);\
__declare_static_bit_vector(BITSEL_u32_u1_1692,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 690
_transmitEngineDaemon_merge_stmt_1640_c_preamble_macro_; 
// 			$phi tx_q_index := 			  ((LAST_READ_TX_QUEUE_INDEX + 1 ) & ($bitcast ($uint<6>) (NUMBER_OF_SERVERS - 1 ) )) $on   $entry ,   $loopback 
 // type of target is $uint<6>
_transmitEngineDaemon_phi_stmt_1641_c_macro_; 
_transmitEngineDaemon_merge_stmt_1640_c_postamble_macro_; 
// $report (transmitEngineDaemon trying_to_get_pointer_from_tx_queue 			 tx_q_index tx_q_index )
_transmitEngineDaemon_stmt_1653_c_macro_; 
// 			$call getTxPacketPointerFromServer (tx_q_index ) (pkt_pointer tx_flag ) 
_transmitEngineDaemon_call_stmt_1657_c_macro_; 
// 			$guard (~tx_flag) $call transmitPacket (pkt_pointer ) (transmitted_flag ) 
_transmitEngineDaemon_call_stmt_1661_c_macro_; 
// $guard (~tx_flag) $report (transmitEngineDaemon got_pointer_now_transmitting_packet 			 pkt_pointer pkt_pointer 			 tx_flag tx_flag )
_transmitEngineDaemon_stmt_1665_c_macro_; 
// $guard (~tx_flag) $report (transmitEngineDaemon packet_transmitted 			 transmitted_flag transmitted_flag )
_transmitEngineDaemon_stmt_1668_c_macro_; 
// 			$volatile push_pointer_back_to_free_Q := (( ~ tx_flag ) & transmitted_flag) $buffering 1
_transmitEngineDaemon_assign_stmt_1674_c_macro_; 
// $report (transmitEngineDaemon pushing_back_to_free_queue 			 push_pointer_back_to_free_Q push_pointer_back_to_free_Q )
_transmitEngineDaemon_stmt_1676_c_macro_; 
// 			$guard (push_pointer_back_to_free_Q) $call pushIntoQueue (($bitcast ($uint<1>) _b1  ) FREE_Q pkt_pointer ) (push_status ) 
_transmitEngineDaemon_call_stmt_1683_c_macro_; 
// $report (transmitEngineDaemon pushed_back_to_free_queue 			 push_status push_status )
_transmitEngineDaemon_stmt_1685_c_macro_; 
// 			LAST_READ_TX_QUEUE_INDEX := tx_q_index $buffering 1// bits of buffering = 6. 
_transmitEngineDaemon_assign_stmt_1688_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
read_bit_vector_from_pipe("CONTROL_REGISTER",&(RPIPE_CONTROL_REGISTER_1690));\
bit_vector_clear(&konst_1691);\
bit_vector_bitsel( &(RPIPE_CONTROL_REGISTER_1690), &(konst_1691), &(BITSEL_u32_u1_1692));\
if (has_undefined_bit(&BITSEL_u32_u1_1692)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1692 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1692));assert(0);} \

if (!bit_vector_to_uint64(0, &BITSEL_u32_u1_1692)) break;
} 
}
/* 		$place[disable_loopback]
*/  goto disable_loopback_1629;
_transmitEngineDaemon_branch_block_stmt_1629_c_export_apply_macro_;
}
_transmitEngineDaemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_transmitEngineDaemon_series_block_stmt_1625_c_mutex_);
}
void transmitEngineDaemon()
{
_transmitEngineDaemon_outer_arg_decl_macro__;
_transmitEngineDaemon_();
_transmitEngineDaemon_outer_op_xfer_macro__;
}


void _transmitPacket_(bit_vector* __ppacket_pointer, bit_vector*  __pstatus)
{
MUTEX_DECL(_transmitPacket_series_block_stmt_1497_c_mutex_);
MUTEX_LOCK(_transmitPacket_series_block_stmt_1497_c_mutex_);
_transmitPacket_inner_inarg_prep_macro__; 
// 	$volatile control_data_addr := ($bitcast ($uint<36>) (( $slice packet_pointer 31 0 )  && ($bitcast ($uint<4>) _b0  )) ) $buffering 1
_transmitPacket_assign_stmt_1507_c_macro_; 
// $report (transmitPacket control_data_addr_is 	 packet_pointer packet_pointer 	 control_data_addr control_data_addr )
_transmitPacket_stmt_1510_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) FULL_BYTE_MASK control_data_addr ($bitcast ($uint<64>) _b0  ) ) (control_data ) 
_transmitPacket_call_stmt_1520_c_macro_; 
// 	$volatile unused := ( $slice control_data 59 16 )  $buffering 1
_transmitPacket_assign_stmt_1525_c_macro_; 
// 	$volatile packet_size := ( $slice control_data 15 8 )  $buffering 1
_transmitPacket_assign_stmt_1529_c_macro_; 
// 	$volatile last_tkeep := ( $slice control_data 7 0 )  $buffering 1
_transmitPacket_assign_stmt_1533_c_macro_; 
// $report (transmitPacket control_data_received_is 	 packet_size packet_size 	 last_tkeep last_tkeep )
_transmitPacket_stmt_1536_c_macro_; 
_transmitPacket_branch_block_stmt_1537_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 652
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 654
_transmitPacket_merge_stmt_1539_c_preamble_macro_; 
// 			$phi count_down := 			  (packet_size - 16 ) $on   $entry 			  ncount_down $on   $loopback 
 // type of target is $uint<8>
_transmitPacket_phi_stmt_1540_c_macro_; 
// 			$phi mem_addr := 			  (control_data_addr + 24 ) $on   $entry 			  nmem_addr $on   $loopback 
 // type of target is $uint<36>
_transmitPacket_phi_stmt_1546_c_macro_; 
_transmitPacket_merge_stmt_1539_c_postamble_macro_; 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) FULL_BYTE_MASK mem_addr ($bitcast ($uint<64>) _b0  ) ) (data ) 
_transmitPacket_call_stmt_1562_c_macro_; 
// 			nic_to_mac_transmit_pipe := ((($bitcast ($uint<1>) _b0  ) && data) && FULL_BYTE_MASK) $buffering 1// bits of buffering = 73. 
_transmitPacket_assign_stmt_1570_c_macro_; 
// 			$volatile ncount_down := (count_down - 8 ) $buffering 1
_transmitPacket_assign_stmt_1575_c_macro_; 
// 			$volatile nmem_addr := (mem_addr + 8 ) $buffering 1
_transmitPacket_assign_stmt_1580_c_macro_; 
// $report (transmitPacket count_down_ 			 count_down count_down 			 ncount_down ncount_down 			 mem_addr mem_addr 			 nmem_addr nmem_addr )
_transmitPacket_stmt_1585_c_macro_; 
// 			$volatile not_last_word := (ncount_down > 8 ) $buffering 1
_transmitPacket_assign_stmt_1590_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
if (has_undefined_bit(&not_last_word)) {fprintf(stderr, "Error: variable not_last_word has undefined value (%s) at test point.\n", to_string(&not_last_word));assert(0);} \

if (!bit_vector_to_uint64(0, &not_last_word)) break;
} 
}
// $report (transmitPacket accessing_last_word 		 nmem_addr nmem_addr )
_transmitPacket_stmt_1594_c_macro_; 
// 		$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b1  ) FULL_BYTE_MASK nmem_addr ($bitcast ($uint<64>) _b0  ) ) (last_word ) 
_transmitPacket_call_stmt_1604_c_macro_; 
// $report (transmitPacket sending_last_word 		 last_word last_word )
_transmitPacket_stmt_1606_c_macro_; 
// 		nic_to_mac_transmit_pipe := ((($bitcast ($uint<1>) _b1  ) && last_word) && last_tkeep) $buffering 1// bits of buffering = 73. 
_transmitPacket_assign_stmt_1614_c_macro_; 
// 		status := (packet_size == ($bitcast ($uint<8>) (nmem_addr - control_data_addr) )) $buffering 1// bits of buffering = 1. 
_transmitPacket_assign_stmt_1622_c_macro_; 
_transmitPacket_branch_block_stmt_1537_c_export_apply_macro_;
}
_transmitPacket_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_transmitPacket_series_block_stmt_1497_c_mutex_);
}
void _writeControlInformationToMem_(bit_vector* __pbase_buffer_pointer, bit_vector* __ppacket_size, bit_vector* __plast_keep)
{
MUTEX_DECL(_writeControlInformationToMem_series_block_stmt_669_c_mutex_);
MUTEX_LOCK(_writeControlInformationToMem_series_block_stmt_669_c_mutex_);
_writeControlInformationToMem_inner_inarg_prep_macro__; 
// 	$volatile control_data := ($bitcast ($uint<64>) (packet_size && last_keep) ) $buffering 1
_writeControlInformationToMem_assign_stmt_678_c_macro_; 
// 	$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) FULL_BYTE_MASK base_buffer_pointer control_data ) (ignore_return ) 
_writeControlInformationToMem_call_stmt_687_c_macro_; 
_writeControlInformationToMem_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_writeControlInformationToMem_series_block_stmt_669_c_mutex_);
}
void _writeEthernetHeaderToMem_(bit_vector* __pbuf_pointer, bit_vector*  __pbuf_position)
{
MUTEX_DECL(_writeEthernetHeaderToMem_series_block_stmt_532_c_mutex_);
MUTEX_LOCK(_writeEthernetHeaderToMem_series_block_stmt_532_c_mutex_);
_writeEthernetHeaderToMem_inner_inarg_prep_macro__; 
_writeEthernetHeaderToMem_branch_block_stmt_535_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 228
__declare_static_bit_vector(konst_589,4);\
bit_vector_clear(&konst_589);\
konst_589.val.byte_array[0] = 1;\
__declare_static_bit_vector(ULE_u4_u1_590,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 229
_writeEthernetHeaderToMem_merge_stmt_537_c_preamble_macro_; 
// 			$phi buf_position := 			  (buf_pointer + 8 ) $on   $entry 			  nbuf_position $on   $loopback 
 // type of target is $uint<36>
_writeEthernetHeaderToMem_phi_stmt_538_c_macro_; 
// 			$phi I := 			  ($bitcast ($uint<4>) _b0  ) $on   $entry 			  nI $on   $loopback 
 // type of target is $uint<4>
_writeEthernetHeaderToMem_phi_stmt_544_c_macro_; 
// 			$phi ethernet_header := 			  nic_rx_to_header $on   $entry ,   $loopback 
 // type of target is $uint<73>
_writeEthernetHeaderToMem_phi_stmt_549_c_macro_; 
_writeEthernetHeaderToMem_merge_stmt_537_c_postamble_macro_; 
// $report (writeEthernetHeaderToMem received_eth_header_is 			 ethernet_header ethernet_header 			 buf_position buf_position )
_writeEthernetHeaderToMem_stmt_555_c_macro_; 
// 			$volatile last_bit := ( $slice ethernet_header 72 72 )  $buffering 1
_writeEthernetHeaderToMem_assign_stmt_559_c_macro_; 
// 			$volatile wdata := ( $slice ethernet_header 71 8 )  $buffering 1
_writeEthernetHeaderToMem_assign_stmt_563_c_macro_; 
// 			$volatile wkeep := ( $slice ethernet_header 7 0 )  $buffering 1
_writeEthernetHeaderToMem_assign_stmt_567_c_macro_; 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) wkeep buf_position wdata ) (ignore_return ) 
_writeEthernetHeaderToMem_call_stmt_576_c_macro_; 
// 			$volatile nI := (I + 1 ) $buffering 1
_writeEthernetHeaderToMem_assign_stmt_581_c_macro_; 
// 			$volatile nbuf_position := (buf_position + 8 ) $buffering 1
_writeEthernetHeaderToMem_assign_stmt_586_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_clear(&konst_589);\
konst_589.val.byte_array[0] = 1;\
bit_vector_less_equal(0, &(nI), &(konst_589), &(ULE_u4_u1_590));\
if (has_undefined_bit(&ULE_u4_u1_590)) {fprintf(stderr, "Error: variable ULE_u4_u1_590 has undefined value (%s) at test point.\n", to_string(&ULE_u4_u1_590));assert(0);} \

if (!bit_vector_to_uint64(0, &ULE_u4_u1_590)) break;
} 
}
_writeEthernetHeaderToMem_branch_block_stmt_535_c_export_apply_macro_;
}
_writeEthernetHeaderToMem_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_writeEthernetHeaderToMem_series_block_stmt_532_c_mutex_);
}
void _writePayloadToMem_(bit_vector* __pbase_buf_pointer, bit_vector* __pbuf_pointer, bit_vector*  __ppacket_size_32, bit_vector*  __pbad_packet_identifier, bit_vector*  __plast_keep)
{
MUTEX_DECL(_writePayloadToMem_series_block_stmt_593_c_mutex_);
MUTEX_LOCK(_writePayloadToMem_series_block_stmt_593_c_mutex_);
_writePayloadToMem_inner_inarg_prep_macro__; 
_writePayloadToMem_branch_block_stmt_599_c_export_decl_macro_; 
{
{
// do-while:   file nic.linked.aa, line 255
__declare_static_bit_vector(NOT_u1_u1_642,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file nic.linked.aa, line 257
_writePayloadToMem_merge_stmt_601_c_preamble_macro_; 
// 			$phi buf_position := 			  (buf_pointer + 8 ) $on   $entry 			  (buf_position + 8 ) $on   $loopback 
 // type of target is $uint<36>
_writePayloadToMem_phi_stmt_602_c_macro_; 
// 			$phi payload_data := 			  nic_rx_to_packet $on   $entry ,   $loopback 
 // type of target is $uint<73>
_writePayloadToMem_phi_stmt_610_c_macro_; 
_writePayloadToMem_merge_stmt_601_c_postamble_macro_; 
// 			$volatile last_bit := ( $slice payload_data 72 72 )  $buffering 1
_writePayloadToMem_assign_stmt_617_c_macro_; 
// 			$volatile wdata := ( $slice payload_data 71 8 )  $buffering 1
_writePayloadToMem_assign_stmt_621_c_macro_; 
// 			$volatile wkeep := ( $slice payload_data 7 0 )  $buffering 1
_writePayloadToMem_assign_stmt_625_c_macro_; 
// $report (writePayloadToMem writing_payload_to_mem 			 last_bit last_bit 			 wdata wdata 			 wkeep wkeep 			 buf_position buf_position )
_writePayloadToMem_stmt_630_c_macro_; 
// 			$call accessMemory (($bitcast ($uint<1>) _b0  ) ($bitcast ($uint<1>) _b0  ) wkeep buf_position wdata ) (ignore_return ) 
_writePayloadToMem_call_stmt_639_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_not( &(last_bit), &(NOT_u1_u1_642));\
if (has_undefined_bit(&NOT_u1_u1_642)) {fprintf(stderr, "Error: variable NOT_u1_u1_642 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_642));assert(0);} \

if (!bit_vector_to_uint64(0, &NOT_u1_u1_642)) break;
} 
}
_writePayloadToMem_branch_block_stmt_599_c_export_apply_macro_;
}
// 	$volatile bad_packet_identifier := ((tdata == BAD_PACKET_DATA) & (tkeep == 0 )) $buffering 1
_writePayloadToMem_assign_stmt_652_c_macro_; 
// 	$volatile packet_size_8 := ($bitcast ($uint<8>) (buf_position - base_buf_pointer) ) $buffering 1
_writePayloadToMem_assign_stmt_658_c_macro_; 
// 	$volatile packet_size_32 := packet_size_8 $buffering 1
_writePayloadToMem_assign_stmt_661_c_macro_; 
// $report (writePayloadToMem packet_size_is 	 packet_size_8 packet_size_8 	 packet_size_32 packet_size_32 )
_writePayloadToMem_stmt_664_c_macro_; 
// 	$volatile last_keep := tkeep $buffering 1
_writePayloadToMem_assign_stmt_667_c_macro_; 
_writePayloadToMem_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(_writePayloadToMem_series_block_stmt_593_c_mutex_);
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
DEFINE_THREAD(nicRxFromMacDaemon);
PTHREAD_DECL(nicRxFromMacDaemon);
DEFINE_THREAD(nicToMacInterface);
PTHREAD_DECL(nicToMacInterface);
DEFINE_THREAD(nicToMemoryInterface);
PTHREAD_DECL(nicToMemoryInterface);
DEFINE_THREAD(nicToProcessorInterface);
PTHREAD_DECL(nicToProcessorInterface);
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
PTHREAD_CREATE(nicRxFromMacDaemon);
PTHREAD_CREATE(nicToMacInterface);
PTHREAD_CREATE(nicToMemoryInterface);
PTHREAD_CREATE(nicToProcessorInterface);
PTHREAD_CREATE(processorToNicInterface);
PTHREAD_CREATE(transmitEngineDaemon);
}
void stop_daemons() {
PTHREAD_CANCEL(NicRegisterAccessDaemon);
PTHREAD_CANCEL(ReceiveEngineDaemon);
PTHREAD_CANCEL(SoftwareRegisterAccessDaemon);
PTHREAD_CANCEL(macToNicInterface);
PTHREAD_CANCEL(memoryToNicInterface);
PTHREAD_CANCEL(nicRxFromMacDaemon);
PTHREAD_CANCEL(nicToMacInterface);
PTHREAD_CANCEL(nicToMemoryInterface);
PTHREAD_CANCEL(nicToProcessorInterface);
PTHREAD_CANCEL(processorToNicInterface);
PTHREAD_CANCEL(transmitEngineDaemon);
}

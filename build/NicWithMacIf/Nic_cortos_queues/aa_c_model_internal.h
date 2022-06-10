#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
// object initialization 

#define _AccessRegister_inner_inarg_prep_macro__ __declare_static_bit_vector(rwbar,1);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &((*__prwbar)));\
__declare_static_bit_vector(bmask,4);\
bit_vector_cast_to_bit_vector(0, &(bmask), &((*__pbmask)));\
__declare_static_bit_vector(register_index,6);\
bit_vector_cast_to_bit_vector(0, &(register_index), &((*__pregister_index)));\
__declare_static_bit_vector(wdata,32);\
bit_vector_cast_to_bit_vector(0, &(wdata), &((*__pwdata)));\
__declare_static_bit_vector(rdata,32);\
__declare_static_bit_vector(request,43);\
__declare_static_bit_vector(response,33);\
__declare_static_bit_vector(status,1);\

#define _AccessRegister_stmt_88_c_macro_ uint32_t _AccessRegister_stmt_88_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_88_c_macro___print_counter,"In_Access_Register");release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_97_c_macro_ __declare_static_bit_vector(CONCAT_u1_u5_92,5);\
__declare_static_bit_vector(CONCAT_u6_u38_95,38);\
__declare_static_bit_vector(CONCAT_u5_u43_96,43);\
bit_vector_concatenate( &(rwbar), &(bmask), &(CONCAT_u1_u5_92));\
bit_vector_concatenate( &(register_index), &(wdata), &(CONCAT_u6_u38_95));\
bit_vector_concatenate( &(CONCAT_u1_u5_92), &(CONCAT_u6_u38_95), &(CONCAT_u5_u43_96));\
bit_vector_cast_to_bit_vector(0, &(request), &(CONCAT_u5_u43_96));\
;

#define _AccessRegister_stmt_102_c_macro_ uint32_t _AccessRegister_stmt_102_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_102_c_macro___print_counter,"Request");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_102_c_macro___print_counter,"rwbar");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rwbar)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_102_c_macro___print_counter,"bmask");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(bmask)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_102_c_macro___print_counter,"register_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(register_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_102_c_macro___print_counter,"wdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_105_c_macro_ write_bit_vector_to_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE",&(request));\
;

#define _AccessRegister_stmt_106_c_macro_ uint32_t _AccessRegister_stmt_106_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_106_c_macro___print_counter,"Request_Sent");release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_109_c_macro_ __declare_static_bit_vector(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_108,33);\
read_bit_vector_from_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE",&(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_108));\
bit_vector_cast_to_bit_vector(0, &(response), &(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_108));\
;

#define _AccessRegister_stmt_111_c_macro_ uint32_t _AccessRegister_stmt_111_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_111_c_macro___print_counter,"Response");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_111_c_macro___print_counter,"response");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(response)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_115_c_macro_ __declare_static_bit_vector(slice_114,1);\
bit_vector_slice(&(response), &(slice_114), 32);\
bit_vector_cast_to_bit_vector(0, &(status), &(slice_114));\
;

#define _AccessRegister_assign_stmt_119_c_macro_ __declare_static_bit_vector(slice_118,32);\
bit_vector_slice(&(response), &(slice_118), 0);\
bit_vector_cast_to_bit_vector(0, &(rdata), &(slice_118));\
;

#define _AccessRegister_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__prdata)), &(rdata));\
;

#define _NicRegisterAccessDaemon_inner_inarg_prep_macro__ 
#define _NicRegisterAccessDaemon_branch_block_stmt_202_c_export_decl_macro_ __declare_static_bit_vector(req,43);\
__declare_static_bit_vector(rwbar,1);\
__declare_static_bit_vector(bmask,4);\
__declare_static_bit_vector(index,6);\
__declare_static_bit_vector(wdata,32);\
__declare_static_bit_vector(rval,32);\
__declare_static_bit_vector(wval,32);\
__declare_static_bit_vector(rdata,32);\
__declare_static_bit_vector(resp,33);\


#define _NicRegisterAccessDaemon_merge_stmt_204_c_preamble_macro_ uint8_t merge_stmt_204_entry_flag;\
merge_stmt_204_entry_flag = do_while_entry_flag;\
goto merge_stmt_204_run;\
merge_stmt_204_run: ;\
;

#define _NicRegisterAccessDaemon_merge_stmt_204_c_postamble_macro_ merge_stmt_204_entry_flag = 0;

#define _NicRegisterAccessDaemon_assign_stmt_207_c_macro_ __declare_static_bit_vector(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_206,43);\
read_bit_vector_from_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE",&(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_206));\
bit_vector_cast_to_bit_vector(0, &(req), &(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_206));\
;

#define _NicRegisterAccessDaemon_stmt_208_c_macro_ uint32_t _NicRegisterAccessDaemon_stmt_208_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t%s\n",_NicRegisterAccessDaemon_stmt_208_c_macro___print_counter,"Request_Received");release_file_print_lock(__report_log_file__);;

#define _NicRegisterAccessDaemon_assign_stmt_212_c_macro_ __declare_static_bit_vector(slice_211,1);\
bit_vector_slice(&(req), &(slice_211), 42);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_211));\
;

#define _NicRegisterAccessDaemon_assign_stmt_216_c_macro_ __declare_static_bit_vector(slice_215,4);\
bit_vector_slice(&(req), &(slice_215), 38);\
bit_vector_cast_to_bit_vector(0, &(bmask), &(slice_215));\
;

#define _NicRegisterAccessDaemon_assign_stmt_220_c_macro_ __declare_static_bit_vector(slice_219,6);\
bit_vector_slice(&(req), &(slice_219), 32);\
bit_vector_cast_to_bit_vector(0, &(index), &(slice_219));\
;

#define _NicRegisterAccessDaemon_assign_stmt_224_c_macro_ __declare_static_bit_vector(slice_223,32);\
bit_vector_slice(&(req), &(slice_223), 0);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_223));\
;

#define _NicRegisterAccessDaemon_assign_stmt_228_c_macro_ bit_vector_cast_to_bit_vector(0, &(rval), &((nic_registers[bit_vector_to_uint64(0, &index)])));\
;

#define _NicRegisterAccessDaemon_stmt_231_c_macro_ uint32_t _NicRegisterAccessDaemon_stmt_231_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t%s\n",_NicRegisterAccessDaemon_stmt_231_c_macro___print_counter,"Request");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t\t%s\t\t",_NicRegisterAccessDaemon_stmt_231_c_macro___print_counter,"rval");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rval)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t\t%s\t\t",_NicRegisterAccessDaemon_stmt_231_c_macro___print_counter,"index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _NicRegisterAccessDaemon_call_stmt_238_c_macro_ if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if (!bit_vector_to_uint64(0, &rwbar)) {\
_UpdateRegister_( &(bmask),  &(rval),  &(wdata),  &(index), &(wval));\
}\
;

#define _NicRegisterAccessDaemon_assign_stmt_245_c_macro_ __declare_static_bit_vector(konst_242,32);\
bit_vector_clear(&konst_242);\
__declare_static_bit_vector(type_cast_243,32);\
bit_vector_clear(&type_cast_243);\
__declare_static_bit_vector(MUX_244,32);\
if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if(bit_vector_to_uint64(0, &rwbar)){bit_vector_cast_to_bit_vector(0, &(MUX_244), &(rval));\
}else {bit_vector_clear(&konst_242);\
bit_vector_bitcast_to_bit_vector( &(type_cast_243), &(konst_242));\
bit_vector_cast_to_bit_vector(0, &(MUX_244), &(type_cast_243));\
}bit_vector_cast_to_bit_vector(0, &(rdata), &(MUX_244));\
;

#define _NicRegisterAccessDaemon_assign_stmt_251_c_macro_ __declare_static_bit_vector(konst_247,1);\
bit_vector_clear(&konst_247);\
__declare_static_bit_vector(type_cast_248,1);\
bit_vector_clear(&type_cast_248);\
__declare_static_bit_vector(CONCAT_u1_u33_250,33);\
bit_vector_clear(&konst_247);\
bit_vector_bitcast_to_bit_vector( &(type_cast_248), &(konst_247));\
bit_vector_concatenate( &(type_cast_248), &(rdata), &(CONCAT_u1_u33_250));\
bit_vector_cast_to_bit_vector(0, &(resp), &(CONCAT_u1_u33_250));\
;

#define _NicRegisterAccessDaemon_assign_stmt_254_c_macro_ write_bit_vector_to_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE",&(resp));\
;
;

#define _NicRegisterAccessDaemon_branch_block_stmt_202_c_export_apply_macro_ ;

#define _NicRegisterAccessDaemon_inner_outarg_prep_macro__ ;

#define _NicRegisterAccessDaemon_outer_arg_decl_macro__ ;

#define _NicRegisterAccessDaemon_outer_op_xfer_macro__ ;

#define _ReceiveEngineDaemon_inner_inarg_prep_macro__ 
#define _ReceiveEngineDaemon_assign_stmt_1330_c_macro_ __declare_static_bit_vector(konst_1329,6);\
bit_vector_clear(&konst_1329);\
bit_vector_clear(&konst_1329);\
write_bit_vector_to_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(konst_1329));\
;

#define _ReceiveEngineDaemon_branch_block_stmt_1331_c_export_decl_macro_ __declare_static_bit_vector(rx_buffer_pointer_32,32);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(rx_buffer_pointer_36,36);\
__declare_static_bit_vector(bad_packet_identifier,1);\
__declare_static_bit_vector(ok_flag,1);\
__declare_static_bit_vector(free_flag,1);\
__declare_static_bit_vector(cond,1);\
__declare_static_bit_vector(push_status,1);\


#define _ReceiveEngineDaemon_stmt_1332_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1332_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1332_c_macro___print_counter,"waiting_for_control");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_merge_stmt_1333_c_preamble_macro_ uint8_t merge_stmt_1333_entry_flag;\
merge_stmt_1333_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_1331_flag = 0;\
uint8_t disable_loopback_1331_flag = 0;\
goto merge_stmt_1333_run;\
not_enabled_yet_loopback_1331: not_enabled_yet_loopback_1331_flag = 1;\
disable_loopback_1331_flag = 0;\
goto merge_stmt_1333_run;\
disable_loopback_1331: disable_loopback_1331_flag = 1;\
not_enabled_yet_loopback_1331_flag = 0;\
goto merge_stmt_1333_run;\
merge_stmt_1333_run: ;\
;

#define _ReceiveEngineDaemon_merge_stmt_1333_c_postamble_macro_ not_enabled_yet_loopback_1331_flag = 0;\
disable_loopback_1331_flag = 0;\
merge_stmt_1333_entry_flag = 0;

#define _ReceiveEngineDaemon_stmt_1341_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1341_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1341_c_macro___print_counter,"got_the__control");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_merge_stmt_1343_c_preamble_macro_ uint8_t merge_stmt_1343_entry_flag;\
merge_stmt_1343_entry_flag = do_while_entry_flag;\
goto merge_stmt_1343_run;\
merge_stmt_1343_run: ;\
;

#define _ReceiveEngineDaemon_merge_stmt_1343_c_postamble_macro_ merge_stmt_1343_entry_flag = 0;

#define _ReceiveEngineDaemon_stmt_1344_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1344_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1344_c_macro___print_counter,"called_pop_From_queue");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_1350_c_macro_ __declare_static_bit_vector(konst_1345,1);\
bit_vector_clear(&konst_1345);\
konst_1345.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1346,1);\
bit_vector_clear(&type_cast_1346);\
type_cast_1346.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_1347,36);\
bit_vector_clear(&konst_1345);\
konst_1345.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1346), &(konst_1345));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_1347));\
_popFromQueue_( &(type_cast_1346),  &(RPIPE_FREE_Q_1347), &(rx_buffer_pointer_32), &(status));\
;

#define _ReceiveEngineDaemon_stmt_1352_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1352_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1352_c_macro___print_counter,"rx_buffer");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1352_c_macro___print_counter,"rx_buffer_pointer_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_buffer_pointer_32)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_assign_stmt_1358_c_macro_ __declare_static_bit_vector(konst_1355,4);\
bit_vector_clear(&konst_1355);\
__declare_static_bit_vector(type_cast_1356,4);\
bit_vector_clear(&type_cast_1356);\
__declare_static_bit_vector(CONCAT_u32_u36_1357,36);\
bit_vector_clear(&konst_1355);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1356), &(konst_1355));\
bit_vector_concatenate( &(rx_buffer_pointer_32), &(type_cast_1356), &(CONCAT_u32_u36_1357));\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer_36), &(CONCAT_u32_u36_1357));\
;

#define _ReceiveEngineDaemon_stmt_1360_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1360_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1360_c_macro___print_counter,"rx_buffer_val");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1360_c_macro___print_counter,"rx_buffer_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_buffer_pointer_36)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_stmt_1364_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1364_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1364_c_macro___print_counter,"calling_loadBuffer");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1364_c_macro___print_counter,"status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(status)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1364_c_macro___print_counter,"rx_buffer_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_buffer_pointer_36)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1364_c_macro___print_counter,"rx_buffer_pointer_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_buffer_pointer_32)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_1368_c_macro_ if (has_undefined_bit(&status)) {fprintf(stderr, "Error: variable status has undefined value (%s) at test point.\n", to_string(&status));assert(0);} \
if (!bit_vector_to_uint64(0, &status)) {\
_loadBuffer_( &(rx_buffer_pointer_36), &(bad_packet_identifier));\
}\
;

#define _ReceiveEngineDaemon_assign_stmt_1375_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1371,1);\
__declare_static_bit_vector(NOT_u1_u1_1373,1);\
__declare_static_bit_vector(AND_u1_u1_1374,1);\
bit_vector_not( &(status), &(NOT_u1_u1_1371));\
bit_vector_not( &(bad_packet_identifier), &(NOT_u1_u1_1373));\
bit_vector_and(&(NOT_u1_u1_1371), &(NOT_u1_u1_1373), &(AND_u1_u1_1374));\
bit_vector_cast_to_bit_vector(0, &(ok_flag), &(AND_u1_u1_1374));\
;

#define _ReceiveEngineDaemon_assign_stmt_1381_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1378,1);\
__declare_static_bit_vector(AND_u1_u1_1380,1);\
bit_vector_not( &(status), &(NOT_u1_u1_1378));\
bit_vector_and(&(NOT_u1_u1_1378), &(bad_packet_identifier), &(AND_u1_u1_1380));\
bit_vector_cast_to_bit_vector(0, &(free_flag), &(AND_u1_u1_1380));\
;

#define _ReceiveEngineDaemon_assign_stmt_1386_c_macro_ __declare_static_bit_vector(konst_1384,1);\
bit_vector_clear(&konst_1384);\
konst_1384.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_1385,1);\
bit_vector_clear(&konst_1384);\
konst_1384.val.byte_array[0] = 1;\
bit_vector_equal(0, &(ok_flag), &(konst_1384), &(EQ_u1_u1_1385));\
bit_vector_cast_to_bit_vector(0, &(cond), &(EQ_u1_u1_1385));\
;

#define _ReceiveEngineDaemon_stmt_1389_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1389_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1389_c_macro___print_counter,"populating_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1389_c_macro___print_counter,"ok_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ok_flag)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1389_c_macro___print_counter,"cond");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(cond)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_stmt_1390_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1390_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1390_c_macro___print_counter,"running_ok_flag");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_1393_c_macro_ if (has_undefined_bit(&ok_flag)) {fprintf(stderr, "Error: variable ok_flag has undefined value (%s) at test point.\n", to_string(&ok_flag));assert(0);} \
if (bit_vector_to_uint64(0, &ok_flag)) {\
_populateRxQueue_( &(rx_buffer_pointer_36));\
}\
;

#define _ReceiveEngineDaemon_stmt_1395_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1395_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1395_c_macro___print_counter,"pushing_into_free_q");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1395_c_macro___print_counter,"free_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(free_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_1403_c_macro_ if (has_undefined_bit(&free_flag)) {fprintf(stderr, "Error: variable free_flag has undefined value (%s) at test point.\n", to_string(&free_flag));assert(0);} \
__declare_static_bit_vector(konst_1397,1);\
bit_vector_clear(&konst_1397);\
konst_1397.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1398,1);\
bit_vector_clear(&type_cast_1398);\
type_cast_1398.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_1399,36);\
__declare_static_bit_vector(slice_1401,32);\
if (bit_vector_to_uint64(0, &free_flag)) {\
bit_vector_clear(&konst_1397);\
konst_1397.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1398), &(konst_1397));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_1399));\
bit_vector_slice(&(rx_buffer_pointer_36), &(slice_1401), 4);\
_pushIntoQueue_( &(type_cast_1398),  &(RPIPE_FREE_Q_1399),  &(slice_1401), &(push_status));\
}\
;

#define _ReceiveEngineDaemon_stmt_1404_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1404_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1404_c_macro___print_counter,"completed_iteration_in_receive_engine");release_file_print_lock(__report_log_file__);;
;

#define _ReceiveEngineDaemon_branch_block_stmt_1331_c_export_apply_macro_ ;

#define _ReceiveEngineDaemon_inner_outarg_prep_macro__ ;

#define _ReceiveEngineDaemon_outer_arg_decl_macro__ ;

#define _ReceiveEngineDaemon_outer_op_xfer_macro__ ;

#define _SoftwareRegisterAccessDaemon_inner_inarg_prep_macro__ 
#define _SoftwareRegisterAccessDaemon_stmt_1413_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1413_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1413_c_macro___print_counter,"started_SoftwareRegisterAccessDaemon");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_branch_block_stmt_1414_c_export_decl_macro_ __declare_static_bit_vector(INIT,1);\
__declare_static_bit_vector(control_register,1);\
__declare_static_bit_vector(free_q,1);\
__declare_static_bit_vector(num_server,1);\
__declare_static_bit_vector(control_data,32);\
__declare_static_bit_vector(update_control_register_pipe,1);\
__declare_static_bit_vector(update_free_q_pipe,1);\
__declare_static_bit_vector(update_server_num,1);\
__declare_static_bit_vector(FREE_Q_32,32);\
__declare_static_bit_vector(req,74);\
__declare_static_bit_vector(lock,1);\
__declare_static_bit_vector(rwbar,1);\
__declare_static_bit_vector(bmask,4);\
__declare_static_bit_vector(addr,36);\
__declare_static_bit_vector(wdata,32);\
__declare_static_bit_vector(index,6);\
__declare_static_bit_vector(check_control_regsiter,1);\
__declare_static_bit_vector(check_free_q,1);\
__declare_static_bit_vector(check_num_server,1);\
__declare_static_bit_vector(rval,32);\
__declare_static_bit_vector(wval,32);\
__declare_static_bit_vector(rdata,32);\
__declare_static_bit_vector(resp,33);\


#define _SoftwareRegisterAccessDaemon_merge_stmt_1416_c_preamble_macro_ uint8_t merge_stmt_1416_entry_flag;\
merge_stmt_1416_entry_flag = do_while_entry_flag;\
goto merge_stmt_1416_run;\
merge_stmt_1416_run: ;\

#define _SoftwareRegisterAccessDaemon_phi_stmt_1417_c_macro_ __declare_static_bit_vector(konst_1419,1);\
bit_vector_clear(&konst_1419);\
__declare_static_bit_vector(type_cast_1420,1);\
bit_vector_clear(&type_cast_1420);\
__declare_static_bit_vector(konst_1421,1);\
bit_vector_clear(&konst_1421);\
konst_1421.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1422,1);\
bit_vector_clear(&type_cast_1422);\
type_cast_1422.val.byte_array[0] = 1;\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_1421);\
konst_1421.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1422), &(konst_1421));\
bit_vector_cast_to_bit_vector(0, &(INIT), &(type_cast_1422));\
}\
else {\
__declare_static_bit_vector(konst_1419,1);\
bit_vector_clear(&konst_1419);\
__declare_static_bit_vector(type_cast_1420,1);\
bit_vector_clear(&type_cast_1420);\
bit_vector_clear(&konst_1419);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1420), &(konst_1419));\
bit_vector_cast_to_bit_vector(0, &(INIT), &(type_cast_1420));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_1423_c_macro_ __declare_static_bit_vector(konst_1425,1);\
bit_vector_clear(&konst_1425);\
__declare_static_bit_vector(type_cast_1426,1);\
bit_vector_clear(&type_cast_1426);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(control_register), &(check_control_regsiter));\
}\
else {\
__declare_static_bit_vector(konst_1425,1);\
bit_vector_clear(&konst_1425);\
__declare_static_bit_vector(type_cast_1426,1);\
bit_vector_clear(&type_cast_1426);\
bit_vector_clear(&konst_1425);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1426), &(konst_1425));\
bit_vector_cast_to_bit_vector(0, &(control_register), &(type_cast_1426));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_1428_c_macro_ __declare_static_bit_vector(konst_1430,1);\
bit_vector_clear(&konst_1430);\
__declare_static_bit_vector(type_cast_1431,1);\
bit_vector_clear(&type_cast_1431);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(free_q), &(check_free_q));\
}\
else {\
__declare_static_bit_vector(konst_1430,1);\
bit_vector_clear(&konst_1430);\
__declare_static_bit_vector(type_cast_1431,1);\
bit_vector_clear(&type_cast_1431);\
bit_vector_clear(&konst_1430);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1431), &(konst_1430));\
bit_vector_cast_to_bit_vector(0, &(free_q), &(type_cast_1431));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_1433_c_macro_ __declare_static_bit_vector(konst_1435,1);\
bit_vector_clear(&konst_1435);\
__declare_static_bit_vector(type_cast_1436,1);\
bit_vector_clear(&type_cast_1436);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(num_server), &(check_num_server));\
}\
else {\
__declare_static_bit_vector(konst_1435,1);\
bit_vector_clear(&konst_1435);\
__declare_static_bit_vector(type_cast_1436,1);\
bit_vector_clear(&type_cast_1436);\
bit_vector_clear(&konst_1435);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1436), &(konst_1435));\
bit_vector_cast_to_bit_vector(0, &(num_server), &(type_cast_1436));\
}\
;
;

#define _SoftwareRegisterAccessDaemon_merge_stmt_1416_c_postamble_macro_ merge_stmt_1416_entry_flag = 0;

#define _SoftwareRegisterAccessDaemon_stmt_1439_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1439_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1439_c_macro___print_counter,"looping_in_SoftwareRegisterAccessDaemon");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1443_c_macro_ __declare_static_bit_vector(konst_1441,32);\
bit_vector_clear(&konst_1441);\
bit_vector_clear(&konst_1441);\
bit_vector_cast_to_bit_vector(0, &(control_data), &((nic_registers[bit_vector_to_uint64(0, &konst_1441)])));\
;

#define _SoftwareRegisterAccessDaemon_stmt_1445_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1445_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1445_c_macro___print_counter,"control");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t\t%s\t\t",_SoftwareRegisterAccessDaemon_stmt_1445_c_macro___print_counter,"control_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(control_data)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1453_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1448,1);\
__declare_static_bit_vector(AND_u1_u1_1451,1);\
__declare_static_bit_vector(OR_u1_u1_1452,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_1448));\
bit_vector_and(&(INIT), &(control_register), &(AND_u1_u1_1451));\
bit_vector_or(&(NOT_u1_u1_1448), &(AND_u1_u1_1451), &(OR_u1_u1_1452));\
bit_vector_cast_to_bit_vector(0, &(update_control_register_pipe), &(OR_u1_u1_1452));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1461_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1456,1);\
__declare_static_bit_vector(AND_u1_u1_1459,1);\
__declare_static_bit_vector(OR_u1_u1_1460,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_1456));\
bit_vector_and(&(INIT), &(free_q), &(AND_u1_u1_1459));\
bit_vector_or(&(NOT_u1_u1_1456), &(AND_u1_u1_1459), &(OR_u1_u1_1460));\
bit_vector_cast_to_bit_vector(0, &(update_free_q_pipe), &(OR_u1_u1_1460));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1469_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1464,1);\
__declare_static_bit_vector(AND_u1_u1_1467,1);\
__declare_static_bit_vector(OR_u1_u1_1468,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_1464));\
bit_vector_and(&(INIT), &(num_server), &(AND_u1_u1_1467));\
bit_vector_or(&(NOT_u1_u1_1464), &(AND_u1_u1_1467), &(OR_u1_u1_1468));\
bit_vector_cast_to_bit_vector(0, &(update_server_num), &(OR_u1_u1_1468));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1474_c_macro_ if (has_undefined_bit(&update_control_register_pipe)) {fprintf(stderr, "Error: variable update_control_register_pipe has undefined value (%s) at test point.\n", to_string(&update_control_register_pipe));assert(0);} \
__declare_static_bit_vector(konst_1472,32);\
bit_vector_clear(&konst_1472);\
if (bit_vector_to_uint64(0, &update_control_register_pipe)) {\
bit_vector_clear(&konst_1472);\
write_bit_vector_to_pipe("CONTROL_REGISTER",&((nic_registers[bit_vector_to_uint64(0, &konst_1472)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1479_c_macro_ if (has_undefined_bit(&update_free_q_pipe)) {fprintf(stderr, "Error: variable update_free_q_pipe has undefined value (%s) at test point.\n", to_string(&update_free_q_pipe));assert(0);} \
__declare_static_bit_vector(konst_1477,32);\
bit_vector_clear(&konst_1477);\
konst_1477.val.byte_array[0] = 18;\
if (bit_vector_to_uint64(0, &update_free_q_pipe)) {\
bit_vector_clear(&konst_1477);\
konst_1477.val.byte_array[0] = 18;\
bit_vector_cast_to_bit_vector(0, &(FREE_Q_32), &((nic_registers[bit_vector_to_uint64(0, &konst_1477)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1487_c_macro_ if (has_undefined_bit(&update_free_q_pipe)) {fprintf(stderr, "Error: variable update_free_q_pipe has undefined value (%s) at test point.\n", to_string(&update_free_q_pipe));assert(0);} \
__declare_static_bit_vector(konst_1483,3);\
bit_vector_clear(&konst_1483);\
__declare_static_bit_vector(type_cast_1484,3);\
bit_vector_clear(&type_cast_1484);\
__declare_static_bit_vector(CONCAT_u32_u35_1485,35);\
__declare_static_bit_vector(type_cast_1486,36);\
if (bit_vector_to_uint64(0, &update_free_q_pipe)) {\
bit_vector_clear(&konst_1483);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1484), &(konst_1483));\
bit_vector_concatenate( &(FREE_Q_32), &(type_cast_1484), &(CONCAT_u32_u35_1485));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1486), &(CONCAT_u32_u35_1485));\
write_bit_vector_to_pipe("FREE_Q",&(type_cast_1486));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1492_c_macro_ if (has_undefined_bit(&update_server_num)) {fprintf(stderr, "Error: variable update_server_num has undefined value (%s) at test point.\n", to_string(&update_server_num));assert(0);} \
__declare_static_bit_vector(konst_1490,32);\
bit_vector_clear(&konst_1490);\
konst_1490.val.byte_array[0] = 1;\
if (bit_vector_to_uint64(0, &update_server_num)) {\
bit_vector_clear(&konst_1490);\
konst_1490.val.byte_array[0] = 1;\
write_bit_vector_to_pipe("NUMBER_OF_SERVERS",&((nic_registers[bit_vector_to_uint64(0, &konst_1490)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1495_c_macro_ __declare_static_bit_vector(RPIPE_AFB_NIC_REQUEST_1494,74);\
read_bit_vector_from_pipe("AFB_NIC_REQUEST",&(RPIPE_AFB_NIC_REQUEST_1494));\
bit_vector_cast_to_bit_vector(0, &(req), &(RPIPE_AFB_NIC_REQUEST_1494));\
;

#define _SoftwareRegisterAccessDaemon_stmt_1497_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1497_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1497_c_macro___print_counter,"got_afb_req");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t\t%s\t\t",_SoftwareRegisterAccessDaemon_stmt_1497_c_macro___print_counter,"req");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(req)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1501_c_macro_ __declare_static_bit_vector(slice_1500,1);\
bit_vector_slice(&(req), &(slice_1500), 73);\
bit_vector_cast_to_bit_vector(0, &(lock), &(slice_1500));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1505_c_macro_ __declare_static_bit_vector(slice_1504,1);\
bit_vector_slice(&(req), &(slice_1504), 72);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_1504));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1509_c_macro_ __declare_static_bit_vector(slice_1508,4);\
bit_vector_slice(&(req), &(slice_1508), 68);\
bit_vector_cast_to_bit_vector(0, &(bmask), &(slice_1508));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1513_c_macro_ __declare_static_bit_vector(slice_1512,36);\
bit_vector_slice(&(req), &(slice_1512), 32);\
bit_vector_cast_to_bit_vector(0, &(addr), &(slice_1512));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1517_c_macro_ __declare_static_bit_vector(slice_1516,32);\
bit_vector_slice(&(req), &(slice_1516), 0);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_1516));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1521_c_macro_ __declare_static_bit_vector(slice_1520,6);\
bit_vector_slice(&(addr), &(slice_1520), 2);\
bit_vector_cast_to_bit_vector(0, &(index), &(slice_1520));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1530_c_macro_ __declare_static_bit_vector(konst_1524,6);\
bit_vector_clear(&konst_1524);\
__declare_static_bit_vector(EQ_u6_u1_1525,1);\
__declare_static_bit_vector(konst_1527,1);\
bit_vector_clear(&konst_1527);\
__declare_static_bit_vector(EQ_u1_u1_1528,1);\
__declare_static_bit_vector(AND_u1_u1_1529,1);\
bit_vector_clear(&konst_1524);\
bit_vector_equal(0, &(index), &(konst_1524), &(EQ_u6_u1_1525));\
bit_vector_clear(&konst_1527);\
bit_vector_equal(0, &(rwbar), &(konst_1527), &(EQ_u1_u1_1528));\
bit_vector_and(&(EQ_u6_u1_1525), &(EQ_u1_u1_1528), &(AND_u1_u1_1529));\
bit_vector_cast_to_bit_vector(0, &(check_control_regsiter), &(AND_u1_u1_1529));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1539_c_macro_ __declare_static_bit_vector(konst_1533,6);\
bit_vector_clear(&konst_1533);\
konst_1533.val.byte_array[0] = 18;\
__declare_static_bit_vector(EQ_u6_u1_1534,1);\
__declare_static_bit_vector(konst_1536,1);\
bit_vector_clear(&konst_1536);\
__declare_static_bit_vector(EQ_u1_u1_1537,1);\
__declare_static_bit_vector(AND_u1_u1_1538,1);\
bit_vector_clear(&konst_1533);\
konst_1533.val.byte_array[0] = 18;\
bit_vector_equal(0, &(index), &(konst_1533), &(EQ_u6_u1_1534));\
bit_vector_clear(&konst_1536);\
bit_vector_equal(0, &(rwbar), &(konst_1536), &(EQ_u1_u1_1537));\
bit_vector_and(&(EQ_u6_u1_1534), &(EQ_u1_u1_1537), &(AND_u1_u1_1538));\
bit_vector_cast_to_bit_vector(0, &(check_free_q), &(AND_u1_u1_1538));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1548_c_macro_ __declare_static_bit_vector(konst_1542,6);\
bit_vector_clear(&konst_1542);\
konst_1542.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u6_u1_1543,1);\
__declare_static_bit_vector(konst_1545,1);\
bit_vector_clear(&konst_1545);\
__declare_static_bit_vector(EQ_u1_u1_1546,1);\
__declare_static_bit_vector(AND_u1_u1_1547,1);\
bit_vector_clear(&konst_1542);\
konst_1542.val.byte_array[0] = 1;\
bit_vector_equal(0, &(index), &(konst_1542), &(EQ_u6_u1_1543));\
bit_vector_clear(&konst_1545);\
bit_vector_equal(0, &(rwbar), &(konst_1545), &(EQ_u1_u1_1546));\
bit_vector_and(&(EQ_u6_u1_1543), &(EQ_u1_u1_1546), &(AND_u1_u1_1547));\
bit_vector_cast_to_bit_vector(0, &(check_num_server), &(AND_u1_u1_1547));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1552_c_macro_ bit_vector_cast_to_bit_vector(0, &(rval), &((nic_registers[bit_vector_to_uint64(0, &index)])));\
;

#define _SoftwareRegisterAccessDaemon_call_stmt_1559_c_macro_ if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if (!bit_vector_to_uint64(0, &rwbar)) {\
_UpdateRegister_( &(bmask),  &(rval),  &(wdata),  &(index), &(wval));\
}\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1566_c_macro_ __declare_static_bit_vector(konst_1563,32);\
bit_vector_clear(&konst_1563);\
__declare_static_bit_vector(type_cast_1564,32);\
bit_vector_clear(&type_cast_1564);\
__declare_static_bit_vector(MUX_1565,32);\
if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if(bit_vector_to_uint64(0, &rwbar)){bit_vector_cast_to_bit_vector(0, &(MUX_1565), &(rval));\
}else {bit_vector_clear(&konst_1563);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1564), &(konst_1563));\
bit_vector_cast_to_bit_vector(0, &(MUX_1565), &(type_cast_1564));\
}bit_vector_cast_to_bit_vector(0, &(rdata), &(MUX_1565));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1572_c_macro_ __declare_static_bit_vector(konst_1568,1);\
bit_vector_clear(&konst_1568);\
__declare_static_bit_vector(type_cast_1569,1);\
bit_vector_clear(&type_cast_1569);\
__declare_static_bit_vector(CONCAT_u1_u33_1571,33);\
bit_vector_clear(&konst_1568);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1569), &(konst_1568));\
bit_vector_concatenate( &(type_cast_1569), &(rdata), &(CONCAT_u1_u33_1571));\
bit_vector_cast_to_bit_vector(0, &(resp), &(CONCAT_u1_u33_1571));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1575_c_macro_ write_bit_vector_to_pipe("AFB_NIC_RESPONSE",&(resp));\
;
;

#define _SoftwareRegisterAccessDaemon_branch_block_stmt_1414_c_export_apply_macro_ ;

#define _SoftwareRegisterAccessDaemon_inner_outarg_prep_macro__ ;

#define _SoftwareRegisterAccessDaemon_outer_arg_decl_macro__ ;

#define _SoftwareRegisterAccessDaemon_outer_op_xfer_macro__ ;

#define _UpdateRegister_inner_inarg_prep_macro__ __declare_static_bit_vector(bmask,4);\
bit_vector_cast_to_bit_vector(0, &(bmask), &((*__pbmask)));\
__declare_static_bit_vector(rval,32);\
bit_vector_cast_to_bit_vector(0, &(rval), &((*__prval)));\
__declare_static_bit_vector(wdata,32);\
bit_vector_cast_to_bit_vector(0, &(wdata), &((*__pwdata)));\
__declare_static_bit_vector(index,6);\
bit_vector_cast_to_bit_vector(0, &(index), &((*__pindex)));\
__declare_static_bit_vector(wval,32);\
__declare_static_bit_vector(b0,1);\
__declare_static_bit_vector(b1,1);\
__declare_static_bit_vector(b2,1);\
__declare_static_bit_vector(b3,1);\
__declare_static_bit_vector(r0,8);\
__declare_static_bit_vector(r1,8);\
__declare_static_bit_vector(r2,8);\
__declare_static_bit_vector(r3,8);\
__declare_static_bit_vector(w0,8);\
__declare_static_bit_vector(w1,8);\
__declare_static_bit_vector(w2,8);\
__declare_static_bit_vector(w3,8);\

#define _UpdateRegister_assign_stmt_130_c_macro_ __declare_static_bit_vector(slice_129,1);\
bit_vector_slice(&(bmask), &(slice_129), 3);\
bit_vector_cast_to_bit_vector(0, &(b0), &(slice_129));\
;

#define _UpdateRegister_assign_stmt_134_c_macro_ __declare_static_bit_vector(slice_133,1);\
bit_vector_slice(&(bmask), &(slice_133), 2);\
bit_vector_cast_to_bit_vector(0, &(b1), &(slice_133));\
;

#define _UpdateRegister_assign_stmt_138_c_macro_ __declare_static_bit_vector(slice_137,1);\
bit_vector_slice(&(bmask), &(slice_137), 1);\
bit_vector_cast_to_bit_vector(0, &(b2), &(slice_137));\
;

#define _UpdateRegister_assign_stmt_142_c_macro_ __declare_static_bit_vector(slice_141,1);\
bit_vector_slice(&(bmask), &(slice_141), 0);\
bit_vector_cast_to_bit_vector(0, &(b3), &(slice_141));\
;

#define _UpdateRegister_assign_stmt_146_c_macro_ __declare_static_bit_vector(slice_145,8);\
bit_vector_slice(&(rval), &(slice_145), 24);\
bit_vector_cast_to_bit_vector(0, &(r0), &(slice_145));\
;

#define _UpdateRegister_assign_stmt_150_c_macro_ __declare_static_bit_vector(slice_149,8);\
bit_vector_slice(&(rval), &(slice_149), 16);\
bit_vector_cast_to_bit_vector(0, &(r1), &(slice_149));\
;

#define _UpdateRegister_assign_stmt_154_c_macro_ __declare_static_bit_vector(slice_153,8);\
bit_vector_slice(&(rval), &(slice_153), 8);\
bit_vector_cast_to_bit_vector(0, &(r2), &(slice_153));\
;

#define _UpdateRegister_assign_stmt_158_c_macro_ __declare_static_bit_vector(slice_157,8);\
bit_vector_slice(&(rval), &(slice_157), 0);\
bit_vector_cast_to_bit_vector(0, &(r3), &(slice_157));\
;

#define _UpdateRegister_assign_stmt_162_c_macro_ __declare_static_bit_vector(slice_161,8);\
bit_vector_slice(&(wdata), &(slice_161), 24);\
bit_vector_cast_to_bit_vector(0, &(w0), &(slice_161));\
;

#define _UpdateRegister_assign_stmt_166_c_macro_ __declare_static_bit_vector(slice_165,8);\
bit_vector_slice(&(wdata), &(slice_165), 16);\
bit_vector_cast_to_bit_vector(0, &(w1), &(slice_165));\
;

#define _UpdateRegister_assign_stmt_170_c_macro_ __declare_static_bit_vector(slice_169,8);\
bit_vector_slice(&(wdata), &(slice_169), 8);\
bit_vector_cast_to_bit_vector(0, &(w2), &(slice_169));\
;

#define _UpdateRegister_assign_stmt_174_c_macro_ __declare_static_bit_vector(slice_173,8);\
bit_vector_slice(&(wdata), &(slice_173), 0);\
bit_vector_cast_to_bit_vector(0, &(w3), &(slice_173));\
;

#define _UpdateRegister_assign_stmt_195_c_macro_ __declare_static_bit_vector(MUX_179,8);\
__declare_static_bit_vector(MUX_183,8);\
__declare_static_bit_vector(CONCAT_u8_u16_184,16);\
__declare_static_bit_vector(MUX_188,8);\
__declare_static_bit_vector(MUX_192,8);\
__declare_static_bit_vector(CONCAT_u8_u16_193,16);\
__declare_static_bit_vector(CONCAT_u16_u32_194,32);\
if (has_undefined_bit(&b0)) {fprintf(stderr, "Error: variable b0 has undefined value (%s) at test point.\n", to_string(&b0));assert(0);} \
if(bit_vector_to_uint64(0, &b0)){bit_vector_cast_to_bit_vector(0, &(MUX_179), &(w0));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_179), &(r0));\
}if (has_undefined_bit(&b1)) {fprintf(stderr, "Error: variable b1 has undefined value (%s) at test point.\n", to_string(&b1));assert(0);} \
if(bit_vector_to_uint64(0, &b1)){bit_vector_cast_to_bit_vector(0, &(MUX_183), &(w1));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_183), &(r1));\
}bit_vector_concatenate( &(MUX_179), &(MUX_183), &(CONCAT_u8_u16_184));\
if (has_undefined_bit(&b2)) {fprintf(stderr, "Error: variable b2 has undefined value (%s) at test point.\n", to_string(&b2));assert(0);} \
if(bit_vector_to_uint64(0, &b2)){bit_vector_cast_to_bit_vector(0, &(MUX_188), &(w2));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_188), &(r2));\
}if (has_undefined_bit(&b3)) {fprintf(stderr, "Error: variable b3 has undefined value (%s) at test point.\n", to_string(&b3));assert(0);} \
if(bit_vector_to_uint64(0, &b3)){bit_vector_cast_to_bit_vector(0, &(MUX_192), &(w3));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_192), &(r3));\
}bit_vector_concatenate( &(MUX_188), &(MUX_192), &(CONCAT_u8_u16_193));\
bit_vector_concatenate( &(CONCAT_u8_u16_184), &(CONCAT_u8_u16_193), &(CONCAT_u16_u32_194));\
bit_vector_cast_to_bit_vector(0, &(wval), &(CONCAT_u16_u32_194));\
;

#define _UpdateRegister_assign_stmt_199_c_macro_ bit_vector_cast_to_bit_vector(0, &((nic_registers[bit_vector_to_uint64(0, &index)])), &(wval));\
;

#define _UpdateRegister_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pwval)), &(wval));\
;

#define _accessMemory_inner_inarg_prep_macro__ __declare_static_bit_vector(lock,1);\
bit_vector_cast_to_bit_vector(0, &(lock), &((*__plock)));\
__declare_static_bit_vector(rwbar,1);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &((*__prwbar)));\
__declare_static_bit_vector(bmask,8);\
bit_vector_cast_to_bit_vector(0, &(bmask), &((*__pbmask)));\
__declare_static_bit_vector(addr,36);\
bit_vector_cast_to_bit_vector(0, &(addr), &((*__paddr)));\
__declare_static_bit_vector(wdata,64);\
bit_vector_cast_to_bit_vector(0, &(wdata), &((*__pwdata)));\
__declare_static_bit_vector(rdata,64);\
__declare_static_bit_vector(request,110);\
__declare_static_bit_vector(response,65);\
__declare_static_bit_vector(err,1);\

#define _accessMemory_assign_stmt_276_c_macro_ __declare_static_bit_vector(CONCAT_u1_u2_269,2);\
__declare_static_bit_vector(CONCAT_u2_u10_271,10);\
__declare_static_bit_vector(CONCAT_u36_u100_274,100);\
__declare_static_bit_vector(CONCAT_u10_u110_275,110);\
bit_vector_concatenate( &(lock), &(rwbar), &(CONCAT_u1_u2_269));\
bit_vector_concatenate( &(CONCAT_u1_u2_269), &(bmask), &(CONCAT_u2_u10_271));\
bit_vector_concatenate( &(addr), &(wdata), &(CONCAT_u36_u100_274));\
bit_vector_concatenate( &(CONCAT_u2_u10_271), &(CONCAT_u36_u100_274), &(CONCAT_u10_u110_275));\
bit_vector_cast_to_bit_vector(0, &(request), &(CONCAT_u10_u110_275));\
;

#define _accessMemory_assign_stmt_279_c_macro_ write_bit_vector_to_pipe("NIC_TO_MEMORY_REQUEST",&(request));\
;

#define _accessMemory_assign_stmt_282_c_macro_ __declare_static_bit_vector(RPIPE_MEMORY_TO_NIC_RESPONSE_281,65);\
read_bit_vector_from_pipe("MEMORY_TO_NIC_RESPONSE",&(RPIPE_MEMORY_TO_NIC_RESPONSE_281));\
bit_vector_cast_to_bit_vector(0, &(response), &(RPIPE_MEMORY_TO_NIC_RESPONSE_281));\
;

#define _accessMemory_assign_stmt_286_c_macro_ __declare_static_bit_vector(slice_285,1);\
bit_vector_slice(&(response), &(slice_285), 64);\
bit_vector_cast_to_bit_vector(0, &(err), &(slice_285));\
;

#define _accessMemory_assign_stmt_290_c_macro_ __declare_static_bit_vector(slice_289,64);\
bit_vector_slice(&(response), &(slice_289), 0);\
bit_vector_cast_to_bit_vector(0, &(rdata), &(slice_289));\
;

#define _accessMemory_stmt_296_c_macro_ uint32_t _accessMemory_stmt_296_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]accessMemory>\t%s\n",_accessMemory_stmt_296_c_macro___print_counter,"byte_mask");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_296_c_macro___print_counter,"bmask");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(bmask)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_296_c_macro___print_counter,"rwbar");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rwbar)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_296_c_macro___print_counter,"addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(addr)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_296_c_macro___print_counter,"wdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wdata)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_296_c_macro___print_counter,"err");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(err)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _accessMemory_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__prdata)), &(rdata));\
;

#define _acquireLock_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(m_ok,1);\

#define _acquireLock_branch_block_stmt_301_c_export_decl_macro_ __declare_static_bit_vector(lock_address_pointer,36);\
__declare_static_bit_vector(msg_size_plus_lock,64);\
__declare_static_bit_vector(lock_addr_32,32);\
__declare_static_bit_vector(sel,3);\
__declare_static_bit_vector(lock_values,64);\
__declare_static_bit_vector(l0,8);\
__declare_static_bit_vector(l1,8);\
__declare_static_bit_vector(l2,8);\
__declare_static_bit_vector(l3,8);\
__declare_static_bit_vector(l4,8);\
__declare_static_bit_vector(l5,8);\
__declare_static_bit_vector(l6,8);\
__declare_static_bit_vector(l7,8);\
__declare_static_bit_vector(lock_val,8);\
__declare_static_bit_vector(err,64);\
__declare_static_bit_vector(s0,1);\
__declare_static_bit_vector(s1,1);\
__declare_static_bit_vector(s2,1);\
__declare_static_bit_vector(s3,1);\
__declare_static_bit_vector(s4,1);\
__declare_static_bit_vector(s5,1);\
__declare_static_bit_vector(s6,1);\
__declare_static_bit_vector(s7,1);\
__declare_static_bit_vector(new_bmask,8);\
__declare_static_bit_vector(ignore,64);\


#define _acquireLock_assign_stmt_307_c_macro_ __declare_static_bit_vector(konst_304,36);\
bit_vector_clear(&konst_304);\
konst_304.val.byte_array[0] = 20;\
__declare_static_bit_vector(type_cast_305,36);\
bit_vector_clear(&type_cast_305);\
type_cast_305.val.byte_array[0] = 20;\
__declare_static_bit_vector(ADD_u36_u36_306,36);\
bit_vector_clear(&konst_304);\
konst_304.val.byte_array[0] = 20;\
bit_vector_bitcast_to_bit_vector( &(type_cast_305), &(konst_304));\
bit_vector_plus( &(q_base_address), &(type_cast_305), &(ADD_u36_u36_306));\
bit_vector_cast_to_bit_vector(0, &(lock_address_pointer), &(ADD_u36_u36_306));\
;

#define _acquireLock_merge_stmt_308_c_preamble_macro_ uint8_t merge_stmt_308_entry_flag;\
merge_stmt_308_entry_flag = 1;\
uint8_t loopback_301_flag = 0;\
goto merge_stmt_308_run;\
loopback_301: loopback_301_flag = 1;\
goto merge_stmt_308_run;\
merge_stmt_308_run: ;\
;

#define _acquireLock_merge_stmt_308_c_postamble_macro_ loopback_301_flag = 0;\
merge_stmt_308_entry_flag = 0;

#define _acquireLock_call_stmt_320_c_macro_ __declare_static_bit_vector(konst_309,1);\
bit_vector_clear(&konst_309);\
konst_309.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_310,1);\
bit_vector_clear(&type_cast_310);\
type_cast_310.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_311,1);\
bit_vector_clear(&konst_311);\
konst_311.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_312,1);\
bit_vector_clear(&type_cast_312);\
type_cast_312.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_313,8);\
bit_vector_clear(&konst_313);\
__declare_static_bit_vector(type_cast_314,8);\
bit_vector_clear(&type_cast_314);\
__declare_static_bit_vector(NOT_u8_u8_315,8);\
bit_vector_clear(&NOT_u8_u8_315);\
NOT_u8_u8_315.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_317,64);\
bit_vector_clear(&konst_317);\
__declare_static_bit_vector(type_cast_318,64);\
bit_vector_clear(&type_cast_318);\
bit_vector_clear(&konst_309);\
konst_309.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_310), &(konst_309));\
bit_vector_clear(&konst_311);\
konst_311.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_312), &(konst_311));\
bit_vector_clear(&konst_313);\
bit_vector_bitcast_to_bit_vector( &(type_cast_314), &(konst_313));\
bit_vector_not( &(type_cast_314), &(NOT_u8_u8_315));\
bit_vector_clear(&konst_317);\
bit_vector_bitcast_to_bit_vector( &(type_cast_318), &(konst_317));\
_accessMemory_( &(type_cast_310),  &(type_cast_312),  &(NOT_u8_u8_315),  &(lock_address_pointer),  &(type_cast_318), &(msg_size_plus_lock));\
;

#define _acquireLock_assign_stmt_324_c_macro_ __declare_static_bit_vector(slice_323,32);\
bit_vector_slice(&(msg_size_plus_lock), &(slice_323), 0);\
bit_vector_cast_to_bit_vector(0, &(lock_addr_32), &(slice_323));\
;

#define _acquireLock_assign_stmt_329_c_macro_ __declare_static_bit_vector(slice_328,3);\
bit_vector_slice(&(lock_addr_32), &(slice_328), 0);\
bit_vector_cast_to_bit_vector(0, &(sel), &(slice_328));\
;

#define _acquireLock_call_stmt_344_c_macro_ __declare_static_bit_vector(konst_330,1);\
bit_vector_clear(&konst_330);\
konst_330.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_331,1);\
bit_vector_clear(&type_cast_331);\
type_cast_331.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_332,1);\
bit_vector_clear(&konst_332);\
konst_332.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_333,1);\
bit_vector_clear(&type_cast_333);\
type_cast_333.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_334,8);\
bit_vector_clear(&konst_334);\
__declare_static_bit_vector(type_cast_335,8);\
bit_vector_clear(&type_cast_335);\
__declare_static_bit_vector(NOT_u8_u8_336,8);\
bit_vector_clear(&NOT_u8_u8_336);\
NOT_u8_u8_336.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_337,4);\
bit_vector_clear(&konst_337);\
__declare_static_bit_vector(type_cast_338,4);\
bit_vector_clear(&type_cast_338);\
__declare_static_bit_vector(CONCAT_u4_u36_340,36);\
__declare_static_bit_vector(konst_341,64);\
bit_vector_clear(&konst_341);\
__declare_static_bit_vector(type_cast_342,64);\
bit_vector_clear(&type_cast_342);\
bit_vector_clear(&konst_330);\
konst_330.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_331), &(konst_330));\
bit_vector_clear(&konst_332);\
konst_332.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_333), &(konst_332));\
bit_vector_clear(&konst_334);\
bit_vector_bitcast_to_bit_vector( &(type_cast_335), &(konst_334));\
bit_vector_not( &(type_cast_335), &(NOT_u8_u8_336));\
bit_vector_clear(&konst_337);\
bit_vector_bitcast_to_bit_vector( &(type_cast_338), &(konst_337));\
bit_vector_concatenate( &(type_cast_338), &(lock_addr_32), &(CONCAT_u4_u36_340));\
bit_vector_clear(&konst_341);\
bit_vector_bitcast_to_bit_vector( &(type_cast_342), &(konst_341));\
_accessMemory_( &(type_cast_331),  &(type_cast_333),  &(NOT_u8_u8_336),  &(CONCAT_u4_u36_340),  &(type_cast_342), &(lock_values));\
;

#define _acquireLock_assign_stmt_348_c_macro_ __declare_static_bit_vector(slice_347,8);\
bit_vector_slice(&(lock_values), &(slice_347), 56);\
bit_vector_cast_to_bit_vector(0, &(l0), &(slice_347));\
;

#define _acquireLock_assign_stmt_352_c_macro_ __declare_static_bit_vector(slice_351,8);\
bit_vector_slice(&(lock_values), &(slice_351), 48);\
bit_vector_cast_to_bit_vector(0, &(l1), &(slice_351));\
;

#define _acquireLock_assign_stmt_356_c_macro_ __declare_static_bit_vector(slice_355,8);\
bit_vector_slice(&(lock_values), &(slice_355), 40);\
bit_vector_cast_to_bit_vector(0, &(l2), &(slice_355));\
;

#define _acquireLock_assign_stmt_360_c_macro_ __declare_static_bit_vector(slice_359,8);\
bit_vector_slice(&(lock_values), &(slice_359), 32);\
bit_vector_cast_to_bit_vector(0, &(l3), &(slice_359));\
;

#define _acquireLock_assign_stmt_364_c_macro_ __declare_static_bit_vector(slice_363,8);\
bit_vector_slice(&(lock_values), &(slice_363), 24);\
bit_vector_cast_to_bit_vector(0, &(l4), &(slice_363));\
;

#define _acquireLock_assign_stmt_368_c_macro_ __declare_static_bit_vector(slice_367,8);\
bit_vector_slice(&(lock_values), &(slice_367), 16);\
bit_vector_cast_to_bit_vector(0, &(l5), &(slice_367));\
;

#define _acquireLock_assign_stmt_372_c_macro_ __declare_static_bit_vector(slice_371,8);\
bit_vector_slice(&(lock_values), &(slice_371), 8);\
bit_vector_cast_to_bit_vector(0, &(l6), &(slice_371));\
;

#define _acquireLock_assign_stmt_376_c_macro_ __declare_static_bit_vector(slice_375,8);\
bit_vector_slice(&(lock_values), &(slice_375), 0);\
bit_vector_cast_to_bit_vector(0, &(l7), &(slice_375));\
;

#define _acquireLock_assign_stmt_433_c_macro_ __declare_static_bit_vector(konst_379,3);\
bit_vector_clear(&konst_379);\
__declare_static_bit_vector(EQ_u3_u1_380,1);\
__declare_static_bit_vector(konst_382,8);\
bit_vector_clear(&konst_382);\
__declare_static_bit_vector(MUX_383,8);\
__declare_static_bit_vector(konst_385,3);\
bit_vector_clear(&konst_385);\
konst_385.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u3_u1_386,1);\
__declare_static_bit_vector(konst_388,8);\
bit_vector_clear(&konst_388);\
__declare_static_bit_vector(MUX_389,8);\
__declare_static_bit_vector(OR_u8_u8_390,8);\
__declare_static_bit_vector(konst_392,3);\
bit_vector_clear(&konst_392);\
konst_392.val.byte_array[0] = 2;\
__declare_static_bit_vector(EQ_u3_u1_393,1);\
__declare_static_bit_vector(konst_395,8);\
bit_vector_clear(&konst_395);\
__declare_static_bit_vector(MUX_396,8);\
__declare_static_bit_vector(konst_398,3);\
bit_vector_clear(&konst_398);\
konst_398.val.byte_array[0] = 3;\
__declare_static_bit_vector(EQ_u3_u1_399,1);\
__declare_static_bit_vector(konst_401,8);\
bit_vector_clear(&konst_401);\
__declare_static_bit_vector(MUX_402,8);\
__declare_static_bit_vector(OR_u8_u8_403,8);\
__declare_static_bit_vector(OR_u8_u8_404,8);\
__declare_static_bit_vector(konst_406,3);\
bit_vector_clear(&konst_406);\
konst_406.val.byte_array[0] = 4;\
__declare_static_bit_vector(EQ_u3_u1_407,1);\
__declare_static_bit_vector(konst_409,8);\
bit_vector_clear(&konst_409);\
__declare_static_bit_vector(MUX_410,8);\
__declare_static_bit_vector(konst_412,3);\
bit_vector_clear(&konst_412);\
konst_412.val.byte_array[0] = 5;\
__declare_static_bit_vector(EQ_u3_u1_413,1);\
__declare_static_bit_vector(konst_415,8);\
bit_vector_clear(&konst_415);\
__declare_static_bit_vector(MUX_416,8);\
__declare_static_bit_vector(OR_u8_u8_417,8);\
__declare_static_bit_vector(konst_419,3);\
bit_vector_clear(&konst_419);\
konst_419.val.byte_array[0] = 6;\
__declare_static_bit_vector(EQ_u3_u1_420,1);\
__declare_static_bit_vector(konst_422,8);\
bit_vector_clear(&konst_422);\
__declare_static_bit_vector(MUX_423,8);\
__declare_static_bit_vector(konst_425,3);\
bit_vector_clear(&konst_425);\
konst_425.val.byte_array[0] = 7;\
__declare_static_bit_vector(EQ_u3_u1_426,1);\
__declare_static_bit_vector(konst_428,8);\
bit_vector_clear(&konst_428);\
__declare_static_bit_vector(MUX_429,8);\
__declare_static_bit_vector(OR_u8_u8_430,8);\
__declare_static_bit_vector(OR_u8_u8_431,8);\
__declare_static_bit_vector(OR_u8_u8_432,8);\
bit_vector_clear(&konst_379);\
bit_vector_equal(0, &(sel), &(konst_379), &(EQ_u3_u1_380));\
if (has_undefined_bit(&EQ_u3_u1_380)) {fprintf(stderr, "Error: variable EQ_u3_u1_380 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_380));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_380)){bit_vector_cast_to_bit_vector(0, &(MUX_383), &(l0));\
}else {bit_vector_clear(&konst_382);\
bit_vector_cast_to_bit_vector(0, &(MUX_383), &(konst_382));\
}bit_vector_clear(&konst_385);\
konst_385.val.byte_array[0] = 1;\
bit_vector_equal(0, &(sel), &(konst_385), &(EQ_u3_u1_386));\
if (has_undefined_bit(&EQ_u3_u1_386)) {fprintf(stderr, "Error: variable EQ_u3_u1_386 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_386));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_386)){bit_vector_cast_to_bit_vector(0, &(MUX_389), &(l1));\
}else {bit_vector_clear(&konst_388);\
bit_vector_cast_to_bit_vector(0, &(MUX_389), &(konst_388));\
}bit_vector_or(&(MUX_383), &(MUX_389), &(OR_u8_u8_390));\
bit_vector_clear(&konst_392);\
konst_392.val.byte_array[0] = 2;\
bit_vector_equal(0, &(sel), &(konst_392), &(EQ_u3_u1_393));\
if (has_undefined_bit(&EQ_u3_u1_393)) {fprintf(stderr, "Error: variable EQ_u3_u1_393 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_393));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_393)){bit_vector_cast_to_bit_vector(0, &(MUX_396), &(l2));\
}else {bit_vector_clear(&konst_395);\
bit_vector_cast_to_bit_vector(0, &(MUX_396), &(konst_395));\
}bit_vector_clear(&konst_398);\
konst_398.val.byte_array[0] = 3;\
bit_vector_equal(0, &(sel), &(konst_398), &(EQ_u3_u1_399));\
if (has_undefined_bit(&EQ_u3_u1_399)) {fprintf(stderr, "Error: variable EQ_u3_u1_399 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_399));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_399)){bit_vector_cast_to_bit_vector(0, &(MUX_402), &(l3));\
}else {bit_vector_clear(&konst_401);\
bit_vector_cast_to_bit_vector(0, &(MUX_402), &(konst_401));\
}bit_vector_or(&(MUX_396), &(MUX_402), &(OR_u8_u8_403));\
bit_vector_or(&(OR_u8_u8_390), &(OR_u8_u8_403), &(OR_u8_u8_404));\
bit_vector_clear(&konst_406);\
konst_406.val.byte_array[0] = 4;\
bit_vector_equal(0, &(sel), &(konst_406), &(EQ_u3_u1_407));\
if (has_undefined_bit(&EQ_u3_u1_407)) {fprintf(stderr, "Error: variable EQ_u3_u1_407 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_407));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_407)){bit_vector_cast_to_bit_vector(0, &(MUX_410), &(l4));\
}else {bit_vector_clear(&konst_409);\
bit_vector_cast_to_bit_vector(0, &(MUX_410), &(konst_409));\
}bit_vector_clear(&konst_412);\
konst_412.val.byte_array[0] = 5;\
bit_vector_equal(0, &(sel), &(konst_412), &(EQ_u3_u1_413));\
if (has_undefined_bit(&EQ_u3_u1_413)) {fprintf(stderr, "Error: variable EQ_u3_u1_413 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_413));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_413)){bit_vector_cast_to_bit_vector(0, &(MUX_416), &(l5));\
}else {bit_vector_clear(&konst_415);\
bit_vector_cast_to_bit_vector(0, &(MUX_416), &(konst_415));\
}bit_vector_or(&(MUX_410), &(MUX_416), &(OR_u8_u8_417));\
bit_vector_clear(&konst_419);\
konst_419.val.byte_array[0] = 6;\
bit_vector_equal(0, &(sel), &(konst_419), &(EQ_u3_u1_420));\
if (has_undefined_bit(&EQ_u3_u1_420)) {fprintf(stderr, "Error: variable EQ_u3_u1_420 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_420));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_420)){bit_vector_cast_to_bit_vector(0, &(MUX_423), &(l6));\
}else {bit_vector_clear(&konst_422);\
bit_vector_cast_to_bit_vector(0, &(MUX_423), &(konst_422));\
}bit_vector_clear(&konst_425);\
konst_425.val.byte_array[0] = 7;\
bit_vector_equal(0, &(sel), &(konst_425), &(EQ_u3_u1_426));\
if (has_undefined_bit(&EQ_u3_u1_426)) {fprintf(stderr, "Error: variable EQ_u3_u1_426 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_426));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_426)){bit_vector_cast_to_bit_vector(0, &(MUX_429), &(l7));\
}else {bit_vector_clear(&konst_428);\
bit_vector_cast_to_bit_vector(0, &(MUX_429), &(konst_428));\
}bit_vector_or(&(MUX_423), &(MUX_429), &(OR_u8_u8_430));\
bit_vector_or(&(OR_u8_u8_417), &(OR_u8_u8_430), &(OR_u8_u8_431));\
bit_vector_or(&(OR_u8_u8_404), &(OR_u8_u8_431), &(OR_u8_u8_432));\
bit_vector_cast_to_bit_vector(0, &(lock_val), &(OR_u8_u8_432));\
;

#define _acquireLock_call_stmt_451_c_macro_ __declare_static_bit_vector(konst_440,1);\
bit_vector_clear(&konst_440);\
__declare_static_bit_vector(type_cast_441,1);\
bit_vector_clear(&type_cast_441);\
__declare_static_bit_vector(konst_442,1);\
bit_vector_clear(&konst_442);\
konst_442.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_443,1);\
bit_vector_clear(&type_cast_443);\
type_cast_443.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_444,8);\
bit_vector_clear(&konst_444);\
__declare_static_bit_vector(type_cast_445,8);\
bit_vector_clear(&type_cast_445);\
__declare_static_bit_vector(NOT_u8_u8_446,8);\
bit_vector_clear(&NOT_u8_u8_446);\
NOT_u8_u8_446.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_448,64);\
bit_vector_clear(&konst_448);\
__declare_static_bit_vector(type_cast_449,64);\
bit_vector_clear(&type_cast_449);\
bit_vector_clear(&konst_440);\
bit_vector_bitcast_to_bit_vector( &(type_cast_441), &(konst_440));\
bit_vector_clear(&konst_442);\
konst_442.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_443), &(konst_442));\
bit_vector_clear(&konst_444);\
bit_vector_bitcast_to_bit_vector( &(type_cast_445), &(konst_444));\
bit_vector_not( &(type_cast_445), &(NOT_u8_u8_446));\
bit_vector_clear(&konst_448);\
bit_vector_bitcast_to_bit_vector( &(type_cast_449), &(konst_448));\
_accessMemory_( &(type_cast_441),  &(type_cast_443),  &(NOT_u8_u8_446),  &(lock_address_pointer),  &(type_cast_449), &(err));\
;

#define _acquireLock_assign_stmt_458_c_macro_ __declare_static_bit_vector(konst_456,3);\
bit_vector_clear(&konst_456);\
__declare_static_bit_vector(EQ_u3_u1_457,1);\
bit_vector_clear(&konst_456);\
bit_vector_equal(0, &(sel), &(konst_456), &(EQ_u3_u1_457));\
bit_vector_cast_to_bit_vector(0, &(s0), &(EQ_u3_u1_457));\
;

#define _acquireLock_assign_stmt_463_c_macro_ __declare_static_bit_vector(konst_461,3);\
bit_vector_clear(&konst_461);\
konst_461.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u3_u1_462,1);\
bit_vector_clear(&konst_461);\
konst_461.val.byte_array[0] = 1;\
bit_vector_equal(0, &(sel), &(konst_461), &(EQ_u3_u1_462));\
bit_vector_cast_to_bit_vector(0, &(s1), &(EQ_u3_u1_462));\
;

#define _acquireLock_assign_stmt_468_c_macro_ __declare_static_bit_vector(konst_466,3);\
bit_vector_clear(&konst_466);\
konst_466.val.byte_array[0] = 2;\
__declare_static_bit_vector(EQ_u3_u1_467,1);\
bit_vector_clear(&konst_466);\
konst_466.val.byte_array[0] = 2;\
bit_vector_equal(0, &(sel), &(konst_466), &(EQ_u3_u1_467));\
bit_vector_cast_to_bit_vector(0, &(s2), &(EQ_u3_u1_467));\
;

#define _acquireLock_assign_stmt_473_c_macro_ __declare_static_bit_vector(konst_471,3);\
bit_vector_clear(&konst_471);\
konst_471.val.byte_array[0] = 3;\
__declare_static_bit_vector(EQ_u3_u1_472,1);\
bit_vector_clear(&konst_471);\
konst_471.val.byte_array[0] = 3;\
bit_vector_equal(0, &(sel), &(konst_471), &(EQ_u3_u1_472));\
bit_vector_cast_to_bit_vector(0, &(s3), &(EQ_u3_u1_472));\
;

#define _acquireLock_assign_stmt_478_c_macro_ __declare_static_bit_vector(konst_476,3);\
bit_vector_clear(&konst_476);\
konst_476.val.byte_array[0] = 4;\
__declare_static_bit_vector(EQ_u3_u1_477,1);\
bit_vector_clear(&konst_476);\
konst_476.val.byte_array[0] = 4;\
bit_vector_equal(0, &(sel), &(konst_476), &(EQ_u3_u1_477));\
bit_vector_cast_to_bit_vector(0, &(s4), &(EQ_u3_u1_477));\
;

#define _acquireLock_assign_stmt_483_c_macro_ __declare_static_bit_vector(konst_481,3);\
bit_vector_clear(&konst_481);\
konst_481.val.byte_array[0] = 5;\
__declare_static_bit_vector(EQ_u3_u1_482,1);\
bit_vector_clear(&konst_481);\
konst_481.val.byte_array[0] = 5;\
bit_vector_equal(0, &(sel), &(konst_481), &(EQ_u3_u1_482));\
bit_vector_cast_to_bit_vector(0, &(s5), &(EQ_u3_u1_482));\
;

#define _acquireLock_assign_stmt_488_c_macro_ __declare_static_bit_vector(konst_486,3);\
bit_vector_clear(&konst_486);\
konst_486.val.byte_array[0] = 6;\
__declare_static_bit_vector(EQ_u3_u1_487,1);\
bit_vector_clear(&konst_486);\
konst_486.val.byte_array[0] = 6;\
bit_vector_equal(0, &(sel), &(konst_486), &(EQ_u3_u1_487));\
bit_vector_cast_to_bit_vector(0, &(s6), &(EQ_u3_u1_487));\
;

#define _acquireLock_assign_stmt_493_c_macro_ __declare_static_bit_vector(konst_491,3);\
bit_vector_clear(&konst_491);\
konst_491.val.byte_array[0] = 7;\
__declare_static_bit_vector(EQ_u3_u1_492,1);\
bit_vector_clear(&konst_491);\
konst_491.val.byte_array[0] = 7;\
bit_vector_equal(0, &(sel), &(konst_491), &(EQ_u3_u1_492));\
bit_vector_cast_to_bit_vector(0, &(s7), &(EQ_u3_u1_492));\
;

#define _acquireLock_assign_stmt_550_c_macro_ __declare_static_bit_vector(konst_496,1);\
bit_vector_clear(&konst_496);\
konst_496.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_497,1);\
bit_vector_clear(&type_cast_497);\
type_cast_497.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_498,1);\
bit_vector_clear(&konst_498);\
__declare_static_bit_vector(type_cast_499,1);\
bit_vector_clear(&type_cast_499);\
__declare_static_bit_vector(MUX_500,1);\
__declare_static_bit_vector(konst_502,1);\
bit_vector_clear(&konst_502);\
konst_502.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_503,1);\
bit_vector_clear(&type_cast_503);\
type_cast_503.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_504,1);\
bit_vector_clear(&konst_504);\
__declare_static_bit_vector(type_cast_505,1);\
bit_vector_clear(&type_cast_505);\
__declare_static_bit_vector(MUX_506,1);\
__declare_static_bit_vector(CONCAT_u1_u2_507,2);\
__declare_static_bit_vector(konst_509,1);\
bit_vector_clear(&konst_509);\
konst_509.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_510,1);\
bit_vector_clear(&type_cast_510);\
type_cast_510.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_511,1);\
bit_vector_clear(&konst_511);\
__declare_static_bit_vector(type_cast_512,1);\
bit_vector_clear(&type_cast_512);\
__declare_static_bit_vector(MUX_513,1);\
__declare_static_bit_vector(konst_515,1);\
bit_vector_clear(&konst_515);\
konst_515.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_516,1);\
bit_vector_clear(&type_cast_516);\
type_cast_516.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_517,1);\
bit_vector_clear(&konst_517);\
__declare_static_bit_vector(type_cast_518,1);\
bit_vector_clear(&type_cast_518);\
__declare_static_bit_vector(MUX_519,1);\
__declare_static_bit_vector(CONCAT_u1_u2_520,2);\
__declare_static_bit_vector(CONCAT_u2_u4_521,4);\
__declare_static_bit_vector(konst_523,1);\
bit_vector_clear(&konst_523);\
konst_523.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_524,1);\
bit_vector_clear(&type_cast_524);\
type_cast_524.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_525,1);\
bit_vector_clear(&konst_525);\
__declare_static_bit_vector(type_cast_526,1);\
bit_vector_clear(&type_cast_526);\
__declare_static_bit_vector(MUX_527,1);\
__declare_static_bit_vector(konst_529,1);\
bit_vector_clear(&konst_529);\
konst_529.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_530,1);\
bit_vector_clear(&type_cast_530);\
type_cast_530.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_531,1);\
bit_vector_clear(&konst_531);\
__declare_static_bit_vector(type_cast_532,1);\
bit_vector_clear(&type_cast_532);\
__declare_static_bit_vector(MUX_533,1);\
__declare_static_bit_vector(CONCAT_u1_u2_534,2);\
__declare_static_bit_vector(konst_536,1);\
bit_vector_clear(&konst_536);\
konst_536.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_537,1);\
bit_vector_clear(&type_cast_537);\
type_cast_537.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_538,1);\
bit_vector_clear(&konst_538);\
__declare_static_bit_vector(type_cast_539,1);\
bit_vector_clear(&type_cast_539);\
__declare_static_bit_vector(MUX_540,1);\
__declare_static_bit_vector(konst_542,1);\
bit_vector_clear(&konst_542);\
konst_542.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_543,1);\
bit_vector_clear(&type_cast_543);\
type_cast_543.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_544,1);\
bit_vector_clear(&konst_544);\
__declare_static_bit_vector(type_cast_545,1);\
bit_vector_clear(&type_cast_545);\
__declare_static_bit_vector(MUX_546,1);\
__declare_static_bit_vector(CONCAT_u1_u2_547,2);\
__declare_static_bit_vector(CONCAT_u2_u4_548,4);\
__declare_static_bit_vector(CONCAT_u4_u8_549,8);\
if (has_undefined_bit(&s0)) {fprintf(stderr, "Error: variable s0 has undefined value (%s) at test point.\n", to_string(&s0));assert(0);} \
if(bit_vector_to_uint64(0, &s0)){bit_vector_clear(&konst_496);\
konst_496.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_497), &(konst_496));\
bit_vector_cast_to_bit_vector(0, &(MUX_500), &(type_cast_497));\
}else {bit_vector_clear(&konst_498);\
bit_vector_bitcast_to_bit_vector( &(type_cast_499), &(konst_498));\
bit_vector_cast_to_bit_vector(0, &(MUX_500), &(type_cast_499));\
}if (has_undefined_bit(&s1)) {fprintf(stderr, "Error: variable s1 has undefined value (%s) at test point.\n", to_string(&s1));assert(0);} \
if(bit_vector_to_uint64(0, &s1)){bit_vector_clear(&konst_502);\
konst_502.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_503), &(konst_502));\
bit_vector_cast_to_bit_vector(0, &(MUX_506), &(type_cast_503));\
}else {bit_vector_clear(&konst_504);\
bit_vector_bitcast_to_bit_vector( &(type_cast_505), &(konst_504));\
bit_vector_cast_to_bit_vector(0, &(MUX_506), &(type_cast_505));\
}bit_vector_concatenate( &(MUX_500), &(MUX_506), &(CONCAT_u1_u2_507));\
if (has_undefined_bit(&s2)) {fprintf(stderr, "Error: variable s2 has undefined value (%s) at test point.\n", to_string(&s2));assert(0);} \
if(bit_vector_to_uint64(0, &s2)){bit_vector_clear(&konst_509);\
konst_509.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_510), &(konst_509));\
bit_vector_cast_to_bit_vector(0, &(MUX_513), &(type_cast_510));\
}else {bit_vector_clear(&konst_511);\
bit_vector_bitcast_to_bit_vector( &(type_cast_512), &(konst_511));\
bit_vector_cast_to_bit_vector(0, &(MUX_513), &(type_cast_512));\
}if (has_undefined_bit(&s3)) {fprintf(stderr, "Error: variable s3 has undefined value (%s) at test point.\n", to_string(&s3));assert(0);} \
if(bit_vector_to_uint64(0, &s3)){bit_vector_clear(&konst_515);\
konst_515.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_516), &(konst_515));\
bit_vector_cast_to_bit_vector(0, &(MUX_519), &(type_cast_516));\
}else {bit_vector_clear(&konst_517);\
bit_vector_bitcast_to_bit_vector( &(type_cast_518), &(konst_517));\
bit_vector_cast_to_bit_vector(0, &(MUX_519), &(type_cast_518));\
}bit_vector_concatenate( &(MUX_513), &(MUX_519), &(CONCAT_u1_u2_520));\
bit_vector_concatenate( &(CONCAT_u1_u2_507), &(CONCAT_u1_u2_520), &(CONCAT_u2_u4_521));\
if (has_undefined_bit(&s4)) {fprintf(stderr, "Error: variable s4 has undefined value (%s) at test point.\n", to_string(&s4));assert(0);} \
if(bit_vector_to_uint64(0, &s4)){bit_vector_clear(&konst_523);\
konst_523.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_524), &(konst_523));\
bit_vector_cast_to_bit_vector(0, &(MUX_527), &(type_cast_524));\
}else {bit_vector_clear(&konst_525);\
bit_vector_bitcast_to_bit_vector( &(type_cast_526), &(konst_525));\
bit_vector_cast_to_bit_vector(0, &(MUX_527), &(type_cast_526));\
}if (has_undefined_bit(&s5)) {fprintf(stderr, "Error: variable s5 has undefined value (%s) at test point.\n", to_string(&s5));assert(0);} \
if(bit_vector_to_uint64(0, &s5)){bit_vector_clear(&konst_529);\
konst_529.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_530), &(konst_529));\
bit_vector_cast_to_bit_vector(0, &(MUX_533), &(type_cast_530));\
}else {bit_vector_clear(&konst_531);\
bit_vector_bitcast_to_bit_vector( &(type_cast_532), &(konst_531));\
bit_vector_cast_to_bit_vector(0, &(MUX_533), &(type_cast_532));\
}bit_vector_concatenate( &(MUX_527), &(MUX_533), &(CONCAT_u1_u2_534));\
if (has_undefined_bit(&s6)) {fprintf(stderr, "Error: variable s6 has undefined value (%s) at test point.\n", to_string(&s6));assert(0);} \
if(bit_vector_to_uint64(0, &s6)){bit_vector_clear(&konst_536);\
konst_536.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_537), &(konst_536));\
bit_vector_cast_to_bit_vector(0, &(MUX_540), &(type_cast_537));\
}else {bit_vector_clear(&konst_538);\
bit_vector_bitcast_to_bit_vector( &(type_cast_539), &(konst_538));\
bit_vector_cast_to_bit_vector(0, &(MUX_540), &(type_cast_539));\
}if (has_undefined_bit(&s7)) {fprintf(stderr, "Error: variable s7 has undefined value (%s) at test point.\n", to_string(&s7));assert(0);} \
if(bit_vector_to_uint64(0, &s7)){bit_vector_clear(&konst_542);\
konst_542.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_543), &(konst_542));\
bit_vector_cast_to_bit_vector(0, &(MUX_546), &(type_cast_543));\
}else {bit_vector_clear(&konst_544);\
bit_vector_bitcast_to_bit_vector( &(type_cast_545), &(konst_544));\
bit_vector_cast_to_bit_vector(0, &(MUX_546), &(type_cast_545));\
}bit_vector_concatenate( &(MUX_540), &(MUX_546), &(CONCAT_u1_u2_547));\
bit_vector_concatenate( &(CONCAT_u1_u2_534), &(CONCAT_u1_u2_547), &(CONCAT_u2_u4_548));\
bit_vector_concatenate( &(CONCAT_u2_u4_521), &(CONCAT_u2_u4_548), &(CONCAT_u4_u8_549));\
bit_vector_cast_to_bit_vector(0, &(new_bmask), &(CONCAT_u4_u8_549));\
;

#define _acquireLock_call_stmt_564_c_macro_ __declare_static_bit_vector(konst_551,1);\
bit_vector_clear(&konst_551);\
__declare_static_bit_vector(type_cast_552,1);\
bit_vector_clear(&type_cast_552);\
__declare_static_bit_vector(konst_553,1);\
bit_vector_clear(&konst_553);\
__declare_static_bit_vector(type_cast_554,1);\
bit_vector_clear(&type_cast_554);\
__declare_static_bit_vector(konst_556,4);\
bit_vector_clear(&konst_556);\
__declare_static_bit_vector(type_cast_557,4);\
bit_vector_clear(&type_cast_557);\
__declare_static_bit_vector(CONCAT_u4_u36_559,36);\
__declare_static_bit_vector(konst_560,64);\
bit_vector_clear(&konst_560);\
__declare_static_bit_vector(type_cast_561,64);\
bit_vector_clear(&type_cast_561);\
__declare_static_bit_vector(NOT_u64_u64_562,64);\
bit_vector_clear(&NOT_u64_u64_562);\
NOT_u64_u64_562.val.byte_array[0] = 255;\
NOT_u64_u64_562.val.byte_array[1] = 255;\
NOT_u64_u64_562.val.byte_array[2] = 255;\
NOT_u64_u64_562.val.byte_array[3] = 255;\
NOT_u64_u64_562.val.byte_array[4] = 255;\
NOT_u64_u64_562.val.byte_array[5] = 255;\
NOT_u64_u64_562.val.byte_array[6] = 255;\
NOT_u64_u64_562.val.byte_array[7] = 255;\
bit_vector_clear(&konst_551);\
bit_vector_bitcast_to_bit_vector( &(type_cast_552), &(konst_551));\
bit_vector_clear(&konst_553);\
bit_vector_bitcast_to_bit_vector( &(type_cast_554), &(konst_553));\
bit_vector_clear(&konst_556);\
bit_vector_bitcast_to_bit_vector( &(type_cast_557), &(konst_556));\
bit_vector_concatenate( &(type_cast_557), &(lock_addr_32), &(CONCAT_u4_u36_559));\
bit_vector_clear(&konst_560);\
bit_vector_bitcast_to_bit_vector( &(type_cast_561), &(konst_560));\
bit_vector_not( &(type_cast_561), &(NOT_u64_u64_562));\
_accessMemory_( &(type_cast_552),  &(type_cast_554),  &(new_bmask),  &(CONCAT_u4_u36_559),  &(NOT_u64_u64_562), &(ignore));\
;
;

#define _acquireLock_branch_block_stmt_301_c_export_apply_macro_ ;

#define _acquireLock_assign_stmt_569_c_macro_ __declare_static_bit_vector(konst_567,1);\
bit_vector_clear(&konst_567);\
konst_567.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_568,1);\
bit_vector_clear(&type_cast_568);\
type_cast_568.val.byte_array[0] = 1;\
bit_vector_clear(&konst_567);\
konst_567.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_568), &(konst_567));\
bit_vector_cast_to_bit_vector(0, &(m_ok), &(type_cast_568));\
;

#define _acquireLock_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pm_ok)), &(m_ok));\
;

#define _delay_time_inner_inarg_prep_macro__ __declare_static_bit_vector(T,32);\
bit_vector_cast_to_bit_vector(0, &(T), &((*__pT)));\
__declare_static_bit_vector(delay_done,1);\

#define _delay_time_branch_block_stmt_1215_c_export_decl_macro_ __declare_static_bit_vector(R,32);\
__declare_static_bit_vector(nR,32);\


#define _delay_time_merge_stmt_1217_c_preamble_macro_ uint8_t merge_stmt_1217_entry_flag;\
merge_stmt_1217_entry_flag = do_while_entry_flag;\
goto merge_stmt_1217_run;\
merge_stmt_1217_run: ;\

#define _delay_time_phi_stmt_1218_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(R), &(nR));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(R), &(T));\
}\
;
;

#define _delay_time_merge_stmt_1217_c_postamble_macro_ merge_stmt_1217_entry_flag = 0;

#define _delay_time_assign_stmt_1227_c_macro_ __declare_static_bit_vector(konst_1225,32);\
bit_vector_clear(&konst_1225);\
konst_1225.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1226,32);\
bit_vector_clear(&konst_1225);\
konst_1225.val.byte_array[0] = 1;\
bit_vector_minus( &(R), &(konst_1225), &(SUB_u32_u32_1226));\
bit_vector_cast_to_bit_vector(0, &(nR), &(SUB_u32_u32_1226));\
;

#define _delay_time_assign_stmt_1234_c_macro_ __declare_static_bit_vector(konst_1233,1);\
bit_vector_clear(&konst_1233);\
konst_1233.val.byte_array[0] = 1;\
bit_vector_clear(&konst_1233);\
konst_1233.val.byte_array[0] = 1;\
bit_vector_cast_to_bit_vector(0, &(delay_done), &(konst_1233));\
;
;

#define _delay_time_branch_block_stmt_1215_c_export_apply_macro_ ;

#define _delay_time_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pdelay_done)), &(delay_done));\
;

#define _getQueueElement_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(read_index,32);\
bit_vector_cast_to_bit_vector(0, &(read_index), &((*__pread_index)));\
__declare_static_bit_vector(q_r_data,32);\
__declare_static_bit_vector(buffer_address,36);\
__declare_static_bit_vector(element_pair_address,36);\
__declare_static_bit_vector(element_pair,64);\
__declare_static_bit_vector(e0,32);\
__declare_static_bit_vector(e1,32);\

#define _getQueueElement_assign_stmt_633_c_macro_ __declare_static_bit_vector(konst_630,36);\
bit_vector_clear(&konst_630);\
konst_630.val.byte_array[0] = 24;\
__declare_static_bit_vector(type_cast_631,36);\
bit_vector_clear(&type_cast_631);\
type_cast_631.val.byte_array[0] = 24;\
__declare_static_bit_vector(ADD_u36_u36_632,36);\
bit_vector_clear(&konst_630);\
konst_630.val.byte_array[0] = 24;\
bit_vector_bitcast_to_bit_vector( &(type_cast_631), &(konst_630));\
bit_vector_plus( &(q_base_address), &(type_cast_631), &(ADD_u36_u36_632));\
bit_vector_cast_to_bit_vector(0, &(buffer_address), &(ADD_u36_u36_632));\
;

#define _getQueueElement_assign_stmt_645_c_macro_ __declare_static_bit_vector(slice_638,31);\
__declare_static_bit_vector(konst_639,3);\
bit_vector_clear(&konst_639);\
__declare_static_bit_vector(type_cast_640,3);\
bit_vector_clear(&type_cast_640);\
__declare_static_bit_vector(CONCAT_u31_u34_641,34);\
__declare_static_bit_vector(type_cast_643,36);\
__declare_static_bit_vector(ADD_u36_u36_644,36);\
bit_vector_slice(&(read_index), &(slice_638), 1);\
bit_vector_clear(&konst_639);\
bit_vector_bitcast_to_bit_vector( &(type_cast_640), &(konst_639));\
bit_vector_concatenate( &(slice_638), &(type_cast_640), &(CONCAT_u31_u34_641));\
bit_vector_bitcast_to_bit_vector( &(type_cast_643), &(CONCAT_u31_u34_641));\
bit_vector_plus( &(buffer_address), &(type_cast_643), &(ADD_u36_u36_644));\
bit_vector_cast_to_bit_vector(0, &(element_pair_address), &(ADD_u36_u36_644));\
;

#define _getQueueElement_call_stmt_657_c_macro_ __declare_static_bit_vector(konst_646,1);\
bit_vector_clear(&konst_646);\
__declare_static_bit_vector(type_cast_647,1);\
bit_vector_clear(&type_cast_647);\
__declare_static_bit_vector(konst_648,1);\
bit_vector_clear(&konst_648);\
konst_648.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_649,1);\
bit_vector_clear(&type_cast_649);\
type_cast_649.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_650,8);\
bit_vector_clear(&konst_650);\
__declare_static_bit_vector(type_cast_651,8);\
bit_vector_clear(&type_cast_651);\
__declare_static_bit_vector(NOT_u8_u8_652,8);\
bit_vector_clear(&NOT_u8_u8_652);\
NOT_u8_u8_652.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_654,64);\
bit_vector_clear(&konst_654);\
__declare_static_bit_vector(type_cast_655,64);\
bit_vector_clear(&type_cast_655);\
bit_vector_clear(&konst_646);\
bit_vector_bitcast_to_bit_vector( &(type_cast_647), &(konst_646));\
bit_vector_clear(&konst_648);\
konst_648.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_649), &(konst_648));\
bit_vector_clear(&konst_650);\
bit_vector_bitcast_to_bit_vector( &(type_cast_651), &(konst_650));\
bit_vector_not( &(type_cast_651), &(NOT_u8_u8_652));\
bit_vector_clear(&konst_654);\
bit_vector_bitcast_to_bit_vector( &(type_cast_655), &(konst_654));\
_accessMemory_( &(type_cast_647),  &(type_cast_649),  &(NOT_u8_u8_652),  &(element_pair_address),  &(type_cast_655), &(element_pair));\
;

#define _getQueueElement_assign_stmt_661_c_macro_ __declare_static_bit_vector(slice_660,32);\
bit_vector_slice(&(element_pair), &(slice_660), 32);\
bit_vector_cast_to_bit_vector(0, &(e0), &(slice_660));\
;

#define _getQueueElement_assign_stmt_665_c_macro_ __declare_static_bit_vector(slice_664,32);\
bit_vector_slice(&(element_pair), &(slice_664), 0);\
bit_vector_cast_to_bit_vector(0, &(e1), &(slice_664));\
;

#define _getQueueElement_assign_stmt_673_c_macro_ __declare_static_bit_vector(konst_668,32);\
bit_vector_clear(&konst_668);\
__declare_static_bit_vector(BITSEL_u32_u1_669,1);\
__declare_static_bit_vector(MUX_672,32);\
bit_vector_clear(&konst_668);\
bit_vector_bitsel( &(read_index), &(konst_668), &(BITSEL_u32_u1_669));\
if (has_undefined_bit(&BITSEL_u32_u1_669)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_669 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_669));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_669)){bit_vector_cast_to_bit_vector(0, &(MUX_672), &(e1));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_672), &(e0));\
}bit_vector_cast_to_bit_vector(0, &(q_r_data), &(MUX_672));\
;

#define _getQueueElement_stmt_678_c_macro_ uint32_t _getQueueElement_stmt_678_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]getQueueElement>\t%s\n",_getQueueElement_stmt_678_c_macro___print_counter,"get_queue_element");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_678_c_macro___print_counter,"q_r_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_r_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_678_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_678_c_macro___print_counter,"read_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_678_c_macro___print_counter,"element_pair_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(element_pair_address)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _getQueueElement_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pq_r_data)), &(q_r_data));\
;

#define _getQueueLength_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(Queue_Length,32);\
__declare_static_bit_vector(wi_and_len,64);\

#define _getQueueLength_call_stmt_618_c_macro_ __declare_static_bit_vector(konst_605,1);\
bit_vector_clear(&konst_605);\
__declare_static_bit_vector(type_cast_606,1);\
bit_vector_clear(&type_cast_606);\
__declare_static_bit_vector(konst_607,1);\
bit_vector_clear(&konst_607);\
konst_607.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_608,1);\
bit_vector_clear(&type_cast_608);\
type_cast_608.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_609,8);\
bit_vector_clear(&konst_609);\
__declare_static_bit_vector(type_cast_610,8);\
bit_vector_clear(&type_cast_610);\
__declare_static_bit_vector(NOT_u8_u8_611,8);\
bit_vector_clear(&NOT_u8_u8_611);\
NOT_u8_u8_611.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_613,36);\
bit_vector_clear(&konst_613);\
konst_613.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_614,36);\
__declare_static_bit_vector(konst_615,64);\
bit_vector_clear(&konst_615);\
__declare_static_bit_vector(type_cast_616,64);\
bit_vector_clear(&type_cast_616);\
bit_vector_clear(&konst_605);\
bit_vector_bitcast_to_bit_vector( &(type_cast_606), &(konst_605));\
bit_vector_clear(&konst_607);\
konst_607.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_608), &(konst_607));\
bit_vector_clear(&konst_609);\
bit_vector_bitcast_to_bit_vector( &(type_cast_610), &(konst_609));\
bit_vector_not( &(type_cast_610), &(NOT_u8_u8_611));\
bit_vector_clear(&konst_613);\
konst_613.val.byte_array[0] = 8;\
bit_vector_plus( &(q_base_address), &(konst_613), &(ADD_u36_u36_614));\
bit_vector_clear(&konst_615);\
bit_vector_bitcast_to_bit_vector( &(type_cast_616), &(konst_615));\
_accessMemory_( &(type_cast_606),  &(type_cast_608),  &(NOT_u8_u8_611),  &(ADD_u36_u36_614),  &(type_cast_616), &(wi_and_len));\
;

#define _getQueueLength_assign_stmt_622_c_macro_ __declare_static_bit_vector(slice_621,32);\
bit_vector_slice(&(wi_and_len), &(slice_621), 0);\
bit_vector_cast_to_bit_vector(0, &(Queue_Length), &(slice_621));\
;

#define _getQueueLength_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pQueue_Length)), &(Queue_Length));\
;

#define _getQueuePointers_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(wp,32);\
__declare_static_bit_vector(rp,32);\
__declare_static_bit_vector(wp_rp,64);\

#define _getQueuePointers_call_stmt_588_c_macro_ __declare_static_bit_vector(konst_575,1);\
bit_vector_clear(&konst_575);\
__declare_static_bit_vector(type_cast_576,1);\
bit_vector_clear(&type_cast_576);\
__declare_static_bit_vector(konst_577,1);\
bit_vector_clear(&konst_577);\
konst_577.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_578,1);\
bit_vector_clear(&type_cast_578);\
type_cast_578.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_579,8);\
bit_vector_clear(&konst_579);\
__declare_static_bit_vector(type_cast_580,8);\
bit_vector_clear(&type_cast_580);\
__declare_static_bit_vector(NOT_u8_u8_581,8);\
bit_vector_clear(&NOT_u8_u8_581);\
NOT_u8_u8_581.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_583,36);\
bit_vector_clear(&konst_583);\
konst_583.val.byte_array[0] = 4;\
__declare_static_bit_vector(ADD_u36_u36_584,36);\
__declare_static_bit_vector(konst_585,64);\
bit_vector_clear(&konst_585);\
__declare_static_bit_vector(type_cast_586,64);\
bit_vector_clear(&type_cast_586);\
bit_vector_clear(&konst_575);\
bit_vector_bitcast_to_bit_vector( &(type_cast_576), &(konst_575));\
bit_vector_clear(&konst_577);\
konst_577.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_578), &(konst_577));\
bit_vector_clear(&konst_579);\
bit_vector_bitcast_to_bit_vector( &(type_cast_580), &(konst_579));\
bit_vector_not( &(type_cast_580), &(NOT_u8_u8_581));\
bit_vector_clear(&konst_583);\
konst_583.val.byte_array[0] = 4;\
bit_vector_plus( &(q_base_address), &(konst_583), &(ADD_u36_u36_584));\
bit_vector_clear(&konst_585);\
bit_vector_bitcast_to_bit_vector( &(type_cast_586), &(konst_585));\
_accessMemory_( &(type_cast_576),  &(type_cast_578),  &(NOT_u8_u8_581),  &(ADD_u36_u36_584),  &(type_cast_586), &(wp_rp));\
;

#define _getQueuePointers_assign_stmt_592_c_macro_ __declare_static_bit_vector(slice_591,32);\
bit_vector_slice(&(wp_rp), &(slice_591), 32);\
bit_vector_cast_to_bit_vector(0, &(rp), &(slice_591));\
;

#define _getQueuePointers_assign_stmt_596_c_macro_ __declare_static_bit_vector(slice_595,32);\
bit_vector_slice(&(wp_rp), &(slice_595), 0);\
bit_vector_cast_to_bit_vector(0, &(wp), &(slice_595));\
;

#define _getQueuePointers_stmt_600_c_macro_ uint32_t _getQueuePointers_stmt_600_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]getQueuePointers>\t%s\n",_getQueuePointers_stmt_600_c_macro___print_counter,"set");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueuePointers>\t\t%s\t\t",_getQueuePointers_stmt_600_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueuePointers>\t\t%s\t\t",_getQueuePointers_stmt_600_c_macro___print_counter,"wp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wp)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueuePointers>\t\t%s\t\t",_getQueuePointers_stmt_600_c_macro___print_counter,"rp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rp)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _getQueuePointers_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pwp)), &(wp));\
bit_vector_cast_to_bit_vector(0, &((*__prp)), &(rp));\
;

#define _getTxPacketPointerFromServer_inner_inarg_prep_macro__ __declare_static_bit_vector(queue_index,6);\
bit_vector_cast_to_bit_vector(0, &(queue_index), &((*__pqueue_index)));\
__declare_static_bit_vector(pkt_pointer,32);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(register_index,6);\
__declare_static_bit_vector(tx_queue_pointer_32,32);\
__declare_static_bit_vector(tx_queue_pointer_36,36);\

#define _getTxPacketPointerFromServer_assign_stmt_1589_c_macro_ __declare_static_bit_vector(ADD_u6_u6_1587,6);\
__declare_static_bit_vector(type_cast_1588,6);\
bit_vector_plus( &(queue_index), &(TX_QUEUES_REG_START_OFFSET), &(ADD_u6_u6_1587));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1588), &(ADD_u6_u6_1587));\
bit_vector_cast_to_bit_vector(0, &(register_index), &(type_cast_1588));\
;

#define _getTxPacketPointerFromServer_call_stmt_1599_c_macro_ __declare_static_bit_vector(konst_1590,1);\
bit_vector_clear(&konst_1590);\
konst_1590.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1591,1);\
bit_vector_clear(&type_cast_1591);\
type_cast_1591.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1592,4);\
bit_vector_clear(&konst_1592);\
__declare_static_bit_vector(type_cast_1593,4);\
bit_vector_clear(&type_cast_1593);\
__declare_static_bit_vector(NOT_u4_u4_1594,4);\
bit_vector_clear(&NOT_u4_u4_1594);\
NOT_u4_u4_1594.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_1596,32);\
bit_vector_clear(&konst_1596);\
__declare_static_bit_vector(type_cast_1597,32);\
bit_vector_clear(&type_cast_1597);\
bit_vector_clear(&konst_1590);\
konst_1590.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1591), &(konst_1590));\
bit_vector_clear(&konst_1592);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1593), &(konst_1592));\
bit_vector_not( &(type_cast_1593), &(NOT_u4_u4_1594));\
bit_vector_clear(&konst_1596);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1597), &(konst_1596));\
_AccessRegister_( &(type_cast_1591),  &(NOT_u4_u4_1594),  &(register_index),  &(type_cast_1597), &(tx_queue_pointer_32));\
;

#define _getTxPacketPointerFromServer_assign_stmt_1605_c_macro_ __declare_static_bit_vector(konst_1602,4);\
bit_vector_clear(&konst_1602);\
__declare_static_bit_vector(type_cast_1603,4);\
bit_vector_clear(&type_cast_1603);\
__declare_static_bit_vector(CONCAT_u32_u36_1604,36);\
bit_vector_clear(&konst_1602);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1603), &(konst_1602));\
bit_vector_concatenate( &(tx_queue_pointer_32), &(type_cast_1603), &(CONCAT_u32_u36_1604));\
bit_vector_cast_to_bit_vector(0, &(tx_queue_pointer_36), &(CONCAT_u32_u36_1604));\
;

#define _getTxPacketPointerFromServer_call_stmt_1611_c_macro_ __declare_static_bit_vector(konst_1606,1);\
bit_vector_clear(&konst_1606);\
konst_1606.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1607,1);\
bit_vector_clear(&type_cast_1607);\
type_cast_1607.val.byte_array[0] = 1;\
bit_vector_clear(&konst_1606);\
konst_1606.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1607), &(konst_1606));\
_popFromQueue_( &(type_cast_1607),  &(tx_queue_pointer_36), &(pkt_pointer), &(status));\
;

#define _getTxPacketPointerFromServer_stmt_1616_c_macro_ uint32_t _getTxPacketPointerFromServer_stmt_1616_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t%s\n",_getTxPacketPointerFromServer_stmt_1616_c_macro___print_counter,"register_ind");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1616_c_macro___print_counter,"register_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(register_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1616_c_macro___print_counter,"tx_queue_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(tx_queue_pointer_36)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1616_c_macro___print_counter,"pkt_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(pkt_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1616_c_macro___print_counter,"status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _getTxPacketPointerFromServer_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__ppkt_pointer)), &(pkt_pointer));\
bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _global_storage_initializer__inner_inarg_prep_macro__ 
#define _global_storage_initializer__inner_outarg_prep_macro__ ;

#define _global_storage_initializer__outer_arg_decl_macro__ ;

#define _global_storage_initializer__outer_op_xfer_macro__ ;

#define _loadBuffer_inner_inarg_prep_macro__ __declare_static_bit_vector(rx_buffer_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer), &((*__prx_buffer_pointer)));\
__declare_static_bit_vector(bad_packet_identifier,1);\
__declare_static_bit_vector(new_buf_pointer,36);\
__declare_static_bit_vector(packet_size,8);\
__declare_static_bit_vector(last_keep,8);\

#define _loadBuffer_call_stmt_1067_c_macro_ _writeEthernetHeaderToMem_( &(rx_buffer_pointer), &(new_buf_pointer));\
;

#define _loadBuffer_call_stmt_1073_c_macro_ _writePayloadToMem_( &(rx_buffer_pointer),  &(new_buf_pointer), &(packet_size), &(bad_packet_identifier), &(last_keep));\
;

#define _loadBuffer_call_stmt_1078_c_macro_ if (has_undefined_bit(&bad_packet_identifier)) {fprintf(stderr, "Error: variable bad_packet_identifier has undefined value (%s) at test point.\n", to_string(&bad_packet_identifier));assert(0);} \
if (!bit_vector_to_uint64(0, &bad_packet_identifier)) {\
_writeControlInformationToMem_( &(rx_buffer_pointer),  &(packet_size),  &(last_keep));\
}\
;

#define _loadBuffer_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pbad_packet_identifier)), &(bad_packet_identifier));\
;

#define _macToNicInterface_inner_inarg_prep_macro__ 
#define _macToNicInterface_branch_block_stmt_1622_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,16);\


#define _macToNicInterface_merge_stmt_1624_c_preamble_macro_ uint8_t merge_stmt_1624_entry_flag;\
merge_stmt_1624_entry_flag = do_while_entry_flag;\
goto merge_stmt_1624_run;\
merge_stmt_1624_run: ;\

#define _macToNicInterface_phi_stmt_1625_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_0_1627,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data_0",&(RPIPE_mac_to_nic_data_0_1627));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mac_to_nic_data_0_1627));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_0_1627,64);\
read_bit_vector_from_pipe("mac_to_nic_data_0",&(RPIPE_mac_to_nic_data_0_1627));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mac_to_nic_data_0_1627));\
}\
;

#define _macToNicInterface_phi_stmt_1628_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_1_1630,16);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data_1",&(RPIPE_mac_to_nic_data_1_1630));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mac_to_nic_data_1_1630));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_1_1630,16);\
read_bit_vector_from_pipe("mac_to_nic_data_1",&(RPIPE_mac_to_nic_data_1_1630));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mac_to_nic_data_1_1630));\
}\
;
;

#define _macToNicInterface_merge_stmt_1624_c_postamble_macro_ merge_stmt_1624_entry_flag = 0;

#define _macToNicInterface_stmt_1634_c_macro_ uint32_t _macToNicInterface_stmt_1634_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]macToNicInterface>\t%s\n",_macToNicInterface_stmt_1634_c_macro___print_counter,"writing_data");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]macToNicInterface>\t\t%s\t\t",_macToNicInterface_stmt_1634_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]macToNicInterface>\t\t%s\t\t",_macToNicInterface_stmt_1634_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _macToNicInterface_assign_stmt_1641_c_macro_ __declare_static_bit_vector(slice_1638,9);\
__declare_static_bit_vector(CONCAT_u9_u73_1640,73);\
bit_vector_slice(&(rdata1), &(slice_1638), 0);\
bit_vector_concatenate( &(slice_1638), &(rdata0), &(CONCAT_u9_u73_1640));\
write_bit_vector_to_pipe("mac_to_nic_data",&(CONCAT_u9_u73_1640));\
;
;

#define _macToNicInterface_branch_block_stmt_1622_c_export_apply_macro_ ;

#define _macToNicInterface_inner_outarg_prep_macro__ ;

#define _macToNicInterface_outer_arg_decl_macro__ ;

#define _macToNicInterface_outer_op_xfer_macro__ ;

#define _memoryToNicInterface_inner_inarg_prep_macro__ 
#define _memoryToNicInterface_branch_block_stmt_1647_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,8);\


#define _memoryToNicInterface_merge_stmt_1649_c_preamble_macro_ uint8_t merge_stmt_1649_entry_flag;\
merge_stmt_1649_entry_flag = do_while_entry_flag;\
goto merge_stmt_1649_run;\
merge_stmt_1649_run: ;\

#define _memoryToNicInterface_phi_stmt_1650_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp1_pipe0_1652,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp1_pipe0",&(RPIPE_mem_resp1_pipe0_1652));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp1_pipe0_1652));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp1_pipe0_1652,64);\
read_bit_vector_from_pipe("mem_resp1_pipe0",&(RPIPE_mem_resp1_pipe0_1652));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp1_pipe0_1652));\
}\
;

#define _memoryToNicInterface_phi_stmt_1653_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp1_pipe1_1655,8);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp1_pipe1",&(RPIPE_mem_resp1_pipe1_1655));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp1_pipe1_1655));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp1_pipe1_1655,8);\
read_bit_vector_from_pipe("mem_resp1_pipe1",&(RPIPE_mem_resp1_pipe1_1655));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp1_pipe1_1655));\
}\
;
;

#define _memoryToNicInterface_merge_stmt_1649_c_postamble_macro_ merge_stmt_1649_entry_flag = 0;

#define _memoryToNicInterface_assign_stmt_1663_c_macro_ __declare_static_bit_vector(konst_1659,8);\
bit_vector_clear(&konst_1659);\
__declare_static_bit_vector(BITSEL_u8_u1_1660,1);\
__declare_static_bit_vector(CONCAT_u1_u65_1662,65);\
bit_vector_clear(&konst_1659);\
bit_vector_bitsel( &(rdata1), &(konst_1659), &(BITSEL_u8_u1_1660));\
bit_vector_concatenate( &(BITSEL_u8_u1_1660), &(rdata0), &(CONCAT_u1_u65_1662));\
write_bit_vector_to_pipe("MEMORY_TO_NIC_RESPONSE",&(CONCAT_u1_u65_1662));\
;
;

#define _memoryToNicInterface_branch_block_stmt_1647_c_export_apply_macro_ ;

#define _memoryToNicInterface_inner_outarg_prep_macro__ ;

#define _memoryToNicInterface_outer_arg_decl_macro__ ;

#define _memoryToNicInterface_outer_op_xfer_macro__ ;

#define _memoryToProcessorInterface_inner_inarg_prep_macro__ 
#define _memoryToProcessorInterface_branch_block_stmt_1669_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,8);\


#define _memoryToProcessorInterface_merge_stmt_1671_c_preamble_macro_ uint8_t merge_stmt_1671_entry_flag;\
merge_stmt_1671_entry_flag = do_while_entry_flag;\
goto merge_stmt_1671_run;\
merge_stmt_1671_run: ;\

#define _memoryToProcessorInterface_phi_stmt_1672_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp0_pipe0_1674,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp0_pipe0",&(RPIPE_mem_resp0_pipe0_1674));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp0_pipe0_1674));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp0_pipe0_1674,64);\
read_bit_vector_from_pipe("mem_resp0_pipe0",&(RPIPE_mem_resp0_pipe0_1674));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp0_pipe0_1674));\
}\
;

#define _memoryToProcessorInterface_phi_stmt_1675_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp0_pipe1_1677,8);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp0_pipe1",&(RPIPE_mem_resp0_pipe1_1677));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp0_pipe1_1677));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp0_pipe1_1677,8);\
read_bit_vector_from_pipe("mem_resp0_pipe1",&(RPIPE_mem_resp0_pipe1_1677));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp0_pipe1_1677));\
}\
;
;

#define _memoryToProcessorInterface_merge_stmt_1671_c_postamble_macro_ merge_stmt_1671_entry_flag = 0;

#define _memoryToProcessorInterface_assign_stmt_1681_c_macro_ write_bit_vector_to_pipe("mem_resp0_pipe0_tester",&(rdata0));\
;

#define _memoryToProcessorInterface_assign_stmt_1684_c_macro_ write_bit_vector_to_pipe("mem_resp0_pipe1_tester",&(rdata1));\
;
;

#define _memoryToProcessorInterface_branch_block_stmt_1669_c_export_apply_macro_ ;

#define _memoryToProcessorInterface_inner_outarg_prep_macro__ ;

#define _memoryToProcessorInterface_outer_arg_decl_macro__ ;

#define _memoryToProcessorInterface_outer_op_xfer_macro__ ;

#define _nextLSTATE_inner_inarg_prep_macro__ __declare_static_bit_vector(RX,73);\
bit_vector_cast_to_bit_vector(0, &(RX), &((*__pRX)));\
__declare_static_bit_vector(LSTATE,2);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &((*__pLSTATE)));\
__declare_static_bit_vector(nLSTATE,2);\
__declare_static_bit_vector(tlast,1);\
__declare_static_bit_vector(tdata,64);\
__declare_static_bit_vector(tkeep,8);\
__declare_static_bit_vector(last_word,1);\

#define _nextLSTATE_assign_stmt_1696_c_macro_ __declare_static_bit_vector(slice_1695,1);\
bit_vector_slice(&(RX), &(slice_1695), 72);\
bit_vector_cast_to_bit_vector(0, &(tlast), &(slice_1695));\
;

#define _nextLSTATE_assign_stmt_1700_c_macro_ __declare_static_bit_vector(slice_1699,64);\
bit_vector_slice(&(RX), &(slice_1699), 8);\
bit_vector_cast_to_bit_vector(0, &(tdata), &(slice_1699));\
;

#define _nextLSTATE_assign_stmt_1704_c_macro_ __declare_static_bit_vector(slice_1703,8);\
bit_vector_slice(&(RX), &(slice_1703), 0);\
bit_vector_cast_to_bit_vector(0, &(tkeep), &(slice_1703));\
;

#define _nextLSTATE_assign_stmt_1709_c_macro_ __declare_static_bit_vector(konst_1707,1);\
bit_vector_clear(&konst_1707);\
konst_1707.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_1708,1);\
bit_vector_clear(&konst_1707);\
konst_1707.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_1707), &(EQ_u1_u1_1708));\
bit_vector_cast_to_bit_vector(0, &(last_word), &(EQ_u1_u1_1708));\
;

#define _nextLSTATE_assign_stmt_1743_c_macro_ __declare_static_bit_vector(EQ_u2_u1_1713,1);\
__declare_static_bit_vector(konst_1715,2);\
bit_vector_clear(&konst_1715);\
__declare_static_bit_vector(MUX_1716,2);\
__declare_static_bit_vector(EQ_u2_u1_1719,1);\
__declare_static_bit_vector(konst_1721,2);\
bit_vector_clear(&konst_1721);\
__declare_static_bit_vector(MUX_1722,2);\
__declare_static_bit_vector(OR_u2_u2_1723,2);\
__declare_static_bit_vector(EQ_u2_u1_1726,1);\
__declare_static_bit_vector(NOT_u1_u1_1728,1);\
__declare_static_bit_vector(AND_u1_u1_1729,1);\
__declare_static_bit_vector(konst_1731,2);\
bit_vector_clear(&konst_1731);\
__declare_static_bit_vector(MUX_1732,2);\
__declare_static_bit_vector(EQ_u2_u1_1735,1);\
__declare_static_bit_vector(AND_u1_u1_1737,1);\
__declare_static_bit_vector(konst_1739,2);\
bit_vector_clear(&konst_1739);\
__declare_static_bit_vector(MUX_1740,2);\
__declare_static_bit_vector(OR_u2_u2_1741,2);\
__declare_static_bit_vector(OR_u2_u2_1742,2);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u2_u1_1713));\
if (has_undefined_bit(&EQ_u2_u1_1713)) {fprintf(stderr, "Error: variable EQ_u2_u1_1713 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1713));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1713)){bit_vector_cast_to_bit_vector(0, &(MUX_1716), &(S1));\
}else {bit_vector_clear(&konst_1715);\
bit_vector_cast_to_bit_vector(0, &(MUX_1716), &(konst_1715));\
}bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1719));\
if (has_undefined_bit(&EQ_u2_u1_1719)) {fprintf(stderr, "Error: variable EQ_u2_u1_1719 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1719));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1719)){bit_vector_cast_to_bit_vector(0, &(MUX_1722), &(S2));\
}else {bit_vector_clear(&konst_1721);\
bit_vector_cast_to_bit_vector(0, &(MUX_1722), &(konst_1721));\
}bit_vector_or(&(MUX_1716), &(MUX_1722), &(OR_u2_u2_1723));\
bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u2_u1_1726));\
bit_vector_not( &(last_word), &(NOT_u1_u1_1728));\
bit_vector_and(&(EQ_u2_u1_1726), &(NOT_u1_u1_1728), &(AND_u1_u1_1729));\
if (has_undefined_bit(&AND_u1_u1_1729)) {fprintf(stderr, "Error: variable AND_u1_u1_1729 has undefined value (%s) at test point.\n", to_string(&AND_u1_u1_1729));assert(0);} \
if(bit_vector_to_uint64(0, &AND_u1_u1_1729)){bit_vector_cast_to_bit_vector(0, &(MUX_1732), &(S2));\
}else {bit_vector_clear(&konst_1731);\
bit_vector_cast_to_bit_vector(0, &(MUX_1732), &(konst_1731));\
}bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u2_u1_1735));\
bit_vector_and(&(EQ_u2_u1_1735), &(last_word), &(AND_u1_u1_1737));\
if (has_undefined_bit(&AND_u1_u1_1737)) {fprintf(stderr, "Error: variable AND_u1_u1_1737 has undefined value (%s) at test point.\n", to_string(&AND_u1_u1_1737));assert(0);} \
if(bit_vector_to_uint64(0, &AND_u1_u1_1737)){bit_vector_cast_to_bit_vector(0, &(MUX_1740), &(S0));\
}else {bit_vector_clear(&konst_1739);\
bit_vector_cast_to_bit_vector(0, &(MUX_1740), &(konst_1739));\
}bit_vector_or(&(MUX_1732), &(MUX_1740), &(OR_u2_u2_1741));\
bit_vector_or(&(OR_u2_u2_1723), &(OR_u2_u2_1741), &(OR_u2_u2_1742));\
bit_vector_cast_to_bit_vector(0, &(nLSTATE), &(OR_u2_u2_1742));\
;

#define _nextLSTATE_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnLSTATE)), &(nLSTATE));\
;

#define _nicRxFromMacDaemon_inner_inarg_prep_macro__ 
#define _nicRxFromMacDaemon_branch_block_stmt_1746_c_export_decl_macro_ __declare_static_bit_vector(ignore_resp0,32);\
__declare_static_bit_vector(ignore_resp1,32);\
__declare_static_bit_vector(LSTATE,2);\
__declare_static_bit_vector(RX,73);\
__declare_static_bit_vector(nLSTATE,2);\
__declare_static_bit_vector(write_to_header,1);\


#define _nicRxFromMacDaemon_stmt_1747_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1747_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1747_c_macro___print_counter,"waiting_for_control");release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_merge_stmt_1748_c_preamble_macro_ uint8_t merge_stmt_1748_entry_flag;\
merge_stmt_1748_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_1746_flag = 0;\
uint8_t disable_loopback_1746_flag = 0;\
goto merge_stmt_1748_run;\
not_enabled_yet_loopback_1746: not_enabled_yet_loopback_1746_flag = 1;\
disable_loopback_1746_flag = 0;\
goto merge_stmt_1748_run;\
disable_loopback_1746: disable_loopback_1746_flag = 1;\
not_enabled_yet_loopback_1746_flag = 0;\
goto merge_stmt_1748_run;\
merge_stmt_1748_run: ;\
;

#define _nicRxFromMacDaemon_merge_stmt_1748_c_postamble_macro_ not_enabled_yet_loopback_1746_flag = 0;\
disable_loopback_1746_flag = 0;\
merge_stmt_1748_entry_flag = 0;

#define _nicRxFromMacDaemon_call_stmt_1758_c_macro_ __declare_static_bit_vector(konst_1749,1);\
bit_vector_clear(&konst_1749);\
__declare_static_bit_vector(type_cast_1750,1);\
bit_vector_clear(&type_cast_1750);\
__declare_static_bit_vector(konst_1751,4);\
bit_vector_clear(&konst_1751);\
__declare_static_bit_vector(type_cast_1752,4);\
bit_vector_clear(&type_cast_1752);\
__declare_static_bit_vector(NOT_u4_u4_1753,4);\
bit_vector_clear(&NOT_u4_u4_1753);\
NOT_u4_u4_1753.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_1754,6);\
bit_vector_clear(&konst_1754);\
konst_1754.val.byte_array[0] = 22;\
__declare_static_bit_vector(konst_1755,32);\
bit_vector_clear(&konst_1755);\
__declare_static_bit_vector(type_cast_1756,32);\
bit_vector_clear(&type_cast_1756);\
bit_vector_clear(&konst_1749);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1750), &(konst_1749));\
bit_vector_clear(&konst_1751);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1752), &(konst_1751));\
bit_vector_not( &(type_cast_1752), &(NOT_u4_u4_1753));\
bit_vector_clear(&konst_1754);\
konst_1754.val.byte_array[0] = 22;\
bit_vector_clear(&konst_1755);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1756), &(konst_1755));\
_AccessRegister_( &(type_cast_1750),  &(NOT_u4_u4_1753),  &(konst_1754),  &(type_cast_1756), &(ignore_resp0));\
;

#define _nicRxFromMacDaemon_stmt_1766_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1766_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1766_c_macro___print_counter,"got_the__control");release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_call_stmt_1776_c_macro_ __declare_static_bit_vector(konst_1767,1);\
bit_vector_clear(&konst_1767);\
__declare_static_bit_vector(type_cast_1768,1);\
bit_vector_clear(&type_cast_1768);\
__declare_static_bit_vector(konst_1769,4);\
bit_vector_clear(&konst_1769);\
__declare_static_bit_vector(type_cast_1770,4);\
bit_vector_clear(&type_cast_1770);\
__declare_static_bit_vector(NOT_u4_u4_1771,4);\
bit_vector_clear(&NOT_u4_u4_1771);\
NOT_u4_u4_1771.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_1772,6);\
bit_vector_clear(&konst_1772);\
konst_1772.val.byte_array[0] = 22;\
__declare_static_bit_vector(konst_1773,32);\
bit_vector_clear(&konst_1773);\
konst_1773.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1774,32);\
bit_vector_clear(&type_cast_1774);\
type_cast_1774.val.byte_array[0] = 1;\
bit_vector_clear(&konst_1767);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1768), &(konst_1767));\
bit_vector_clear(&konst_1769);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1770), &(konst_1769));\
bit_vector_not( &(type_cast_1770), &(NOT_u4_u4_1771));\
bit_vector_clear(&konst_1772);\
konst_1772.val.byte_array[0] = 22;\
bit_vector_clear(&konst_1773);\
konst_1773.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1774), &(konst_1773));\
_AccessRegister_( &(type_cast_1768),  &(NOT_u4_u4_1771),  &(konst_1772),  &(type_cast_1774), &(ignore_resp1));\
;

#define _nicRxFromMacDaemon_merge_stmt_1778_c_preamble_macro_ uint8_t merge_stmt_1778_entry_flag;\
merge_stmt_1778_entry_flag = do_while_entry_flag;\
goto merge_stmt_1778_run;\
merge_stmt_1778_run: ;\

#define _nicRxFromMacDaemon_phi_stmt_1779_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(nLSTATE));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(S0));\
}\
;

#define _nicRxFromMacDaemon_phi_stmt_1783_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_1785,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_1785));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_1785));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_1785,73);\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_1785));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_1785));\
}\
;
;

#define _nicRxFromMacDaemon_merge_stmt_1778_c_postamble_macro_ merge_stmt_1778_entry_flag = 0;

#define _nicRxFromMacDaemon_stmt_1789_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1789_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1789_c_macro___print_counter,"data_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1789_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1789_c_macro___print_counter,"LSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(LSTATE)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_call_stmt_1793_c_macro_ _nextLSTATE_( &(RX),  &(LSTATE), &(nLSTATE));\
;

#define _nicRxFromMacDaemon_assign_stmt_1802_c_macro_ __declare_static_bit_vector(EQ_u2_u1_1797,1);\
__declare_static_bit_vector(EQ_u2_u1_1800,1);\
__declare_static_bit_vector(OR_u1_u1_1801,1);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u2_u1_1797));\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1800));\
bit_vector_or(&(EQ_u2_u1_1797), &(EQ_u2_u1_1800), &(OR_u1_u1_1801));\
bit_vector_cast_to_bit_vector(0, &(write_to_header), &(OR_u1_u1_1801));\
;

#define _nicRxFromMacDaemon_assign_stmt_1814_c_macro_ if (has_undefined_bit(&write_to_header)) {fprintf(stderr, "Error: variable write_to_header has undefined value (%s) at test point.\n", to_string(&write_to_header));assert(0);} \
__declare_static_bit_vector(EQ_u2_u1_1807,1);\
__declare_static_bit_vector(slice_1809,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1811,73);\
__declare_static_bit_vector(MUX_1813,73);\
if (bit_vector_to_uint64(0, &write_to_header)) {\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1807));\
if (has_undefined_bit(&EQ_u2_u1_1807)) {fprintf(stderr, "Error: variable EQ_u2_u1_1807 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1807));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1807)){bit_vector_slice(&(RX), &(slice_1809), 8);\
bit_vector_concatenate( &(slice_1809), &(HEADER_TKEEP), &(CONCAT_u65_u73_1811));\
bit_vector_cast_to_bit_vector(0, &(MUX_1813), &(CONCAT_u65_u73_1811));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_1813), &(RX));\
}write_bit_vector_to_pipe("nic_rx_to_header",&(MUX_1813));\
}
;

#define _nicRxFromMacDaemon_assign_stmt_1817_c_macro_ write_bit_vector_to_pipe("nic_rx_to_packet",&(RX));\
;

#define _nicRxFromMacDaemon_stmt_1820_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1820_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1820_c_macro___print_counter,"data_written_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1820_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1820_c_macro___print_counter,"nLSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nLSTATE)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;
;

#define _nicRxFromMacDaemon_branch_block_stmt_1746_c_export_apply_macro_ ;

#define _nicRxFromMacDaemon_inner_outarg_prep_macro__ ;

#define _nicRxFromMacDaemon_outer_arg_decl_macro__ ;

#define _nicRxFromMacDaemon_outer_op_xfer_macro__ ;

#define _nicToMacInterface_inner_inarg_prep_macro__ 
#define _nicToMacInterface_branch_block_stmt_1829_c_export_decl_macro_ __declare_static_bit_vector(rdata,73);\


#define _nicToMacInterface_merge_stmt_1831_c_preamble_macro_ uint8_t merge_stmt_1831_entry_flag;\
merge_stmt_1831_entry_flag = do_while_entry_flag;\
goto merge_stmt_1831_run;\
merge_stmt_1831_run: ;\

#define _nicToMacInterface_phi_stmt_1832_c_macro_ __declare_static_bit_vector(RPIPE_nic_to_mac_transmit_pipe_1834,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_to_mac_transmit_pipe",&(RPIPE_nic_to_mac_transmit_pipe_1834));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_nic_to_mac_transmit_pipe_1834));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_to_mac_transmit_pipe_1834,73);\
read_bit_vector_from_pipe("nic_to_mac_transmit_pipe",&(RPIPE_nic_to_mac_transmit_pipe_1834));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_nic_to_mac_transmit_pipe_1834));\
}\
;
;

#define _nicToMacInterface_merge_stmt_1831_c_postamble_macro_ merge_stmt_1831_entry_flag = 0;

#define _nicToMacInterface_stmt_1837_c_macro_ uint32_t _nicToMacInterface_stmt_1837_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicToMacInterface>\t%s\n",_nicToMacInterface_stmt_1837_c_macro___print_counter,"read_data_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicToMacInterface>\t\t%s\t\t",_nicToMacInterface_stmt_1837_c_macro___print_counter,"rdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicToMacInterface_assign_stmt_1841_c_macro_ __declare_static_bit_vector(slice_1840,64);\
bit_vector_slice(&(rdata), &(slice_1840), 0);\
write_bit_vector_to_pipe("nic_to_mac_data_0",&(slice_1840));\
;

#define _nicToMacInterface_assign_stmt_1846_c_macro_ __declare_static_bit_vector(slice_1844,9);\
__declare_static_bit_vector(type_cast_1845,16);\
bit_vector_slice(&(rdata), &(slice_1844), 64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1845), &(slice_1844));\
write_bit_vector_to_pipe("nic_to_mac_data_1",&(type_cast_1845));\
;
;

#define _nicToMacInterface_branch_block_stmt_1829_c_export_apply_macro_ ;

#define _nicToMacInterface_inner_outarg_prep_macro__ ;

#define _nicToMacInterface_outer_arg_decl_macro__ ;

#define _nicToMacInterface_outer_op_xfer_macro__ ;

#define _nicToMemoryInterface_inner_inarg_prep_macro__ 
#define _nicToMemoryInterface_branch_block_stmt_1852_c_export_decl_macro_ __declare_static_bit_vector(rdata,110);\


#define _nicToMemoryInterface_merge_stmt_1854_c_preamble_macro_ uint8_t merge_stmt_1854_entry_flag;\
merge_stmt_1854_entry_flag = do_while_entry_flag;\
goto merge_stmt_1854_run;\
merge_stmt_1854_run: ;\

#define _nicToMemoryInterface_phi_stmt_1855_c_macro_ __declare_static_bit_vector(RPIPE_NIC_TO_MEMORY_REQUEST_1857,110);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("NIC_TO_MEMORY_REQUEST",&(RPIPE_NIC_TO_MEMORY_REQUEST_1857));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_NIC_TO_MEMORY_REQUEST_1857));\
}\
else {\
__declare_static_bit_vector(RPIPE_NIC_TO_MEMORY_REQUEST_1857,110);\
read_bit_vector_from_pipe("NIC_TO_MEMORY_REQUEST",&(RPIPE_NIC_TO_MEMORY_REQUEST_1857));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_NIC_TO_MEMORY_REQUEST_1857));\
}\
;
;

#define _nicToMemoryInterface_merge_stmt_1854_c_postamble_macro_ merge_stmt_1854_entry_flag = 0;

#define _nicToMemoryInterface_stmt_1860_c_macro_ uint32_t _nicToMemoryInterface_stmt_1860_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicToMemoryInterface>\t%s\n",_nicToMemoryInterface_stmt_1860_c_macro___print_counter,"writing_to_mem_pipe");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicToMemoryInterface>\t\t%s\t\t",_nicToMemoryInterface_stmt_1860_c_macro___print_counter,"rdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicToMemoryInterface_assign_stmt_1864_c_macro_ __declare_static_bit_vector(slice_1863,64);\
bit_vector_slice(&(rdata), &(slice_1863), 0);\
write_bit_vector_to_pipe("mem_req1_pipe0",&(slice_1863));\
;

#define _nicToMemoryInterface_assign_stmt_1870_c_macro_ __declare_static_bit_vector(slice_1868,46);\
__declare_static_bit_vector(type_cast_1869,64);\
bit_vector_slice(&(rdata), &(slice_1868), 64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1869), &(slice_1868));\
write_bit_vector_to_pipe("mem_req1_pipe1",&(type_cast_1869));\
;
;

#define _nicToMemoryInterface_branch_block_stmt_1852_c_export_apply_macro_ ;

#define _nicToMemoryInterface_inner_outarg_prep_macro__ ;

#define _nicToMemoryInterface_outer_arg_decl_macro__ ;

#define _nicToMemoryInterface_outer_op_xfer_macro__ ;

#define _nicToProcessorInterface_inner_inarg_prep_macro__ 
#define _nicToProcessorInterface_branch_block_stmt_1876_c_export_decl_macro_ __declare_static_bit_vector(rdata,33);\


#define _nicToProcessorInterface_merge_stmt_1878_c_preamble_macro_ uint8_t merge_stmt_1878_entry_flag;\
merge_stmt_1878_entry_flag = do_while_entry_flag;\
goto merge_stmt_1878_run;\
merge_stmt_1878_run: ;\

#define _nicToProcessorInterface_phi_stmt_1879_c_macro_ __declare_static_bit_vector(RPIPE_AFB_NIC_RESPONSE_1881,33);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("AFB_NIC_RESPONSE",&(RPIPE_AFB_NIC_RESPONSE_1881));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_AFB_NIC_RESPONSE_1881));\
}\
else {\
__declare_static_bit_vector(RPIPE_AFB_NIC_RESPONSE_1881,33);\
read_bit_vector_from_pipe("AFB_NIC_RESPONSE",&(RPIPE_AFB_NIC_RESPONSE_1881));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_AFB_NIC_RESPONSE_1881));\
}\
;
;

#define _nicToProcessorInterface_merge_stmt_1878_c_postamble_macro_ merge_stmt_1878_entry_flag = 0;

#define _nicToProcessorInterface_assign_stmt_1886_c_macro_ __declare_static_bit_vector(type_cast_1885,64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1885), &(rdata));\
write_bit_vector_to_pipe("control_word_response_pipe",&(type_cast_1885));\
;
;

#define _nicToProcessorInterface_branch_block_stmt_1876_c_export_apply_macro_ ;

#define _nicToProcessorInterface_inner_outarg_prep_macro__ ;

#define _nicToProcessorInterface_outer_arg_decl_macro__ ;

#define _nicToProcessorInterface_outer_op_xfer_macro__ ;

#define _popFromQueue_inner_inarg_prep_macro__ __declare_static_bit_vector(lock,1);\
bit_vector_cast_to_bit_vector(0, &(lock), &((*__plock)));\
__declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(q_r_data,32);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(m_ok,1);\
__declare_static_bit_vector(write_index,32);\
__declare_static_bit_vector(read_index,32);\
__declare_static_bit_vector(q_empty,1);\
__declare_static_bit_vector(Queue_Length,32);\
__declare_static_bit_vector(round_off,1);\
__declare_static_bit_vector(next_ri,32);\

#define _popFromQueue_call_stmt_851_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_acquireLock_( &(q_base_address), &(m_ok));\
}\
;

#define _popFromQueue_call_stmt_856_c_macro_ _getQueuePointers_( &(q_base_address), &(write_index), &(read_index));\
;

#define _popFromQueue_assign_stmt_861_c_macro_ __declare_static_bit_vector(EQ_u32_u1_860,1);\
bit_vector_equal(0, &(write_index), &(read_index), &(EQ_u32_u1_860));\
bit_vector_cast_to_bit_vector(0, &(q_empty), &(EQ_u32_u1_860));\
;

#define _popFromQueue_call_stmt_864_c_macro_ _getQueueLength_( &(q_base_address), &(Queue_Length));\
;

#define _popFromQueue_assign_stmt_871_c_macro_ __declare_static_bit_vector(konst_868,32);\
bit_vector_clear(&konst_868);\
konst_868.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_869,32);\
__declare_static_bit_vector(EQ_u32_u1_870,1);\
bit_vector_clear(&konst_868);\
konst_868.val.byte_array[0] = 1;\
bit_vector_minus( &(Queue_Length), &(konst_868), &(SUB_u32_u32_869));\
bit_vector_equal(0, &(read_index), &(SUB_u32_u32_869), &(EQ_u32_u1_870));\
bit_vector_cast_to_bit_vector(0, &(round_off), &(EQ_u32_u1_870));\
;

#define _popFromQueue_assign_stmt_879_c_macro_ __declare_static_bit_vector(konst_874,32);\
bit_vector_clear(&konst_874);\
__declare_static_bit_vector(konst_876,32);\
bit_vector_clear(&konst_876);\
konst_876.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_877,32);\
__declare_static_bit_vector(MUX_878,32);\
if (has_undefined_bit(&round_off)) {fprintf(stderr, "Error: variable round_off has undefined value (%s) at test point.\n", to_string(&round_off));assert(0);} \
if(bit_vector_to_uint64(0, &round_off)){bit_vector_clear(&konst_874);\
bit_vector_cast_to_bit_vector(0, &(MUX_878), &(konst_874));\
}else {bit_vector_clear(&konst_876);\
konst_876.val.byte_array[0] = 1;\
bit_vector_plus( &(read_index), &(konst_876), &(ADD_u32_u32_877));\
bit_vector_cast_to_bit_vector(0, &(MUX_878), &(ADD_u32_u32_877));\
}bit_vector_cast_to_bit_vector(0, &(next_ri), &(MUX_878));\
;

#define _popFromQueue_call_stmt_884_c_macro_ if (has_undefined_bit(&q_empty)) {fprintf(stderr, "Error: variable q_empty has undefined value (%s) at test point.\n", to_string(&q_empty));assert(0);} \
if (!bit_vector_to_uint64(0, &q_empty)) {\
_getQueueElement_( &(q_base_address),  &(read_index), &(q_r_data));\
}\
;

#define _popFromQueue_call_stmt_889_c_macro_ if (has_undefined_bit(&q_empty)) {fprintf(stderr, "Error: variable q_empty has undefined value (%s) at test point.\n", to_string(&q_empty));assert(0);} \
if (!bit_vector_to_uint64(0, &q_empty)) {\
_setQueuePointers_( &(q_base_address),  &(write_index),  &(next_ri));\
}\
;

#define _popFromQueue_stmt_896_c_macro_ uint32_t _popFromQueue_stmt_896_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]popFromQueue>\t%s\n",_popFromQueue_stmt_896_c_macro___print_counter,"pop_data");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_896_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_896_c_macro___print_counter,"q_r_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_r_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_896_c_macro___print_counter,"q_empty");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_empty)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_896_c_macro___print_counter,"write_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(write_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_896_c_macro___print_counter,"read_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_896_c_macro___print_counter,"next_ri");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(next_ri)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _popFromQueue_call_stmt_900_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_releaseLock_( &(q_base_address));\
}\
;

#define _popFromQueue_assign_stmt_903_c_macro_ bit_vector_cast_to_bit_vector(0, &(status), &(q_empty));\
;

#define _popFromQueue_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pq_r_data)), &(q_r_data));\
bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _populateRxQueue_inner_inarg_prep_macro__ __declare_static_bit_vector(rx_buffer_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer), &((*__prx_buffer_pointer)));\

#define _populateRxQueue_stmt_1240_c_macro_ uint32_t _populateRxQueue_stmt_1240_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_1240_c_macro___print_counter,"started_populate_rx_queue_module");__declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1239,6);\
read_bit_vector_from_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1239));\
if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1240_c_macro___print_counter,"LAST_WRITTEN_RX_QUEUE_INDEX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1239)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_branch_block_stmt_1241_c_export_decl_macro_ __declare_static_bit_vector(q_index,6);\
__declare_static_bit_vector(register_index,6);\
__declare_static_bit_vector(rx_queue_pointer_32,32);\
__declare_static_bit_vector(rx_queue_pointer_36,36);\
__declare_static_bit_vector(push_status,1);\
__declare_static_bit_vector(n_q_index,6);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(selected_q_index,6);\


#define _populateRxQueue_merge_stmt_1242_c_preamble_macro_ uint8_t merge_stmt_1242_entry_flag;\
merge_stmt_1242_entry_flag = 1;\
uint8_t loopback_1241_flag = 0;\
goto merge_stmt_1242_run;\
loopback_1241: loopback_1241_flag = 1;\
goto merge_stmt_1242_run;\
merge_stmt_1242_run: ;\

#define _populateRxQueue_phi_stmt_1243_c_macro_ __declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1245,6);\
__declare_static_bit_vector(konst_1246,6);\
bit_vector_clear(&konst_1246);\
konst_1246.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1247,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1248,32);\
__declare_static_bit_vector(konst_1249,32);\
bit_vector_clear(&konst_1249);\
konst_1249.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1250,32);\
__declare_static_bit_vector(type_cast_1251,6);\
__declare_static_bit_vector(AND_u6_u6_1252,6);\
if(loopback_1241_flag) {\
bit_vector_cast_to_bit_vector(0, &(q_index), &(n_q_index));\
}\
else {\
__declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1245,6);\
__declare_static_bit_vector(konst_1246,6);\
bit_vector_clear(&konst_1246);\
konst_1246.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1247,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1248,32);\
__declare_static_bit_vector(konst_1249,32);\
bit_vector_clear(&konst_1249);\
konst_1249.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1250,32);\
__declare_static_bit_vector(type_cast_1251,6);\
__declare_static_bit_vector(AND_u6_u6_1252,6);\
read_bit_vector_from_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1245));\
bit_vector_clear(&konst_1246);\
konst_1246.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_1245), &(konst_1246), &(ADD_u6_u6_1247));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1248));\
bit_vector_clear(&konst_1249);\
konst_1249.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_1248), &(konst_1249), &(SUB_u32_u32_1250));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1251), &(SUB_u32_u32_1250));\
bit_vector_and(&(ADD_u6_u6_1247), &(type_cast_1251), &(AND_u6_u6_1252));\
bit_vector_cast_to_bit_vector(0, &(q_index), &(AND_u6_u6_1252));\
}\
;
;

#define _populateRxQueue_merge_stmt_1242_c_postamble_macro_ loopback_1241_flag = 0;\
merge_stmt_1242_entry_flag = 0;

#define _populateRxQueue_stmt_1256_c_macro_ uint32_t _populateRxQueue_stmt_1256_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_1256_c_macro___print_counter,"in_loop");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1256_c_macro___print_counter,"q_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_assign_stmt_1262_c_macro_ __declare_static_bit_vector(ADD_u6_u6_1260,6);\
__declare_static_bit_vector(type_cast_1261,6);\
bit_vector_plus( &(q_index), &(RX_QUEUES_REG_START_OFFSET), &(ADD_u6_u6_1260));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1261), &(ADD_u6_u6_1260));\
bit_vector_cast_to_bit_vector(0, &(register_index), &(type_cast_1261));\
;

#define _populateRxQueue_stmt_1264_c_macro_ uint32_t _populateRxQueue_stmt_1264_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_1264_c_macro___print_counter,"will_be_Accessing_register");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1264_c_macro___print_counter,"register_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(register_index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_call_stmt_1274_c_macro_ __declare_static_bit_vector(konst_1265,1);\
bit_vector_clear(&konst_1265);\
konst_1265.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1266,1);\
bit_vector_clear(&type_cast_1266);\
type_cast_1266.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1267,4);\
bit_vector_clear(&konst_1267);\
__declare_static_bit_vector(type_cast_1268,4);\
bit_vector_clear(&type_cast_1268);\
__declare_static_bit_vector(NOT_u4_u4_1269,4);\
bit_vector_clear(&NOT_u4_u4_1269);\
NOT_u4_u4_1269.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_1271,32);\
bit_vector_clear(&konst_1271);\
__declare_static_bit_vector(type_cast_1272,32);\
bit_vector_clear(&type_cast_1272);\
bit_vector_clear(&konst_1265);\
konst_1265.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1266), &(konst_1265));\
bit_vector_clear(&konst_1267);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1268), &(konst_1267));\
bit_vector_not( &(type_cast_1268), &(NOT_u4_u4_1269));\
bit_vector_clear(&konst_1271);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1272), &(konst_1271));\
_AccessRegister_( &(type_cast_1266),  &(NOT_u4_u4_1269),  &(register_index),  &(type_cast_1272), &(rx_queue_pointer_32));\
;

#define _populateRxQueue_assign_stmt_1280_c_macro_ __declare_static_bit_vector(konst_1277,4);\
bit_vector_clear(&konst_1277);\
__declare_static_bit_vector(type_cast_1278,4);\
bit_vector_clear(&type_cast_1278);\
__declare_static_bit_vector(CONCAT_u32_u36_1279,36);\
bit_vector_clear(&konst_1277);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1278), &(konst_1277));\
bit_vector_concatenate( &(rx_queue_pointer_32), &(type_cast_1278), &(CONCAT_u32_u36_1279));\
bit_vector_cast_to_bit_vector(0, &(rx_queue_pointer_36), &(CONCAT_u32_u36_1279));\
;

#define _populateRxQueue_stmt_1284_c_macro_ uint32_t _populateRxQueue_stmt_1284_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_1284_c_macro___print_counter,"got_rx_queue_pointer_pushing_to_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1284_c_macro___print_counter,"rx_queue_pointer_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_queue_pointer_32)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1284_c_macro___print_counter,"rx_queue_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_queue_pointer_36)));fflush (__report_log_file__);}__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1283,32);\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1283));\
if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1284_c_macro___print_counter,"NUMBER_OF_SERVERS");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RPIPE_NUMBER_OF_SERVERS_1283)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_call_stmt_1291_c_macro_ __declare_static_bit_vector(konst_1285,1);\
bit_vector_clear(&konst_1285);\
__declare_static_bit_vector(type_cast_1286,1);\
bit_vector_clear(&type_cast_1286);\
__declare_static_bit_vector(slice_1289,32);\
bit_vector_clear(&konst_1285);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1286), &(konst_1285));\
bit_vector_slice(&(rx_buffer_pointer), &(slice_1289), 4);\
_pushIntoQueue_( &(type_cast_1286),  &(rx_queue_pointer_36),  &(slice_1289), &(push_status));\
;

#define _populateRxQueue_assign_stmt_1301_c_macro_ __declare_static_bit_vector(konst_1294,6);\
bit_vector_clear(&konst_1294);\
konst_1294.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1295,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1296,32);\
__declare_static_bit_vector(konst_1297,32);\
bit_vector_clear(&konst_1297);\
konst_1297.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1298,32);\
__declare_static_bit_vector(type_cast_1299,6);\
__declare_static_bit_vector(AND_u6_u6_1300,6);\
bit_vector_clear(&konst_1294);\
konst_1294.val.byte_array[0] = 1;\
bit_vector_plus( &(q_index), &(konst_1294), &(ADD_u6_u6_1295));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1296));\
bit_vector_clear(&konst_1297);\
konst_1297.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_1296), &(konst_1297), &(SUB_u32_u32_1298));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1299), &(SUB_u32_u32_1298));\
bit_vector_and(&(ADD_u6_u6_1295), &(type_cast_1299), &(AND_u6_u6_1300));\
bit_vector_cast_to_bit_vector(0, &(n_q_index), &(AND_u6_u6_1300));\
;

#define _populateRxQueue_stmt_1304_c_macro_ uint32_t _populateRxQueue_stmt_1304_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_1304_c_macro___print_counter,"written_to_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1304_c_macro___print_counter,"n_q_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(n_q_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_1304_c_macro___print_counter,"push_status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(push_status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_call_stmt_1310_c_macro_ __declare_static_bit_vector(konst_1308,32);\
bit_vector_clear(&konst_1308);\
konst_1308.val.byte_array[0] = 32;\
bit_vector_clear(&konst_1308);\
konst_1308.val.byte_array[0] = 32;\
_delay_time_( &(konst_1308), &(status));\
;

#define _populateRxQueue_assign_stmt_1320_c_macro_ write_bit_vector_to_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(q_index));\
;

#define _populateRxQueue_assign_stmt_1323_c_macro_ bit_vector_cast_to_bit_vector(0, &(selected_q_index), &(q_index));\
;
;

#define _populateRxQueue_branch_block_stmt_1241_c_export_apply_macro_ ;

#define _populateRxQueue_inner_outarg_prep_macro__ ;

#define _processorToMemoryInterface_inner_inarg_prep_macro__ 
#define _processorToMemoryInterface_branch_block_stmt_1892_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,64);\


#define _processorToMemoryInterface_merge_stmt_1894_c_preamble_macro_ uint8_t merge_stmt_1894_entry_flag;\
merge_stmt_1894_entry_flag = do_while_entry_flag;\
goto merge_stmt_1894_run;\
merge_stmt_1894_run: ;\

#define _processorToMemoryInterface_phi_stmt_1895_c_macro_ __declare_static_bit_vector(RPIPE_mem_req0_pipe0_tester_1897,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_req0_pipe0_tester",&(RPIPE_mem_req0_pipe0_tester_1897));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_req0_pipe0_tester_1897));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_req0_pipe0_tester_1897,64);\
read_bit_vector_from_pipe("mem_req0_pipe0_tester",&(RPIPE_mem_req0_pipe0_tester_1897));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_req0_pipe0_tester_1897));\
}\
;

#define _processorToMemoryInterface_phi_stmt_1898_c_macro_ __declare_static_bit_vector(RPIPE_mem_req0_pipe1_tester_1900,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_req0_pipe1_tester",&(RPIPE_mem_req0_pipe1_tester_1900));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_req0_pipe1_tester_1900));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_req0_pipe1_tester_1900,64);\
read_bit_vector_from_pipe("mem_req0_pipe1_tester",&(RPIPE_mem_req0_pipe1_tester_1900));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_req0_pipe1_tester_1900));\
}\
;
;

#define _processorToMemoryInterface_merge_stmt_1894_c_postamble_macro_ merge_stmt_1894_entry_flag = 0;

#define _processorToMemoryInterface_stmt_1904_c_macro_ uint32_t _processorToMemoryInterface_stmt_1904_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ProcessorToMemoryInterface>\t%s\n",_processorToMemoryInterface_stmt_1904_c_macro___print_counter,"writing_to_mem_pipe");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ProcessorToMemoryInterface>\t\t%s\t\t",_processorToMemoryInterface_stmt_1904_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ProcessorToMemoryInterface>\t\t%s\t\t",_processorToMemoryInterface_stmt_1904_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _processorToMemoryInterface_assign_stmt_1907_c_macro_ write_bit_vector_to_pipe("mem_req0_pipe0",&(rdata0));\
;

#define _processorToMemoryInterface_assign_stmt_1910_c_macro_ write_bit_vector_to_pipe("mem_req0_pipe1",&(rdata1));\
;
;

#define _processorToMemoryInterface_branch_block_stmt_1892_c_export_apply_macro_ ;

#define _processorToMemoryInterface_inner_outarg_prep_macro__ ;

#define _processorToMemoryInterface_outer_arg_decl_macro__ ;

#define _processorToMemoryInterface_outer_op_xfer_macro__ ;

#define _processorToNicInterface_inner_inarg_prep_macro__ 
#define _processorToNicInterface_branch_block_stmt_1916_c_export_decl_macro_ __declare_static_bit_vector(rdata0,32);\
__declare_static_bit_vector(rdata1,64);\


#define _processorToNicInterface_merge_stmt_1918_c_preamble_macro_ uint8_t merge_stmt_1918_entry_flag;\
merge_stmt_1918_entry_flag = do_while_entry_flag;\
goto merge_stmt_1918_run;\
merge_stmt_1918_run: ;\

#define _processorToNicInterface_phi_stmt_1919_c_macro_ __declare_static_bit_vector(RPIPE_control_word_request_pipe_0_1921,32);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("control_word_request_pipe_0",&(RPIPE_control_word_request_pipe_0_1921));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_control_word_request_pipe_0_1921));\
}\
else {\
__declare_static_bit_vector(RPIPE_control_word_request_pipe_0_1921,32);\
read_bit_vector_from_pipe("control_word_request_pipe_0",&(RPIPE_control_word_request_pipe_0_1921));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_control_word_request_pipe_0_1921));\
}\
;

#define _processorToNicInterface_phi_stmt_1922_c_macro_ __declare_static_bit_vector(RPIPE_control_word_request_pipe_1_1924,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("control_word_request_pipe_1",&(RPIPE_control_word_request_pipe_1_1924));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_control_word_request_pipe_1_1924));\
}\
else {\
__declare_static_bit_vector(RPIPE_control_word_request_pipe_1_1924,64);\
read_bit_vector_from_pipe("control_word_request_pipe_1",&(RPIPE_control_word_request_pipe_1_1924));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_control_word_request_pipe_1_1924));\
}\
;
;

#define _processorToNicInterface_merge_stmt_1918_c_postamble_macro_ merge_stmt_1918_entry_flag = 0;

#define _processorToNicInterface_stmt_1928_c_macro_ uint32_t _processorToNicInterface_stmt_1928_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]processorToNicInterface>\t%s\n",_processorToNicInterface_stmt_1928_c_macro___print_counter,"got_afb_Req");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]processorToNicInterface>\t\t%s\t\t",_processorToNicInterface_stmt_1928_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]processorToNicInterface>\t\t%s\t\t",_processorToNicInterface_stmt_1928_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _processorToNicInterface_assign_stmt_1935_c_macro_ __declare_static_bit_vector(slice_1932,42);\
__declare_static_bit_vector(CONCAT_u42_u74_1934,74);\
bit_vector_slice(&(rdata1), &(slice_1932), 0);\
bit_vector_concatenate( &(slice_1932), &(rdata0), &(CONCAT_u42_u74_1934));\
write_bit_vector_to_pipe("AFB_NIC_REQUEST",&(CONCAT_u42_u74_1934));\
;
;

#define _processorToNicInterface_branch_block_stmt_1916_c_export_apply_macro_ ;

#define _processorToNicInterface_inner_outarg_prep_macro__ ;

#define _processorToNicInterface_outer_arg_decl_macro__ ;

#define _processorToNicInterface_outer_op_xfer_macro__ ;

#define _pushIntoQueue_inner_inarg_prep_macro__ __declare_static_bit_vector(lock,1);\
bit_vector_cast_to_bit_vector(0, &(lock), &((*__plock)));\
__declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(q_w_data,32);\
bit_vector_cast_to_bit_vector(0, &(q_w_data), &((*__pq_w_data)));\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(m_ok,1);\
__declare_static_bit_vector(write_index,32);\
__declare_static_bit_vector(read_index,32);\
__declare_static_bit_vector(Queue_Length,32);\
__declare_static_bit_vector(round_off,1);\
__declare_static_bit_vector(next_wi,32);\
__declare_static_bit_vector(q_full,1);\

#define _pushIntoQueue_call_stmt_1155_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_acquireLock_( &(q_base_address), &(m_ok));\
}\
;

#define _pushIntoQueue_stmt_1159_c_macro_ uint32_t _pushIntoQueue_stmt_1159_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]pushIntoQueue>\t%s\n",_pushIntoQueue_stmt_1159_c_macro___print_counter,"pushing_to_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1159_c_macro___print_counter,"q_w_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_w_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1159_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _pushIntoQueue_call_stmt_1163_c_macro_ _getQueuePointers_( &(q_base_address), &(write_index), &(read_index));\
;

#define _pushIntoQueue_call_stmt_1166_c_macro_ _getQueueLength_( &(q_base_address), &(Queue_Length));\
;

#define _pushIntoQueue_assign_stmt_1173_c_macro_ __declare_static_bit_vector(konst_1170,32);\
bit_vector_clear(&konst_1170);\
konst_1170.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1171,32);\
__declare_static_bit_vector(EQ_u32_u1_1172,1);\
bit_vector_clear(&konst_1170);\
konst_1170.val.byte_array[0] = 1;\
bit_vector_minus( &(Queue_Length), &(konst_1170), &(SUB_u32_u32_1171));\
bit_vector_equal(0, &(read_index), &(SUB_u32_u32_1171), &(EQ_u32_u1_1172));\
bit_vector_cast_to_bit_vector(0, &(round_off), &(EQ_u32_u1_1172));\
;

#define _pushIntoQueue_assign_stmt_1181_c_macro_ __declare_static_bit_vector(konst_1176,32);\
bit_vector_clear(&konst_1176);\
__declare_static_bit_vector(konst_1178,32);\
bit_vector_clear(&konst_1178);\
konst_1178.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_1179,32);\
__declare_static_bit_vector(MUX_1180,32);\
if (has_undefined_bit(&round_off)) {fprintf(stderr, "Error: variable round_off has undefined value (%s) at test point.\n", to_string(&round_off));assert(0);} \
if(bit_vector_to_uint64(0, &round_off)){bit_vector_clear(&konst_1176);\
bit_vector_cast_to_bit_vector(0, &(MUX_1180), &(konst_1176));\
}else {bit_vector_clear(&konst_1178);\
konst_1178.val.byte_array[0] = 1;\
bit_vector_plus( &(write_index), &(konst_1178), &(ADD_u32_u32_1179));\
bit_vector_cast_to_bit_vector(0, &(MUX_1180), &(ADD_u32_u32_1179));\
}bit_vector_cast_to_bit_vector(0, &(next_wi), &(MUX_1180));\
;

#define _pushIntoQueue_assign_stmt_1186_c_macro_ __declare_static_bit_vector(EQ_u32_u1_1185,1);\
bit_vector_equal(0, &(next_wi), &(read_index), &(EQ_u32_u1_1185));\
bit_vector_cast_to_bit_vector(0, &(q_full), &(EQ_u32_u1_1185));\
;

#define _pushIntoQueue_stmt_1192_c_macro_ uint32_t _pushIntoQueue_stmt_1192_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]pushIntoQueue>\t%s\n",_pushIntoQueue_stmt_1192_c_macro___print_counter,"pushing_to_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1192_c_macro___print_counter,"q_w_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_w_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1192_c_macro___print_counter,"write_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(write_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1192_c_macro___print_counter,"read_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1192_c_macro___print_counter,"next_wi");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(next_wi)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_1192_c_macro___print_counter,"q_full");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_full)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _pushIntoQueue_call_stmt_1197_c_macro_ if (has_undefined_bit(&q_full)) {fprintf(stderr, "Error: variable q_full has undefined value (%s) at test point.\n", to_string(&q_full));assert(0);} \
if (!bit_vector_to_uint64(0, &q_full)) {\
_setQueueElement_( &(q_base_address),  &(write_index),  &(q_w_data));\
}\
;

#define _pushIntoQueue_call_stmt_1202_c_macro_ if (has_undefined_bit(&q_full)) {fprintf(stderr, "Error: variable q_full has undefined value (%s) at test point.\n", to_string(&q_full));assert(0);} \
if (!bit_vector_to_uint64(0, &q_full)) {\
_setQueuePointers_( &(q_base_address),  &(next_wi),  &(read_index));\
}\
;

#define _pushIntoQueue_call_stmt_1206_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_releaseLock_( &(q_base_address));\
}\
;

#define _pushIntoQueue_assign_stmt_1210_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1209,1);\
bit_vector_not( &(q_full), &(NOT_u1_u1_1209));\
bit_vector_cast_to_bit_vector(0, &(status), &(NOT_u1_u1_1209));\
;

#define _pushIntoQueue_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _releaseLock_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(lock_address_pointer,36);\
__declare_static_bit_vector(msg_size_plus_lock,64);\
__declare_static_bit_vector(lock_addr_32,32);\
__declare_static_bit_vector(sel,3);\
__declare_static_bit_vector(s0,1);\
__declare_static_bit_vector(s1,1);\
__declare_static_bit_vector(s2,1);\
__declare_static_bit_vector(s3,1);\
__declare_static_bit_vector(s4,1);\
__declare_static_bit_vector(s5,1);\
__declare_static_bit_vector(s6,1);\
__declare_static_bit_vector(s7,1);\
__declare_static_bit_vector(new_bmask,8);\
__declare_static_bit_vector(ignore,64);\

#define _releaseLock_assign_stmt_711_c_macro_ __declare_static_bit_vector(konst_708,36);\
bit_vector_clear(&konst_708);\
konst_708.val.byte_array[0] = 20;\
__declare_static_bit_vector(type_cast_709,36);\
bit_vector_clear(&type_cast_709);\
type_cast_709.val.byte_array[0] = 20;\
__declare_static_bit_vector(ADD_u36_u36_710,36);\
bit_vector_clear(&konst_708);\
konst_708.val.byte_array[0] = 20;\
bit_vector_bitcast_to_bit_vector( &(type_cast_709), &(konst_708));\
bit_vector_plus( &(q_base_address), &(type_cast_709), &(ADD_u36_u36_710));\
bit_vector_cast_to_bit_vector(0, &(lock_address_pointer), &(ADD_u36_u36_710));\
;

#define _releaseLock_call_stmt_723_c_macro_ __declare_static_bit_vector(konst_712,1);\
bit_vector_clear(&konst_712);\
__declare_static_bit_vector(type_cast_713,1);\
bit_vector_clear(&type_cast_713);\
__declare_static_bit_vector(konst_714,1);\
bit_vector_clear(&konst_714);\
konst_714.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_715,1);\
bit_vector_clear(&type_cast_715);\
type_cast_715.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_716,8);\
bit_vector_clear(&konst_716);\
__declare_static_bit_vector(type_cast_717,8);\
bit_vector_clear(&type_cast_717);\
__declare_static_bit_vector(NOT_u8_u8_718,8);\
bit_vector_clear(&NOT_u8_u8_718);\
NOT_u8_u8_718.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_720,64);\
bit_vector_clear(&konst_720);\
__declare_static_bit_vector(type_cast_721,64);\
bit_vector_clear(&type_cast_721);\
bit_vector_clear(&konst_712);\
bit_vector_bitcast_to_bit_vector( &(type_cast_713), &(konst_712));\
bit_vector_clear(&konst_714);\
konst_714.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_715), &(konst_714));\
bit_vector_clear(&konst_716);\
bit_vector_bitcast_to_bit_vector( &(type_cast_717), &(konst_716));\
bit_vector_not( &(type_cast_717), &(NOT_u8_u8_718));\
bit_vector_clear(&konst_720);\
bit_vector_bitcast_to_bit_vector( &(type_cast_721), &(konst_720));\
_accessMemory_( &(type_cast_713),  &(type_cast_715),  &(NOT_u8_u8_718),  &(lock_address_pointer),  &(type_cast_721), &(msg_size_plus_lock));\
;

#define _releaseLock_assign_stmt_727_c_macro_ __declare_static_bit_vector(slice_726,32);\
bit_vector_slice(&(msg_size_plus_lock), &(slice_726), 0);\
bit_vector_cast_to_bit_vector(0, &(lock_addr_32), &(slice_726));\
;

#define _releaseLock_assign_stmt_731_c_macro_ __declare_static_bit_vector(slice_730,3);\
bit_vector_slice(&(lock_addr_32), &(slice_730), 0);\
bit_vector_cast_to_bit_vector(0, &(sel), &(slice_730));\
;

#define _releaseLock_assign_stmt_736_c_macro_ __declare_static_bit_vector(konst_734,3);\
bit_vector_clear(&konst_734);\
__declare_static_bit_vector(EQ_u3_u1_735,1);\
bit_vector_clear(&konst_734);\
bit_vector_equal(0, &(sel), &(konst_734), &(EQ_u3_u1_735));\
bit_vector_cast_to_bit_vector(0, &(s0), &(EQ_u3_u1_735));\
;

#define _releaseLock_assign_stmt_741_c_macro_ __declare_static_bit_vector(konst_739,3);\
bit_vector_clear(&konst_739);\
konst_739.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u3_u1_740,1);\
bit_vector_clear(&konst_739);\
konst_739.val.byte_array[0] = 1;\
bit_vector_equal(0, &(sel), &(konst_739), &(EQ_u3_u1_740));\
bit_vector_cast_to_bit_vector(0, &(s1), &(EQ_u3_u1_740));\
;

#define _releaseLock_assign_stmt_746_c_macro_ __declare_static_bit_vector(konst_744,3);\
bit_vector_clear(&konst_744);\
konst_744.val.byte_array[0] = 2;\
__declare_static_bit_vector(EQ_u3_u1_745,1);\
bit_vector_clear(&konst_744);\
konst_744.val.byte_array[0] = 2;\
bit_vector_equal(0, &(sel), &(konst_744), &(EQ_u3_u1_745));\
bit_vector_cast_to_bit_vector(0, &(s2), &(EQ_u3_u1_745));\
;

#define _releaseLock_assign_stmt_751_c_macro_ __declare_static_bit_vector(konst_749,3);\
bit_vector_clear(&konst_749);\
konst_749.val.byte_array[0] = 3;\
__declare_static_bit_vector(EQ_u3_u1_750,1);\
bit_vector_clear(&konst_749);\
konst_749.val.byte_array[0] = 3;\
bit_vector_equal(0, &(sel), &(konst_749), &(EQ_u3_u1_750));\
bit_vector_cast_to_bit_vector(0, &(s3), &(EQ_u3_u1_750));\
;

#define _releaseLock_assign_stmt_756_c_macro_ __declare_static_bit_vector(konst_754,3);\
bit_vector_clear(&konst_754);\
konst_754.val.byte_array[0] = 4;\
__declare_static_bit_vector(EQ_u3_u1_755,1);\
bit_vector_clear(&konst_754);\
konst_754.val.byte_array[0] = 4;\
bit_vector_equal(0, &(sel), &(konst_754), &(EQ_u3_u1_755));\
bit_vector_cast_to_bit_vector(0, &(s4), &(EQ_u3_u1_755));\
;

#define _releaseLock_assign_stmt_761_c_macro_ __declare_static_bit_vector(konst_759,3);\
bit_vector_clear(&konst_759);\
konst_759.val.byte_array[0] = 5;\
__declare_static_bit_vector(EQ_u3_u1_760,1);\
bit_vector_clear(&konst_759);\
konst_759.val.byte_array[0] = 5;\
bit_vector_equal(0, &(sel), &(konst_759), &(EQ_u3_u1_760));\
bit_vector_cast_to_bit_vector(0, &(s5), &(EQ_u3_u1_760));\
;

#define _releaseLock_assign_stmt_766_c_macro_ __declare_static_bit_vector(konst_764,3);\
bit_vector_clear(&konst_764);\
konst_764.val.byte_array[0] = 6;\
__declare_static_bit_vector(EQ_u3_u1_765,1);\
bit_vector_clear(&konst_764);\
konst_764.val.byte_array[0] = 6;\
bit_vector_equal(0, &(sel), &(konst_764), &(EQ_u3_u1_765));\
bit_vector_cast_to_bit_vector(0, &(s6), &(EQ_u3_u1_765));\
;

#define _releaseLock_assign_stmt_771_c_macro_ __declare_static_bit_vector(konst_769,3);\
bit_vector_clear(&konst_769);\
konst_769.val.byte_array[0] = 7;\
__declare_static_bit_vector(EQ_u3_u1_770,1);\
bit_vector_clear(&konst_769);\
konst_769.val.byte_array[0] = 7;\
bit_vector_equal(0, &(sel), &(konst_769), &(EQ_u3_u1_770));\
bit_vector_cast_to_bit_vector(0, &(s7), &(EQ_u3_u1_770));\
;

#define _releaseLock_assign_stmt_828_c_macro_ __declare_static_bit_vector(konst_774,1);\
bit_vector_clear(&konst_774);\
konst_774.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_775,1);\
bit_vector_clear(&type_cast_775);\
type_cast_775.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_776,1);\
bit_vector_clear(&konst_776);\
__declare_static_bit_vector(type_cast_777,1);\
bit_vector_clear(&type_cast_777);\
__declare_static_bit_vector(MUX_778,1);\
__declare_static_bit_vector(konst_780,1);\
bit_vector_clear(&konst_780);\
konst_780.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_781,1);\
bit_vector_clear(&type_cast_781);\
type_cast_781.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_782,1);\
bit_vector_clear(&konst_782);\
__declare_static_bit_vector(type_cast_783,1);\
bit_vector_clear(&type_cast_783);\
__declare_static_bit_vector(MUX_784,1);\
__declare_static_bit_vector(CONCAT_u1_u2_785,2);\
__declare_static_bit_vector(konst_787,1);\
bit_vector_clear(&konst_787);\
konst_787.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_788,1);\
bit_vector_clear(&type_cast_788);\
type_cast_788.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_789,1);\
bit_vector_clear(&konst_789);\
__declare_static_bit_vector(type_cast_790,1);\
bit_vector_clear(&type_cast_790);\
__declare_static_bit_vector(MUX_791,1);\
__declare_static_bit_vector(konst_793,1);\
bit_vector_clear(&konst_793);\
konst_793.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_794,1);\
bit_vector_clear(&type_cast_794);\
type_cast_794.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_795,1);\
bit_vector_clear(&konst_795);\
__declare_static_bit_vector(type_cast_796,1);\
bit_vector_clear(&type_cast_796);\
__declare_static_bit_vector(MUX_797,1);\
__declare_static_bit_vector(CONCAT_u1_u2_798,2);\
__declare_static_bit_vector(CONCAT_u2_u4_799,4);\
__declare_static_bit_vector(konst_801,1);\
bit_vector_clear(&konst_801);\
konst_801.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_802,1);\
bit_vector_clear(&type_cast_802);\
type_cast_802.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_803,1);\
bit_vector_clear(&konst_803);\
__declare_static_bit_vector(type_cast_804,1);\
bit_vector_clear(&type_cast_804);\
__declare_static_bit_vector(MUX_805,1);\
__declare_static_bit_vector(konst_807,1);\
bit_vector_clear(&konst_807);\
konst_807.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_808,1);\
bit_vector_clear(&type_cast_808);\
type_cast_808.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_809,1);\
bit_vector_clear(&konst_809);\
__declare_static_bit_vector(type_cast_810,1);\
bit_vector_clear(&type_cast_810);\
__declare_static_bit_vector(MUX_811,1);\
__declare_static_bit_vector(CONCAT_u1_u2_812,2);\
__declare_static_bit_vector(konst_814,1);\
bit_vector_clear(&konst_814);\
konst_814.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_815,1);\
bit_vector_clear(&type_cast_815);\
type_cast_815.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_816,1);\
bit_vector_clear(&konst_816);\
__declare_static_bit_vector(type_cast_817,1);\
bit_vector_clear(&type_cast_817);\
__declare_static_bit_vector(MUX_818,1);\
__declare_static_bit_vector(konst_820,1);\
bit_vector_clear(&konst_820);\
konst_820.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_821,1);\
bit_vector_clear(&type_cast_821);\
type_cast_821.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_822,1);\
bit_vector_clear(&konst_822);\
__declare_static_bit_vector(type_cast_823,1);\
bit_vector_clear(&type_cast_823);\
__declare_static_bit_vector(MUX_824,1);\
__declare_static_bit_vector(CONCAT_u1_u2_825,2);\
__declare_static_bit_vector(CONCAT_u2_u4_826,4);\
__declare_static_bit_vector(CONCAT_u4_u8_827,8);\
if (has_undefined_bit(&s0)) {fprintf(stderr, "Error: variable s0 has undefined value (%s) at test point.\n", to_string(&s0));assert(0);} \
if(bit_vector_to_uint64(0, &s0)){bit_vector_clear(&konst_774);\
konst_774.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_775), &(konst_774));\
bit_vector_cast_to_bit_vector(0, &(MUX_778), &(type_cast_775));\
}else {bit_vector_clear(&konst_776);\
bit_vector_bitcast_to_bit_vector( &(type_cast_777), &(konst_776));\
bit_vector_cast_to_bit_vector(0, &(MUX_778), &(type_cast_777));\
}if (has_undefined_bit(&s1)) {fprintf(stderr, "Error: variable s1 has undefined value (%s) at test point.\n", to_string(&s1));assert(0);} \
if(bit_vector_to_uint64(0, &s1)){bit_vector_clear(&konst_780);\
konst_780.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_781), &(konst_780));\
bit_vector_cast_to_bit_vector(0, &(MUX_784), &(type_cast_781));\
}else {bit_vector_clear(&konst_782);\
bit_vector_bitcast_to_bit_vector( &(type_cast_783), &(konst_782));\
bit_vector_cast_to_bit_vector(0, &(MUX_784), &(type_cast_783));\
}bit_vector_concatenate( &(MUX_778), &(MUX_784), &(CONCAT_u1_u2_785));\
if (has_undefined_bit(&s2)) {fprintf(stderr, "Error: variable s2 has undefined value (%s) at test point.\n", to_string(&s2));assert(0);} \
if(bit_vector_to_uint64(0, &s2)){bit_vector_clear(&konst_787);\
konst_787.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_788), &(konst_787));\
bit_vector_cast_to_bit_vector(0, &(MUX_791), &(type_cast_788));\
}else {bit_vector_clear(&konst_789);\
bit_vector_bitcast_to_bit_vector( &(type_cast_790), &(konst_789));\
bit_vector_cast_to_bit_vector(0, &(MUX_791), &(type_cast_790));\
}if (has_undefined_bit(&s3)) {fprintf(stderr, "Error: variable s3 has undefined value (%s) at test point.\n", to_string(&s3));assert(0);} \
if(bit_vector_to_uint64(0, &s3)){bit_vector_clear(&konst_793);\
konst_793.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_794), &(konst_793));\
bit_vector_cast_to_bit_vector(0, &(MUX_797), &(type_cast_794));\
}else {bit_vector_clear(&konst_795);\
bit_vector_bitcast_to_bit_vector( &(type_cast_796), &(konst_795));\
bit_vector_cast_to_bit_vector(0, &(MUX_797), &(type_cast_796));\
}bit_vector_concatenate( &(MUX_791), &(MUX_797), &(CONCAT_u1_u2_798));\
bit_vector_concatenate( &(CONCAT_u1_u2_785), &(CONCAT_u1_u2_798), &(CONCAT_u2_u4_799));\
if (has_undefined_bit(&s4)) {fprintf(stderr, "Error: variable s4 has undefined value (%s) at test point.\n", to_string(&s4));assert(0);} \
if(bit_vector_to_uint64(0, &s4)){bit_vector_clear(&konst_801);\
konst_801.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_802), &(konst_801));\
bit_vector_cast_to_bit_vector(0, &(MUX_805), &(type_cast_802));\
}else {bit_vector_clear(&konst_803);\
bit_vector_bitcast_to_bit_vector( &(type_cast_804), &(konst_803));\
bit_vector_cast_to_bit_vector(0, &(MUX_805), &(type_cast_804));\
}if (has_undefined_bit(&s5)) {fprintf(stderr, "Error: variable s5 has undefined value (%s) at test point.\n", to_string(&s5));assert(0);} \
if(bit_vector_to_uint64(0, &s5)){bit_vector_clear(&konst_807);\
konst_807.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_808), &(konst_807));\
bit_vector_cast_to_bit_vector(0, &(MUX_811), &(type_cast_808));\
}else {bit_vector_clear(&konst_809);\
bit_vector_bitcast_to_bit_vector( &(type_cast_810), &(konst_809));\
bit_vector_cast_to_bit_vector(0, &(MUX_811), &(type_cast_810));\
}bit_vector_concatenate( &(MUX_805), &(MUX_811), &(CONCAT_u1_u2_812));\
if (has_undefined_bit(&s6)) {fprintf(stderr, "Error: variable s6 has undefined value (%s) at test point.\n", to_string(&s6));assert(0);} \
if(bit_vector_to_uint64(0, &s6)){bit_vector_clear(&konst_814);\
konst_814.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_815), &(konst_814));\
bit_vector_cast_to_bit_vector(0, &(MUX_818), &(type_cast_815));\
}else {bit_vector_clear(&konst_816);\
bit_vector_bitcast_to_bit_vector( &(type_cast_817), &(konst_816));\
bit_vector_cast_to_bit_vector(0, &(MUX_818), &(type_cast_817));\
}if (has_undefined_bit(&s7)) {fprintf(stderr, "Error: variable s7 has undefined value (%s) at test point.\n", to_string(&s7));assert(0);} \
if(bit_vector_to_uint64(0, &s7)){bit_vector_clear(&konst_820);\
konst_820.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_821), &(konst_820));\
bit_vector_cast_to_bit_vector(0, &(MUX_824), &(type_cast_821));\
}else {bit_vector_clear(&konst_822);\
bit_vector_bitcast_to_bit_vector( &(type_cast_823), &(konst_822));\
bit_vector_cast_to_bit_vector(0, &(MUX_824), &(type_cast_823));\
}bit_vector_concatenate( &(MUX_818), &(MUX_824), &(CONCAT_u1_u2_825));\
bit_vector_concatenate( &(CONCAT_u1_u2_812), &(CONCAT_u1_u2_825), &(CONCAT_u2_u4_826));\
bit_vector_concatenate( &(CONCAT_u2_u4_799), &(CONCAT_u2_u4_826), &(CONCAT_u4_u8_827));\
bit_vector_cast_to_bit_vector(0, &(new_bmask), &(CONCAT_u4_u8_827));\
;

#define _releaseLock_call_stmt_841_c_macro_ __declare_static_bit_vector(konst_829,1);\
bit_vector_clear(&konst_829);\
konst_829.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_830,1);\
bit_vector_clear(&type_cast_830);\
type_cast_830.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_831,1);\
bit_vector_clear(&konst_831);\
__declare_static_bit_vector(type_cast_832,1);\
bit_vector_clear(&type_cast_832);\
__declare_static_bit_vector(konst_834,4);\
bit_vector_clear(&konst_834);\
__declare_static_bit_vector(type_cast_835,4);\
bit_vector_clear(&type_cast_835);\
__declare_static_bit_vector(CONCAT_u4_u36_837,36);\
__declare_static_bit_vector(konst_838,64);\
bit_vector_clear(&konst_838);\
__declare_static_bit_vector(type_cast_839,64);\
bit_vector_clear(&type_cast_839);\
bit_vector_clear(&konst_829);\
konst_829.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_830), &(konst_829));\
bit_vector_clear(&konst_831);\
bit_vector_bitcast_to_bit_vector( &(type_cast_832), &(konst_831));\
bit_vector_clear(&konst_834);\
bit_vector_bitcast_to_bit_vector( &(type_cast_835), &(konst_834));\
bit_vector_concatenate( &(type_cast_835), &(lock_addr_32), &(CONCAT_u4_u36_837));\
bit_vector_clear(&konst_838);\
bit_vector_bitcast_to_bit_vector( &(type_cast_839), &(konst_838));\
_accessMemory_( &(type_cast_830),  &(type_cast_832),  &(new_bmask),  &(CONCAT_u4_u36_837),  &(type_cast_839), &(ignore));\
;

#define _releaseLock_inner_outarg_prep_macro__ ;

#define _setQueueElement_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(write_index,32);\
bit_vector_cast_to_bit_vector(0, &(write_index), &((*__pwrite_index)));\
__declare_static_bit_vector(q_w_data,32);\
bit_vector_cast_to_bit_vector(0, &(q_w_data), &((*__pq_w_data)));\
__declare_static_bit_vector(buffer_address,36);\
__declare_static_bit_vector(element_pair_address,36);\
__declare_static_bit_vector(bmask,8);\
__declare_static_bit_vector(wval,64);\
__declare_static_bit_vector(ignore,64);\

#define _setQueueElement_assign_stmt_1089_c_macro_ __declare_static_bit_vector(konst_1086,36);\
bit_vector_clear(&konst_1086);\
konst_1086.val.byte_array[0] = 24;\
__declare_static_bit_vector(type_cast_1087,36);\
bit_vector_clear(&type_cast_1087);\
type_cast_1087.val.byte_array[0] = 24;\
__declare_static_bit_vector(ADD_u36_u36_1088,36);\
bit_vector_clear(&konst_1086);\
konst_1086.val.byte_array[0] = 24;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1087), &(konst_1086));\
bit_vector_plus( &(q_base_address), &(type_cast_1087), &(ADD_u36_u36_1088));\
bit_vector_cast_to_bit_vector(0, &(buffer_address), &(ADD_u36_u36_1088));\
;

#define _setQueueElement_assign_stmt_1099_c_macro_ __declare_static_bit_vector(slice_1093,31);\
__declare_static_bit_vector(konst_1094,3);\
bit_vector_clear(&konst_1094);\
__declare_static_bit_vector(type_cast_1095,3);\
bit_vector_clear(&type_cast_1095);\
__declare_static_bit_vector(CONCAT_u31_u34_1096,34);\
__declare_static_bit_vector(type_cast_1097,36);\
__declare_static_bit_vector(ADD_u36_u36_1098,36);\
bit_vector_slice(&(write_index), &(slice_1093), 1);\
bit_vector_clear(&konst_1094);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1095), &(konst_1094));\
bit_vector_concatenate( &(slice_1093), &(type_cast_1095), &(CONCAT_u31_u34_1096));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1097), &(CONCAT_u31_u34_1096));\
bit_vector_plus( &(buffer_address), &(type_cast_1097), &(ADD_u36_u36_1098));\
bit_vector_cast_to_bit_vector(0, &(element_pair_address), &(ADD_u36_u36_1098));\
;

#define _setQueueElement_assign_stmt_1117_c_macro_ __declare_static_bit_vector(konst_1102,32);\
bit_vector_clear(&konst_1102);\
__declare_static_bit_vector(BITSEL_u32_u1_1103,1);\
__declare_static_bit_vector(konst_1104,4);\
bit_vector_clear(&konst_1104);\
__declare_static_bit_vector(type_cast_1105,4);\
bit_vector_clear(&type_cast_1105);\
__declare_static_bit_vector(konst_1106,4);\
bit_vector_clear(&konst_1106);\
__declare_static_bit_vector(type_cast_1107,4);\
bit_vector_clear(&type_cast_1107);\
__declare_static_bit_vector(NOT_u4_u4_1108,4);\
bit_vector_clear(&NOT_u4_u4_1108);\
NOT_u4_u4_1108.val.byte_array[0] = 255;\
__declare_static_bit_vector(CONCAT_u4_u8_1109,8);\
bit_vector_clear(&CONCAT_u4_u8_1109);\
CONCAT_u4_u8_1109.val.byte_array[0] = 15;\
__declare_static_bit_vector(konst_1110,4);\
bit_vector_clear(&konst_1110);\
__declare_static_bit_vector(type_cast_1111,4);\
bit_vector_clear(&type_cast_1111);\
__declare_static_bit_vector(NOT_u4_u4_1112,4);\
bit_vector_clear(&NOT_u4_u4_1112);\
NOT_u4_u4_1112.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_1113,4);\
bit_vector_clear(&konst_1113);\
__declare_static_bit_vector(type_cast_1114,4);\
bit_vector_clear(&type_cast_1114);\
__declare_static_bit_vector(CONCAT_u4_u8_1115,8);\
bit_vector_clear(&CONCAT_u4_u8_1115);\
CONCAT_u4_u8_1115.val.byte_array[0] = 240;\
__declare_static_bit_vector(MUX_1116,8);\
bit_vector_clear(&konst_1102);\
bit_vector_bitsel( &(write_index), &(konst_1102), &(BITSEL_u32_u1_1103));\
if (has_undefined_bit(&BITSEL_u32_u1_1103)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1103 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1103));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_1103)){bit_vector_clear(&konst_1104);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1105), &(konst_1104));\
bit_vector_clear(&konst_1106);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1107), &(konst_1106));\
bit_vector_not( &(type_cast_1107), &(NOT_u4_u4_1108));\
bit_vector_concatenate( &(type_cast_1105), &(NOT_u4_u4_1108), &(CONCAT_u4_u8_1109));\
bit_vector_cast_to_bit_vector(0, &(MUX_1116), &(CONCAT_u4_u8_1109));\
}else {bit_vector_clear(&konst_1110);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1111), &(konst_1110));\
bit_vector_not( &(type_cast_1111), &(NOT_u4_u4_1112));\
bit_vector_clear(&konst_1113);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1114), &(konst_1113));\
bit_vector_concatenate( &(NOT_u4_u4_1112), &(type_cast_1114), &(CONCAT_u4_u8_1115));\
bit_vector_cast_to_bit_vector(0, &(MUX_1116), &(CONCAT_u4_u8_1115));\
}bit_vector_cast_to_bit_vector(0, &(bmask), &(MUX_1116));\
;

#define _setQueueElement_assign_stmt_1131_c_macro_ __declare_static_bit_vector(konst_1120,32);\
bit_vector_clear(&konst_1120);\
__declare_static_bit_vector(BITSEL_u32_u1_1121,1);\
__declare_static_bit_vector(konst_1122,32);\
bit_vector_clear(&konst_1122);\
__declare_static_bit_vector(type_cast_1123,32);\
bit_vector_clear(&type_cast_1123);\
__declare_static_bit_vector(CONCAT_u32_u64_1125,64);\
__declare_static_bit_vector(konst_1127,32);\
bit_vector_clear(&konst_1127);\
__declare_static_bit_vector(type_cast_1128,32);\
bit_vector_clear(&type_cast_1128);\
__declare_static_bit_vector(CONCAT_u32_u64_1129,64);\
__declare_static_bit_vector(MUX_1130,64);\
bit_vector_clear(&konst_1120);\
bit_vector_bitsel( &(write_index), &(konst_1120), &(BITSEL_u32_u1_1121));\
if (has_undefined_bit(&BITSEL_u32_u1_1121)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_1121 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_1121));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_1121)){bit_vector_clear(&konst_1122);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1123), &(konst_1122));\
bit_vector_concatenate( &(type_cast_1123), &(q_w_data), &(CONCAT_u32_u64_1125));\
bit_vector_cast_to_bit_vector(0, &(MUX_1130), &(CONCAT_u32_u64_1125));\
}else {bit_vector_clear(&konst_1127);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1128), &(konst_1127));\
bit_vector_concatenate( &(q_w_data), &(type_cast_1128), &(CONCAT_u32_u64_1129));\
bit_vector_cast_to_bit_vector(0, &(MUX_1130), &(CONCAT_u32_u64_1129));\
}bit_vector_cast_to_bit_vector(0, &(wval), &(MUX_1130));\
;

#define _setQueueElement_stmt_1136_c_macro_ uint32_t _setQueueElement_stmt_1136_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]setQueueElement>\t%s\n",_setQueueElement_stmt_1136_c_macro___print_counter,"addresses");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_1136_c_macro___print_counter,"element_pair_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(element_pair_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_1136_c_macro___print_counter,"q_w_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_w_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_1136_c_macro___print_counter,"bmask");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(bmask)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_1136_c_macro___print_counter,"wval");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wval)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _setQueueElement_call_stmt_1145_c_macro_ __declare_static_bit_vector(konst_1137,1);\
bit_vector_clear(&konst_1137);\
__declare_static_bit_vector(type_cast_1138,1);\
bit_vector_clear(&type_cast_1138);\
__declare_static_bit_vector(konst_1139,1);\
bit_vector_clear(&konst_1139);\
__declare_static_bit_vector(type_cast_1140,1);\
bit_vector_clear(&type_cast_1140);\
bit_vector_clear(&konst_1137);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1138), &(konst_1137));\
bit_vector_clear(&konst_1139);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1140), &(konst_1139));\
_accessMemory_( &(type_cast_1138),  &(type_cast_1140),  &(bmask),  &(element_pair_address),  &(wval), &(ignore));\
;

#define _setQueueElement_inner_outarg_prep_macro__ ;

#define _setQueuePointers_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(wp,32);\
bit_vector_cast_to_bit_vector(0, &(wp), &((*__pwp)));\
__declare_static_bit_vector(rp,32);\
bit_vector_cast_to_bit_vector(0, &(rp), &((*__prp)));\
__declare_static_bit_vector(ignore,64);\

#define _setQueuePointers_stmt_687_c_macro_ uint32_t _setQueuePointers_stmt_687_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]setQueuePointers>\t%s\n",_setQueuePointers_stmt_687_c_macro___print_counter,"set");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueuePointers>\t\t%s\t\t",_setQueuePointers_stmt_687_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueuePointers>\t\t%s\t\t",_setQueuePointers_stmt_687_c_macro___print_counter,"wp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wp)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueuePointers>\t\t%s\t\t",_setQueuePointers_stmt_687_c_macro___print_counter,"rp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rp)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _setQueuePointers_call_stmt_702_c_macro_ __declare_static_bit_vector(konst_688,1);\
bit_vector_clear(&konst_688);\
__declare_static_bit_vector(type_cast_689,1);\
bit_vector_clear(&type_cast_689);\
__declare_static_bit_vector(konst_690,1);\
bit_vector_clear(&konst_690);\
__declare_static_bit_vector(type_cast_691,1);\
bit_vector_clear(&type_cast_691);\
__declare_static_bit_vector(konst_692,8);\
bit_vector_clear(&konst_692);\
__declare_static_bit_vector(type_cast_693,8);\
bit_vector_clear(&type_cast_693);\
__declare_static_bit_vector(NOT_u8_u8_694,8);\
bit_vector_clear(&NOT_u8_u8_694);\
NOT_u8_u8_694.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_696,36);\
bit_vector_clear(&konst_696);\
konst_696.val.byte_array[0] = 4;\
__declare_static_bit_vector(ADD_u36_u36_697,36);\
__declare_static_bit_vector(CONCAT_u32_u64_700,64);\
bit_vector_clear(&konst_688);\
bit_vector_bitcast_to_bit_vector( &(type_cast_689), &(konst_688));\
bit_vector_clear(&konst_690);\
bit_vector_bitcast_to_bit_vector( &(type_cast_691), &(konst_690));\
bit_vector_clear(&konst_692);\
bit_vector_bitcast_to_bit_vector( &(type_cast_693), &(konst_692));\
bit_vector_not( &(type_cast_693), &(NOT_u8_u8_694));\
bit_vector_clear(&konst_696);\
konst_696.val.byte_array[0] = 4;\
bit_vector_plus( &(q_base_address), &(konst_696), &(ADD_u36_u36_697));\
bit_vector_concatenate( &(rp), &(wp), &(CONCAT_u32_u64_700));\
_accessMemory_( &(type_cast_689),  &(type_cast_691),  &(NOT_u8_u8_694),  &(ADD_u36_u36_697),  &(CONCAT_u32_u64_700), &(ignore));\
;

#define _setQueuePointers_inner_outarg_prep_macro__ ;

#define _transmitEngineDaemon_inner_inarg_prep_macro__ 
#define _transmitEngineDaemon_assign_stmt_2072_c_macro_ __declare_static_bit_vector(konst_2071,6);\
bit_vector_clear(&konst_2071);\
bit_vector_clear(&konst_2071);\
write_bit_vector_to_pipe("LAST_READ_TX_QUEUE_INDEX",&(konst_2071));\
;

#define _transmitEngineDaemon_branch_block_stmt_2073_c_export_decl_macro_ __declare_static_bit_vector(tx_q_index,6);\
__declare_static_bit_vector(count,32);\
__declare_static_bit_vector(pkt_pointer,32);\
__declare_static_bit_vector(tx_flag,1);\
__declare_static_bit_vector(transmitted_flag,1);\
__declare_static_bit_vector(push_pointer_back_to_free_Q,1);\
__declare_static_bit_vector(push_status,1);\
__declare_static_bit_vector(ignore_resp,32);\
__declare_static_bit_vector(ncount,32);\


#define _transmitEngineDaemon_merge_stmt_2074_c_preamble_macro_ uint8_t merge_stmt_2074_entry_flag;\
merge_stmt_2074_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_2073_flag = 0;\
uint8_t disable_loopback_2073_flag = 0;\
goto merge_stmt_2074_run;\
not_enabled_yet_loopback_2073: not_enabled_yet_loopback_2073_flag = 1;\
disable_loopback_2073_flag = 0;\
goto merge_stmt_2074_run;\
disable_loopback_2073: disable_loopback_2073_flag = 1;\
not_enabled_yet_loopback_2073_flag = 0;\
goto merge_stmt_2074_run;\
merge_stmt_2074_run: ;\
;

#define _transmitEngineDaemon_merge_stmt_2074_c_postamble_macro_ not_enabled_yet_loopback_2073_flag = 0;\
disable_loopback_2073_flag = 0;\
merge_stmt_2074_entry_flag = 0;

#define _transmitEngineDaemon_stmt_2082_c_macro_ uint32_t _transmitEngineDaemon_stmt_2082_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2082_c_macro___print_counter,"got_control");release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_merge_stmt_2084_c_preamble_macro_ uint8_t merge_stmt_2084_entry_flag;\
merge_stmt_2084_entry_flag = do_while_entry_flag;\
goto merge_stmt_2084_run;\
merge_stmt_2084_run: ;\

#define _transmitEngineDaemon_phi_stmt_2085_c_macro_ __declare_static_bit_vector(RPIPE_LAST_READ_TX_QUEUE_INDEX_2087,6);\
__declare_static_bit_vector(konst_2088,6);\
bit_vector_clear(&konst_2088);\
konst_2088.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_2089,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_2090,32);\
__declare_static_bit_vector(konst_2091,32);\
bit_vector_clear(&konst_2091);\
konst_2091.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_2092,32);\
__declare_static_bit_vector(type_cast_2093,6);\
__declare_static_bit_vector(AND_u6_u6_2094,6);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("LAST_READ_TX_QUEUE_INDEX",&(RPIPE_LAST_READ_TX_QUEUE_INDEX_2087));\
bit_vector_clear(&konst_2088);\
konst_2088.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_READ_TX_QUEUE_INDEX_2087), &(konst_2088), &(ADD_u6_u6_2089));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_2090));\
bit_vector_clear(&konst_2091);\
konst_2091.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_2090), &(konst_2091), &(SUB_u32_u32_2092));\
bit_vector_bitcast_to_bit_vector( &(type_cast_2093), &(SUB_u32_u32_2092));\
bit_vector_and(&(ADD_u6_u6_2089), &(type_cast_2093), &(AND_u6_u6_2094));\
bit_vector_cast_to_bit_vector(0, &(tx_q_index), &(AND_u6_u6_2094));\
}\
else {\
__declare_static_bit_vector(RPIPE_LAST_READ_TX_QUEUE_INDEX_2087,6);\
__declare_static_bit_vector(konst_2088,6);\
bit_vector_clear(&konst_2088);\
konst_2088.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_2089,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_2090,32);\
__declare_static_bit_vector(konst_2091,32);\
bit_vector_clear(&konst_2091);\
konst_2091.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_2092,32);\
__declare_static_bit_vector(type_cast_2093,6);\
__declare_static_bit_vector(AND_u6_u6_2094,6);\
read_bit_vector_from_pipe("LAST_READ_TX_QUEUE_INDEX",&(RPIPE_LAST_READ_TX_QUEUE_INDEX_2087));\
bit_vector_clear(&konst_2088);\
konst_2088.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_READ_TX_QUEUE_INDEX_2087), &(konst_2088), &(ADD_u6_u6_2089));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_2090));\
bit_vector_clear(&konst_2091);\
konst_2091.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_2090), &(konst_2091), &(SUB_u32_u32_2092));\
bit_vector_bitcast_to_bit_vector( &(type_cast_2093), &(SUB_u32_u32_2092));\
bit_vector_and(&(ADD_u6_u6_2089), &(type_cast_2093), &(AND_u6_u6_2094));\
bit_vector_cast_to_bit_vector(0, &(tx_q_index), &(AND_u6_u6_2094));\
}\
;

#define _transmitEngineDaemon_phi_stmt_2095_c_macro_ __declare_static_bit_vector(konst_2097,32);\
bit_vector_clear(&konst_2097);\
konst_2097.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_2098,32);\
bit_vector_clear(&type_cast_2098);\
type_cast_2098.val.byte_array[0] = 1;\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(count), &(ncount));\
}\
else {\
__declare_static_bit_vector(konst_2097,32);\
bit_vector_clear(&konst_2097);\
konst_2097.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_2098,32);\
bit_vector_clear(&type_cast_2098);\
type_cast_2098.val.byte_array[0] = 1;\
bit_vector_clear(&konst_2097);\
konst_2097.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_2098), &(konst_2097));\
bit_vector_cast_to_bit_vector(0, &(count), &(type_cast_2098));\
}\
;
;

#define _transmitEngineDaemon_merge_stmt_2084_c_postamble_macro_ merge_stmt_2084_entry_flag = 0;

#define _transmitEngineDaemon_stmt_2102_c_macro_ uint32_t _transmitEngineDaemon_stmt_2102_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2102_c_macro___print_counter,"trying_to_get_pointer_from_tx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2102_c_macro___print_counter,"tx_q_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(tx_q_index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_call_stmt_2106_c_macro_ _getTxPacketPointerFromServer_( &(tx_q_index), &(pkt_pointer), &(tx_flag));\
;

#define _transmitEngineDaemon_call_stmt_2110_c_macro_ if (has_undefined_bit(&tx_flag)) {fprintf(stderr, "Error: variable tx_flag has undefined value (%s) at test point.\n", to_string(&tx_flag));assert(0);} \
if (!bit_vector_to_uint64(0, &tx_flag)) {\
_transmitPacket_( &(pkt_pointer), &(transmitted_flag));\
}\
;

#define _transmitEngineDaemon_stmt_2114_c_macro_ if (!bit_vector_to_uint64(0, &tx_flag)) {\
uint32_t _transmitEngineDaemon_stmt_2114_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2114_c_macro___print_counter,"got_pointer_now_transmitting_packet");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2114_c_macro___print_counter,"pkt_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(pkt_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2114_c_macro___print_counter,"tx_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(tx_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);};

#define _transmitEngineDaemon_stmt_2117_c_macro_ if (!bit_vector_to_uint64(0, &tx_flag)) {\
uint32_t _transmitEngineDaemon_stmt_2117_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2117_c_macro___print_counter,"packet_transmitted");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2117_c_macro___print_counter,"transmitted_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(transmitted_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);};

#define _transmitEngineDaemon_assign_stmt_2123_c_macro_ __declare_static_bit_vector(NOT_u1_u1_2120,1);\
__declare_static_bit_vector(AND_u1_u1_2122,1);\
bit_vector_not( &(tx_flag), &(NOT_u1_u1_2120));\
bit_vector_and(&(NOT_u1_u1_2120), &(transmitted_flag), &(AND_u1_u1_2122));\
bit_vector_cast_to_bit_vector(0, &(push_pointer_back_to_free_Q), &(AND_u1_u1_2122));\
;

#define _transmitEngineDaemon_stmt_2126_c_macro_ uint32_t _transmitEngineDaemon_stmt_2126_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2126_c_macro___print_counter,"pushing_back_to_free_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2126_c_macro___print_counter,"push_pointer_back_to_free_Q");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(push_pointer_back_to_free_Q)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2126_c_macro___print_counter,"pkt_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(pkt_pointer)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_call_stmt_2133_c_macro_ if (has_undefined_bit(&push_pointer_back_to_free_Q)) {fprintf(stderr, "Error: variable push_pointer_back_to_free_Q has undefined value (%s) at test point.\n", to_string(&push_pointer_back_to_free_Q));assert(0);} \
__declare_static_bit_vector(konst_2128,1);\
bit_vector_clear(&konst_2128);\
konst_2128.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_2129,1);\
bit_vector_clear(&type_cast_2129);\
type_cast_2129.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_2130,36);\
if (bit_vector_to_uint64(0, &push_pointer_back_to_free_Q)) {\
bit_vector_clear(&konst_2128);\
konst_2128.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_2129), &(konst_2128));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_2130));\
_pushIntoQueue_( &(type_cast_2129),  &(RPIPE_FREE_Q_2130),  &(pkt_pointer), &(push_status));\
}\
;

#define _transmitEngineDaemon_stmt_2136_c_macro_ if (bit_vector_to_uint64(0, &push_pointer_back_to_free_Q)) {\
uint32_t _transmitEngineDaemon_stmt_2136_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2136_c_macro___print_counter,"writing_count_to_reg_21");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2136_c_macro___print_counter,"count");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(count)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);};

#define _transmitEngineDaemon_call_stmt_2146_c_macro_ if (has_undefined_bit(&push_pointer_back_to_free_Q)) {fprintf(stderr, "Error: variable push_pointer_back_to_free_Q has undefined value (%s) at test point.\n", to_string(&push_pointer_back_to_free_Q));assert(0);} \
__declare_static_bit_vector(konst_2138,1);\
bit_vector_clear(&konst_2138);\
__declare_static_bit_vector(type_cast_2139,1);\
bit_vector_clear(&type_cast_2139);\
__declare_static_bit_vector(konst_2140,4);\
bit_vector_clear(&konst_2140);\
__declare_static_bit_vector(type_cast_2141,4);\
bit_vector_clear(&type_cast_2141);\
__declare_static_bit_vector(NOT_u4_u4_2142,4);\
bit_vector_clear(&NOT_u4_u4_2142);\
NOT_u4_u4_2142.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_2143,6);\
bit_vector_clear(&konst_2143);\
konst_2143.val.byte_array[0] = 21;\
if (bit_vector_to_uint64(0, &push_pointer_back_to_free_Q)) {\
bit_vector_clear(&konst_2138);\
bit_vector_bitcast_to_bit_vector( &(type_cast_2139), &(konst_2138));\
bit_vector_clear(&konst_2140);\
bit_vector_bitcast_to_bit_vector( &(type_cast_2141), &(konst_2140));\
bit_vector_not( &(type_cast_2141), &(NOT_u4_u4_2142));\
bit_vector_clear(&konst_2143);\
konst_2143.val.byte_array[0] = 21;\
_AccessRegister_( &(type_cast_2139),  &(NOT_u4_u4_2142),  &(konst_2143),  &(count), &(ignore_resp));\
}\
;

#define _transmitEngineDaemon_assign_stmt_2154_c_macro_ __declare_static_bit_vector(konst_2150,32);\
bit_vector_clear(&konst_2150);\
konst_2150.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_2151,32);\
__declare_static_bit_vector(MUX_2153,32);\
if (has_undefined_bit(&push_pointer_back_to_free_Q)) {fprintf(stderr, "Error: variable push_pointer_back_to_free_Q has undefined value (%s) at test point.\n", to_string(&push_pointer_back_to_free_Q));assert(0);} \
if(bit_vector_to_uint64(0, &push_pointer_back_to_free_Q)){bit_vector_clear(&konst_2150);\
konst_2150.val.byte_array[0] = 1;\
bit_vector_plus( &(count), &(konst_2150), &(ADD_u32_u32_2151));\
bit_vector_cast_to_bit_vector(0, &(MUX_2153), &(ADD_u32_u32_2151));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_2153), &(count));\
}bit_vector_cast_to_bit_vector(0, &(ncount), &(MUX_2153));\
;

#define _transmitEngineDaemon_stmt_2156_c_macro_ uint32_t _transmitEngineDaemon_stmt_2156_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_2156_c_macro___print_counter,"pushed_back_to_free_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_2156_c_macro___print_counter,"push_status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(push_status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_assign_stmt_2159_c_macro_ write_bit_vector_to_pipe("LAST_READ_TX_QUEUE_INDEX",&(tx_q_index));\
;
;

#define _transmitEngineDaemon_branch_block_stmt_2073_c_export_apply_macro_ ;

#define _transmitEngineDaemon_inner_outarg_prep_macro__ ;

#define _transmitEngineDaemon_outer_arg_decl_macro__ ;

#define _transmitEngineDaemon_outer_op_xfer_macro__ ;

#define _transmitPacket_inner_inarg_prep_macro__ __declare_static_bit_vector(packet_pointer,32);\
bit_vector_cast_to_bit_vector(0, &(packet_pointer), &((*__ppacket_pointer)));\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(control_data_addr,36);\
__declare_static_bit_vector(control_data,64);\
__declare_static_bit_vector(unused,44);\
__declare_static_bit_vector(packet_size,8);\
__declare_static_bit_vector(last_tkeep,8);\

#define _transmitPacket_assign_stmt_1950_c_macro_ __declare_static_bit_vector(slice_1945,32);\
__declare_static_bit_vector(konst_1946,4);\
bit_vector_clear(&konst_1946);\
__declare_static_bit_vector(type_cast_1947,4);\
bit_vector_clear(&type_cast_1947);\
__declare_static_bit_vector(CONCAT_u32_u36_1948,36);\
__declare_static_bit_vector(type_cast_1949,36);\
bit_vector_slice(&(packet_pointer), &(slice_1945), 0);\
bit_vector_clear(&konst_1946);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1947), &(konst_1946));\
bit_vector_concatenate( &(slice_1945), &(type_cast_1947), &(CONCAT_u32_u36_1948));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1949), &(CONCAT_u32_u36_1948));\
bit_vector_cast_to_bit_vector(0, &(control_data_addr), &(type_cast_1949));\
;

#define _transmitPacket_stmt_1953_c_macro_ uint32_t _transmitPacket_stmt_1953_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1953_c_macro___print_counter,"control_data_addr_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1953_c_macro___print_counter,"packet_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1953_c_macro___print_counter,"control_data_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(control_data_addr)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_call_stmt_1963_c_macro_ __declare_static_bit_vector(konst_1954,1);\
bit_vector_clear(&konst_1954);\
__declare_static_bit_vector(type_cast_1955,1);\
bit_vector_clear(&type_cast_1955);\
__declare_static_bit_vector(konst_1956,1);\
bit_vector_clear(&konst_1956);\
konst_1956.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1957,1);\
bit_vector_clear(&type_cast_1957);\
type_cast_1957.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1960,64);\
bit_vector_clear(&konst_1960);\
__declare_static_bit_vector(type_cast_1961,64);\
bit_vector_clear(&type_cast_1961);\
bit_vector_clear(&konst_1954);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1955), &(konst_1954));\
bit_vector_clear(&konst_1956);\
konst_1956.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1957), &(konst_1956));\
bit_vector_clear(&konst_1960);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1961), &(konst_1960));\
_accessMemory_( &(type_cast_1955),  &(type_cast_1957),  &(FULL_BYTE_MASK),  &(control_data_addr),  &(type_cast_1961), &(control_data));\
;

#define _transmitPacket_assign_stmt_1968_c_macro_ __declare_static_bit_vector(slice_1967,44);\
bit_vector_slice(&(control_data), &(slice_1967), 16);\
bit_vector_cast_to_bit_vector(0, &(unused), &(slice_1967));\
;

#define _transmitPacket_assign_stmt_1972_c_macro_ __declare_static_bit_vector(slice_1971,8);\
bit_vector_slice(&(control_data), &(slice_1971), 8);\
bit_vector_cast_to_bit_vector(0, &(packet_size), &(slice_1971));\
;

#define _transmitPacket_assign_stmt_1976_c_macro_ __declare_static_bit_vector(slice_1975,8);\
bit_vector_slice(&(control_data), &(slice_1975), 0);\
bit_vector_cast_to_bit_vector(0, &(last_tkeep), &(slice_1975));\
;

#define _transmitPacket_stmt_1979_c_macro_ uint32_t _transmitPacket_stmt_1979_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1979_c_macro___print_counter,"control_data_received_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1979_c_macro___print_counter,"packet_size");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_size)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1979_c_macro___print_counter,"last_tkeep");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(last_tkeep)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_branch_block_stmt_1980_c_export_decl_macro_ __declare_static_bit_vector(count_down,8);\
__declare_static_bit_vector(mem_addr,36);\
__declare_static_bit_vector(data,64);\
__declare_static_bit_vector(ncount_down,8);\
__declare_static_bit_vector(nmem_addr,36);\
__declare_static_bit_vector(not_last_word,1);\
__declare_static_bit_vector(last_word,64);\


#define _transmitPacket_merge_stmt_1982_c_preamble_macro_ uint8_t merge_stmt_1982_entry_flag;\
merge_stmt_1982_entry_flag = do_while_entry_flag;\
goto merge_stmt_1982_run;\
merge_stmt_1982_run: ;\

#define _transmitPacket_phi_stmt_1983_c_macro_ __declare_static_bit_vector(konst_1986,8);\
bit_vector_clear(&konst_1986);\
konst_1986.val.byte_array[0] = 16;\
__declare_static_bit_vector(SUB_u8_u8_1987,8);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(count_down), &(ncount_down));\
}\
else {\
__declare_static_bit_vector(konst_1986,8);\
bit_vector_clear(&konst_1986);\
konst_1986.val.byte_array[0] = 16;\
__declare_static_bit_vector(SUB_u8_u8_1987,8);\
bit_vector_clear(&konst_1986);\
konst_1986.val.byte_array[0] = 16;\
bit_vector_minus( &(packet_size), &(konst_1986), &(SUB_u8_u8_1987));\
bit_vector_cast_to_bit_vector(0, &(count_down), &(SUB_u8_u8_1987));\
}\
;

#define _transmitPacket_phi_stmt_1989_c_macro_ __declare_static_bit_vector(konst_1992,36);\
bit_vector_clear(&konst_1992);\
konst_1992.val.byte_array[0] = 24;\
__declare_static_bit_vector(ADD_u36_u36_1993,36);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(mem_addr), &(nmem_addr));\
}\
else {\
__declare_static_bit_vector(konst_1992,36);\
bit_vector_clear(&konst_1992);\
konst_1992.val.byte_array[0] = 24;\
__declare_static_bit_vector(ADD_u36_u36_1993,36);\
bit_vector_clear(&konst_1992);\
konst_1992.val.byte_array[0] = 24;\
bit_vector_plus( &(control_data_addr), &(konst_1992), &(ADD_u36_u36_1993));\
bit_vector_cast_to_bit_vector(0, &(mem_addr), &(ADD_u36_u36_1993));\
}\
;
;

#define _transmitPacket_merge_stmt_1982_c_postamble_macro_ merge_stmt_1982_entry_flag = 0;

#define _transmitPacket_call_stmt_2005_c_macro_ __declare_static_bit_vector(konst_1996,1);\
bit_vector_clear(&konst_1996);\
__declare_static_bit_vector(type_cast_1997,1);\
bit_vector_clear(&type_cast_1997);\
__declare_static_bit_vector(konst_1998,1);\
bit_vector_clear(&konst_1998);\
konst_1998.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1999,1);\
bit_vector_clear(&type_cast_1999);\
type_cast_1999.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_2002,64);\
bit_vector_clear(&konst_2002);\
__declare_static_bit_vector(type_cast_2003,64);\
bit_vector_clear(&type_cast_2003);\
bit_vector_clear(&konst_1996);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1997), &(konst_1996));\
bit_vector_clear(&konst_1998);\
konst_1998.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1999), &(konst_1998));\
bit_vector_clear(&konst_2002);\
bit_vector_bitcast_to_bit_vector( &(type_cast_2003), &(konst_2002));\
_accessMemory_( &(type_cast_1997),  &(type_cast_1999),  &(FULL_BYTE_MASK),  &(mem_addr),  &(type_cast_2003), &(data));\
;

#define _transmitPacket_assign_stmt_2013_c_macro_ __declare_static_bit_vector(konst_2007,1);\
bit_vector_clear(&konst_2007);\
__declare_static_bit_vector(type_cast_2008,1);\
bit_vector_clear(&type_cast_2008);\
__declare_static_bit_vector(CONCAT_u1_u65_2010,65);\
__declare_static_bit_vector(CONCAT_u65_u73_2012,73);\
bit_vector_clear(&konst_2007);\
bit_vector_bitcast_to_bit_vector( &(type_cast_2008), &(konst_2007));\
bit_vector_concatenate( &(type_cast_2008), &(data), &(CONCAT_u1_u65_2010));\
bit_vector_concatenate( &(CONCAT_u1_u65_2010), &(FULL_BYTE_MASK), &(CONCAT_u65_u73_2012));\
write_bit_vector_to_pipe("nic_to_mac_transmit_pipe",&(CONCAT_u65_u73_2012));\
;

#define _transmitPacket_assign_stmt_2018_c_macro_ __declare_static_bit_vector(konst_2016,8);\
bit_vector_clear(&konst_2016);\
konst_2016.val.byte_array[0] = 8;\
__declare_static_bit_vector(SUB_u8_u8_2017,8);\
bit_vector_clear(&konst_2016);\
konst_2016.val.byte_array[0] = 8;\
bit_vector_minus( &(count_down), &(konst_2016), &(SUB_u8_u8_2017));\
bit_vector_cast_to_bit_vector(0, &(ncount_down), &(SUB_u8_u8_2017));\
;

#define _transmitPacket_assign_stmt_2023_c_macro_ __declare_static_bit_vector(konst_2021,36);\
bit_vector_clear(&konst_2021);\
konst_2021.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_2022,36);\
bit_vector_clear(&konst_2021);\
konst_2021.val.byte_array[0] = 8;\
bit_vector_plus( &(mem_addr), &(konst_2021), &(ADD_u36_u36_2022));\
bit_vector_cast_to_bit_vector(0, &(nmem_addr), &(ADD_u36_u36_2022));\
;

#define _transmitPacket_stmt_2029_c_macro_ uint32_t _transmitPacket_stmt_2029_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_2029_c_macro___print_counter,"count_down_");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2029_c_macro___print_counter,"data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2029_c_macro___print_counter,"count_down");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(count_down)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2029_c_macro___print_counter,"ncount_down");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ncount_down)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2029_c_macro___print_counter,"mem_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(mem_addr)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2029_c_macro___print_counter,"nmem_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nmem_addr)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_assign_stmt_2034_c_macro_ __declare_static_bit_vector(konst_2032,8);\
bit_vector_clear(&konst_2032);\
konst_2032.val.byte_array[0] = 8;\
__declare_static_bit_vector(UGT_u8_u1_2033,1);\
bit_vector_clear(&konst_2032);\
konst_2032.val.byte_array[0] = 8;\
bit_vector_greater(0, &(ncount_down), &(konst_2032), &(UGT_u8_u1_2033));\
bit_vector_cast_to_bit_vector(0, &(not_last_word), &(UGT_u8_u1_2033));\
;

#define _transmitPacket_stmt_2038_c_macro_ uint32_t _transmitPacket_stmt_2038_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_2038_c_macro___print_counter,"accessing_last_word");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2038_c_macro___print_counter,"nmem_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nmem_addr)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_call_stmt_2048_c_macro_ __declare_static_bit_vector(konst_2039,1);\
bit_vector_clear(&konst_2039);\
__declare_static_bit_vector(type_cast_2040,1);\
bit_vector_clear(&type_cast_2040);\
__declare_static_bit_vector(konst_2041,1);\
bit_vector_clear(&konst_2041);\
konst_2041.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_2042,1);\
bit_vector_clear(&type_cast_2042);\
type_cast_2042.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_2045,64);\
bit_vector_clear(&konst_2045);\
__declare_static_bit_vector(type_cast_2046,64);\
bit_vector_clear(&type_cast_2046);\
bit_vector_clear(&konst_2039);\
bit_vector_bitcast_to_bit_vector( &(type_cast_2040), &(konst_2039));\
bit_vector_clear(&konst_2041);\
konst_2041.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_2042), &(konst_2041));\
bit_vector_clear(&konst_2045);\
bit_vector_bitcast_to_bit_vector( &(type_cast_2046), &(konst_2045));\
_accessMemory_( &(type_cast_2040),  &(type_cast_2042),  &(FULL_BYTE_MASK),  &(nmem_addr),  &(type_cast_2046), &(last_word));\
;

#define _transmitPacket_stmt_2050_c_macro_ uint32_t _transmitPacket_stmt_2050_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_2050_c_macro___print_counter,"sending_last_word");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_2050_c_macro___print_counter,"last_word");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(last_word)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_assign_stmt_2058_c_macro_ __declare_static_bit_vector(konst_2052,1);\
bit_vector_clear(&konst_2052);\
konst_2052.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_2053,1);\
bit_vector_clear(&type_cast_2053);\
type_cast_2053.val.byte_array[0] = 1;\
__declare_static_bit_vector(CONCAT_u1_u65_2055,65);\
__declare_static_bit_vector(CONCAT_u65_u73_2057,73);\
bit_vector_clear(&konst_2052);\
konst_2052.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_2053), &(konst_2052));\
bit_vector_concatenate( &(type_cast_2053), &(last_word), &(CONCAT_u1_u65_2055));\
bit_vector_concatenate( &(CONCAT_u1_u65_2055), &(last_tkeep), &(CONCAT_u65_u73_2057));\
write_bit_vector_to_pipe("nic_to_mac_transmit_pipe",&(CONCAT_u65_u73_2057));\
;

#define _transmitPacket_assign_stmt_2066_c_macro_ __declare_static_bit_vector(SUB_u36_u36_2063,36);\
__declare_static_bit_vector(type_cast_2064,8);\
__declare_static_bit_vector(EQ_u8_u1_2065,1);\
bit_vector_minus( &(nmem_addr), &(control_data_addr), &(SUB_u36_u36_2063));\
bit_vector_bitcast_to_bit_vector( &(type_cast_2064), &(SUB_u36_u36_2063));\
bit_vector_equal(0, &(packet_size), &(type_cast_2064), &(EQ_u8_u1_2065));\
bit_vector_cast_to_bit_vector(0, &(status), &(EQ_u8_u1_2065));\
;
;

#define _transmitPacket_branch_block_stmt_1980_c_export_apply_macro_ ;

#define _transmitPacket_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _writeControlInformationToMem_inner_inarg_prep_macro__ __declare_static_bit_vector(base_buffer_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(base_buffer_pointer), &((*__pbase_buffer_pointer)));\
__declare_static_bit_vector(packet_size,8);\
bit_vector_cast_to_bit_vector(0, &(packet_size), &((*__ppacket_size)));\
__declare_static_bit_vector(last_keep,8);\
bit_vector_cast_to_bit_vector(0, &(last_keep), &((*__plast_keep)));\
__declare_static_bit_vector(control_data,64);\
__declare_static_bit_vector(ignore_return,64);\

#define _writeControlInformationToMem_assign_stmt_1051_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_1049,16);\
__declare_static_bit_vector(type_cast_1050,64);\
bit_vector_concatenate( &(packet_size), &(last_keep), &(CONCAT_u8_u16_1049));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1050), &(CONCAT_u8_u16_1049));\
bit_vector_cast_to_bit_vector(0, &(control_data), &(type_cast_1050));\
;

#define _writeControlInformationToMem_call_stmt_1060_c_macro_ __declare_static_bit_vector(konst_1052,1);\
bit_vector_clear(&konst_1052);\
__declare_static_bit_vector(type_cast_1053,1);\
bit_vector_clear(&type_cast_1053);\
__declare_static_bit_vector(konst_1054,1);\
bit_vector_clear(&konst_1054);\
__declare_static_bit_vector(type_cast_1055,1);\
bit_vector_clear(&type_cast_1055);\
bit_vector_clear(&konst_1052);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1053), &(konst_1052));\
bit_vector_clear(&konst_1054);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1055), &(konst_1054));\
_accessMemory_( &(type_cast_1053),  &(type_cast_1055),  &(FULL_BYTE_MASK),  &(base_buffer_pointer),  &(control_data), &(ignore_return));\
;

#define _writeControlInformationToMem_inner_outarg_prep_macro__ ;

#define _writeEthernetHeaderToMem_inner_inarg_prep_macro__ __declare_static_bit_vector(buf_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(buf_pointer), &((*__pbuf_pointer)));\
__declare_static_bit_vector(buf_position,36);\

#define _writeEthernetHeaderToMem_branch_block_stmt_908_c_export_decl_macro_ __declare_static_bit_vector(I,4);\
__declare_static_bit_vector(ethernet_header,73);\
__declare_static_bit_vector(last_bit,1);\
__declare_static_bit_vector(wdata,64);\
__declare_static_bit_vector(wkeep,8);\
__declare_static_bit_vector(ignore_return,64);\
__declare_static_bit_vector(nI,4);\
__declare_static_bit_vector(nbuf_position,36);\


#define _writeEthernetHeaderToMem_merge_stmt_910_c_preamble_macro_ uint8_t merge_stmt_910_entry_flag;\
merge_stmt_910_entry_flag = do_while_entry_flag;\
goto merge_stmt_910_run;\
merge_stmt_910_run: ;\

#define _writeEthernetHeaderToMem_phi_stmt_911_c_macro_ __declare_static_bit_vector(konst_914,36);\
bit_vector_clear(&konst_914);\
konst_914.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_915,36);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(nbuf_position));\
}\
else {\
__declare_static_bit_vector(konst_914,36);\
bit_vector_clear(&konst_914);\
konst_914.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_915,36);\
bit_vector_clear(&konst_914);\
konst_914.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_pointer), &(konst_914), &(ADD_u36_u36_915));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_915));\
}\
;

#define _writeEthernetHeaderToMem_phi_stmt_917_c_macro_ __declare_static_bit_vector(konst_919,4);\
bit_vector_clear(&konst_919);\
__declare_static_bit_vector(type_cast_920,4);\
bit_vector_clear(&type_cast_920);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(I), &(nI));\
}\
else {\
__declare_static_bit_vector(konst_919,4);\
bit_vector_clear(&konst_919);\
__declare_static_bit_vector(type_cast_920,4);\
bit_vector_clear(&type_cast_920);\
bit_vector_clear(&konst_919);\
bit_vector_bitcast_to_bit_vector( &(type_cast_920), &(konst_919));\
bit_vector_cast_to_bit_vector(0, &(I), &(type_cast_920));\
}\
;

#define _writeEthernetHeaderToMem_phi_stmt_922_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_header_924,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_924));\
bit_vector_cast_to_bit_vector(0, &(ethernet_header), &(RPIPE_nic_rx_to_header_924));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_header_924,73);\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_924));\
bit_vector_cast_to_bit_vector(0, &(ethernet_header), &(RPIPE_nic_rx_to_header_924));\
}\
;
;

#define _writeEthernetHeaderToMem_merge_stmt_910_c_postamble_macro_ merge_stmt_910_entry_flag = 0;

#define _writeEthernetHeaderToMem_stmt_928_c_macro_ uint32_t _writeEthernetHeaderToMem_stmt_928_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t%s\n",_writeEthernetHeaderToMem_stmt_928_c_macro___print_counter,"received_eth_header_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t\t%s\t\t",_writeEthernetHeaderToMem_stmt_928_c_macro___print_counter,"ethernet_header");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ethernet_header)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t\t%s\t\t",_writeEthernetHeaderToMem_stmt_928_c_macro___print_counter,"buf_position");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(buf_position)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writeEthernetHeaderToMem_assign_stmt_932_c_macro_ __declare_static_bit_vector(slice_931,1);\
bit_vector_slice(&(ethernet_header), &(slice_931), 72);\
bit_vector_cast_to_bit_vector(0, &(last_bit), &(slice_931));\
;

#define _writeEthernetHeaderToMem_assign_stmt_936_c_macro_ __declare_static_bit_vector(slice_935,64);\
bit_vector_slice(&(ethernet_header), &(slice_935), 8);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_935));\
;

#define _writeEthernetHeaderToMem_assign_stmt_940_c_macro_ __declare_static_bit_vector(slice_939,8);\
bit_vector_slice(&(ethernet_header), &(slice_939), 0);\
bit_vector_cast_to_bit_vector(0, &(wkeep), &(slice_939));\
;

#define _writeEthernetHeaderToMem_call_stmt_949_c_macro_ __declare_static_bit_vector(konst_941,1);\
bit_vector_clear(&konst_941);\
__declare_static_bit_vector(type_cast_942,1);\
bit_vector_clear(&type_cast_942);\
__declare_static_bit_vector(konst_943,1);\
bit_vector_clear(&konst_943);\
__declare_static_bit_vector(type_cast_944,1);\
bit_vector_clear(&type_cast_944);\
bit_vector_clear(&konst_941);\
bit_vector_bitcast_to_bit_vector( &(type_cast_942), &(konst_941));\
bit_vector_clear(&konst_943);\
bit_vector_bitcast_to_bit_vector( &(type_cast_944), &(konst_943));\
_accessMemory_( &(type_cast_942),  &(type_cast_944),  &(wkeep),  &(buf_position),  &(wdata), &(ignore_return));\
;

#define _writeEthernetHeaderToMem_assign_stmt_954_c_macro_ __declare_static_bit_vector(konst_952,4);\
bit_vector_clear(&konst_952);\
konst_952.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u4_u4_953,4);\
bit_vector_clear(&konst_952);\
konst_952.val.byte_array[0] = 1;\
bit_vector_plus( &(I), &(konst_952), &(ADD_u4_u4_953));\
bit_vector_cast_to_bit_vector(0, &(nI), &(ADD_u4_u4_953));\
;

#define _writeEthernetHeaderToMem_assign_stmt_959_c_macro_ __declare_static_bit_vector(konst_957,36);\
bit_vector_clear(&konst_957);\
konst_957.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_958,36);\
bit_vector_clear(&konst_957);\
konst_957.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_position), &(konst_957), &(ADD_u36_u36_958));\
bit_vector_cast_to_bit_vector(0, &(nbuf_position), &(ADD_u36_u36_958));\
;
;

#define _writeEthernetHeaderToMem_branch_block_stmt_908_c_export_apply_macro_ ;

#define _writeEthernetHeaderToMem_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pbuf_position)), &(buf_position));\
;

#define _writePayloadToMem_inner_inarg_prep_macro__ __declare_static_bit_vector(base_buf_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(base_buf_pointer), &((*__pbase_buf_pointer)));\
__declare_static_bit_vector(buf_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(buf_pointer), &((*__pbuf_pointer)));\
__declare_static_bit_vector(packet_size_32,8);\
__declare_static_bit_vector(bad_packet_identifier,1);\
__declare_static_bit_vector(last_keep,8);\
__declare_static_bit_vector(packet_size_8,8);\

#define _writePayloadToMem_branch_block_stmt_972_c_export_decl_macro_ __declare_static_bit_vector(buf_position__buf_position,36);\
__declare_static_bit_vector(tdata__wdata,64);\
__declare_static_bit_vector(tkeep__wkeep,8);\
__declare_static_bit_vector(buf_position,36);\
__declare_static_bit_vector(payload_data,73);\
__declare_static_bit_vector(last_bit,1);\
__declare_static_bit_vector(wdata,64);\
__declare_static_bit_vector(wkeep,8);\
__declare_static_bit_vector(ignore_return,64);\


#define _writePayloadToMem_merge_stmt_974_c_preamble_macro_ uint8_t merge_stmt_974_entry_flag;\
merge_stmt_974_entry_flag = do_while_entry_flag;\
goto merge_stmt_974_run;\
merge_stmt_974_run: ;\

#define _writePayloadToMem_phi_stmt_975_c_macro_ __declare_static_bit_vector(konst_978,36);\
bit_vector_clear(&konst_978);\
konst_978.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_979,36);\
__declare_static_bit_vector(konst_981,36);\
bit_vector_clear(&konst_981);\
konst_981.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_982,36);\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_981);\
konst_981.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_position), &(konst_981), &(ADD_u36_u36_982));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_982));\
}\
else {\
__declare_static_bit_vector(konst_978,36);\
bit_vector_clear(&konst_978);\
konst_978.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_979,36);\
bit_vector_clear(&konst_978);\
konst_978.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_pointer), &(konst_978), &(ADD_u36_u36_979));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_979));\
}\
;

#define _writePayloadToMem_phi_stmt_983_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_packet_985,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_985));\
bit_vector_cast_to_bit_vector(0, &(payload_data), &(RPIPE_nic_rx_to_packet_985));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_packet_985,73);\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_985));\
bit_vector_cast_to_bit_vector(0, &(payload_data), &(RPIPE_nic_rx_to_packet_985));\
}\
;
;

#define _writePayloadToMem_merge_stmt_974_c_postamble_macro_ merge_stmt_974_entry_flag = 0;

#define _writePayloadToMem_assign_stmt_990_c_macro_ __declare_static_bit_vector(slice_989,1);\
bit_vector_slice(&(payload_data), &(slice_989), 72);\
bit_vector_cast_to_bit_vector(0, &(last_bit), &(slice_989));\
;

#define _writePayloadToMem_assign_stmt_994_c_macro_ __declare_static_bit_vector(slice_993,64);\
bit_vector_slice(&(payload_data), &(slice_993), 8);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_993));\
;

#define _writePayloadToMem_assign_stmt_998_c_macro_ __declare_static_bit_vector(slice_997,8);\
bit_vector_slice(&(payload_data), &(slice_997), 0);\
bit_vector_cast_to_bit_vector(0, &(wkeep), &(slice_997));\
;

#define _writePayloadToMem_stmt_1003_c_macro_ uint32_t _writePayloadToMem_stmt_1003_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writePayloadToMem>\t%s\n",_writePayloadToMem_stmt_1003_c_macro___print_counter,"writing_payload_to_mem");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_1003_c_macro___print_counter,"last_bit");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(last_bit)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_1003_c_macro___print_counter,"wdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wdata)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_1003_c_macro___print_counter,"wkeep");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wkeep)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_1003_c_macro___print_counter,"buf_position");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(buf_position)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writePayloadToMem_call_stmt_1012_c_macro_ __declare_static_bit_vector(konst_1004,1);\
bit_vector_clear(&konst_1004);\
__declare_static_bit_vector(type_cast_1005,1);\
bit_vector_clear(&type_cast_1005);\
__declare_static_bit_vector(konst_1006,1);\
bit_vector_clear(&konst_1006);\
__declare_static_bit_vector(type_cast_1007,1);\
bit_vector_clear(&type_cast_1007);\
bit_vector_clear(&konst_1004);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1005), &(konst_1004));\
bit_vector_clear(&konst_1006);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1007), &(konst_1006));\
_accessMemory_( &(type_cast_1005),  &(type_cast_1007),  &(wkeep),  &(buf_position),  &(wdata), &(ignore_return));\
;
;

#define _writePayloadToMem_branch_block_stmt_972_c_export_apply_macro_ bit_vector_cast_to_bit_vector(0, &(buf_position__buf_position), &(buf_position));\
bit_vector_cast_to_bit_vector(0, &(tdata__wdata), &(wdata));\
bit_vector_cast_to_bit_vector(0, &(tkeep__wkeep), &(wkeep));\
;

#define _writePayloadToMem_assign_stmt_1025_c_macro_ __declare_static_bit_vector(EQ_u64_u1_1020,1);\
__declare_static_bit_vector(konst_1022,8);\
bit_vector_clear(&konst_1022);\
__declare_static_bit_vector(EQ_u8_u1_1023,1);\
__declare_static_bit_vector(AND_u1_u1_1024,1);\
bit_vector_equal(0, &(tdata__wdata), &(BAD_PACKET_DATA), &(EQ_u64_u1_1020));\
bit_vector_clear(&konst_1022);\
bit_vector_equal(0, &(tkeep__wkeep), &(konst_1022), &(EQ_u8_u1_1023));\
bit_vector_and(&(EQ_u64_u1_1020), &(EQ_u8_u1_1023), &(AND_u1_u1_1024));\
bit_vector_cast_to_bit_vector(0, &(bad_packet_identifier), &(AND_u1_u1_1024));\
;

#define _writePayloadToMem_assign_stmt_1031_c_macro_ __declare_static_bit_vector(SUB_u36_u36_1029,36);\
__declare_static_bit_vector(type_cast_1030,8);\
bit_vector_minus( &(buf_position__buf_position), &(base_buf_pointer), &(SUB_u36_u36_1029));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1030), &(SUB_u36_u36_1029));\
bit_vector_cast_to_bit_vector(0, &(packet_size_8), &(type_cast_1030));\
;

#define _writePayloadToMem_assign_stmt_1034_c_macro_ bit_vector_cast_to_bit_vector(0, &(packet_size_32), &(packet_size_8));\
;

#define _writePayloadToMem_stmt_1037_c_macro_ uint32_t _writePayloadToMem_stmt_1037_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writePayloadToMem>\t%s\n",_writePayloadToMem_stmt_1037_c_macro___print_counter,"packet_size_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_1037_c_macro___print_counter,"packet_size_8");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_size_8)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_1037_c_macro___print_counter,"packet_size_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_size_32)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writePayloadToMem_assign_stmt_1040_c_macro_ bit_vector_cast_to_bit_vector(0, &(last_keep), &(tkeep__wkeep));\
;

#define _writePayloadToMem_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__ppacket_size_32)), &(packet_size_32));\
bit_vector_cast_to_bit_vector(0, &((*__pbad_packet_identifier)), &(bad_packet_identifier));\
bit_vector_cast_to_bit_vector(0, &((*__plast_keep)), &(last_keep));\
;

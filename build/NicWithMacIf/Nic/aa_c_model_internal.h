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

#define _AccessRegister_stmt_84_c_macro_ uint32_t _AccessRegister_stmt_84_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_84_c_macro___print_counter,"In_Access_Register");release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_93_c_macro_ __declare_static_bit_vector(CONCAT_u1_u5_88,5);\
__declare_static_bit_vector(CONCAT_u6_u38_91,38);\
__declare_static_bit_vector(CONCAT_u5_u43_92,43);\
bit_vector_concatenate( &(rwbar), &(bmask), &(CONCAT_u1_u5_88));\
bit_vector_concatenate( &(register_index), &(wdata), &(CONCAT_u6_u38_91));\
bit_vector_concatenate( &(CONCAT_u1_u5_88), &(CONCAT_u6_u38_91), &(CONCAT_u5_u43_92));\
bit_vector_cast_to_bit_vector(0, &(request), &(CONCAT_u5_u43_92));\
;

#define _AccessRegister_stmt_98_c_macro_ uint32_t _AccessRegister_stmt_98_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_98_c_macro___print_counter,"Request");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_98_c_macro___print_counter,"rwbar");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rwbar)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_98_c_macro___print_counter,"bmask");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(bmask)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_98_c_macro___print_counter,"register_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(register_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_98_c_macro___print_counter,"wdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_101_c_macro_ write_bit_vector_to_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE",&(request));\
;

#define _AccessRegister_stmt_102_c_macro_ uint32_t _AccessRegister_stmt_102_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_102_c_macro___print_counter,"Request_Sent");release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_105_c_macro_ __declare_static_bit_vector(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_104,33);\
read_bit_vector_from_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE",&(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_104));\
bit_vector_cast_to_bit_vector(0, &(response), &(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_104));\
;

#define _AccessRegister_stmt_107_c_macro_ uint32_t _AccessRegister_stmt_107_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]AccessRegister>\t%s\n",_AccessRegister_stmt_107_c_macro___print_counter,"Response");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]AccessRegister>\t\t%s\t\t",_AccessRegister_stmt_107_c_macro___print_counter,"response");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(response)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _AccessRegister_assign_stmt_111_c_macro_ __declare_static_bit_vector(slice_110,1);\
bit_vector_slice(&(response), &(slice_110), 32);\
bit_vector_cast_to_bit_vector(0, &(status), &(slice_110));\
;

#define _AccessRegister_assign_stmt_115_c_macro_ __declare_static_bit_vector(slice_114,32);\
bit_vector_slice(&(response), &(slice_114), 0);\
bit_vector_cast_to_bit_vector(0, &(rdata), &(slice_114));\
;

#define _AccessRegister_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__prdata)), &(rdata));\
;

#define _NicRegisterAccessDaemon_inner_inarg_prep_macro__ 
#define _NicRegisterAccessDaemon_branch_block_stmt_198_c_export_decl_macro_ __declare_static_bit_vector(req,43);\
__declare_static_bit_vector(rwbar,1);\
__declare_static_bit_vector(bmask,4);\
__declare_static_bit_vector(index,6);\
__declare_static_bit_vector(wdata,32);\
__declare_static_bit_vector(rval,32);\
__declare_static_bit_vector(wval,32);\
__declare_static_bit_vector(rdata,32);\
__declare_static_bit_vector(resp,33);\


#define _NicRegisterAccessDaemon_merge_stmt_200_c_preamble_macro_ uint8_t merge_stmt_200_entry_flag;\
merge_stmt_200_entry_flag = do_while_entry_flag;\
goto merge_stmt_200_run;\
merge_stmt_200_run: ;\
;

#define _NicRegisterAccessDaemon_merge_stmt_200_c_postamble_macro_ merge_stmt_200_entry_flag = 0;

#define _NicRegisterAccessDaemon_assign_stmt_203_c_macro_ __declare_static_bit_vector(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_202,43);\
read_bit_vector_from_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE",&(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_202));\
bit_vector_cast_to_bit_vector(0, &(req), &(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_202));\
;

#define _NicRegisterAccessDaemon_stmt_204_c_macro_ uint32_t _NicRegisterAccessDaemon_stmt_204_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t%s\n",_NicRegisterAccessDaemon_stmt_204_c_macro___print_counter,"Request_Received");release_file_print_lock(__report_log_file__);;

#define _NicRegisterAccessDaemon_assign_stmt_208_c_macro_ __declare_static_bit_vector(slice_207,1);\
bit_vector_slice(&(req), &(slice_207), 42);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_207));\
;

#define _NicRegisterAccessDaemon_assign_stmt_212_c_macro_ __declare_static_bit_vector(slice_211,4);\
bit_vector_slice(&(req), &(slice_211), 38);\
bit_vector_cast_to_bit_vector(0, &(bmask), &(slice_211));\
;

#define _NicRegisterAccessDaemon_assign_stmt_216_c_macro_ __declare_static_bit_vector(slice_215,6);\
bit_vector_slice(&(req), &(slice_215), 32);\
bit_vector_cast_to_bit_vector(0, &(index), &(slice_215));\
;

#define _NicRegisterAccessDaemon_assign_stmt_220_c_macro_ __declare_static_bit_vector(slice_219,32);\
bit_vector_slice(&(req), &(slice_219), 0);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_219));\
;

#define _NicRegisterAccessDaemon_assign_stmt_224_c_macro_ bit_vector_cast_to_bit_vector(0, &(rval), &((nic_registers[bit_vector_to_uint64(0, &index)])));\
;

#define _NicRegisterAccessDaemon_stmt_227_c_macro_ uint32_t _NicRegisterAccessDaemon_stmt_227_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t%s\n",_NicRegisterAccessDaemon_stmt_227_c_macro___print_counter,"Request");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t\t%s\t\t",_NicRegisterAccessDaemon_stmt_227_c_macro___print_counter,"rval");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rval)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]NicRegisterAccessDaemon>\t\t%s\t\t",_NicRegisterAccessDaemon_stmt_227_c_macro___print_counter,"index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _NicRegisterAccessDaemon_call_stmt_234_c_macro_ if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if (!bit_vector_to_uint64(0, &rwbar)) {\
_UpdateRegister_( &(bmask),  &(rval),  &(wdata),  &(index), &(wval));\
}\
;

#define _NicRegisterAccessDaemon_assign_stmt_241_c_macro_ __declare_static_bit_vector(konst_238,32);\
bit_vector_clear(&konst_238);\
__declare_static_bit_vector(type_cast_239,32);\
bit_vector_clear(&type_cast_239);\
__declare_static_bit_vector(MUX_240,32);\
if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if(bit_vector_to_uint64(0, &rwbar)){bit_vector_cast_to_bit_vector(0, &(MUX_240), &(rval));\
}else {bit_vector_clear(&konst_238);\
bit_vector_bitcast_to_bit_vector( &(type_cast_239), &(konst_238));\
bit_vector_cast_to_bit_vector(0, &(MUX_240), &(type_cast_239));\
}bit_vector_cast_to_bit_vector(0, &(rdata), &(MUX_240));\
;

#define _NicRegisterAccessDaemon_assign_stmt_247_c_macro_ __declare_static_bit_vector(konst_243,1);\
bit_vector_clear(&konst_243);\
__declare_static_bit_vector(type_cast_244,1);\
bit_vector_clear(&type_cast_244);\
__declare_static_bit_vector(CONCAT_u1_u33_246,33);\
bit_vector_clear(&konst_243);\
bit_vector_bitcast_to_bit_vector( &(type_cast_244), &(konst_243));\
bit_vector_concatenate( &(type_cast_244), &(rdata), &(CONCAT_u1_u33_246));\
bit_vector_cast_to_bit_vector(0, &(resp), &(CONCAT_u1_u33_246));\
;

#define _NicRegisterAccessDaemon_assign_stmt_250_c_macro_ write_bit_vector_to_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE",&(resp));\
;
;

#define _NicRegisterAccessDaemon_branch_block_stmt_198_c_export_apply_macro_ ;

#define _NicRegisterAccessDaemon_inner_outarg_prep_macro__ ;

#define _NicRegisterAccessDaemon_outer_arg_decl_macro__ ;

#define _NicRegisterAccessDaemon_outer_op_xfer_macro__ ;

#define _ReceiveEngineDaemon_inner_inarg_prep_macro__ 
#define _ReceiveEngineDaemon_assign_stmt_954_c_macro_ __declare_static_bit_vector(konst_953,6);\
bit_vector_clear(&konst_953);\
bit_vector_clear(&konst_953);\
write_bit_vector_to_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(konst_953));\
;

#define _ReceiveEngineDaemon_branch_block_stmt_955_c_export_decl_macro_ __declare_static_bit_vector(rx_buffer_pointer_32,32);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(rx_buffer_pointer_36,36);\
__declare_static_bit_vector(bad_packet_identifier,1);\
__declare_static_bit_vector(ok_flag,1);\
__declare_static_bit_vector(free_flag,1);\
__declare_static_bit_vector(cond,1);\
__declare_static_bit_vector(push_status,1);\


#define _ReceiveEngineDaemon_stmt_956_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_956_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_956_c_macro___print_counter,"waiting_for_control");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_merge_stmt_957_c_preamble_macro_ uint8_t merge_stmt_957_entry_flag;\
merge_stmt_957_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_955_flag = 0;\
uint8_t disable_loopback_955_flag = 0;\
goto merge_stmt_957_run;\
not_enabled_yet_loopback_955: not_enabled_yet_loopback_955_flag = 1;\
disable_loopback_955_flag = 0;\
goto merge_stmt_957_run;\
disable_loopback_955: disable_loopback_955_flag = 1;\
not_enabled_yet_loopback_955_flag = 0;\
goto merge_stmt_957_run;\
merge_stmt_957_run: ;\
;

#define _ReceiveEngineDaemon_merge_stmt_957_c_postamble_macro_ not_enabled_yet_loopback_955_flag = 0;\
disable_loopback_955_flag = 0;\
merge_stmt_957_entry_flag = 0;

#define _ReceiveEngineDaemon_stmt_965_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_965_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_965_c_macro___print_counter,"got_the__control");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_merge_stmt_967_c_preamble_macro_ uint8_t merge_stmt_967_entry_flag;\
merge_stmt_967_entry_flag = do_while_entry_flag;\
goto merge_stmt_967_run;\
merge_stmt_967_run: ;\
;

#define _ReceiveEngineDaemon_merge_stmt_967_c_postamble_macro_ merge_stmt_967_entry_flag = 0;

#define _ReceiveEngineDaemon_stmt_968_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_968_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_968_c_macro___print_counter,"called_pop_From_queue");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_974_c_macro_ __declare_static_bit_vector(konst_969,1);\
bit_vector_clear(&konst_969);\
konst_969.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_970,1);\
bit_vector_clear(&type_cast_970);\
type_cast_970.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_971,36);\
bit_vector_clear(&konst_969);\
konst_969.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_970), &(konst_969));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_971));\
_popFromQueue_( &(type_cast_970),  &(RPIPE_FREE_Q_971), &(rx_buffer_pointer_32), &(status));\
;

#define _ReceiveEngineDaemon_stmt_976_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_976_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_976_c_macro___print_counter,"rx_buffer");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_976_c_macro___print_counter,"rx_buffer_pointer_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_buffer_pointer_32)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_assign_stmt_982_c_macro_ __declare_static_bit_vector(konst_979,4);\
bit_vector_clear(&konst_979);\
__declare_static_bit_vector(type_cast_980,4);\
bit_vector_clear(&type_cast_980);\
__declare_static_bit_vector(CONCAT_u32_u36_981,36);\
bit_vector_clear(&konst_979);\
bit_vector_bitcast_to_bit_vector( &(type_cast_980), &(konst_979));\
bit_vector_concatenate( &(rx_buffer_pointer_32), &(type_cast_980), &(CONCAT_u32_u36_981));\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer_36), &(CONCAT_u32_u36_981));\
;

#define _ReceiveEngineDaemon_stmt_984_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_984_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_984_c_macro___print_counter,"rx_buffer_val");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_984_c_macro___print_counter,"rx_buffer_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_buffer_pointer_36)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_stmt_986_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_986_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_986_c_macro___print_counter,"calling_loadBuffer");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_986_c_macro___print_counter,"status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_990_c_macro_ if (has_undefined_bit(&status)) {fprintf(stderr, "Error: variable status has undefined value (%s) at test point.\n", to_string(&status));assert(0);} \
if (!bit_vector_to_uint64(0, &status)) {\
_loadBuffer_( &(rx_buffer_pointer_36), &(bad_packet_identifier));\
}\
;

#define _ReceiveEngineDaemon_assign_stmt_997_c_macro_ __declare_static_bit_vector(NOT_u1_u1_993,1);\
__declare_static_bit_vector(NOT_u1_u1_995,1);\
__declare_static_bit_vector(AND_u1_u1_996,1);\
bit_vector_not( &(status), &(NOT_u1_u1_993));\
bit_vector_not( &(bad_packet_identifier), &(NOT_u1_u1_995));\
bit_vector_and(&(NOT_u1_u1_993), &(NOT_u1_u1_995), &(AND_u1_u1_996));\
bit_vector_cast_to_bit_vector(0, &(ok_flag), &(AND_u1_u1_996));\
;

#define _ReceiveEngineDaemon_assign_stmt_1003_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1000,1);\
__declare_static_bit_vector(AND_u1_u1_1002,1);\
bit_vector_not( &(status), &(NOT_u1_u1_1000));\
bit_vector_and(&(NOT_u1_u1_1000), &(bad_packet_identifier), &(AND_u1_u1_1002));\
bit_vector_cast_to_bit_vector(0, &(free_flag), &(AND_u1_u1_1002));\
;

#define _ReceiveEngineDaemon_assign_stmt_1008_c_macro_ __declare_static_bit_vector(konst_1006,1);\
bit_vector_clear(&konst_1006);\
konst_1006.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_1007,1);\
bit_vector_clear(&konst_1006);\
konst_1006.val.byte_array[0] = 1;\
bit_vector_equal(0, &(ok_flag), &(konst_1006), &(EQ_u1_u1_1007));\
bit_vector_cast_to_bit_vector(0, &(cond), &(EQ_u1_u1_1007));\
;

#define _ReceiveEngineDaemon_stmt_1011_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1011_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1011_c_macro___print_counter,"populating_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1011_c_macro___print_counter,"ok_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ok_flag)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1011_c_macro___print_counter,"cond");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(cond)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_stmt_1012_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1012_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1012_c_macro___print_counter,"running_ok_flag");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_1015_c_macro_ if (has_undefined_bit(&ok_flag)) {fprintf(stderr, "Error: variable ok_flag has undefined value (%s) at test point.\n", to_string(&ok_flag));assert(0);} \
if (bit_vector_to_uint64(0, &ok_flag)) {\
_populateRxQueue_( &(rx_buffer_pointer_36));\
}\
;

#define _ReceiveEngineDaemon_stmt_1017_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1017_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1017_c_macro___print_counter,"pushing_into_free_q");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_1017_c_macro___print_counter,"free_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(free_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_1025_c_macro_ if (has_undefined_bit(&free_flag)) {fprintf(stderr, "Error: variable free_flag has undefined value (%s) at test point.\n", to_string(&free_flag));assert(0);} \
__declare_static_bit_vector(konst_1019,1);\
bit_vector_clear(&konst_1019);\
konst_1019.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1020,1);\
bit_vector_clear(&type_cast_1020);\
type_cast_1020.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_1021,36);\
__declare_static_bit_vector(slice_1023,32);\
if (bit_vector_to_uint64(0, &free_flag)) {\
bit_vector_clear(&konst_1019);\
konst_1019.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1020), &(konst_1019));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_1021));\
bit_vector_slice(&(rx_buffer_pointer_36), &(slice_1023), 4);\
_pushIntoQueue_( &(type_cast_1020),  &(RPIPE_FREE_Q_1021),  &(slice_1023), &(push_status));\
}\
;

#define _ReceiveEngineDaemon_stmt_1026_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_1026_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_1026_c_macro___print_counter,"completed_iteration_in_receive_engine");release_file_print_lock(__report_log_file__);;
;

#define _ReceiveEngineDaemon_branch_block_stmt_955_c_export_apply_macro_ ;

#define _ReceiveEngineDaemon_inner_outarg_prep_macro__ ;

#define _ReceiveEngineDaemon_outer_arg_decl_macro__ ;

#define _ReceiveEngineDaemon_outer_op_xfer_macro__ ;

#define _SoftwareRegisterAccessDaemon_inner_inarg_prep_macro__ 
#define _SoftwareRegisterAccessDaemon_stmt_1035_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1035_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1035_c_macro___print_counter,"started_SoftwareRegisterAccessDaemon");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_branch_block_stmt_1036_c_export_decl_macro_ __declare_static_bit_vector(INIT,1);\
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


#define _SoftwareRegisterAccessDaemon_merge_stmt_1038_c_preamble_macro_ uint8_t merge_stmt_1038_entry_flag;\
merge_stmt_1038_entry_flag = do_while_entry_flag;\
goto merge_stmt_1038_run;\
merge_stmt_1038_run: ;\

#define _SoftwareRegisterAccessDaemon_phi_stmt_1039_c_macro_ __declare_static_bit_vector(konst_1041,1);\
bit_vector_clear(&konst_1041);\
__declare_static_bit_vector(type_cast_1042,1);\
bit_vector_clear(&type_cast_1042);\
__declare_static_bit_vector(konst_1043,1);\
bit_vector_clear(&konst_1043);\
konst_1043.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1044,1);\
bit_vector_clear(&type_cast_1044);\
type_cast_1044.val.byte_array[0] = 1;\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_1043);\
konst_1043.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1044), &(konst_1043));\
bit_vector_cast_to_bit_vector(0, &(INIT), &(type_cast_1044));\
}\
else {\
__declare_static_bit_vector(konst_1041,1);\
bit_vector_clear(&konst_1041);\
__declare_static_bit_vector(type_cast_1042,1);\
bit_vector_clear(&type_cast_1042);\
bit_vector_clear(&konst_1041);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1042), &(konst_1041));\
bit_vector_cast_to_bit_vector(0, &(INIT), &(type_cast_1042));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_1045_c_macro_ __declare_static_bit_vector(konst_1047,1);\
bit_vector_clear(&konst_1047);\
__declare_static_bit_vector(type_cast_1048,1);\
bit_vector_clear(&type_cast_1048);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(control_register), &(check_control_regsiter));\
}\
else {\
__declare_static_bit_vector(konst_1047,1);\
bit_vector_clear(&konst_1047);\
__declare_static_bit_vector(type_cast_1048,1);\
bit_vector_clear(&type_cast_1048);\
bit_vector_clear(&konst_1047);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1048), &(konst_1047));\
bit_vector_cast_to_bit_vector(0, &(control_register), &(type_cast_1048));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_1050_c_macro_ __declare_static_bit_vector(konst_1052,1);\
bit_vector_clear(&konst_1052);\
__declare_static_bit_vector(type_cast_1053,1);\
bit_vector_clear(&type_cast_1053);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(free_q), &(check_free_q));\
}\
else {\
__declare_static_bit_vector(konst_1052,1);\
bit_vector_clear(&konst_1052);\
__declare_static_bit_vector(type_cast_1053,1);\
bit_vector_clear(&type_cast_1053);\
bit_vector_clear(&konst_1052);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1053), &(konst_1052));\
bit_vector_cast_to_bit_vector(0, &(free_q), &(type_cast_1053));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_1055_c_macro_ __declare_static_bit_vector(konst_1057,1);\
bit_vector_clear(&konst_1057);\
__declare_static_bit_vector(type_cast_1058,1);\
bit_vector_clear(&type_cast_1058);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(num_server), &(check_num_server));\
}\
else {\
__declare_static_bit_vector(konst_1057,1);\
bit_vector_clear(&konst_1057);\
__declare_static_bit_vector(type_cast_1058,1);\
bit_vector_clear(&type_cast_1058);\
bit_vector_clear(&konst_1057);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1058), &(konst_1057));\
bit_vector_cast_to_bit_vector(0, &(num_server), &(type_cast_1058));\
}\
;
;

#define _SoftwareRegisterAccessDaemon_merge_stmt_1038_c_postamble_macro_ merge_stmt_1038_entry_flag = 0;

#define _SoftwareRegisterAccessDaemon_stmt_1061_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1061_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1061_c_macro___print_counter,"looping_in_SoftwareRegisterAccessDaemon");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1065_c_macro_ __declare_static_bit_vector(konst_1063,32);\
bit_vector_clear(&konst_1063);\
bit_vector_clear(&konst_1063);\
bit_vector_cast_to_bit_vector(0, &(control_data), &((nic_registers[bit_vector_to_uint64(0, &konst_1063)])));\
;

#define _SoftwareRegisterAccessDaemon_stmt_1067_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1067_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1067_c_macro___print_counter,"control");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t\t%s\t\t",_SoftwareRegisterAccessDaemon_stmt_1067_c_macro___print_counter,"control_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(control_data)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1075_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1070,1);\
__declare_static_bit_vector(AND_u1_u1_1073,1);\
__declare_static_bit_vector(OR_u1_u1_1074,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_1070));\
bit_vector_and(&(INIT), &(control_register), &(AND_u1_u1_1073));\
bit_vector_or(&(NOT_u1_u1_1070), &(AND_u1_u1_1073), &(OR_u1_u1_1074));\
bit_vector_cast_to_bit_vector(0, &(update_control_register_pipe), &(OR_u1_u1_1074));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1083_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1078,1);\
__declare_static_bit_vector(AND_u1_u1_1081,1);\
__declare_static_bit_vector(OR_u1_u1_1082,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_1078));\
bit_vector_and(&(INIT), &(free_q), &(AND_u1_u1_1081));\
bit_vector_or(&(NOT_u1_u1_1078), &(AND_u1_u1_1081), &(OR_u1_u1_1082));\
bit_vector_cast_to_bit_vector(0, &(update_free_q_pipe), &(OR_u1_u1_1082));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1091_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1086,1);\
__declare_static_bit_vector(AND_u1_u1_1089,1);\
__declare_static_bit_vector(OR_u1_u1_1090,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_1086));\
bit_vector_and(&(INIT), &(num_server), &(AND_u1_u1_1089));\
bit_vector_or(&(NOT_u1_u1_1086), &(AND_u1_u1_1089), &(OR_u1_u1_1090));\
bit_vector_cast_to_bit_vector(0, &(update_server_num), &(OR_u1_u1_1090));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1096_c_macro_ if (has_undefined_bit(&update_control_register_pipe)) {fprintf(stderr, "Error: variable update_control_register_pipe has undefined value (%s) at test point.\n", to_string(&update_control_register_pipe));assert(0);} \
__declare_static_bit_vector(konst_1094,32);\
bit_vector_clear(&konst_1094);\
if (bit_vector_to_uint64(0, &update_control_register_pipe)) {\
bit_vector_clear(&konst_1094);\
write_bit_vector_to_pipe("CONTROL_REGISTER",&((nic_registers[bit_vector_to_uint64(0, &konst_1094)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1101_c_macro_ if (has_undefined_bit(&update_free_q_pipe)) {fprintf(stderr, "Error: variable update_free_q_pipe has undefined value (%s) at test point.\n", to_string(&update_free_q_pipe));assert(0);} \
__declare_static_bit_vector(konst_1099,32);\
bit_vector_clear(&konst_1099);\
konst_1099.val.byte_array[0] = 18;\
if (bit_vector_to_uint64(0, &update_free_q_pipe)) {\
bit_vector_clear(&konst_1099);\
konst_1099.val.byte_array[0] = 18;\
bit_vector_cast_to_bit_vector(0, &(FREE_Q_32), &((nic_registers[bit_vector_to_uint64(0, &konst_1099)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1109_c_macro_ if (has_undefined_bit(&update_free_q_pipe)) {fprintf(stderr, "Error: variable update_free_q_pipe has undefined value (%s) at test point.\n", to_string(&update_free_q_pipe));assert(0);} \
__declare_static_bit_vector(konst_1105,3);\
bit_vector_clear(&konst_1105);\
__declare_static_bit_vector(type_cast_1106,3);\
bit_vector_clear(&type_cast_1106);\
__declare_static_bit_vector(CONCAT_u32_u35_1107,35);\
__declare_static_bit_vector(type_cast_1108,36);\
if (bit_vector_to_uint64(0, &update_free_q_pipe)) {\
bit_vector_clear(&konst_1105);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1106), &(konst_1105));\
bit_vector_concatenate( &(FREE_Q_32), &(type_cast_1106), &(CONCAT_u32_u35_1107));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1108), &(CONCAT_u32_u35_1107));\
write_bit_vector_to_pipe("FREE_Q",&(type_cast_1108));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1114_c_macro_ if (has_undefined_bit(&update_server_num)) {fprintf(stderr, "Error: variable update_server_num has undefined value (%s) at test point.\n", to_string(&update_server_num));assert(0);} \
__declare_static_bit_vector(konst_1112,32);\
bit_vector_clear(&konst_1112);\
konst_1112.val.byte_array[0] = 1;\
if (bit_vector_to_uint64(0, &update_server_num)) {\
bit_vector_clear(&konst_1112);\
konst_1112.val.byte_array[0] = 1;\
write_bit_vector_to_pipe("NUMBER_OF_SERVERS",&((nic_registers[bit_vector_to_uint64(0, &konst_1112)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1117_c_macro_ __declare_static_bit_vector(RPIPE_AFB_NIC_REQUEST_1116,74);\
read_bit_vector_from_pipe("AFB_NIC_REQUEST",&(RPIPE_AFB_NIC_REQUEST_1116));\
bit_vector_cast_to_bit_vector(0, &(req), &(RPIPE_AFB_NIC_REQUEST_1116));\
;

#define _SoftwareRegisterAccessDaemon_stmt_1119_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1119_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1119_c_macro___print_counter,"got_afb_req");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t\t%s\t\t",_SoftwareRegisterAccessDaemon_stmt_1119_c_macro___print_counter,"req");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(req)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1123_c_macro_ __declare_static_bit_vector(slice_1122,1);\
bit_vector_slice(&(req), &(slice_1122), 73);\
bit_vector_cast_to_bit_vector(0, &(lock), &(slice_1122));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1127_c_macro_ __declare_static_bit_vector(slice_1126,1);\
bit_vector_slice(&(req), &(slice_1126), 72);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_1126));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1131_c_macro_ __declare_static_bit_vector(slice_1130,4);\
bit_vector_slice(&(req), &(slice_1130), 68);\
bit_vector_cast_to_bit_vector(0, &(bmask), &(slice_1130));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1135_c_macro_ __declare_static_bit_vector(slice_1134,36);\
bit_vector_slice(&(req), &(slice_1134), 32);\
bit_vector_cast_to_bit_vector(0, &(addr), &(slice_1134));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1139_c_macro_ __declare_static_bit_vector(slice_1138,32);\
bit_vector_slice(&(req), &(slice_1138), 0);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_1138));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1143_c_macro_ __declare_static_bit_vector(slice_1142,6);\
bit_vector_slice(&(addr), &(slice_1142), 0);\
bit_vector_cast_to_bit_vector(0, &(index), &(slice_1142));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1152_c_macro_ __declare_static_bit_vector(konst_1146,6);\
bit_vector_clear(&konst_1146);\
__declare_static_bit_vector(EQ_u6_u1_1147,1);\
__declare_static_bit_vector(konst_1149,1);\
bit_vector_clear(&konst_1149);\
__declare_static_bit_vector(EQ_u1_u1_1150,1);\
__declare_static_bit_vector(AND_u1_u1_1151,1);\
bit_vector_clear(&konst_1146);\
bit_vector_equal(0, &(index), &(konst_1146), &(EQ_u6_u1_1147));\
bit_vector_clear(&konst_1149);\
bit_vector_equal(0, &(rwbar), &(konst_1149), &(EQ_u1_u1_1150));\
bit_vector_and(&(EQ_u6_u1_1147), &(EQ_u1_u1_1150), &(AND_u1_u1_1151));\
bit_vector_cast_to_bit_vector(0, &(check_control_regsiter), &(AND_u1_u1_1151));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1161_c_macro_ __declare_static_bit_vector(konst_1155,6);\
bit_vector_clear(&konst_1155);\
konst_1155.val.byte_array[0] = 18;\
__declare_static_bit_vector(EQ_u6_u1_1156,1);\
__declare_static_bit_vector(konst_1158,1);\
bit_vector_clear(&konst_1158);\
__declare_static_bit_vector(EQ_u1_u1_1159,1);\
__declare_static_bit_vector(AND_u1_u1_1160,1);\
bit_vector_clear(&konst_1155);\
konst_1155.val.byte_array[0] = 18;\
bit_vector_equal(0, &(index), &(konst_1155), &(EQ_u6_u1_1156));\
bit_vector_clear(&konst_1158);\
bit_vector_equal(0, &(rwbar), &(konst_1158), &(EQ_u1_u1_1159));\
bit_vector_and(&(EQ_u6_u1_1156), &(EQ_u1_u1_1159), &(AND_u1_u1_1160));\
bit_vector_cast_to_bit_vector(0, &(check_free_q), &(AND_u1_u1_1160));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1170_c_macro_ __declare_static_bit_vector(konst_1164,6);\
bit_vector_clear(&konst_1164);\
konst_1164.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u6_u1_1165,1);\
__declare_static_bit_vector(konst_1167,1);\
bit_vector_clear(&konst_1167);\
__declare_static_bit_vector(EQ_u1_u1_1168,1);\
__declare_static_bit_vector(AND_u1_u1_1169,1);\
bit_vector_clear(&konst_1164);\
konst_1164.val.byte_array[0] = 1;\
bit_vector_equal(0, &(index), &(konst_1164), &(EQ_u6_u1_1165));\
bit_vector_clear(&konst_1167);\
bit_vector_equal(0, &(rwbar), &(konst_1167), &(EQ_u1_u1_1168));\
bit_vector_and(&(EQ_u6_u1_1165), &(EQ_u1_u1_1168), &(AND_u1_u1_1169));\
bit_vector_cast_to_bit_vector(0, &(check_num_server), &(AND_u1_u1_1169));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1174_c_macro_ bit_vector_cast_to_bit_vector(0, &(rval), &((nic_registers[bit_vector_to_uint64(0, &index)])));\
;

#define _SoftwareRegisterAccessDaemon_call_stmt_1181_c_macro_ if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if (!bit_vector_to_uint64(0, &rwbar)) {\
_UpdateRegister_( &(bmask),  &(rval),  &(wdata),  &(index), &(wval));\
}\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1188_c_macro_ __declare_static_bit_vector(konst_1185,32);\
bit_vector_clear(&konst_1185);\
__declare_static_bit_vector(type_cast_1186,32);\
bit_vector_clear(&type_cast_1186);\
__declare_static_bit_vector(MUX_1187,32);\
if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if(bit_vector_to_uint64(0, &rwbar)){bit_vector_cast_to_bit_vector(0, &(MUX_1187), &(rval));\
}else {bit_vector_clear(&konst_1185);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1186), &(konst_1185));\
bit_vector_cast_to_bit_vector(0, &(MUX_1187), &(type_cast_1186));\
}bit_vector_cast_to_bit_vector(0, &(rdata), &(MUX_1187));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1194_c_macro_ __declare_static_bit_vector(konst_1190,1);\
bit_vector_clear(&konst_1190);\
__declare_static_bit_vector(type_cast_1191,1);\
bit_vector_clear(&type_cast_1191);\
__declare_static_bit_vector(CONCAT_u1_u33_1193,33);\
bit_vector_clear(&konst_1190);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1191), &(konst_1190));\
bit_vector_concatenate( &(type_cast_1191), &(rdata), &(CONCAT_u1_u33_1193));\
bit_vector_cast_to_bit_vector(0, &(resp), &(CONCAT_u1_u33_1193));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1197_c_macro_ write_bit_vector_to_pipe("AFB_NIC_RESPONSE",&(resp));\
;
;

#define _SoftwareRegisterAccessDaemon_branch_block_stmt_1036_c_export_apply_macro_ ;

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

#define _UpdateRegister_assign_stmt_126_c_macro_ __declare_static_bit_vector(slice_125,1);\
bit_vector_slice(&(bmask), &(slice_125), 3);\
bit_vector_cast_to_bit_vector(0, &(b0), &(slice_125));\
;

#define _UpdateRegister_assign_stmt_130_c_macro_ __declare_static_bit_vector(slice_129,1);\
bit_vector_slice(&(bmask), &(slice_129), 2);\
bit_vector_cast_to_bit_vector(0, &(b1), &(slice_129));\
;

#define _UpdateRegister_assign_stmt_134_c_macro_ __declare_static_bit_vector(slice_133,1);\
bit_vector_slice(&(bmask), &(slice_133), 1);\
bit_vector_cast_to_bit_vector(0, &(b2), &(slice_133));\
;

#define _UpdateRegister_assign_stmt_138_c_macro_ __declare_static_bit_vector(slice_137,1);\
bit_vector_slice(&(bmask), &(slice_137), 0);\
bit_vector_cast_to_bit_vector(0, &(b3), &(slice_137));\
;

#define _UpdateRegister_assign_stmt_142_c_macro_ __declare_static_bit_vector(slice_141,8);\
bit_vector_slice(&(rval), &(slice_141), 24);\
bit_vector_cast_to_bit_vector(0, &(r0), &(slice_141));\
;

#define _UpdateRegister_assign_stmt_146_c_macro_ __declare_static_bit_vector(slice_145,8);\
bit_vector_slice(&(rval), &(slice_145), 16);\
bit_vector_cast_to_bit_vector(0, &(r1), &(slice_145));\
;

#define _UpdateRegister_assign_stmt_150_c_macro_ __declare_static_bit_vector(slice_149,8);\
bit_vector_slice(&(rval), &(slice_149), 8);\
bit_vector_cast_to_bit_vector(0, &(r2), &(slice_149));\
;

#define _UpdateRegister_assign_stmt_154_c_macro_ __declare_static_bit_vector(slice_153,8);\
bit_vector_slice(&(rval), &(slice_153), 0);\
bit_vector_cast_to_bit_vector(0, &(r3), &(slice_153));\
;

#define _UpdateRegister_assign_stmt_158_c_macro_ __declare_static_bit_vector(slice_157,8);\
bit_vector_slice(&(wdata), &(slice_157), 24);\
bit_vector_cast_to_bit_vector(0, &(w0), &(slice_157));\
;

#define _UpdateRegister_assign_stmt_162_c_macro_ __declare_static_bit_vector(slice_161,8);\
bit_vector_slice(&(wdata), &(slice_161), 16);\
bit_vector_cast_to_bit_vector(0, &(w1), &(slice_161));\
;

#define _UpdateRegister_assign_stmt_166_c_macro_ __declare_static_bit_vector(slice_165,8);\
bit_vector_slice(&(wdata), &(slice_165), 8);\
bit_vector_cast_to_bit_vector(0, &(w2), &(slice_165));\
;

#define _UpdateRegister_assign_stmt_170_c_macro_ __declare_static_bit_vector(slice_169,8);\
bit_vector_slice(&(wdata), &(slice_169), 0);\
bit_vector_cast_to_bit_vector(0, &(w3), &(slice_169));\
;

#define _UpdateRegister_assign_stmt_191_c_macro_ __declare_static_bit_vector(MUX_175,8);\
__declare_static_bit_vector(MUX_179,8);\
__declare_static_bit_vector(CONCAT_u8_u16_180,16);\
__declare_static_bit_vector(MUX_184,8);\
__declare_static_bit_vector(MUX_188,8);\
__declare_static_bit_vector(CONCAT_u8_u16_189,16);\
__declare_static_bit_vector(CONCAT_u16_u32_190,32);\
if (has_undefined_bit(&b0)) {fprintf(stderr, "Error: variable b0 has undefined value (%s) at test point.\n", to_string(&b0));assert(0);} \
if(bit_vector_to_uint64(0, &b0)){bit_vector_cast_to_bit_vector(0, &(MUX_175), &(w0));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_175), &(r0));\
}if (has_undefined_bit(&b1)) {fprintf(stderr, "Error: variable b1 has undefined value (%s) at test point.\n", to_string(&b1));assert(0);} \
if(bit_vector_to_uint64(0, &b1)){bit_vector_cast_to_bit_vector(0, &(MUX_179), &(w1));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_179), &(r1));\
}bit_vector_concatenate( &(MUX_175), &(MUX_179), &(CONCAT_u8_u16_180));\
if (has_undefined_bit(&b2)) {fprintf(stderr, "Error: variable b2 has undefined value (%s) at test point.\n", to_string(&b2));assert(0);} \
if(bit_vector_to_uint64(0, &b2)){bit_vector_cast_to_bit_vector(0, &(MUX_184), &(w2));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_184), &(r2));\
}if (has_undefined_bit(&b3)) {fprintf(stderr, "Error: variable b3 has undefined value (%s) at test point.\n", to_string(&b3));assert(0);} \
if(bit_vector_to_uint64(0, &b3)){bit_vector_cast_to_bit_vector(0, &(MUX_188), &(w3));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_188), &(r3));\
}bit_vector_concatenate( &(MUX_184), &(MUX_188), &(CONCAT_u8_u16_189));\
bit_vector_concatenate( &(CONCAT_u8_u16_180), &(CONCAT_u8_u16_189), &(CONCAT_u16_u32_190));\
bit_vector_cast_to_bit_vector(0, &(wval), &(CONCAT_u16_u32_190));\
;

#define _UpdateRegister_assign_stmt_195_c_macro_ bit_vector_cast_to_bit_vector(0, &((nic_registers[bit_vector_to_uint64(0, &index)])), &(wval));\
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

#define _accessMemory_assign_stmt_272_c_macro_ __declare_static_bit_vector(CONCAT_u1_u2_265,2);\
__declare_static_bit_vector(CONCAT_u2_u10_267,10);\
__declare_static_bit_vector(CONCAT_u36_u100_270,100);\
__declare_static_bit_vector(CONCAT_u10_u110_271,110);\
bit_vector_concatenate( &(lock), &(rwbar), &(CONCAT_u1_u2_265));\
bit_vector_concatenate( &(CONCAT_u1_u2_265), &(bmask), &(CONCAT_u2_u10_267));\
bit_vector_concatenate( &(addr), &(wdata), &(CONCAT_u36_u100_270));\
bit_vector_concatenate( &(CONCAT_u2_u10_267), &(CONCAT_u36_u100_270), &(CONCAT_u10_u110_271));\
bit_vector_cast_to_bit_vector(0, &(request), &(CONCAT_u10_u110_271));\
;

#define _accessMemory_stmt_277_c_macro_ uint32_t _accessMemory_stmt_277_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]accessMemory>\t%s\n",_accessMemory_stmt_277_c_macro___print_counter,"byte_mask");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_277_c_macro___print_counter,"bmask");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(bmask)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_277_c_macro___print_counter,"rwbar");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rwbar)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_277_c_macro___print_counter,"addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(addr)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]accessMemory>\t\t%s\t\t",_accessMemory_stmt_277_c_macro___print_counter,"wdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _accessMemory_assign_stmt_280_c_macro_ write_bit_vector_to_pipe("NIC_TO_MEMORY_REQUEST",&(request));\
;

#define _accessMemory_assign_stmt_283_c_macro_ __declare_static_bit_vector(RPIPE_MEMORY_TO_NIC_RESPONSE_282,65);\
read_bit_vector_from_pipe("MEMORY_TO_NIC_RESPONSE",&(RPIPE_MEMORY_TO_NIC_RESPONSE_282));\
bit_vector_cast_to_bit_vector(0, &(response), &(RPIPE_MEMORY_TO_NIC_RESPONSE_282));\
;

#define _accessMemory_assign_stmt_287_c_macro_ __declare_static_bit_vector(slice_286,1);\
bit_vector_slice(&(response), &(slice_286), 64);\
bit_vector_cast_to_bit_vector(0, &(err), &(slice_286));\
;

#define _accessMemory_assign_stmt_291_c_macro_ __declare_static_bit_vector(slice_290,64);\
bit_vector_slice(&(response), &(slice_290), 0);\
bit_vector_cast_to_bit_vector(0, &(rdata), &(slice_290));\
;

#define _accessMemory_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__prdata)), &(rdata));\
;

#define _acquireMutex_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(m_ok,1);\

#define _acquireMutex_branch_block_stmt_296_c_export_decl_macro_ __declare_static_bit_vector(mutex_address,36);\
__declare_static_bit_vector(mutex_plus_nentries,64);\
__declare_static_bit_vector(mutex_val,32);\
__declare_static_bit_vector(wval,64);\
__declare_static_bit_vector(ignore,64);\


#define _acquireMutex_assign_stmt_299_c_macro_ bit_vector_cast_to_bit_vector(0, &(mutex_address), &(q_base_address));\
;

#define _acquireMutex_merge_stmt_300_c_preamble_macro_ uint8_t merge_stmt_300_entry_flag;\
merge_stmt_300_entry_flag = 1;\
uint8_t loopback_296_flag = 0;\
goto merge_stmt_300_run;\
loopback_296: loopback_296_flag = 1;\
goto merge_stmt_300_run;\
merge_stmt_300_run: ;\
;

#define _acquireMutex_merge_stmt_300_c_postamble_macro_ loopback_296_flag = 0;\
merge_stmt_300_entry_flag = 0;

#define _acquireMutex_call_stmt_312_c_macro_ __declare_static_bit_vector(konst_301,1);\
bit_vector_clear(&konst_301);\
konst_301.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_302,1);\
bit_vector_clear(&type_cast_302);\
type_cast_302.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_303,1);\
bit_vector_clear(&konst_303);\
konst_303.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_304,1);\
bit_vector_clear(&type_cast_304);\
type_cast_304.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_305,8);\
bit_vector_clear(&konst_305);\
__declare_static_bit_vector(type_cast_306,8);\
bit_vector_clear(&type_cast_306);\
__declare_static_bit_vector(NOT_u8_u8_307,8);\
bit_vector_clear(&NOT_u8_u8_307);\
NOT_u8_u8_307.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_309,64);\
bit_vector_clear(&konst_309);\
__declare_static_bit_vector(type_cast_310,64);\
bit_vector_clear(&type_cast_310);\
bit_vector_clear(&konst_301);\
konst_301.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_302), &(konst_301));\
bit_vector_clear(&konst_303);\
konst_303.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_304), &(konst_303));\
bit_vector_clear(&konst_305);\
bit_vector_bitcast_to_bit_vector( &(type_cast_306), &(konst_305));\
bit_vector_not( &(type_cast_306), &(NOT_u8_u8_307));\
bit_vector_clear(&konst_309);\
bit_vector_bitcast_to_bit_vector( &(type_cast_310), &(konst_309));\
_accessMemory_( &(type_cast_302),  &(type_cast_304),  &(NOT_u8_u8_307),  &(mutex_address),  &(type_cast_310), &(mutex_plus_nentries));\
;

#define _acquireMutex_assign_stmt_316_c_macro_ __declare_static_bit_vector(slice_315,32);\
bit_vector_slice(&(mutex_plus_nentries), &(slice_315), 32);\
bit_vector_cast_to_bit_vector(0, &(mutex_val), &(slice_315));\
;

#define _acquireMutex_assign_stmt_329_c_macro_ __declare_static_bit_vector(konst_324,32);\
bit_vector_clear(&konst_324);\
konst_324.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_325,32);\
bit_vector_clear(&type_cast_325);\
type_cast_325.val.byte_array[0] = 1;\
__declare_static_bit_vector(slice_327,32);\
__declare_static_bit_vector(CONCAT_u32_u64_328,64);\
bit_vector_clear(&konst_324);\
konst_324.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_325), &(konst_324));\
bit_vector_slice(&(mutex_plus_nentries), &(slice_327), 0);\
bit_vector_concatenate( &(type_cast_325), &(slice_327), &(CONCAT_u32_u64_328));\
bit_vector_cast_to_bit_vector(0, &(wval), &(CONCAT_u32_u64_328));\
;

#define _acquireMutex_call_stmt_340_c_macro_ __declare_static_bit_vector(konst_330,1);\
bit_vector_clear(&konst_330);\
__declare_static_bit_vector(type_cast_331,1);\
bit_vector_clear(&type_cast_331);\
__declare_static_bit_vector(konst_332,1);\
bit_vector_clear(&konst_332);\
__declare_static_bit_vector(type_cast_333,1);\
bit_vector_clear(&type_cast_333);\
__declare_static_bit_vector(konst_334,8);\
bit_vector_clear(&konst_334);\
__declare_static_bit_vector(type_cast_335,8);\
bit_vector_clear(&type_cast_335);\
__declare_static_bit_vector(NOT_u8_u8_336,8);\
bit_vector_clear(&NOT_u8_u8_336);\
NOT_u8_u8_336.val.byte_array[0] = 255;\
bit_vector_clear(&konst_330);\
bit_vector_bitcast_to_bit_vector( &(type_cast_331), &(konst_330));\
bit_vector_clear(&konst_332);\
bit_vector_bitcast_to_bit_vector( &(type_cast_333), &(konst_332));\
bit_vector_clear(&konst_334);\
bit_vector_bitcast_to_bit_vector( &(type_cast_335), &(konst_334));\
bit_vector_not( &(type_cast_335), &(NOT_u8_u8_336));\
_accessMemory_( &(type_cast_331),  &(type_cast_333),  &(NOT_u8_u8_336),  &(mutex_address),  &(wval), &(ignore));\
;
;

#define _acquireMutex_branch_block_stmt_296_c_export_apply_macro_ ;

#define _acquireMutex_assign_stmt_345_c_macro_ __declare_static_bit_vector(konst_343,1);\
bit_vector_clear(&konst_343);\
konst_343.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_344,1);\
bit_vector_clear(&type_cast_344);\
type_cast_344.val.byte_array[0] = 1;\
bit_vector_clear(&konst_343);\
konst_343.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_344), &(konst_343));\
bit_vector_cast_to_bit_vector(0, &(m_ok), &(type_cast_344));\
;

#define _acquireMutex_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pm_ok)), &(m_ok));\
;

#define _delay_time_inner_inarg_prep_macro__ __declare_static_bit_vector(T,32);\
bit_vector_cast_to_bit_vector(0, &(T), &((*__pT)));\
__declare_static_bit_vector(delay_done,1);\

#define _delay_time_branch_block_stmt_839_c_export_decl_macro_ __declare_static_bit_vector(R,32);\
__declare_static_bit_vector(nR,32);\


#define _delay_time_merge_stmt_841_c_preamble_macro_ uint8_t merge_stmt_841_entry_flag;\
merge_stmt_841_entry_flag = do_while_entry_flag;\
goto merge_stmt_841_run;\
merge_stmt_841_run: ;\

#define _delay_time_phi_stmt_842_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(R), &(nR));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(R), &(T));\
}\
;
;

#define _delay_time_merge_stmt_841_c_postamble_macro_ merge_stmt_841_entry_flag = 0;

#define _delay_time_assign_stmt_851_c_macro_ __declare_static_bit_vector(konst_849,32);\
bit_vector_clear(&konst_849);\
konst_849.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_850,32);\
bit_vector_clear(&konst_849);\
konst_849.val.byte_array[0] = 1;\
bit_vector_minus( &(R), &(konst_849), &(SUB_u32_u32_850));\
bit_vector_cast_to_bit_vector(0, &(nR), &(SUB_u32_u32_850));\
;

#define _delay_time_assign_stmt_858_c_macro_ __declare_static_bit_vector(konst_857,1);\
bit_vector_clear(&konst_857);\
konst_857.val.byte_array[0] = 1;\
bit_vector_clear(&konst_857);\
konst_857.val.byte_array[0] = 1;\
bit_vector_cast_to_bit_vector(0, &(delay_done), &(konst_857));\
;
;

#define _delay_time_branch_block_stmt_839_c_export_apply_macro_ ;

#define _delay_time_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pdelay_done)), &(delay_done));\
;

#define _getQueueElement_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(read_pointer,32);\
bit_vector_cast_to_bit_vector(0, &(read_pointer), &((*__pread_pointer)));\
__declare_static_bit_vector(q_r_data,32);\
__declare_static_bit_vector(buffer_address,36);\
__declare_static_bit_vector(element_pair_address,36);\
__declare_static_bit_vector(element_pair,64);\
__declare_static_bit_vector(e0,32);\
__declare_static_bit_vector(e1,32);\

#define _getQueueElement_assign_stmt_383_c_macro_ __declare_static_bit_vector(konst_380,36);\
bit_vector_clear(&konst_380);\
konst_380.val.byte_array[0] = 16;\
__declare_static_bit_vector(type_cast_381,36);\
bit_vector_clear(&type_cast_381);\
type_cast_381.val.byte_array[0] = 16;\
__declare_static_bit_vector(ADD_u36_u36_382,36);\
bit_vector_clear(&konst_380);\
konst_380.val.byte_array[0] = 16;\
bit_vector_bitcast_to_bit_vector( &(type_cast_381), &(konst_380));\
bit_vector_plus( &(q_base_address), &(type_cast_381), &(ADD_u36_u36_382));\
bit_vector_cast_to_bit_vector(0, &(buffer_address), &(ADD_u36_u36_382));\
;

#define _getQueueElement_assign_stmt_396_c_macro_ __declare_static_bit_vector(slice_388,31);\
__declare_static_bit_vector(konst_390,3);\
bit_vector_clear(&konst_390);\
__declare_static_bit_vector(type_cast_391,3);\
bit_vector_clear(&type_cast_391);\
__declare_static_bit_vector(CONCAT_u31_u34_392,34);\
__declare_static_bit_vector(type_cast_394,36);\
__declare_static_bit_vector(ADD_u36_u36_395,36);\
bit_vector_slice(&(read_pointer), &(slice_388), 1);\
bit_vector_clear(&konst_390);\
bit_vector_bitcast_to_bit_vector( &(type_cast_391), &(konst_390));\
bit_vector_concatenate( &(slice_388), &(type_cast_391), &(CONCAT_u31_u34_392));\
bit_vector_bitcast_to_bit_vector( &(type_cast_394), &(CONCAT_u31_u34_392));\
bit_vector_plus( &(buffer_address), &(type_cast_394), &(ADD_u36_u36_395));\
bit_vector_cast_to_bit_vector(0, &(element_pair_address), &(ADD_u36_u36_395));\
;

#define _getQueueElement_call_stmt_408_c_macro_ __declare_static_bit_vector(konst_397,1);\
bit_vector_clear(&konst_397);\
__declare_static_bit_vector(type_cast_398,1);\
bit_vector_clear(&type_cast_398);\
__declare_static_bit_vector(konst_399,1);\
bit_vector_clear(&konst_399);\
konst_399.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_400,1);\
bit_vector_clear(&type_cast_400);\
type_cast_400.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_401,8);\
bit_vector_clear(&konst_401);\
__declare_static_bit_vector(type_cast_402,8);\
bit_vector_clear(&type_cast_402);\
__declare_static_bit_vector(NOT_u8_u8_403,8);\
bit_vector_clear(&NOT_u8_u8_403);\
NOT_u8_u8_403.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_405,64);\
bit_vector_clear(&konst_405);\
__declare_static_bit_vector(type_cast_406,64);\
bit_vector_clear(&type_cast_406);\
bit_vector_clear(&konst_397);\
bit_vector_bitcast_to_bit_vector( &(type_cast_398), &(konst_397));\
bit_vector_clear(&konst_399);\
konst_399.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_400), &(konst_399));\
bit_vector_clear(&konst_401);\
bit_vector_bitcast_to_bit_vector( &(type_cast_402), &(konst_401));\
bit_vector_not( &(type_cast_402), &(NOT_u8_u8_403));\
bit_vector_clear(&konst_405);\
bit_vector_bitcast_to_bit_vector( &(type_cast_406), &(konst_405));\
_accessMemory_( &(type_cast_398),  &(type_cast_400),  &(NOT_u8_u8_403),  &(element_pair_address),  &(type_cast_406), &(element_pair));\
;

#define _getQueueElement_assign_stmt_412_c_macro_ __declare_static_bit_vector(slice_411,32);\
bit_vector_slice(&(element_pair), &(slice_411), 32);\
bit_vector_cast_to_bit_vector(0, &(e0), &(slice_411));\
;

#define _getQueueElement_assign_stmt_416_c_macro_ __declare_static_bit_vector(slice_415,32);\
bit_vector_slice(&(element_pair), &(slice_415), 0);\
bit_vector_cast_to_bit_vector(0, &(e1), &(slice_415));\
;

#define _getQueueElement_assign_stmt_424_c_macro_ __declare_static_bit_vector(konst_419,32);\
bit_vector_clear(&konst_419);\
__declare_static_bit_vector(BITSEL_u32_u1_420,1);\
__declare_static_bit_vector(MUX_423,32);\
bit_vector_clear(&konst_419);\
bit_vector_bitsel( &(read_pointer), &(konst_419), &(BITSEL_u32_u1_420));\
if (has_undefined_bit(&BITSEL_u32_u1_420)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_420 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_420));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_420)){bit_vector_cast_to_bit_vector(0, &(MUX_423), &(e1));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_423), &(e0));\
}bit_vector_cast_to_bit_vector(0, &(q_r_data), &(MUX_423));\
;

#define _getQueueElement_stmt_429_c_macro_ uint32_t _getQueueElement_stmt_429_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]getQueueElement>\t%s\n",_getQueueElement_stmt_429_c_macro___print_counter,"get_queue_element");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_429_c_macro___print_counter,"q_r_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_r_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_429_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_429_c_macro___print_counter,"read_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getQueueElement>\t\t%s\t\t",_getQueueElement_stmt_429_c_macro___print_counter,"element_pair_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(element_pair_address)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _getQueueElement_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pq_r_data)), &(q_r_data));\
;

#define _getQueuePointers_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(wp,32);\
__declare_static_bit_vector(rp,32);\
__declare_static_bit_vector(wp_rp,64);\

#define _getQueuePointers_call_stmt_364_c_macro_ __declare_static_bit_vector(konst_351,1);\
bit_vector_clear(&konst_351);\
__declare_static_bit_vector(type_cast_352,1);\
bit_vector_clear(&type_cast_352);\
__declare_static_bit_vector(konst_353,1);\
bit_vector_clear(&konst_353);\
konst_353.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_354,1);\
bit_vector_clear(&type_cast_354);\
type_cast_354.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_355,8);\
bit_vector_clear(&konst_355);\
__declare_static_bit_vector(type_cast_356,8);\
bit_vector_clear(&type_cast_356);\
__declare_static_bit_vector(NOT_u8_u8_357,8);\
bit_vector_clear(&NOT_u8_u8_357);\
NOT_u8_u8_357.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_359,36);\
bit_vector_clear(&konst_359);\
konst_359.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_360,36);\
__declare_static_bit_vector(konst_361,64);\
bit_vector_clear(&konst_361);\
__declare_static_bit_vector(type_cast_362,64);\
bit_vector_clear(&type_cast_362);\
bit_vector_clear(&konst_351);\
bit_vector_bitcast_to_bit_vector( &(type_cast_352), &(konst_351));\
bit_vector_clear(&konst_353);\
konst_353.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_354), &(konst_353));\
bit_vector_clear(&konst_355);\
bit_vector_bitcast_to_bit_vector( &(type_cast_356), &(konst_355));\
bit_vector_not( &(type_cast_356), &(NOT_u8_u8_357));\
bit_vector_clear(&konst_359);\
konst_359.val.byte_array[0] = 8;\
bit_vector_plus( &(q_base_address), &(konst_359), &(ADD_u36_u36_360));\
bit_vector_clear(&konst_361);\
bit_vector_bitcast_to_bit_vector( &(type_cast_362), &(konst_361));\
_accessMemory_( &(type_cast_352),  &(type_cast_354),  &(NOT_u8_u8_357),  &(ADD_u36_u36_360),  &(type_cast_362), &(wp_rp));\
;

#define _getQueuePointers_assign_stmt_368_c_macro_ __declare_static_bit_vector(slice_367,32);\
bit_vector_slice(&(wp_rp), &(slice_367), 32);\
bit_vector_cast_to_bit_vector(0, &(wp), &(slice_367));\
;

#define _getQueuePointers_assign_stmt_372_c_macro_ __declare_static_bit_vector(slice_371,32);\
bit_vector_slice(&(wp_rp), &(slice_371), 0);\
bit_vector_cast_to_bit_vector(0, &(rp), &(slice_371));\
;

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

#define _getTxPacketPointerFromServer_assign_stmt_1211_c_macro_ __declare_static_bit_vector(ADD_u6_u6_1209,6);\
__declare_static_bit_vector(type_cast_1210,6);\
bit_vector_plus( &(queue_index), &(TX_QUEUES_REG_START_OFFSET), &(ADD_u6_u6_1209));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1210), &(ADD_u6_u6_1209));\
bit_vector_cast_to_bit_vector(0, &(register_index), &(type_cast_1210));\
;

#define _getTxPacketPointerFromServer_call_stmt_1221_c_macro_ __declare_static_bit_vector(konst_1212,1);\
bit_vector_clear(&konst_1212);\
konst_1212.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1213,1);\
bit_vector_clear(&type_cast_1213);\
type_cast_1213.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1214,4);\
bit_vector_clear(&konst_1214);\
__declare_static_bit_vector(type_cast_1215,4);\
bit_vector_clear(&type_cast_1215);\
__declare_static_bit_vector(NOT_u4_u4_1216,4);\
bit_vector_clear(&NOT_u4_u4_1216);\
NOT_u4_u4_1216.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_1218,32);\
bit_vector_clear(&konst_1218);\
__declare_static_bit_vector(type_cast_1219,32);\
bit_vector_clear(&type_cast_1219);\
bit_vector_clear(&konst_1212);\
konst_1212.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1213), &(konst_1212));\
bit_vector_clear(&konst_1214);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1215), &(konst_1214));\
bit_vector_not( &(type_cast_1215), &(NOT_u4_u4_1216));\
bit_vector_clear(&konst_1218);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1219), &(konst_1218));\
_AccessRegister_( &(type_cast_1213),  &(NOT_u4_u4_1216),  &(register_index),  &(type_cast_1219), &(tx_queue_pointer_32));\
;

#define _getTxPacketPointerFromServer_assign_stmt_1227_c_macro_ __declare_static_bit_vector(konst_1224,4);\
bit_vector_clear(&konst_1224);\
__declare_static_bit_vector(type_cast_1225,4);\
bit_vector_clear(&type_cast_1225);\
__declare_static_bit_vector(CONCAT_u32_u36_1226,36);\
bit_vector_clear(&konst_1224);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1225), &(konst_1224));\
bit_vector_concatenate( &(tx_queue_pointer_32), &(type_cast_1225), &(CONCAT_u32_u36_1226));\
bit_vector_cast_to_bit_vector(0, &(tx_queue_pointer_36), &(CONCAT_u32_u36_1226));\
;

#define _getTxPacketPointerFromServer_call_stmt_1233_c_macro_ __declare_static_bit_vector(konst_1228,1);\
bit_vector_clear(&konst_1228);\
__declare_static_bit_vector(type_cast_1229,1);\
bit_vector_clear(&type_cast_1229);\
bit_vector_clear(&konst_1228);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1229), &(konst_1228));\
_popFromQueue_( &(type_cast_1229),  &(tx_queue_pointer_36), &(pkt_pointer), &(status));\
;

#define _getTxPacketPointerFromServer_stmt_1238_c_macro_ uint32_t _getTxPacketPointerFromServer_stmt_1238_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t%s\n",_getTxPacketPointerFromServer_stmt_1238_c_macro___print_counter,"register_ind");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1238_c_macro___print_counter,"register_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(register_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1238_c_macro___print_counter,"tx_queue_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(tx_queue_pointer_36)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1238_c_macro___print_counter,"pkt_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(pkt_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]getTxPacketPointerFromServer>\t\t%s\t\t",_getTxPacketPointerFromServer_stmt_1238_c_macro___print_counter,"status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

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

#define _loadBuffer_call_stmt_694_c_macro_ _writeEthernetHeaderToMem_( &(rx_buffer_pointer), &(new_buf_pointer));\
;

#define _loadBuffer_call_stmt_700_c_macro_ _writePayloadToMem_( &(rx_buffer_pointer),  &(new_buf_pointer), &(packet_size), &(bad_packet_identifier), &(last_keep));\
;

#define _loadBuffer_call_stmt_705_c_macro_ if (has_undefined_bit(&bad_packet_identifier)) {fprintf(stderr, "Error: variable bad_packet_identifier has undefined value (%s) at test point.\n", to_string(&bad_packet_identifier));assert(0);} \
if (!bit_vector_to_uint64(0, &bad_packet_identifier)) {\
_writeControlInformationToMem_( &(rx_buffer_pointer),  &(packet_size),  &(last_keep));\
}\
;

#define _loadBuffer_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pbad_packet_identifier)), &(bad_packet_identifier));\
;

#define _macToNicInterface_inner_inarg_prep_macro__ 
#define _macToNicInterface_branch_block_stmt_1244_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,16);\


#define _macToNicInterface_merge_stmt_1246_c_preamble_macro_ uint8_t merge_stmt_1246_entry_flag;\
merge_stmt_1246_entry_flag = do_while_entry_flag;\
goto merge_stmt_1246_run;\
merge_stmt_1246_run: ;\

#define _macToNicInterface_phi_stmt_1247_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_0_1249,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data_0",&(RPIPE_mac_to_nic_data_0_1249));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mac_to_nic_data_0_1249));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_0_1249,64);\
read_bit_vector_from_pipe("mac_to_nic_data_0",&(RPIPE_mac_to_nic_data_0_1249));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mac_to_nic_data_0_1249));\
}\
;

#define _macToNicInterface_phi_stmt_1250_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_1_1252,16);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data_1",&(RPIPE_mac_to_nic_data_1_1252));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mac_to_nic_data_1_1252));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_1_1252,16);\
read_bit_vector_from_pipe("mac_to_nic_data_1",&(RPIPE_mac_to_nic_data_1_1252));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mac_to_nic_data_1_1252));\
}\
;
;

#define _macToNicInterface_merge_stmt_1246_c_postamble_macro_ merge_stmt_1246_entry_flag = 0;

#define _macToNicInterface_stmt_1256_c_macro_ uint32_t _macToNicInterface_stmt_1256_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]macToNicInterface>\t%s\n",_macToNicInterface_stmt_1256_c_macro___print_counter,"writing_data");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]macToNicInterface>\t\t%s\t\t",_macToNicInterface_stmt_1256_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]macToNicInterface>\t\t%s\t\t",_macToNicInterface_stmt_1256_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _macToNicInterface_assign_stmt_1263_c_macro_ __declare_static_bit_vector(slice_1260,9);\
__declare_static_bit_vector(CONCAT_u9_u73_1262,73);\
bit_vector_slice(&(rdata1), &(slice_1260), 0);\
bit_vector_concatenate( &(slice_1260), &(rdata0), &(CONCAT_u9_u73_1262));\
write_bit_vector_to_pipe("mac_to_nic_data",&(CONCAT_u9_u73_1262));\
;
;

#define _macToNicInterface_branch_block_stmt_1244_c_export_apply_macro_ ;

#define _macToNicInterface_inner_outarg_prep_macro__ ;

#define _macToNicInterface_outer_arg_decl_macro__ ;

#define _macToNicInterface_outer_op_xfer_macro__ ;

#define _memoryToNicInterface_inner_inarg_prep_macro__ 
#define _memoryToNicInterface_branch_block_stmt_1269_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,8);\


#define _memoryToNicInterface_merge_stmt_1271_c_preamble_macro_ uint8_t merge_stmt_1271_entry_flag;\
merge_stmt_1271_entry_flag = do_while_entry_flag;\
goto merge_stmt_1271_run;\
merge_stmt_1271_run: ;\

#define _memoryToNicInterface_phi_stmt_1272_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp1_pipe0_1274,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp1_pipe0",&(RPIPE_mem_resp1_pipe0_1274));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp1_pipe0_1274));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp1_pipe0_1274,64);\
read_bit_vector_from_pipe("mem_resp1_pipe0",&(RPIPE_mem_resp1_pipe0_1274));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp1_pipe0_1274));\
}\
;

#define _memoryToNicInterface_phi_stmt_1275_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp1_pipe1_1277,8);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp1_pipe1",&(RPIPE_mem_resp1_pipe1_1277));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp1_pipe1_1277));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp1_pipe1_1277,8);\
read_bit_vector_from_pipe("mem_resp1_pipe1",&(RPIPE_mem_resp1_pipe1_1277));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp1_pipe1_1277));\
}\
;
;

#define _memoryToNicInterface_merge_stmt_1271_c_postamble_macro_ merge_stmt_1271_entry_flag = 0;

#define _memoryToNicInterface_assign_stmt_1285_c_macro_ __declare_static_bit_vector(konst_1281,8);\
bit_vector_clear(&konst_1281);\
__declare_static_bit_vector(BITSEL_u8_u1_1282,1);\
__declare_static_bit_vector(CONCAT_u1_u65_1284,65);\
bit_vector_clear(&konst_1281);\
bit_vector_bitsel( &(rdata1), &(konst_1281), &(BITSEL_u8_u1_1282));\
bit_vector_concatenate( &(BITSEL_u8_u1_1282), &(rdata0), &(CONCAT_u1_u65_1284));\
write_bit_vector_to_pipe("MEMORY_TO_NIC_RESPONSE",&(CONCAT_u1_u65_1284));\
;
;

#define _memoryToNicInterface_branch_block_stmt_1269_c_export_apply_macro_ ;

#define _memoryToNicInterface_inner_outarg_prep_macro__ ;

#define _memoryToNicInterface_outer_arg_decl_macro__ ;

#define _memoryToNicInterface_outer_op_xfer_macro__ ;

#define _nextLSTATE_inner_inarg_prep_macro__ __declare_static_bit_vector(RX,73);\
bit_vector_cast_to_bit_vector(0, &(RX), &((*__pRX)));\
__declare_static_bit_vector(LSTATE,2);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &((*__pLSTATE)));\
__declare_static_bit_vector(nLSTATE,2);\
__declare_static_bit_vector(tlast,1);\
__declare_static_bit_vector(tdata,64);\
__declare_static_bit_vector(tkeep,8);\
__declare_static_bit_vector(last_word,1);\

#define _nextLSTATE_assign_stmt_1297_c_macro_ __declare_static_bit_vector(slice_1296,1);\
bit_vector_slice(&(RX), &(slice_1296), 72);\
bit_vector_cast_to_bit_vector(0, &(tlast), &(slice_1296));\
;

#define _nextLSTATE_assign_stmt_1301_c_macro_ __declare_static_bit_vector(slice_1300,64);\
bit_vector_slice(&(RX), &(slice_1300), 8);\
bit_vector_cast_to_bit_vector(0, &(tdata), &(slice_1300));\
;

#define _nextLSTATE_assign_stmt_1305_c_macro_ __declare_static_bit_vector(slice_1304,8);\
bit_vector_slice(&(RX), &(slice_1304), 0);\
bit_vector_cast_to_bit_vector(0, &(tkeep), &(slice_1304));\
;

#define _nextLSTATE_assign_stmt_1310_c_macro_ __declare_static_bit_vector(konst_1308,1);\
bit_vector_clear(&konst_1308);\
konst_1308.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_1309,1);\
bit_vector_clear(&konst_1308);\
konst_1308.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_1308), &(EQ_u1_u1_1309));\
bit_vector_cast_to_bit_vector(0, &(last_word), &(EQ_u1_u1_1309));\
;

#define _nextLSTATE_assign_stmt_1344_c_macro_ __declare_static_bit_vector(EQ_u2_u1_1314,1);\
__declare_static_bit_vector(konst_1316,2);\
bit_vector_clear(&konst_1316);\
__declare_static_bit_vector(MUX_1317,2);\
__declare_static_bit_vector(EQ_u2_u1_1320,1);\
__declare_static_bit_vector(konst_1322,2);\
bit_vector_clear(&konst_1322);\
__declare_static_bit_vector(MUX_1323,2);\
__declare_static_bit_vector(OR_u2_u2_1324,2);\
__declare_static_bit_vector(EQ_u2_u1_1327,1);\
__declare_static_bit_vector(NOT_u1_u1_1329,1);\
__declare_static_bit_vector(AND_u1_u1_1330,1);\
__declare_static_bit_vector(konst_1332,2);\
bit_vector_clear(&konst_1332);\
__declare_static_bit_vector(MUX_1333,2);\
__declare_static_bit_vector(EQ_u2_u1_1336,1);\
__declare_static_bit_vector(AND_u1_u1_1338,1);\
__declare_static_bit_vector(konst_1340,2);\
bit_vector_clear(&konst_1340);\
__declare_static_bit_vector(MUX_1341,2);\
__declare_static_bit_vector(OR_u2_u2_1342,2);\
__declare_static_bit_vector(OR_u2_u2_1343,2);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u2_u1_1314));\
if (has_undefined_bit(&EQ_u2_u1_1314)) {fprintf(stderr, "Error: variable EQ_u2_u1_1314 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1314));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1314)){bit_vector_cast_to_bit_vector(0, &(MUX_1317), &(S1));\
}else {bit_vector_clear(&konst_1316);\
bit_vector_cast_to_bit_vector(0, &(MUX_1317), &(konst_1316));\
}bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1320));\
if (has_undefined_bit(&EQ_u2_u1_1320)) {fprintf(stderr, "Error: variable EQ_u2_u1_1320 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1320));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1320)){bit_vector_cast_to_bit_vector(0, &(MUX_1323), &(S2));\
}else {bit_vector_clear(&konst_1322);\
bit_vector_cast_to_bit_vector(0, &(MUX_1323), &(konst_1322));\
}bit_vector_or(&(MUX_1317), &(MUX_1323), &(OR_u2_u2_1324));\
bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u2_u1_1327));\
bit_vector_not( &(last_word), &(NOT_u1_u1_1329));\
bit_vector_and(&(EQ_u2_u1_1327), &(NOT_u1_u1_1329), &(AND_u1_u1_1330));\
if (has_undefined_bit(&AND_u1_u1_1330)) {fprintf(stderr, "Error: variable AND_u1_u1_1330 has undefined value (%s) at test point.\n", to_string(&AND_u1_u1_1330));assert(0);} \
if(bit_vector_to_uint64(0, &AND_u1_u1_1330)){bit_vector_cast_to_bit_vector(0, &(MUX_1333), &(S2));\
}else {bit_vector_clear(&konst_1332);\
bit_vector_cast_to_bit_vector(0, &(MUX_1333), &(konst_1332));\
}bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u2_u1_1336));\
bit_vector_and(&(EQ_u2_u1_1336), &(last_word), &(AND_u1_u1_1338));\
if (has_undefined_bit(&AND_u1_u1_1338)) {fprintf(stderr, "Error: variable AND_u1_u1_1338 has undefined value (%s) at test point.\n", to_string(&AND_u1_u1_1338));assert(0);} \
if(bit_vector_to_uint64(0, &AND_u1_u1_1338)){bit_vector_cast_to_bit_vector(0, &(MUX_1341), &(S0));\
}else {bit_vector_clear(&konst_1340);\
bit_vector_cast_to_bit_vector(0, &(MUX_1341), &(konst_1340));\
}bit_vector_or(&(MUX_1333), &(MUX_1341), &(OR_u2_u2_1342));\
bit_vector_or(&(OR_u2_u2_1324), &(OR_u2_u2_1342), &(OR_u2_u2_1343));\
bit_vector_cast_to_bit_vector(0, &(nLSTATE), &(OR_u2_u2_1343));\
;

#define _nextLSTATE_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnLSTATE)), &(nLSTATE));\
;

#define _nicRxFromMacDaemon_inner_inarg_prep_macro__ 
#define _nicRxFromMacDaemon_branch_block_stmt_1347_c_export_decl_macro_ __declare_static_bit_vector(LSTATE,2);\
__declare_static_bit_vector(RX,73);\
__declare_static_bit_vector(nLSTATE,2);\
__declare_static_bit_vector(write_to_header,1);\


#define _nicRxFromMacDaemon_stmt_1348_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1348_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1348_c_macro___print_counter,"waiting_for_control");release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_merge_stmt_1349_c_preamble_macro_ uint8_t merge_stmt_1349_entry_flag;\
merge_stmt_1349_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_1347_flag = 0;\
uint8_t disable_loopback_1347_flag = 0;\
goto merge_stmt_1349_run;\
not_enabled_yet_loopback_1347: not_enabled_yet_loopback_1347_flag = 1;\
disable_loopback_1347_flag = 0;\
goto merge_stmt_1349_run;\
disable_loopback_1347: disable_loopback_1347_flag = 1;\
not_enabled_yet_loopback_1347_flag = 0;\
goto merge_stmt_1349_run;\
merge_stmt_1349_run: ;\
;

#define _nicRxFromMacDaemon_merge_stmt_1349_c_postamble_macro_ not_enabled_yet_loopback_1347_flag = 0;\
disable_loopback_1347_flag = 0;\
merge_stmt_1349_entry_flag = 0;

#define _nicRxFromMacDaemon_stmt_1357_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1357_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1357_c_macro___print_counter,"got_the__control");release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_merge_stmt_1359_c_preamble_macro_ uint8_t merge_stmt_1359_entry_flag;\
merge_stmt_1359_entry_flag = do_while_entry_flag;\
goto merge_stmt_1359_run;\
merge_stmt_1359_run: ;\

#define _nicRxFromMacDaemon_phi_stmt_1360_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(nLSTATE));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(S0));\
}\
;

#define _nicRxFromMacDaemon_phi_stmt_1364_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_1366,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_1366));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_1366));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_1366,73);\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_1366));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_1366));\
}\
;
;

#define _nicRxFromMacDaemon_merge_stmt_1359_c_postamble_macro_ merge_stmt_1359_entry_flag = 0;

#define _nicRxFromMacDaemon_stmt_1370_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1370_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1370_c_macro___print_counter,"data_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1370_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1370_c_macro___print_counter,"LSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(LSTATE)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_call_stmt_1374_c_macro_ _nextLSTATE_( &(RX),  &(LSTATE), &(nLSTATE));\
;

#define _nicRxFromMacDaemon_assign_stmt_1383_c_macro_ __declare_static_bit_vector(EQ_u2_u1_1378,1);\
__declare_static_bit_vector(EQ_u2_u1_1381,1);\
__declare_static_bit_vector(OR_u1_u1_1382,1);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u2_u1_1378));\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1381));\
bit_vector_or(&(EQ_u2_u1_1378), &(EQ_u2_u1_1381), &(OR_u1_u1_1382));\
bit_vector_cast_to_bit_vector(0, &(write_to_header), &(OR_u1_u1_1382));\
;

#define _nicRxFromMacDaemon_assign_stmt_1395_c_macro_ if (has_undefined_bit(&write_to_header)) {fprintf(stderr, "Error: variable write_to_header has undefined value (%s) at test point.\n", to_string(&write_to_header));assert(0);} \
__declare_static_bit_vector(EQ_u2_u1_1388,1);\
__declare_static_bit_vector(slice_1390,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1392,73);\
__declare_static_bit_vector(MUX_1394,73);\
if (bit_vector_to_uint64(0, &write_to_header)) {\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1388));\
if (has_undefined_bit(&EQ_u2_u1_1388)) {fprintf(stderr, "Error: variable EQ_u2_u1_1388 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1388));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1388)){bit_vector_slice(&(RX), &(slice_1390), 8);\
bit_vector_concatenate( &(slice_1390), &(HEADER_TKEEP), &(CONCAT_u65_u73_1392));\
bit_vector_cast_to_bit_vector(0, &(MUX_1394), &(CONCAT_u65_u73_1392));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_1394), &(RX));\
}write_bit_vector_to_pipe("nic_rx_to_header",&(MUX_1394));\
}
;

#define _nicRxFromMacDaemon_assign_stmt_1398_c_macro_ write_bit_vector_to_pipe("nic_rx_to_packet",&(RX));\
;

#define _nicRxFromMacDaemon_stmt_1401_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1401_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1401_c_macro___print_counter,"data_written_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1401_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1401_c_macro___print_counter,"nLSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nLSTATE)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;
;

#define _nicRxFromMacDaemon_branch_block_stmt_1347_c_export_apply_macro_ ;

#define _nicRxFromMacDaemon_inner_outarg_prep_macro__ ;

#define _nicRxFromMacDaemon_outer_arg_decl_macro__ ;

#define _nicRxFromMacDaemon_outer_op_xfer_macro__ ;

#define _nicToMacInterface_inner_inarg_prep_macro__ 
#define _nicToMacInterface_branch_block_stmt_1410_c_export_decl_macro_ __declare_static_bit_vector(rdata,73);\


#define _nicToMacInterface_merge_stmt_1412_c_preamble_macro_ uint8_t merge_stmt_1412_entry_flag;\
merge_stmt_1412_entry_flag = do_while_entry_flag;\
goto merge_stmt_1412_run;\
merge_stmt_1412_run: ;\

#define _nicToMacInterface_phi_stmt_1413_c_macro_ __declare_static_bit_vector(RPIPE_nic_to_mac_transmit_pipe_1415,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_to_mac_transmit_pipe",&(RPIPE_nic_to_mac_transmit_pipe_1415));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_nic_to_mac_transmit_pipe_1415));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_to_mac_transmit_pipe_1415,73);\
read_bit_vector_from_pipe("nic_to_mac_transmit_pipe",&(RPIPE_nic_to_mac_transmit_pipe_1415));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_nic_to_mac_transmit_pipe_1415));\
}\
;
;

#define _nicToMacInterface_merge_stmt_1412_c_postamble_macro_ merge_stmt_1412_entry_flag = 0;

#define _nicToMacInterface_stmt_1418_c_macro_ uint32_t _nicToMacInterface_stmt_1418_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicToMacInterface>\t%s\n",_nicToMacInterface_stmt_1418_c_macro___print_counter,"read_data_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicToMacInterface>\t\t%s\t\t",_nicToMacInterface_stmt_1418_c_macro___print_counter,"rdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicToMacInterface_assign_stmt_1422_c_macro_ __declare_static_bit_vector(slice_1421,64);\
bit_vector_slice(&(rdata), &(slice_1421), 0);\
write_bit_vector_to_pipe("nic_to_mac_data_0",&(slice_1421));\
;

#define _nicToMacInterface_assign_stmt_1427_c_macro_ __declare_static_bit_vector(slice_1425,9);\
__declare_static_bit_vector(type_cast_1426,16);\
bit_vector_slice(&(rdata), &(slice_1425), 64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1426), &(slice_1425));\
write_bit_vector_to_pipe("nic_to_mac_data_1",&(type_cast_1426));\
;
;

#define _nicToMacInterface_branch_block_stmt_1410_c_export_apply_macro_ ;

#define _nicToMacInterface_inner_outarg_prep_macro__ ;

#define _nicToMacInterface_outer_arg_decl_macro__ ;

#define _nicToMacInterface_outer_op_xfer_macro__ ;

#define _nicToMemoryInterface_inner_inarg_prep_macro__ 
#define _nicToMemoryInterface_branch_block_stmt_1433_c_export_decl_macro_ __declare_static_bit_vector(rdata,110);\


#define _nicToMemoryInterface_merge_stmt_1435_c_preamble_macro_ uint8_t merge_stmt_1435_entry_flag;\
merge_stmt_1435_entry_flag = do_while_entry_flag;\
goto merge_stmt_1435_run;\
merge_stmt_1435_run: ;\

#define _nicToMemoryInterface_phi_stmt_1436_c_macro_ __declare_static_bit_vector(RPIPE_NIC_TO_MEMORY_REQUEST_1438,110);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("NIC_TO_MEMORY_REQUEST",&(RPIPE_NIC_TO_MEMORY_REQUEST_1438));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_NIC_TO_MEMORY_REQUEST_1438));\
}\
else {\
__declare_static_bit_vector(RPIPE_NIC_TO_MEMORY_REQUEST_1438,110);\
read_bit_vector_from_pipe("NIC_TO_MEMORY_REQUEST",&(RPIPE_NIC_TO_MEMORY_REQUEST_1438));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_NIC_TO_MEMORY_REQUEST_1438));\
}\
;
;

#define _nicToMemoryInterface_merge_stmt_1435_c_postamble_macro_ merge_stmt_1435_entry_flag = 0;

#define _nicToMemoryInterface_stmt_1441_c_macro_ uint32_t _nicToMemoryInterface_stmt_1441_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicToMemoryInterface>\t%s\n",_nicToMemoryInterface_stmt_1441_c_macro___print_counter,"writing_to_mem_pipe");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicToMemoryInterface>\t\t%s\t\t",_nicToMemoryInterface_stmt_1441_c_macro___print_counter,"rdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicToMemoryInterface_assign_stmt_1445_c_macro_ __declare_static_bit_vector(slice_1444,64);\
bit_vector_slice(&(rdata), &(slice_1444), 0);\
write_bit_vector_to_pipe("mem_req1_pipe0",&(slice_1444));\
;

#define _nicToMemoryInterface_assign_stmt_1451_c_macro_ __declare_static_bit_vector(slice_1449,46);\
__declare_static_bit_vector(type_cast_1450,64);\
bit_vector_slice(&(rdata), &(slice_1449), 64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1450), &(slice_1449));\
write_bit_vector_to_pipe("mem_req1_pipe1",&(type_cast_1450));\
;
;

#define _nicToMemoryInterface_branch_block_stmt_1433_c_export_apply_macro_ ;

#define _nicToMemoryInterface_inner_outarg_prep_macro__ ;

#define _nicToMemoryInterface_outer_arg_decl_macro__ ;

#define _nicToMemoryInterface_outer_op_xfer_macro__ ;

#define _nicToProcessorInterface_inner_inarg_prep_macro__ 
#define _nicToProcessorInterface_branch_block_stmt_1457_c_export_decl_macro_ __declare_static_bit_vector(rdata,33);\


#define _nicToProcessorInterface_merge_stmt_1459_c_preamble_macro_ uint8_t merge_stmt_1459_entry_flag;\
merge_stmt_1459_entry_flag = do_while_entry_flag;\
goto merge_stmt_1459_run;\
merge_stmt_1459_run: ;\

#define _nicToProcessorInterface_phi_stmt_1460_c_macro_ __declare_static_bit_vector(RPIPE_AFB_NIC_RESPONSE_1462,33);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("AFB_NIC_RESPONSE",&(RPIPE_AFB_NIC_RESPONSE_1462));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_AFB_NIC_RESPONSE_1462));\
}\
else {\
__declare_static_bit_vector(RPIPE_AFB_NIC_RESPONSE_1462,33);\
read_bit_vector_from_pipe("AFB_NIC_RESPONSE",&(RPIPE_AFB_NIC_RESPONSE_1462));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_AFB_NIC_RESPONSE_1462));\
}\
;
;

#define _nicToProcessorInterface_merge_stmt_1459_c_postamble_macro_ merge_stmt_1459_entry_flag = 0;

#define _nicToProcessorInterface_assign_stmt_1467_c_macro_ __declare_static_bit_vector(type_cast_1466,64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1466), &(rdata));\
write_bit_vector_to_pipe("control_word_response_pipe",&(type_cast_1466));\
;
;

#define _nicToProcessorInterface_branch_block_stmt_1457_c_export_apply_macro_ ;

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
__declare_static_bit_vector(write_pointer,32);\
__declare_static_bit_vector(read_pointer,32);\
__declare_static_bit_vector(q_empty,1);\
__declare_static_bit_vector(round_off,1);\
__declare_static_bit_vector(next_rp,32);\

#define _popFromQueue_call_stmt_481_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_acquireMutex_( &(q_base_address), &(m_ok));\
}\
;

#define _popFromQueue_call_stmt_486_c_macro_ _getQueuePointers_( &(q_base_address), &(write_pointer), &(read_pointer));\
;

#define _popFromQueue_assign_stmt_491_c_macro_ __declare_static_bit_vector(EQ_u32_u1_490,1);\
bit_vector_equal(0, &(write_pointer), &(read_pointer), &(EQ_u32_u1_490));\
bit_vector_cast_to_bit_vector(0, &(q_empty), &(EQ_u32_u1_490));\
;

#define _popFromQueue_assign_stmt_498_c_macro_ __declare_static_bit_vector(konst_495,32);\
bit_vector_clear(&konst_495);\
konst_495.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_496,32);\
bit_vector_clear(&SUB_u32_u32_496);\
SUB_u32_u32_496.val.byte_array[0] = 2;\
__declare_static_bit_vector(EQ_u32_u1_497,1);\
bit_vector_clear(&konst_495);\
konst_495.val.byte_array[0] = 1;\
bit_vector_minus( &(QUEUE_SIZE_MASK), &(konst_495), &(SUB_u32_u32_496));\
bit_vector_equal(0, &(read_pointer), &(SUB_u32_u32_496), &(EQ_u32_u1_497));\
bit_vector_cast_to_bit_vector(0, &(round_off), &(EQ_u32_u1_497));\
;

#define _popFromQueue_assign_stmt_506_c_macro_ __declare_static_bit_vector(konst_501,32);\
bit_vector_clear(&konst_501);\
__declare_static_bit_vector(konst_503,32);\
bit_vector_clear(&konst_503);\
konst_503.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_504,32);\
__declare_static_bit_vector(MUX_505,32);\
if (has_undefined_bit(&round_off)) {fprintf(stderr, "Error: variable round_off has undefined value (%s) at test point.\n", to_string(&round_off));assert(0);} \
if(bit_vector_to_uint64(0, &round_off)){bit_vector_clear(&konst_501);\
bit_vector_cast_to_bit_vector(0, &(MUX_505), &(konst_501));\
}else {bit_vector_clear(&konst_503);\
konst_503.val.byte_array[0] = 1;\
bit_vector_plus( &(read_pointer), &(konst_503), &(ADD_u32_u32_504));\
bit_vector_cast_to_bit_vector(0, &(MUX_505), &(ADD_u32_u32_504));\
}bit_vector_cast_to_bit_vector(0, &(next_rp), &(MUX_505));\
;

#define _popFromQueue_call_stmt_511_c_macro_ if (has_undefined_bit(&q_empty)) {fprintf(stderr, "Error: variable q_empty has undefined value (%s) at test point.\n", to_string(&q_empty));assert(0);} \
if (!bit_vector_to_uint64(0, &q_empty)) {\
_getQueueElement_( &(q_base_address),  &(read_pointer), &(q_r_data));\
}\
;

#define _popFromQueue_call_stmt_516_c_macro_ if (has_undefined_bit(&q_empty)) {fprintf(stderr, "Error: variable q_empty has undefined value (%s) at test point.\n", to_string(&q_empty));assert(0);} \
if (!bit_vector_to_uint64(0, &q_empty)) {\
_setQueuePointers_( &(q_base_address),  &(write_pointer),  &(next_rp));\
}\
;

#define _popFromQueue_stmt_523_c_macro_ uint32_t _popFromQueue_stmt_523_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]popFromQueue>\t%s\n",_popFromQueue_stmt_523_c_macro___print_counter,"pop_data");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_523_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_523_c_macro___print_counter,"q_r_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_r_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_523_c_macro___print_counter,"q_empty");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_empty)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_523_c_macro___print_counter,"write_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(write_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_523_c_macro___print_counter,"read_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_523_c_macro___print_counter,"next_rp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(next_rp)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _popFromQueue_call_stmt_527_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_releaseMutex_( &(q_base_address));\
}\
;

#define _popFromQueue_assign_stmt_530_c_macro_ bit_vector_cast_to_bit_vector(0, &(status), &(q_empty));\
;

#define _popFromQueue_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pq_r_data)), &(q_r_data));\
bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _populateRxQueue_inner_inarg_prep_macro__ __declare_static_bit_vector(rx_buffer_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer), &((*__prx_buffer_pointer)));\

#define _populateRxQueue_stmt_864_c_macro_ uint32_t _populateRxQueue_stmt_864_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_864_c_macro___print_counter,"started_populate_rx_queue_module");__declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_863,6);\
read_bit_vector_from_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_863));\
if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_864_c_macro___print_counter,"LAST_WRITTEN_RX_QUEUE_INDEX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_863)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_branch_block_stmt_865_c_export_decl_macro_ __declare_static_bit_vector(q_index,6);\
__declare_static_bit_vector(register_index,6);\
__declare_static_bit_vector(rx_queue_pointer_32,32);\
__declare_static_bit_vector(rx_queue_pointer_36,36);\
__declare_static_bit_vector(push_status,1);\
__declare_static_bit_vector(n_q_index,6);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(selected_q_index,6);\


#define _populateRxQueue_merge_stmt_866_c_preamble_macro_ uint8_t merge_stmt_866_entry_flag;\
merge_stmt_866_entry_flag = 1;\
uint8_t loopback_865_flag = 0;\
goto merge_stmt_866_run;\
loopback_865: loopback_865_flag = 1;\
goto merge_stmt_866_run;\
merge_stmt_866_run: ;\

#define _populateRxQueue_phi_stmt_867_c_macro_ __declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_869,6);\
__declare_static_bit_vector(konst_870,6);\
bit_vector_clear(&konst_870);\
konst_870.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_871,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_872,32);\
__declare_static_bit_vector(konst_873,32);\
bit_vector_clear(&konst_873);\
konst_873.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_874,32);\
__declare_static_bit_vector(type_cast_875,6);\
__declare_static_bit_vector(AND_u6_u6_876,6);\
if(loopback_865_flag) {\
bit_vector_cast_to_bit_vector(0, &(q_index), &(n_q_index));\
}\
else {\
__declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_869,6);\
__declare_static_bit_vector(konst_870,6);\
bit_vector_clear(&konst_870);\
konst_870.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_871,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_872,32);\
__declare_static_bit_vector(konst_873,32);\
bit_vector_clear(&konst_873);\
konst_873.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_874,32);\
__declare_static_bit_vector(type_cast_875,6);\
__declare_static_bit_vector(AND_u6_u6_876,6);\
read_bit_vector_from_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_869));\
bit_vector_clear(&konst_870);\
konst_870.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_869), &(konst_870), &(ADD_u6_u6_871));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_872));\
bit_vector_clear(&konst_873);\
konst_873.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_872), &(konst_873), &(SUB_u32_u32_874));\
bit_vector_bitcast_to_bit_vector( &(type_cast_875), &(SUB_u32_u32_874));\
bit_vector_and(&(ADD_u6_u6_871), &(type_cast_875), &(AND_u6_u6_876));\
bit_vector_cast_to_bit_vector(0, &(q_index), &(AND_u6_u6_876));\
}\
;
;

#define _populateRxQueue_merge_stmt_866_c_postamble_macro_ loopback_865_flag = 0;\
merge_stmt_866_entry_flag = 0;

#define _populateRxQueue_stmt_880_c_macro_ uint32_t _populateRxQueue_stmt_880_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_880_c_macro___print_counter,"in_loop");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_880_c_macro___print_counter,"q_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_assign_stmt_886_c_macro_ __declare_static_bit_vector(ADD_u6_u6_884,6);\
__declare_static_bit_vector(type_cast_885,6);\
bit_vector_plus( &(q_index), &(RX_QUEUES_REG_START_OFFSET), &(ADD_u6_u6_884));\
bit_vector_bitcast_to_bit_vector( &(type_cast_885), &(ADD_u6_u6_884));\
bit_vector_cast_to_bit_vector(0, &(register_index), &(type_cast_885));\
;

#define _populateRxQueue_stmt_888_c_macro_ uint32_t _populateRxQueue_stmt_888_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_888_c_macro___print_counter,"will_be_Accessing_register");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_888_c_macro___print_counter,"register_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(register_index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_call_stmt_898_c_macro_ __declare_static_bit_vector(konst_889,1);\
bit_vector_clear(&konst_889);\
konst_889.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_890,1);\
bit_vector_clear(&type_cast_890);\
type_cast_890.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_891,4);\
bit_vector_clear(&konst_891);\
__declare_static_bit_vector(type_cast_892,4);\
bit_vector_clear(&type_cast_892);\
__declare_static_bit_vector(NOT_u4_u4_893,4);\
bit_vector_clear(&NOT_u4_u4_893);\
NOT_u4_u4_893.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_895,32);\
bit_vector_clear(&konst_895);\
__declare_static_bit_vector(type_cast_896,32);\
bit_vector_clear(&type_cast_896);\
bit_vector_clear(&konst_889);\
konst_889.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_890), &(konst_889));\
bit_vector_clear(&konst_891);\
bit_vector_bitcast_to_bit_vector( &(type_cast_892), &(konst_891));\
bit_vector_not( &(type_cast_892), &(NOT_u4_u4_893));\
bit_vector_clear(&konst_895);\
bit_vector_bitcast_to_bit_vector( &(type_cast_896), &(konst_895));\
_AccessRegister_( &(type_cast_890),  &(NOT_u4_u4_893),  &(register_index),  &(type_cast_896), &(rx_queue_pointer_32));\
;

#define _populateRxQueue_assign_stmt_904_c_macro_ __declare_static_bit_vector(konst_901,4);\
bit_vector_clear(&konst_901);\
__declare_static_bit_vector(type_cast_902,4);\
bit_vector_clear(&type_cast_902);\
__declare_static_bit_vector(CONCAT_u32_u36_903,36);\
bit_vector_clear(&konst_901);\
bit_vector_bitcast_to_bit_vector( &(type_cast_902), &(konst_901));\
bit_vector_concatenate( &(rx_queue_pointer_32), &(type_cast_902), &(CONCAT_u32_u36_903));\
bit_vector_cast_to_bit_vector(0, &(rx_queue_pointer_36), &(CONCAT_u32_u36_903));\
;

#define _populateRxQueue_stmt_908_c_macro_ uint32_t _populateRxQueue_stmt_908_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_908_c_macro___print_counter,"got_rx_queue_pointer_pushing_to_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_908_c_macro___print_counter,"rx_queue_pointer_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_queue_pointer_32)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_908_c_macro___print_counter,"rx_queue_pointer_36");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rx_queue_pointer_36)));fflush (__report_log_file__);}__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_907,32);\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_907));\
if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_908_c_macro___print_counter,"NUMBER_OF_SERVERS");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RPIPE_NUMBER_OF_SERVERS_907)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_call_stmt_915_c_macro_ __declare_static_bit_vector(konst_909,1);\
bit_vector_clear(&konst_909);\
__declare_static_bit_vector(type_cast_910,1);\
bit_vector_clear(&type_cast_910);\
__declare_static_bit_vector(slice_913,32);\
bit_vector_clear(&konst_909);\
bit_vector_bitcast_to_bit_vector( &(type_cast_910), &(konst_909));\
bit_vector_slice(&(rx_buffer_pointer), &(slice_913), 4);\
_pushIntoQueue_( &(type_cast_910),  &(rx_queue_pointer_36),  &(slice_913), &(push_status));\
;

#define _populateRxQueue_assign_stmt_925_c_macro_ __declare_static_bit_vector(konst_918,6);\
bit_vector_clear(&konst_918);\
konst_918.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_919,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_920,32);\
__declare_static_bit_vector(konst_921,32);\
bit_vector_clear(&konst_921);\
konst_921.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_922,32);\
__declare_static_bit_vector(type_cast_923,6);\
__declare_static_bit_vector(AND_u6_u6_924,6);\
bit_vector_clear(&konst_918);\
konst_918.val.byte_array[0] = 1;\
bit_vector_plus( &(q_index), &(konst_918), &(ADD_u6_u6_919));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_920));\
bit_vector_clear(&konst_921);\
konst_921.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_920), &(konst_921), &(SUB_u32_u32_922));\
bit_vector_bitcast_to_bit_vector( &(type_cast_923), &(SUB_u32_u32_922));\
bit_vector_and(&(ADD_u6_u6_919), &(type_cast_923), &(AND_u6_u6_924));\
bit_vector_cast_to_bit_vector(0, &(n_q_index), &(AND_u6_u6_924));\
;

#define _populateRxQueue_stmt_928_c_macro_ uint32_t _populateRxQueue_stmt_928_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]populateRxQueue>\t%s\n",_populateRxQueue_stmt_928_c_macro___print_counter,"written_to_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_928_c_macro___print_counter,"n_q_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(n_q_index)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]populateRxQueue>\t\t%s\t\t",_populateRxQueue_stmt_928_c_macro___print_counter,"push_status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(push_status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _populateRxQueue_call_stmt_934_c_macro_ __declare_static_bit_vector(konst_932,32);\
bit_vector_clear(&konst_932);\
konst_932.val.byte_array[0] = 32;\
bit_vector_clear(&konst_932);\
konst_932.val.byte_array[0] = 32;\
_delay_time_( &(konst_932), &(status));\
;

#define _populateRxQueue_assign_stmt_944_c_macro_ write_bit_vector_to_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(q_index));\
;

#define _populateRxQueue_assign_stmt_947_c_macro_ bit_vector_cast_to_bit_vector(0, &(selected_q_index), &(q_index));\
;
;

#define _populateRxQueue_branch_block_stmt_865_c_export_apply_macro_ ;

#define _populateRxQueue_inner_outarg_prep_macro__ ;

#define _processorToNicInterface_inner_inarg_prep_macro__ 
#define _processorToNicInterface_branch_block_stmt_1473_c_export_decl_macro_ __declare_static_bit_vector(rdata0,32);\
__declare_static_bit_vector(rdata1,64);\


#define _processorToNicInterface_merge_stmt_1475_c_preamble_macro_ uint8_t merge_stmt_1475_entry_flag;\
merge_stmt_1475_entry_flag = do_while_entry_flag;\
goto merge_stmt_1475_run;\
merge_stmt_1475_run: ;\

#define _processorToNicInterface_phi_stmt_1476_c_macro_ __declare_static_bit_vector(RPIPE_control_word_request_pipe_0_1478,32);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("control_word_request_pipe_0",&(RPIPE_control_word_request_pipe_0_1478));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_control_word_request_pipe_0_1478));\
}\
else {\
__declare_static_bit_vector(RPIPE_control_word_request_pipe_0_1478,32);\
read_bit_vector_from_pipe("control_word_request_pipe_0",&(RPIPE_control_word_request_pipe_0_1478));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_control_word_request_pipe_0_1478));\
}\
;

#define _processorToNicInterface_phi_stmt_1479_c_macro_ __declare_static_bit_vector(RPIPE_control_word_request_pipe_1_1481,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("control_word_request_pipe_1",&(RPIPE_control_word_request_pipe_1_1481));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_control_word_request_pipe_1_1481));\
}\
else {\
__declare_static_bit_vector(RPIPE_control_word_request_pipe_1_1481,64);\
read_bit_vector_from_pipe("control_word_request_pipe_1",&(RPIPE_control_word_request_pipe_1_1481));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_control_word_request_pipe_1_1481));\
}\
;
;

#define _processorToNicInterface_merge_stmt_1475_c_postamble_macro_ merge_stmt_1475_entry_flag = 0;

#define _processorToNicInterface_stmt_1485_c_macro_ uint32_t _processorToNicInterface_stmt_1485_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]processorToNicInterface>\t%s\n",_processorToNicInterface_stmt_1485_c_macro___print_counter,"got_afb_Req");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]processorToNicInterface>\t\t%s\t\t",_processorToNicInterface_stmt_1485_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]processorToNicInterface>\t\t%s\t\t",_processorToNicInterface_stmt_1485_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _processorToNicInterface_assign_stmt_1492_c_macro_ __declare_static_bit_vector(slice_1489,42);\
__declare_static_bit_vector(CONCAT_u42_u74_1491,74);\
bit_vector_slice(&(rdata1), &(slice_1489), 0);\
bit_vector_concatenate( &(slice_1489), &(rdata0), &(CONCAT_u42_u74_1491));\
write_bit_vector_to_pipe("AFB_NIC_REQUEST",&(CONCAT_u42_u74_1491));\
;
;

#define _processorToNicInterface_branch_block_stmt_1473_c_export_apply_macro_ ;

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
__declare_static_bit_vector(write_pointer,32);\
__declare_static_bit_vector(read_pointer,32);\
__declare_static_bit_vector(round_off,1);\
__declare_static_bit_vector(next_wp,32);\
__declare_static_bit_vector(q_full,1);\

#define _pushIntoQueue_call_stmt_782_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_acquireMutex_( &(q_base_address), &(m_ok));\
}\
;

#define _pushIntoQueue_stmt_786_c_macro_ uint32_t _pushIntoQueue_stmt_786_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]pushIntoQueue>\t%s\n",_pushIntoQueue_stmt_786_c_macro___print_counter,"pushing_to_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_786_c_macro___print_counter,"q_w_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_w_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_786_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _pushIntoQueue_call_stmt_790_c_macro_ _getQueuePointers_( &(q_base_address), &(write_pointer), &(read_pointer));\
;

#define _pushIntoQueue_assign_stmt_797_c_macro_ __declare_static_bit_vector(konst_794,32);\
bit_vector_clear(&konst_794);\
konst_794.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_795,32);\
bit_vector_clear(&SUB_u32_u32_795);\
SUB_u32_u32_795.val.byte_array[0] = 2;\
__declare_static_bit_vector(EQ_u32_u1_796,1);\
bit_vector_clear(&konst_794);\
konst_794.val.byte_array[0] = 1;\
bit_vector_minus( &(QUEUE_SIZE_MASK), &(konst_794), &(SUB_u32_u32_795));\
bit_vector_equal(0, &(write_pointer), &(SUB_u32_u32_795), &(EQ_u32_u1_796));\
bit_vector_cast_to_bit_vector(0, &(round_off), &(EQ_u32_u1_796));\
;

#define _pushIntoQueue_assign_stmt_805_c_macro_ __declare_static_bit_vector(konst_800,32);\
bit_vector_clear(&konst_800);\
__declare_static_bit_vector(konst_802,32);\
bit_vector_clear(&konst_802);\
konst_802.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_803,32);\
__declare_static_bit_vector(MUX_804,32);\
if (has_undefined_bit(&round_off)) {fprintf(stderr, "Error: variable round_off has undefined value (%s) at test point.\n", to_string(&round_off));assert(0);} \
if(bit_vector_to_uint64(0, &round_off)){bit_vector_clear(&konst_800);\
bit_vector_cast_to_bit_vector(0, &(MUX_804), &(konst_800));\
}else {bit_vector_clear(&konst_802);\
konst_802.val.byte_array[0] = 1;\
bit_vector_plus( &(write_pointer), &(konst_802), &(ADD_u32_u32_803));\
bit_vector_cast_to_bit_vector(0, &(MUX_804), &(ADD_u32_u32_803));\
}bit_vector_cast_to_bit_vector(0, &(next_wp), &(MUX_804));\
;

#define _pushIntoQueue_assign_stmt_810_c_macro_ __declare_static_bit_vector(EQ_u32_u1_809,1);\
bit_vector_equal(0, &(next_wp), &(read_pointer), &(EQ_u32_u1_809));\
bit_vector_cast_to_bit_vector(0, &(q_full), &(EQ_u32_u1_809));\
;

#define _pushIntoQueue_stmt_816_c_macro_ uint32_t _pushIntoQueue_stmt_816_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]pushIntoQueue>\t%s\n",_pushIntoQueue_stmt_816_c_macro___print_counter,"pushing_to_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_816_c_macro___print_counter,"q_w_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_w_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_816_c_macro___print_counter,"write_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(write_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_816_c_macro___print_counter,"read_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_816_c_macro___print_counter,"next_wp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(next_wp)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]pushIntoQueue>\t\t%s\t\t",_pushIntoQueue_stmt_816_c_macro___print_counter,"q_full");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_full)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _pushIntoQueue_call_stmt_821_c_macro_ if (has_undefined_bit(&q_full)) {fprintf(stderr, "Error: variable q_full has undefined value (%s) at test point.\n", to_string(&q_full));assert(0);} \
if (!bit_vector_to_uint64(0, &q_full)) {\
_setQueueElement_( &(q_base_address),  &(write_pointer),  &(q_w_data));\
}\
;

#define _pushIntoQueue_call_stmt_826_c_macro_ if (has_undefined_bit(&q_full)) {fprintf(stderr, "Error: variable q_full has undefined value (%s) at test point.\n", to_string(&q_full));assert(0);} \
if (!bit_vector_to_uint64(0, &q_full)) {\
_setQueuePointers_( &(q_base_address),  &(next_wp),  &(read_pointer));\
}\
;

#define _pushIntoQueue_call_stmt_830_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_releaseMutex_( &(q_base_address));\
}\
;

#define _pushIntoQueue_assign_stmt_834_c_macro_ __declare_static_bit_vector(NOT_u1_u1_833,1);\
bit_vector_not( &(q_full), &(NOT_u1_u1_833));\
bit_vector_cast_to_bit_vector(0, &(status), &(NOT_u1_u1_833));\
;

#define _pushIntoQueue_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _releaseMutex_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(ignore,64);\

#define _releaseMutex_call_stmt_471_c_macro_ __declare_static_bit_vector(konst_457,1);\
bit_vector_clear(&konst_457);\
__declare_static_bit_vector(type_cast_458,1);\
bit_vector_clear(&type_cast_458);\
__declare_static_bit_vector(konst_459,1);\
bit_vector_clear(&konst_459);\
__declare_static_bit_vector(type_cast_460,1);\
bit_vector_clear(&type_cast_460);\
__declare_static_bit_vector(konst_461,4);\
bit_vector_clear(&konst_461);\
__declare_static_bit_vector(type_cast_462,4);\
bit_vector_clear(&type_cast_462);\
__declare_static_bit_vector(NOT_u4_u4_463,4);\
bit_vector_clear(&NOT_u4_u4_463);\
NOT_u4_u4_463.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_464,4);\
bit_vector_clear(&konst_464);\
__declare_static_bit_vector(type_cast_465,4);\
bit_vector_clear(&type_cast_465);\
__declare_static_bit_vector(CONCAT_u4_u8_466,8);\
bit_vector_clear(&CONCAT_u4_u8_466);\
CONCAT_u4_u8_466.val.byte_array[0] = 240;\
__declare_static_bit_vector(konst_468,64);\
bit_vector_clear(&konst_468);\
__declare_static_bit_vector(type_cast_469,64);\
bit_vector_clear(&type_cast_469);\
bit_vector_clear(&konst_457);\
bit_vector_bitcast_to_bit_vector( &(type_cast_458), &(konst_457));\
bit_vector_clear(&konst_459);\
bit_vector_bitcast_to_bit_vector( &(type_cast_460), &(konst_459));\
bit_vector_clear(&konst_461);\
bit_vector_bitcast_to_bit_vector( &(type_cast_462), &(konst_461));\
bit_vector_not( &(type_cast_462), &(NOT_u4_u4_463));\
bit_vector_clear(&konst_464);\
bit_vector_bitcast_to_bit_vector( &(type_cast_465), &(konst_464));\
bit_vector_concatenate( &(NOT_u4_u4_463), &(type_cast_465), &(CONCAT_u4_u8_466));\
bit_vector_clear(&konst_468);\
bit_vector_bitcast_to_bit_vector( &(type_cast_469), &(konst_468));\
_accessMemory_( &(type_cast_458),  &(type_cast_460),  &(CONCAT_u4_u8_466),  &(q_base_address),  &(type_cast_469), &(ignore));\
;

#define _releaseMutex_inner_outarg_prep_macro__ ;

#define _setQueueElement_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(write_pointer,32);\
bit_vector_cast_to_bit_vector(0, &(write_pointer), &((*__pwrite_pointer)));\
__declare_static_bit_vector(q_w_data,32);\
bit_vector_cast_to_bit_vector(0, &(q_w_data), &((*__pq_w_data)));\
__declare_static_bit_vector(buffer_address,36);\
__declare_static_bit_vector(element_pair_address,36);\
__declare_static_bit_vector(bmask,8);\
__declare_static_bit_vector(wval,64);\
__declare_static_bit_vector(ignore,64);\

#define _setQueueElement_assign_stmt_716_c_macro_ __declare_static_bit_vector(konst_713,36);\
bit_vector_clear(&konst_713);\
konst_713.val.byte_array[0] = 16;\
__declare_static_bit_vector(type_cast_714,36);\
bit_vector_clear(&type_cast_714);\
type_cast_714.val.byte_array[0] = 16;\
__declare_static_bit_vector(ADD_u36_u36_715,36);\
bit_vector_clear(&konst_713);\
konst_713.val.byte_array[0] = 16;\
bit_vector_bitcast_to_bit_vector( &(type_cast_714), &(konst_713));\
bit_vector_plus( &(q_base_address), &(type_cast_714), &(ADD_u36_u36_715));\
bit_vector_cast_to_bit_vector(0, &(buffer_address), &(ADD_u36_u36_715));\
;

#define _setQueueElement_assign_stmt_726_c_macro_ __declare_static_bit_vector(slice_720,31);\
__declare_static_bit_vector(konst_721,3);\
bit_vector_clear(&konst_721);\
__declare_static_bit_vector(type_cast_722,3);\
bit_vector_clear(&type_cast_722);\
__declare_static_bit_vector(CONCAT_u31_u34_723,34);\
__declare_static_bit_vector(type_cast_724,36);\
__declare_static_bit_vector(ADD_u36_u36_725,36);\
bit_vector_slice(&(write_pointer), &(slice_720), 1);\
bit_vector_clear(&konst_721);\
bit_vector_bitcast_to_bit_vector( &(type_cast_722), &(konst_721));\
bit_vector_concatenate( &(slice_720), &(type_cast_722), &(CONCAT_u31_u34_723));\
bit_vector_bitcast_to_bit_vector( &(type_cast_724), &(CONCAT_u31_u34_723));\
bit_vector_plus( &(buffer_address), &(type_cast_724), &(ADD_u36_u36_725));\
bit_vector_cast_to_bit_vector(0, &(element_pair_address), &(ADD_u36_u36_725));\
;

#define _setQueueElement_assign_stmt_744_c_macro_ __declare_static_bit_vector(konst_729,32);\
bit_vector_clear(&konst_729);\
__declare_static_bit_vector(BITSEL_u32_u1_730,1);\
__declare_static_bit_vector(konst_731,4);\
bit_vector_clear(&konst_731);\
__declare_static_bit_vector(type_cast_732,4);\
bit_vector_clear(&type_cast_732);\
__declare_static_bit_vector(konst_733,4);\
bit_vector_clear(&konst_733);\
__declare_static_bit_vector(type_cast_734,4);\
bit_vector_clear(&type_cast_734);\
__declare_static_bit_vector(NOT_u4_u4_735,4);\
bit_vector_clear(&NOT_u4_u4_735);\
NOT_u4_u4_735.val.byte_array[0] = 255;\
__declare_static_bit_vector(CONCAT_u4_u8_736,8);\
bit_vector_clear(&CONCAT_u4_u8_736);\
CONCAT_u4_u8_736.val.byte_array[0] = 15;\
__declare_static_bit_vector(konst_737,4);\
bit_vector_clear(&konst_737);\
__declare_static_bit_vector(type_cast_738,4);\
bit_vector_clear(&type_cast_738);\
__declare_static_bit_vector(NOT_u4_u4_739,4);\
bit_vector_clear(&NOT_u4_u4_739);\
NOT_u4_u4_739.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_740,4);\
bit_vector_clear(&konst_740);\
__declare_static_bit_vector(type_cast_741,4);\
bit_vector_clear(&type_cast_741);\
__declare_static_bit_vector(CONCAT_u4_u8_742,8);\
bit_vector_clear(&CONCAT_u4_u8_742);\
CONCAT_u4_u8_742.val.byte_array[0] = 240;\
__declare_static_bit_vector(MUX_743,8);\
bit_vector_clear(&konst_729);\
bit_vector_bitsel( &(write_pointer), &(konst_729), &(BITSEL_u32_u1_730));\
if (has_undefined_bit(&BITSEL_u32_u1_730)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_730 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_730));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_730)){bit_vector_clear(&konst_731);\
bit_vector_bitcast_to_bit_vector( &(type_cast_732), &(konst_731));\
bit_vector_clear(&konst_733);\
bit_vector_bitcast_to_bit_vector( &(type_cast_734), &(konst_733));\
bit_vector_not( &(type_cast_734), &(NOT_u4_u4_735));\
bit_vector_concatenate( &(type_cast_732), &(NOT_u4_u4_735), &(CONCAT_u4_u8_736));\
bit_vector_cast_to_bit_vector(0, &(MUX_743), &(CONCAT_u4_u8_736));\
}else {bit_vector_clear(&konst_737);\
bit_vector_bitcast_to_bit_vector( &(type_cast_738), &(konst_737));\
bit_vector_not( &(type_cast_738), &(NOT_u4_u4_739));\
bit_vector_clear(&konst_740);\
bit_vector_bitcast_to_bit_vector( &(type_cast_741), &(konst_740));\
bit_vector_concatenate( &(NOT_u4_u4_739), &(type_cast_741), &(CONCAT_u4_u8_742));\
bit_vector_cast_to_bit_vector(0, &(MUX_743), &(CONCAT_u4_u8_742));\
}bit_vector_cast_to_bit_vector(0, &(bmask), &(MUX_743));\
;

#define _setQueueElement_assign_stmt_758_c_macro_ __declare_static_bit_vector(konst_747,32);\
bit_vector_clear(&konst_747);\
__declare_static_bit_vector(BITSEL_u32_u1_748,1);\
__declare_static_bit_vector(konst_749,32);\
bit_vector_clear(&konst_749);\
__declare_static_bit_vector(type_cast_750,32);\
bit_vector_clear(&type_cast_750);\
__declare_static_bit_vector(CONCAT_u32_u64_752,64);\
__declare_static_bit_vector(konst_754,32);\
bit_vector_clear(&konst_754);\
__declare_static_bit_vector(type_cast_755,32);\
bit_vector_clear(&type_cast_755);\
__declare_static_bit_vector(CONCAT_u32_u64_756,64);\
__declare_static_bit_vector(MUX_757,64);\
bit_vector_clear(&konst_747);\
bit_vector_bitsel( &(write_pointer), &(konst_747), &(BITSEL_u32_u1_748));\
if (has_undefined_bit(&BITSEL_u32_u1_748)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_748 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_748));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_748)){bit_vector_clear(&konst_749);\
bit_vector_bitcast_to_bit_vector( &(type_cast_750), &(konst_749));\
bit_vector_concatenate( &(type_cast_750), &(q_w_data), &(CONCAT_u32_u64_752));\
bit_vector_cast_to_bit_vector(0, &(MUX_757), &(CONCAT_u32_u64_752));\
}else {bit_vector_clear(&konst_754);\
bit_vector_bitcast_to_bit_vector( &(type_cast_755), &(konst_754));\
bit_vector_concatenate( &(q_w_data), &(type_cast_755), &(CONCAT_u32_u64_756));\
bit_vector_cast_to_bit_vector(0, &(MUX_757), &(CONCAT_u32_u64_756));\
}bit_vector_cast_to_bit_vector(0, &(wval), &(MUX_757));\
;

#define _setQueueElement_stmt_763_c_macro_ uint32_t _setQueueElement_stmt_763_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]setQueueElement>\t%s\n",_setQueueElement_stmt_763_c_macro___print_counter,"addresses");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_763_c_macro___print_counter,"element_pair_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(element_pair_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_763_c_macro___print_counter,"q_w_data");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_w_data)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_763_c_macro___print_counter,"bmask");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(bmask)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueueElement>\t\t%s\t\t",_setQueueElement_stmt_763_c_macro___print_counter,"wval");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wval)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _setQueueElement_call_stmt_772_c_macro_ __declare_static_bit_vector(konst_764,1);\
bit_vector_clear(&konst_764);\
__declare_static_bit_vector(type_cast_765,1);\
bit_vector_clear(&type_cast_765);\
__declare_static_bit_vector(konst_766,1);\
bit_vector_clear(&konst_766);\
__declare_static_bit_vector(type_cast_767,1);\
bit_vector_clear(&type_cast_767);\
bit_vector_clear(&konst_764);\
bit_vector_bitcast_to_bit_vector( &(type_cast_765), &(konst_764));\
bit_vector_clear(&konst_766);\
bit_vector_bitcast_to_bit_vector( &(type_cast_767), &(konst_766));\
_accessMemory_( &(type_cast_765),  &(type_cast_767),  &(bmask),  &(element_pair_address),  &(wval), &(ignore));\
;

#define _setQueueElement_inner_outarg_prep_macro__ ;

#define _setQueuePointers_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(wp,32);\
bit_vector_cast_to_bit_vector(0, &(wp), &((*__pwp)));\
__declare_static_bit_vector(rp,32);\
bit_vector_cast_to_bit_vector(0, &(rp), &((*__prp)));\
__declare_static_bit_vector(ignore,64);\

#define _setQueuePointers_stmt_438_c_macro_ uint32_t _setQueuePointers_stmt_438_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]setQueuePointers>\t%s\n",_setQueuePointers_stmt_438_c_macro___print_counter,"set");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueuePointers>\t\t%s\t\t",_setQueuePointers_stmt_438_c_macro___print_counter,"q_base_address");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(q_base_address)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueuePointers>\t\t%s\t\t",_setQueuePointers_stmt_438_c_macro___print_counter,"wp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wp)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]setQueuePointers>\t\t%s\t\t",_setQueuePointers_stmt_438_c_macro___print_counter,"rp");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rp)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _setQueuePointers_call_stmt_453_c_macro_ __declare_static_bit_vector(konst_439,1);\
bit_vector_clear(&konst_439);\
__declare_static_bit_vector(type_cast_440,1);\
bit_vector_clear(&type_cast_440);\
__declare_static_bit_vector(konst_441,1);\
bit_vector_clear(&konst_441);\
__declare_static_bit_vector(type_cast_442,1);\
bit_vector_clear(&type_cast_442);\
__declare_static_bit_vector(konst_443,8);\
bit_vector_clear(&konst_443);\
__declare_static_bit_vector(type_cast_444,8);\
bit_vector_clear(&type_cast_444);\
__declare_static_bit_vector(NOT_u8_u8_445,8);\
bit_vector_clear(&NOT_u8_u8_445);\
NOT_u8_u8_445.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_447,36);\
bit_vector_clear(&konst_447);\
konst_447.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_448,36);\
__declare_static_bit_vector(CONCAT_u32_u64_451,64);\
bit_vector_clear(&konst_439);\
bit_vector_bitcast_to_bit_vector( &(type_cast_440), &(konst_439));\
bit_vector_clear(&konst_441);\
bit_vector_bitcast_to_bit_vector( &(type_cast_442), &(konst_441));\
bit_vector_clear(&konst_443);\
bit_vector_bitcast_to_bit_vector( &(type_cast_444), &(konst_443));\
bit_vector_not( &(type_cast_444), &(NOT_u8_u8_445));\
bit_vector_clear(&konst_447);\
konst_447.val.byte_array[0] = 8;\
bit_vector_plus( &(q_base_address), &(konst_447), &(ADD_u36_u36_448));\
bit_vector_concatenate( &(wp), &(rp), &(CONCAT_u32_u64_451));\
_accessMemory_( &(type_cast_440),  &(type_cast_442),  &(NOT_u8_u8_445),  &(ADD_u36_u36_448),  &(CONCAT_u32_u64_451), &(ignore));\
;

#define _setQueuePointers_inner_outarg_prep_macro__ ;

#define _transmitEngineDaemon_inner_inarg_prep_macro__ 
#define _transmitEngineDaemon_assign_stmt_1628_c_macro_ __declare_static_bit_vector(konst_1627,6);\
bit_vector_clear(&konst_1627);\
bit_vector_clear(&konst_1627);\
write_bit_vector_to_pipe("LAST_READ_TX_QUEUE_INDEX",&(konst_1627));\
;

#define _transmitEngineDaemon_branch_block_stmt_1629_c_export_decl_macro_ __declare_static_bit_vector(tx_q_index,6);\
__declare_static_bit_vector(pkt_pointer,32);\
__declare_static_bit_vector(tx_flag,1);\
__declare_static_bit_vector(transmitted_flag,1);\
__declare_static_bit_vector(push_pointer_back_to_free_Q,1);\
__declare_static_bit_vector(push_status,1);\


#define _transmitEngineDaemon_merge_stmt_1630_c_preamble_macro_ uint8_t merge_stmt_1630_entry_flag;\
merge_stmt_1630_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_1629_flag = 0;\
uint8_t disable_loopback_1629_flag = 0;\
goto merge_stmt_1630_run;\
not_enabled_yet_loopback_1629: not_enabled_yet_loopback_1629_flag = 1;\
disable_loopback_1629_flag = 0;\
goto merge_stmt_1630_run;\
disable_loopback_1629: disable_loopback_1629_flag = 1;\
not_enabled_yet_loopback_1629_flag = 0;\
goto merge_stmt_1630_run;\
merge_stmt_1630_run: ;\
;

#define _transmitEngineDaemon_merge_stmt_1630_c_postamble_macro_ not_enabled_yet_loopback_1629_flag = 0;\
disable_loopback_1629_flag = 0;\
merge_stmt_1630_entry_flag = 0;

#define _transmitEngineDaemon_stmt_1638_c_macro_ uint32_t _transmitEngineDaemon_stmt_1638_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_1638_c_macro___print_counter,"got_control");release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_merge_stmt_1640_c_preamble_macro_ uint8_t merge_stmt_1640_entry_flag;\
merge_stmt_1640_entry_flag = do_while_entry_flag;\
goto merge_stmt_1640_run;\
merge_stmt_1640_run: ;\

#define _transmitEngineDaemon_phi_stmt_1641_c_macro_ __declare_static_bit_vector(RPIPE_LAST_READ_TX_QUEUE_INDEX_1643,6);\
__declare_static_bit_vector(konst_1644,6);\
bit_vector_clear(&konst_1644);\
konst_1644.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1645,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1646,32);\
__declare_static_bit_vector(konst_1647,32);\
bit_vector_clear(&konst_1647);\
konst_1647.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1648,32);\
__declare_static_bit_vector(type_cast_1649,6);\
__declare_static_bit_vector(AND_u6_u6_1650,6);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("LAST_READ_TX_QUEUE_INDEX",&(RPIPE_LAST_READ_TX_QUEUE_INDEX_1643));\
bit_vector_clear(&konst_1644);\
konst_1644.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_READ_TX_QUEUE_INDEX_1643), &(konst_1644), &(ADD_u6_u6_1645));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1646));\
bit_vector_clear(&konst_1647);\
konst_1647.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_1646), &(konst_1647), &(SUB_u32_u32_1648));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1649), &(SUB_u32_u32_1648));\
bit_vector_and(&(ADD_u6_u6_1645), &(type_cast_1649), &(AND_u6_u6_1650));\
bit_vector_cast_to_bit_vector(0, &(tx_q_index), &(AND_u6_u6_1650));\
}\
else {\
__declare_static_bit_vector(RPIPE_LAST_READ_TX_QUEUE_INDEX_1643,6);\
__declare_static_bit_vector(konst_1644,6);\
bit_vector_clear(&konst_1644);\
konst_1644.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1645,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1646,32);\
__declare_static_bit_vector(konst_1647,32);\
bit_vector_clear(&konst_1647);\
konst_1647.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1648,32);\
__declare_static_bit_vector(type_cast_1649,6);\
__declare_static_bit_vector(AND_u6_u6_1650,6);\
read_bit_vector_from_pipe("LAST_READ_TX_QUEUE_INDEX",&(RPIPE_LAST_READ_TX_QUEUE_INDEX_1643));\
bit_vector_clear(&konst_1644);\
konst_1644.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_READ_TX_QUEUE_INDEX_1643), &(konst_1644), &(ADD_u6_u6_1645));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1646));\
bit_vector_clear(&konst_1647);\
konst_1647.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_1646), &(konst_1647), &(SUB_u32_u32_1648));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1649), &(SUB_u32_u32_1648));\
bit_vector_and(&(ADD_u6_u6_1645), &(type_cast_1649), &(AND_u6_u6_1650));\
bit_vector_cast_to_bit_vector(0, &(tx_q_index), &(AND_u6_u6_1650));\
}\
;
;

#define _transmitEngineDaemon_merge_stmt_1640_c_postamble_macro_ merge_stmt_1640_entry_flag = 0;

#define _transmitEngineDaemon_stmt_1653_c_macro_ uint32_t _transmitEngineDaemon_stmt_1653_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_1653_c_macro___print_counter,"trying_to_get_pointer_from_tx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_1653_c_macro___print_counter,"tx_q_index");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(tx_q_index)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_call_stmt_1657_c_macro_ _getTxPacketPointerFromServer_( &(tx_q_index), &(pkt_pointer), &(tx_flag));\
;

#define _transmitEngineDaemon_call_stmt_1661_c_macro_ if (has_undefined_bit(&tx_flag)) {fprintf(stderr, "Error: variable tx_flag has undefined value (%s) at test point.\n", to_string(&tx_flag));assert(0);} \
if (!bit_vector_to_uint64(0, &tx_flag)) {\
_transmitPacket_( &(pkt_pointer), &(transmitted_flag));\
}\
;

#define _transmitEngineDaemon_stmt_1665_c_macro_ if (!bit_vector_to_uint64(0, &tx_flag)) {\
uint32_t _transmitEngineDaemon_stmt_1665_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_1665_c_macro___print_counter,"got_pointer_now_transmitting_packet");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_1665_c_macro___print_counter,"pkt_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(pkt_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_1665_c_macro___print_counter,"tx_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(tx_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);};

#define _transmitEngineDaemon_stmt_1668_c_macro_ if (!bit_vector_to_uint64(0, &tx_flag)) {\
uint32_t _transmitEngineDaemon_stmt_1668_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_1668_c_macro___print_counter,"packet_transmitted");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_1668_c_macro___print_counter,"transmitted_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(transmitted_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);};

#define _transmitEngineDaemon_assign_stmt_1674_c_macro_ __declare_static_bit_vector(NOT_u1_u1_1671,1);\
__declare_static_bit_vector(AND_u1_u1_1673,1);\
bit_vector_not( &(tx_flag), &(NOT_u1_u1_1671));\
bit_vector_and(&(NOT_u1_u1_1671), &(transmitted_flag), &(AND_u1_u1_1673));\
bit_vector_cast_to_bit_vector(0, &(push_pointer_back_to_free_Q), &(AND_u1_u1_1673));\
;

#define _transmitEngineDaemon_stmt_1676_c_macro_ uint32_t _transmitEngineDaemon_stmt_1676_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_1676_c_macro___print_counter,"pushing_back_to_free_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_1676_c_macro___print_counter,"push_pointer_back_to_free_Q");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(push_pointer_back_to_free_Q)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_call_stmt_1683_c_macro_ if (has_undefined_bit(&push_pointer_back_to_free_Q)) {fprintf(stderr, "Error: variable push_pointer_back_to_free_Q has undefined value (%s) at test point.\n", to_string(&push_pointer_back_to_free_Q));assert(0);} \
__declare_static_bit_vector(konst_1678,1);\
bit_vector_clear(&konst_1678);\
konst_1678.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1679,1);\
bit_vector_clear(&type_cast_1679);\
type_cast_1679.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_1680,36);\
if (bit_vector_to_uint64(0, &push_pointer_back_to_free_Q)) {\
bit_vector_clear(&konst_1678);\
konst_1678.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1679), &(konst_1678));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_1680));\
_pushIntoQueue_( &(type_cast_1679),  &(RPIPE_FREE_Q_1680),  &(pkt_pointer), &(push_status));\
}\
;

#define _transmitEngineDaemon_stmt_1685_c_macro_ uint32_t _transmitEngineDaemon_stmt_1685_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t%s\n",_transmitEngineDaemon_stmt_1685_c_macro___print_counter,"pushed_back_to_free_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitEngineDaemon>\t\t%s\t\t",_transmitEngineDaemon_stmt_1685_c_macro___print_counter,"push_status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(push_status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitEngineDaemon_assign_stmt_1688_c_macro_ write_bit_vector_to_pipe("LAST_READ_TX_QUEUE_INDEX",&(tx_q_index));\
;
;

#define _transmitEngineDaemon_branch_block_stmt_1629_c_export_apply_macro_ ;

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

#define _transmitPacket_assign_stmt_1507_c_macro_ __declare_static_bit_vector(slice_1502,32);\
__declare_static_bit_vector(konst_1503,4);\
bit_vector_clear(&konst_1503);\
__declare_static_bit_vector(type_cast_1504,4);\
bit_vector_clear(&type_cast_1504);\
__declare_static_bit_vector(CONCAT_u32_u36_1505,36);\
__declare_static_bit_vector(type_cast_1506,36);\
bit_vector_slice(&(packet_pointer), &(slice_1502), 0);\
bit_vector_clear(&konst_1503);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1504), &(konst_1503));\
bit_vector_concatenate( &(slice_1502), &(type_cast_1504), &(CONCAT_u32_u36_1505));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1506), &(CONCAT_u32_u36_1505));\
bit_vector_cast_to_bit_vector(0, &(control_data_addr), &(type_cast_1506));\
;

#define _transmitPacket_stmt_1510_c_macro_ uint32_t _transmitPacket_stmt_1510_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1510_c_macro___print_counter,"control_data_addr_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1510_c_macro___print_counter,"packet_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1510_c_macro___print_counter,"control_data_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(control_data_addr)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_call_stmt_1520_c_macro_ __declare_static_bit_vector(konst_1511,1);\
bit_vector_clear(&konst_1511);\
__declare_static_bit_vector(type_cast_1512,1);\
bit_vector_clear(&type_cast_1512);\
__declare_static_bit_vector(konst_1513,1);\
bit_vector_clear(&konst_1513);\
konst_1513.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1514,1);\
bit_vector_clear(&type_cast_1514);\
type_cast_1514.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1517,64);\
bit_vector_clear(&konst_1517);\
__declare_static_bit_vector(type_cast_1518,64);\
bit_vector_clear(&type_cast_1518);\
bit_vector_clear(&konst_1511);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1512), &(konst_1511));\
bit_vector_clear(&konst_1513);\
konst_1513.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1514), &(konst_1513));\
bit_vector_clear(&konst_1517);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1518), &(konst_1517));\
_accessMemory_( &(type_cast_1512),  &(type_cast_1514),  &(FULL_BYTE_MASK),  &(control_data_addr),  &(type_cast_1518), &(control_data));\
;

#define _transmitPacket_assign_stmt_1525_c_macro_ __declare_static_bit_vector(slice_1524,44);\
bit_vector_slice(&(control_data), &(slice_1524), 16);\
bit_vector_cast_to_bit_vector(0, &(unused), &(slice_1524));\
;

#define _transmitPacket_assign_stmt_1529_c_macro_ __declare_static_bit_vector(slice_1528,8);\
bit_vector_slice(&(control_data), &(slice_1528), 8);\
bit_vector_cast_to_bit_vector(0, &(packet_size), &(slice_1528));\
;

#define _transmitPacket_assign_stmt_1533_c_macro_ __declare_static_bit_vector(slice_1532,8);\
bit_vector_slice(&(control_data), &(slice_1532), 0);\
bit_vector_cast_to_bit_vector(0, &(last_tkeep), &(slice_1532));\
;

#define _transmitPacket_stmt_1536_c_macro_ uint32_t _transmitPacket_stmt_1536_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1536_c_macro___print_counter,"control_data_received_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1536_c_macro___print_counter,"packet_size");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_size)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1536_c_macro___print_counter,"last_tkeep");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(last_tkeep)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_branch_block_stmt_1537_c_export_decl_macro_ __declare_static_bit_vector(count_down,8);\
__declare_static_bit_vector(mem_addr,36);\
__declare_static_bit_vector(data,64);\
__declare_static_bit_vector(ncount_down,8);\
__declare_static_bit_vector(nmem_addr,36);\
__declare_static_bit_vector(not_last_word,1);\
__declare_static_bit_vector(last_word,64);\


#define _transmitPacket_merge_stmt_1539_c_preamble_macro_ uint8_t merge_stmt_1539_entry_flag;\
merge_stmt_1539_entry_flag = do_while_entry_flag;\
goto merge_stmt_1539_run;\
merge_stmt_1539_run: ;\

#define _transmitPacket_phi_stmt_1540_c_macro_ __declare_static_bit_vector(konst_1543,8);\
bit_vector_clear(&konst_1543);\
konst_1543.val.byte_array[0] = 16;\
__declare_static_bit_vector(SUB_u8_u8_1544,8);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(count_down), &(ncount_down));\
}\
else {\
__declare_static_bit_vector(konst_1543,8);\
bit_vector_clear(&konst_1543);\
konst_1543.val.byte_array[0] = 16;\
__declare_static_bit_vector(SUB_u8_u8_1544,8);\
bit_vector_clear(&konst_1543);\
konst_1543.val.byte_array[0] = 16;\
bit_vector_minus( &(packet_size), &(konst_1543), &(SUB_u8_u8_1544));\
bit_vector_cast_to_bit_vector(0, &(count_down), &(SUB_u8_u8_1544));\
}\
;

#define _transmitPacket_phi_stmt_1546_c_macro_ __declare_static_bit_vector(konst_1549,36);\
bit_vector_clear(&konst_1549);\
konst_1549.val.byte_array[0] = 24;\
__declare_static_bit_vector(ADD_u36_u36_1550,36);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(mem_addr), &(nmem_addr));\
}\
else {\
__declare_static_bit_vector(konst_1549,36);\
bit_vector_clear(&konst_1549);\
konst_1549.val.byte_array[0] = 24;\
__declare_static_bit_vector(ADD_u36_u36_1550,36);\
bit_vector_clear(&konst_1549);\
konst_1549.val.byte_array[0] = 24;\
bit_vector_plus( &(control_data_addr), &(konst_1549), &(ADD_u36_u36_1550));\
bit_vector_cast_to_bit_vector(0, &(mem_addr), &(ADD_u36_u36_1550));\
}\
;
;

#define _transmitPacket_merge_stmt_1539_c_postamble_macro_ merge_stmt_1539_entry_flag = 0;

#define _transmitPacket_call_stmt_1562_c_macro_ __declare_static_bit_vector(konst_1553,1);\
bit_vector_clear(&konst_1553);\
__declare_static_bit_vector(type_cast_1554,1);\
bit_vector_clear(&type_cast_1554);\
__declare_static_bit_vector(konst_1555,1);\
bit_vector_clear(&konst_1555);\
konst_1555.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1556,1);\
bit_vector_clear(&type_cast_1556);\
type_cast_1556.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1559,64);\
bit_vector_clear(&konst_1559);\
__declare_static_bit_vector(type_cast_1560,64);\
bit_vector_clear(&type_cast_1560);\
bit_vector_clear(&konst_1553);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1554), &(konst_1553));\
bit_vector_clear(&konst_1555);\
konst_1555.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1556), &(konst_1555));\
bit_vector_clear(&konst_1559);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1560), &(konst_1559));\
_accessMemory_( &(type_cast_1554),  &(type_cast_1556),  &(FULL_BYTE_MASK),  &(mem_addr),  &(type_cast_1560), &(data));\
;

#define _transmitPacket_assign_stmt_1570_c_macro_ __declare_static_bit_vector(konst_1564,1);\
bit_vector_clear(&konst_1564);\
__declare_static_bit_vector(type_cast_1565,1);\
bit_vector_clear(&type_cast_1565);\
__declare_static_bit_vector(CONCAT_u1_u65_1567,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1569,73);\
bit_vector_clear(&konst_1564);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1565), &(konst_1564));\
bit_vector_concatenate( &(type_cast_1565), &(data), &(CONCAT_u1_u65_1567));\
bit_vector_concatenate( &(CONCAT_u1_u65_1567), &(FULL_BYTE_MASK), &(CONCAT_u65_u73_1569));\
write_bit_vector_to_pipe("nic_to_mac_transmit_pipe",&(CONCAT_u65_u73_1569));\
;

#define _transmitPacket_assign_stmt_1575_c_macro_ __declare_static_bit_vector(konst_1573,8);\
bit_vector_clear(&konst_1573);\
konst_1573.val.byte_array[0] = 8;\
__declare_static_bit_vector(SUB_u8_u8_1574,8);\
bit_vector_clear(&konst_1573);\
konst_1573.val.byte_array[0] = 8;\
bit_vector_minus( &(count_down), &(konst_1573), &(SUB_u8_u8_1574));\
bit_vector_cast_to_bit_vector(0, &(ncount_down), &(SUB_u8_u8_1574));\
;

#define _transmitPacket_assign_stmt_1580_c_macro_ __declare_static_bit_vector(konst_1578,36);\
bit_vector_clear(&konst_1578);\
konst_1578.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_1579,36);\
bit_vector_clear(&konst_1578);\
konst_1578.val.byte_array[0] = 8;\
bit_vector_plus( &(mem_addr), &(konst_1578), &(ADD_u36_u36_1579));\
bit_vector_cast_to_bit_vector(0, &(nmem_addr), &(ADD_u36_u36_1579));\
;

#define _transmitPacket_stmt_1585_c_macro_ uint32_t _transmitPacket_stmt_1585_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1585_c_macro___print_counter,"count_down_");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1585_c_macro___print_counter,"count_down");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(count_down)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1585_c_macro___print_counter,"ncount_down");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ncount_down)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1585_c_macro___print_counter,"mem_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(mem_addr)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1585_c_macro___print_counter,"nmem_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nmem_addr)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_assign_stmt_1590_c_macro_ __declare_static_bit_vector(konst_1588,8);\
bit_vector_clear(&konst_1588);\
konst_1588.val.byte_array[0] = 8;\
__declare_static_bit_vector(UGT_u8_u1_1589,1);\
bit_vector_clear(&konst_1588);\
konst_1588.val.byte_array[0] = 8;\
bit_vector_greater(0, &(ncount_down), &(konst_1588), &(UGT_u8_u1_1589));\
bit_vector_cast_to_bit_vector(0, &(not_last_word), &(UGT_u8_u1_1589));\
;

#define _transmitPacket_stmt_1594_c_macro_ uint32_t _transmitPacket_stmt_1594_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1594_c_macro___print_counter,"accessing_last_word");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1594_c_macro___print_counter,"nmem_addr");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nmem_addr)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_call_stmt_1604_c_macro_ __declare_static_bit_vector(konst_1595,1);\
bit_vector_clear(&konst_1595);\
__declare_static_bit_vector(type_cast_1596,1);\
bit_vector_clear(&type_cast_1596);\
__declare_static_bit_vector(konst_1597,1);\
bit_vector_clear(&konst_1597);\
konst_1597.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1598,1);\
bit_vector_clear(&type_cast_1598);\
type_cast_1598.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1601,64);\
bit_vector_clear(&konst_1601);\
__declare_static_bit_vector(type_cast_1602,64);\
bit_vector_clear(&type_cast_1602);\
bit_vector_clear(&konst_1595);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1596), &(konst_1595));\
bit_vector_clear(&konst_1597);\
konst_1597.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1598), &(konst_1597));\
bit_vector_clear(&konst_1601);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1602), &(konst_1601));\
_accessMemory_( &(type_cast_1596),  &(type_cast_1598),  &(FULL_BYTE_MASK),  &(nmem_addr),  &(type_cast_1602), &(last_word));\
;

#define _transmitPacket_stmt_1606_c_macro_ uint32_t _transmitPacket_stmt_1606_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]transmitPacket>\t%s\n",_transmitPacket_stmt_1606_c_macro___print_counter,"sending_last_word");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]transmitPacket>\t\t%s\t\t",_transmitPacket_stmt_1606_c_macro___print_counter,"last_word");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(last_word)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _transmitPacket_assign_stmt_1614_c_macro_ __declare_static_bit_vector(konst_1608,1);\
bit_vector_clear(&konst_1608);\
konst_1608.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1609,1);\
bit_vector_clear(&type_cast_1609);\
type_cast_1609.val.byte_array[0] = 1;\
__declare_static_bit_vector(CONCAT_u1_u65_1611,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1613,73);\
bit_vector_clear(&konst_1608);\
konst_1608.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1609), &(konst_1608));\
bit_vector_concatenate( &(type_cast_1609), &(last_word), &(CONCAT_u1_u65_1611));\
bit_vector_concatenate( &(CONCAT_u1_u65_1611), &(last_tkeep), &(CONCAT_u65_u73_1613));\
write_bit_vector_to_pipe("nic_to_mac_transmit_pipe",&(CONCAT_u65_u73_1613));\
;

#define _transmitPacket_assign_stmt_1622_c_macro_ __declare_static_bit_vector(SUB_u36_u36_1619,36);\
__declare_static_bit_vector(type_cast_1620,8);\
__declare_static_bit_vector(EQ_u8_u1_1621,1);\
bit_vector_minus( &(nmem_addr), &(control_data_addr), &(SUB_u36_u36_1619));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1620), &(SUB_u36_u36_1619));\
bit_vector_equal(0, &(packet_size), &(type_cast_1620), &(EQ_u8_u1_1621));\
bit_vector_cast_to_bit_vector(0, &(status), &(EQ_u8_u1_1621));\
;
;

#define _transmitPacket_branch_block_stmt_1537_c_export_apply_macro_ ;

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

#define _writeControlInformationToMem_assign_stmt_678_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_676,16);\
__declare_static_bit_vector(type_cast_677,64);\
bit_vector_concatenate( &(packet_size), &(last_keep), &(CONCAT_u8_u16_676));\
bit_vector_bitcast_to_bit_vector( &(type_cast_677), &(CONCAT_u8_u16_676));\
bit_vector_cast_to_bit_vector(0, &(control_data), &(type_cast_677));\
;

#define _writeControlInformationToMem_call_stmt_687_c_macro_ __declare_static_bit_vector(konst_679,1);\
bit_vector_clear(&konst_679);\
__declare_static_bit_vector(type_cast_680,1);\
bit_vector_clear(&type_cast_680);\
__declare_static_bit_vector(konst_681,1);\
bit_vector_clear(&konst_681);\
__declare_static_bit_vector(type_cast_682,1);\
bit_vector_clear(&type_cast_682);\
bit_vector_clear(&konst_679);\
bit_vector_bitcast_to_bit_vector( &(type_cast_680), &(konst_679));\
bit_vector_clear(&konst_681);\
bit_vector_bitcast_to_bit_vector( &(type_cast_682), &(konst_681));\
_accessMemory_( &(type_cast_680),  &(type_cast_682),  &(FULL_BYTE_MASK),  &(base_buffer_pointer),  &(control_data), &(ignore_return));\
;

#define _writeControlInformationToMem_inner_outarg_prep_macro__ ;

#define _writeEthernetHeaderToMem_inner_inarg_prep_macro__ __declare_static_bit_vector(buf_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(buf_pointer), &((*__pbuf_pointer)));\
__declare_static_bit_vector(buf_position,36);\

#define _writeEthernetHeaderToMem_branch_block_stmt_535_c_export_decl_macro_ __declare_static_bit_vector(I,4);\
__declare_static_bit_vector(ethernet_header,73);\
__declare_static_bit_vector(last_bit,1);\
__declare_static_bit_vector(wdata,64);\
__declare_static_bit_vector(wkeep,8);\
__declare_static_bit_vector(ignore_return,64);\
__declare_static_bit_vector(nI,4);\
__declare_static_bit_vector(nbuf_position,36);\


#define _writeEthernetHeaderToMem_merge_stmt_537_c_preamble_macro_ uint8_t merge_stmt_537_entry_flag;\
merge_stmt_537_entry_flag = do_while_entry_flag;\
goto merge_stmt_537_run;\
merge_stmt_537_run: ;\

#define _writeEthernetHeaderToMem_phi_stmt_538_c_macro_ __declare_static_bit_vector(konst_541,36);\
bit_vector_clear(&konst_541);\
konst_541.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_542,36);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(nbuf_position));\
}\
else {\
__declare_static_bit_vector(konst_541,36);\
bit_vector_clear(&konst_541);\
konst_541.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_542,36);\
bit_vector_clear(&konst_541);\
konst_541.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_pointer), &(konst_541), &(ADD_u36_u36_542));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_542));\
}\
;

#define _writeEthernetHeaderToMem_phi_stmt_544_c_macro_ __declare_static_bit_vector(konst_546,4);\
bit_vector_clear(&konst_546);\
__declare_static_bit_vector(type_cast_547,4);\
bit_vector_clear(&type_cast_547);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(I), &(nI));\
}\
else {\
__declare_static_bit_vector(konst_546,4);\
bit_vector_clear(&konst_546);\
__declare_static_bit_vector(type_cast_547,4);\
bit_vector_clear(&type_cast_547);\
bit_vector_clear(&konst_546);\
bit_vector_bitcast_to_bit_vector( &(type_cast_547), &(konst_546));\
bit_vector_cast_to_bit_vector(0, &(I), &(type_cast_547));\
}\
;

#define _writeEthernetHeaderToMem_phi_stmt_549_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_header_551,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_551));\
bit_vector_cast_to_bit_vector(0, &(ethernet_header), &(RPIPE_nic_rx_to_header_551));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_header_551,73);\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_551));\
bit_vector_cast_to_bit_vector(0, &(ethernet_header), &(RPIPE_nic_rx_to_header_551));\
}\
;
;

#define _writeEthernetHeaderToMem_merge_stmt_537_c_postamble_macro_ merge_stmt_537_entry_flag = 0;

#define _writeEthernetHeaderToMem_stmt_555_c_macro_ uint32_t _writeEthernetHeaderToMem_stmt_555_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t%s\n",_writeEthernetHeaderToMem_stmt_555_c_macro___print_counter,"received_eth_header_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t\t%s\t\t",_writeEthernetHeaderToMem_stmt_555_c_macro___print_counter,"ethernet_header");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ethernet_header)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t\t%s\t\t",_writeEthernetHeaderToMem_stmt_555_c_macro___print_counter,"buf_position");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(buf_position)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writeEthernetHeaderToMem_assign_stmt_559_c_macro_ __declare_static_bit_vector(slice_558,1);\
bit_vector_slice(&(ethernet_header), &(slice_558), 72);\
bit_vector_cast_to_bit_vector(0, &(last_bit), &(slice_558));\
;

#define _writeEthernetHeaderToMem_assign_stmt_563_c_macro_ __declare_static_bit_vector(slice_562,64);\
bit_vector_slice(&(ethernet_header), &(slice_562), 8);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_562));\
;

#define _writeEthernetHeaderToMem_assign_stmt_567_c_macro_ __declare_static_bit_vector(slice_566,8);\
bit_vector_slice(&(ethernet_header), &(slice_566), 0);\
bit_vector_cast_to_bit_vector(0, &(wkeep), &(slice_566));\
;

#define _writeEthernetHeaderToMem_call_stmt_576_c_macro_ __declare_static_bit_vector(konst_568,1);\
bit_vector_clear(&konst_568);\
__declare_static_bit_vector(type_cast_569,1);\
bit_vector_clear(&type_cast_569);\
__declare_static_bit_vector(konst_570,1);\
bit_vector_clear(&konst_570);\
__declare_static_bit_vector(type_cast_571,1);\
bit_vector_clear(&type_cast_571);\
bit_vector_clear(&konst_568);\
bit_vector_bitcast_to_bit_vector( &(type_cast_569), &(konst_568));\
bit_vector_clear(&konst_570);\
bit_vector_bitcast_to_bit_vector( &(type_cast_571), &(konst_570));\
_accessMemory_( &(type_cast_569),  &(type_cast_571),  &(wkeep),  &(buf_position),  &(wdata), &(ignore_return));\
;

#define _writeEthernetHeaderToMem_assign_stmt_581_c_macro_ __declare_static_bit_vector(konst_579,4);\
bit_vector_clear(&konst_579);\
konst_579.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u4_u4_580,4);\
bit_vector_clear(&konst_579);\
konst_579.val.byte_array[0] = 1;\
bit_vector_plus( &(I), &(konst_579), &(ADD_u4_u4_580));\
bit_vector_cast_to_bit_vector(0, &(nI), &(ADD_u4_u4_580));\
;

#define _writeEthernetHeaderToMem_assign_stmt_586_c_macro_ __declare_static_bit_vector(konst_584,36);\
bit_vector_clear(&konst_584);\
konst_584.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_585,36);\
bit_vector_clear(&konst_584);\
konst_584.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_position), &(konst_584), &(ADD_u36_u36_585));\
bit_vector_cast_to_bit_vector(0, &(nbuf_position), &(ADD_u36_u36_585));\
;
;

#define _writeEthernetHeaderToMem_branch_block_stmt_535_c_export_apply_macro_ ;

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

#define _writePayloadToMem_branch_block_stmt_599_c_export_decl_macro_ __declare_static_bit_vector(buf_position__buf_position,36);\
__declare_static_bit_vector(tdata__wdata,64);\
__declare_static_bit_vector(tkeep__wkeep,8);\
__declare_static_bit_vector(buf_position,36);\
__declare_static_bit_vector(payload_data,73);\
__declare_static_bit_vector(last_bit,1);\
__declare_static_bit_vector(wdata,64);\
__declare_static_bit_vector(wkeep,8);\
__declare_static_bit_vector(ignore_return,64);\


#define _writePayloadToMem_merge_stmt_601_c_preamble_macro_ uint8_t merge_stmt_601_entry_flag;\
merge_stmt_601_entry_flag = do_while_entry_flag;\
goto merge_stmt_601_run;\
merge_stmt_601_run: ;\

#define _writePayloadToMem_phi_stmt_602_c_macro_ __declare_static_bit_vector(konst_605,36);\
bit_vector_clear(&konst_605);\
konst_605.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_606,36);\
__declare_static_bit_vector(konst_608,36);\
bit_vector_clear(&konst_608);\
konst_608.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_609,36);\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_608);\
konst_608.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_position), &(konst_608), &(ADD_u36_u36_609));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_609));\
}\
else {\
__declare_static_bit_vector(konst_605,36);\
bit_vector_clear(&konst_605);\
konst_605.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_606,36);\
bit_vector_clear(&konst_605);\
konst_605.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_pointer), &(konst_605), &(ADD_u36_u36_606));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_606));\
}\
;

#define _writePayloadToMem_phi_stmt_610_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_packet_612,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_612));\
bit_vector_cast_to_bit_vector(0, &(payload_data), &(RPIPE_nic_rx_to_packet_612));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_packet_612,73);\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_612));\
bit_vector_cast_to_bit_vector(0, &(payload_data), &(RPIPE_nic_rx_to_packet_612));\
}\
;
;

#define _writePayloadToMem_merge_stmt_601_c_postamble_macro_ merge_stmt_601_entry_flag = 0;

#define _writePayloadToMem_assign_stmt_617_c_macro_ __declare_static_bit_vector(slice_616,1);\
bit_vector_slice(&(payload_data), &(slice_616), 72);\
bit_vector_cast_to_bit_vector(0, &(last_bit), &(slice_616));\
;

#define _writePayloadToMem_assign_stmt_621_c_macro_ __declare_static_bit_vector(slice_620,64);\
bit_vector_slice(&(payload_data), &(slice_620), 8);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_620));\
;

#define _writePayloadToMem_assign_stmt_625_c_macro_ __declare_static_bit_vector(slice_624,8);\
bit_vector_slice(&(payload_data), &(slice_624), 0);\
bit_vector_cast_to_bit_vector(0, &(wkeep), &(slice_624));\
;

#define _writePayloadToMem_stmt_630_c_macro_ uint32_t _writePayloadToMem_stmt_630_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writePayloadToMem>\t%s\n",_writePayloadToMem_stmt_630_c_macro___print_counter,"writing_payload_to_mem");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_630_c_macro___print_counter,"last_bit");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(last_bit)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_630_c_macro___print_counter,"wdata");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wdata)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_630_c_macro___print_counter,"wkeep");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(wkeep)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_630_c_macro___print_counter,"buf_position");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(buf_position)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writePayloadToMem_call_stmt_639_c_macro_ __declare_static_bit_vector(konst_631,1);\
bit_vector_clear(&konst_631);\
__declare_static_bit_vector(type_cast_632,1);\
bit_vector_clear(&type_cast_632);\
__declare_static_bit_vector(konst_633,1);\
bit_vector_clear(&konst_633);\
__declare_static_bit_vector(type_cast_634,1);\
bit_vector_clear(&type_cast_634);\
bit_vector_clear(&konst_631);\
bit_vector_bitcast_to_bit_vector( &(type_cast_632), &(konst_631));\
bit_vector_clear(&konst_633);\
bit_vector_bitcast_to_bit_vector( &(type_cast_634), &(konst_633));\
_accessMemory_( &(type_cast_632),  &(type_cast_634),  &(wkeep),  &(buf_position),  &(wdata), &(ignore_return));\
;
;

#define _writePayloadToMem_branch_block_stmt_599_c_export_apply_macro_ bit_vector_cast_to_bit_vector(0, &(buf_position__buf_position), &(buf_position));\
bit_vector_cast_to_bit_vector(0, &(tdata__wdata), &(wdata));\
bit_vector_cast_to_bit_vector(0, &(tkeep__wkeep), &(wkeep));\
;

#define _writePayloadToMem_assign_stmt_652_c_macro_ __declare_static_bit_vector(EQ_u64_u1_647,1);\
__declare_static_bit_vector(konst_649,8);\
bit_vector_clear(&konst_649);\
__declare_static_bit_vector(EQ_u8_u1_650,1);\
__declare_static_bit_vector(AND_u1_u1_651,1);\
bit_vector_equal(0, &(tdata__wdata), &(BAD_PACKET_DATA), &(EQ_u64_u1_647));\
bit_vector_clear(&konst_649);\
bit_vector_equal(0, &(tkeep__wkeep), &(konst_649), &(EQ_u8_u1_650));\
bit_vector_and(&(EQ_u64_u1_647), &(EQ_u8_u1_650), &(AND_u1_u1_651));\
bit_vector_cast_to_bit_vector(0, &(bad_packet_identifier), &(AND_u1_u1_651));\
;

#define _writePayloadToMem_assign_stmt_658_c_macro_ __declare_static_bit_vector(SUB_u36_u36_656,36);\
__declare_static_bit_vector(type_cast_657,8);\
bit_vector_minus( &(buf_position__buf_position), &(base_buf_pointer), &(SUB_u36_u36_656));\
bit_vector_bitcast_to_bit_vector( &(type_cast_657), &(SUB_u36_u36_656));\
bit_vector_cast_to_bit_vector(0, &(packet_size_8), &(type_cast_657));\
;

#define _writePayloadToMem_assign_stmt_661_c_macro_ bit_vector_cast_to_bit_vector(0, &(packet_size_32), &(packet_size_8));\
;

#define _writePayloadToMem_stmt_664_c_macro_ uint32_t _writePayloadToMem_stmt_664_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writePayloadToMem>\t%s\n",_writePayloadToMem_stmt_664_c_macro___print_counter,"packet_size_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_664_c_macro___print_counter,"packet_size_8");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_size_8)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writePayloadToMem>\t\t%s\t\t",_writePayloadToMem_stmt_664_c_macro___print_counter,"packet_size_32");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(packet_size_32)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writePayloadToMem_assign_stmt_667_c_macro_ bit_vector_cast_to_bit_vector(0, &(last_keep), &(tkeep__wkeep));\
;

#define _writePayloadToMem_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__ppacket_size_32)), &(packet_size_32));\
bit_vector_cast_to_bit_vector(0, &((*__pbad_packet_identifier)), &(bad_packet_identifier));\
bit_vector_cast_to_bit_vector(0, &((*__plast_keep)), &(last_keep));\
;

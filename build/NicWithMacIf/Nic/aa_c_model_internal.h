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

#define _AccessRegister_assign_stmt_92_c_macro_ __declare_static_bit_vector(CONCAT_u1_u5_87,5);\
__declare_static_bit_vector(CONCAT_u6_u38_90,38);\
__declare_static_bit_vector(CONCAT_u5_u43_91,43);\
bit_vector_concatenate( &(rwbar), &(bmask), &(CONCAT_u1_u5_87));\
bit_vector_concatenate( &(register_index), &(wdata), &(CONCAT_u6_u38_90));\
bit_vector_concatenate( &(CONCAT_u1_u5_87), &(CONCAT_u6_u38_90), &(CONCAT_u5_u43_91));\
bit_vector_cast_to_bit_vector(0, &(request), &(CONCAT_u5_u43_91));\
;

#define _AccessRegister_assign_stmt_95_c_macro_ write_bit_vector_to_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE",&(request));\
;

#define _AccessRegister_assign_stmt_98_c_macro_ __declare_static_bit_vector(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_97,33);\
read_bit_vector_from_pipe("NIC_RESPONSE_REGISTER_ACCESS_PIPE",&(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_97));\
bit_vector_cast_to_bit_vector(0, &(response), &(RPIPE_NIC_RESPONSE_REGISTER_ACCESS_PIPE_97));\
;

#define _AccessRegister_assign_stmt_102_c_macro_ __declare_static_bit_vector(slice_101,1);\
bit_vector_slice(&(response), &(slice_101), 32);\
bit_vector_cast_to_bit_vector(0, &(status), &(slice_101));\
;

#define _AccessRegister_assign_stmt_106_c_macro_ __declare_static_bit_vector(slice_105,32);\
bit_vector_slice(&(response), &(slice_105), 0);\
bit_vector_cast_to_bit_vector(0, &(rdata), &(slice_105));\
;

#define _AccessRegister_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__prdata)), &(rdata));\
;

#define _NicRegisterAccessDaemon_inner_inarg_prep_macro__ 
#define _NicRegisterAccessDaemon_branch_block_stmt_189_c_export_decl_macro_ __declare_static_bit_vector(req,43);\
__declare_static_bit_vector(rwbar,1);\
__declare_static_bit_vector(bmask,4);\
__declare_static_bit_vector(index,6);\
__declare_static_bit_vector(wdata,32);\
__declare_static_bit_vector(rval,32);\
__declare_static_bit_vector(wval,32);\
__declare_static_bit_vector(rdata,32);\
__declare_static_bit_vector(resp,33);\
__declare_static_bit_vector(NIC_RESPONE_REGISTER_ACCESS_PIPE,33);\


#define _NicRegisterAccessDaemon_merge_stmt_191_c_preamble_macro_ uint8_t merge_stmt_191_entry_flag;\
merge_stmt_191_entry_flag = do_while_entry_flag;\
goto merge_stmt_191_run;\
merge_stmt_191_run: ;\
;

#define _NicRegisterAccessDaemon_merge_stmt_191_c_postamble_macro_ merge_stmt_191_entry_flag = 0;

#define _NicRegisterAccessDaemon_assign_stmt_194_c_macro_ __declare_static_bit_vector(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_193,43);\
read_bit_vector_from_pipe("NIC_REQUEST_REGISTER_ACCESS_PIPE",&(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_193));\
bit_vector_cast_to_bit_vector(0, &(req), &(RPIPE_NIC_REQUEST_REGISTER_ACCESS_PIPE_193));\
;

#define _NicRegisterAccessDaemon_assign_stmt_198_c_macro_ __declare_static_bit_vector(slice_197,1);\
bit_vector_slice(&(req), &(slice_197), 42);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_197));\
;

#define _NicRegisterAccessDaemon_assign_stmt_202_c_macro_ __declare_static_bit_vector(slice_201,4);\
bit_vector_slice(&(req), &(slice_201), 38);\
bit_vector_cast_to_bit_vector(0, &(bmask), &(slice_201));\
;

#define _NicRegisterAccessDaemon_assign_stmt_206_c_macro_ __declare_static_bit_vector(slice_205,6);\
bit_vector_slice(&(req), &(slice_205), 32);\
bit_vector_cast_to_bit_vector(0, &(index), &(slice_205));\
;

#define _NicRegisterAccessDaemon_assign_stmt_210_c_macro_ __declare_static_bit_vector(slice_209,32);\
bit_vector_slice(&(req), &(slice_209), 0);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_209));\
;

#define _NicRegisterAccessDaemon_assign_stmt_214_c_macro_ bit_vector_cast_to_bit_vector(0, &(rval), &((nic_registers[bit_vector_to_uint64(0, &index)])));\
;

#define _NicRegisterAccessDaemon_call_stmt_221_c_macro_ if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if (!bit_vector_to_uint64(0, &rwbar)) {\
_UpdateRegister_( &(bmask),  &(rval),  &(wdata),  &(index), &(wval));\
}\
;

#define _NicRegisterAccessDaemon_assign_stmt_228_c_macro_ __declare_static_bit_vector(konst_225,32);\
bit_vector_clear(&konst_225);\
__declare_static_bit_vector(type_cast_226,32);\
bit_vector_clear(&type_cast_226);\
__declare_static_bit_vector(MUX_227,32);\
if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if(bit_vector_to_uint64(0, &rwbar)){bit_vector_cast_to_bit_vector(0, &(MUX_227), &(rval));\
}else {bit_vector_clear(&konst_225);\
bit_vector_bitcast_to_bit_vector( &(type_cast_226), &(konst_225));\
bit_vector_cast_to_bit_vector(0, &(MUX_227), &(type_cast_226));\
}bit_vector_cast_to_bit_vector(0, &(rdata), &(MUX_227));\
;

#define _NicRegisterAccessDaemon_assign_stmt_234_c_macro_ __declare_static_bit_vector(konst_230,1);\
bit_vector_clear(&konst_230);\
__declare_static_bit_vector(type_cast_231,1);\
bit_vector_clear(&type_cast_231);\
__declare_static_bit_vector(CONCAT_u1_u33_233,33);\
bit_vector_clear(&konst_230);\
bit_vector_bitcast_to_bit_vector( &(type_cast_231), &(konst_230));\
bit_vector_concatenate( &(type_cast_231), &(rdata), &(CONCAT_u1_u33_233));\
bit_vector_cast_to_bit_vector(0, &(resp), &(CONCAT_u1_u33_233));\
;

#define _NicRegisterAccessDaemon_assign_stmt_237_c_macro_ bit_vector_cast_to_bit_vector(0, &(NIC_RESPONE_REGISTER_ACCESS_PIPE), &(resp));\
;
;

#define _NicRegisterAccessDaemon_branch_block_stmt_189_c_export_apply_macro_ ;

#define _NicRegisterAccessDaemon_inner_outarg_prep_macro__ ;

#define _NicRegisterAccessDaemon_outer_arg_decl_macro__ ;

#define _NicRegisterAccessDaemon_outer_op_xfer_macro__ ;

#define _ReceiveEngineDaemon_inner_inarg_prep_macro__ 
#define _ReceiveEngineDaemon_assign_stmt_880_c_macro_ __declare_static_bit_vector(konst_879,6);\
bit_vector_clear(&konst_879);\
bit_vector_clear(&konst_879);\
write_bit_vector_to_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(konst_879));\
;

#define _ReceiveEngineDaemon_branch_block_stmt_881_c_export_decl_macro_ __declare_static_bit_vector(rx_buffer_pointer_32,32);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(rx_buffer_pointer_36,36);\
__declare_static_bit_vector(bad_packet_identifier,1);\
__declare_static_bit_vector(ok_flag,1);\
__declare_static_bit_vector(free_flag,1);\
__declare_static_bit_vector(push_status,1);\


#define _ReceiveEngineDaemon_merge_stmt_882_c_preamble_macro_ uint8_t merge_stmt_882_entry_flag;\
merge_stmt_882_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_881_flag = 0;\
uint8_t disable_loopback_881_flag = 0;\
goto merge_stmt_882_run;\
not_enabled_yet_loopback_881: not_enabled_yet_loopback_881_flag = 1;\
disable_loopback_881_flag = 0;\
goto merge_stmt_882_run;\
disable_loopback_881: disable_loopback_881_flag = 1;\
not_enabled_yet_loopback_881_flag = 0;\
goto merge_stmt_882_run;\
merge_stmt_882_run: ;\
;

#define _ReceiveEngineDaemon_merge_stmt_882_c_postamble_macro_ not_enabled_yet_loopback_881_flag = 0;\
disable_loopback_881_flag = 0;\
merge_stmt_882_entry_flag = 0;

#define _ReceiveEngineDaemon_stmt_883_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_883_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_883_c_macro___print_counter,"waiting_for_control");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_stmt_890_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_890_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_890_c_macro___print_counter,"got_the__control");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_merge_stmt_892_c_preamble_macro_ uint8_t merge_stmt_892_entry_flag;\
merge_stmt_892_entry_flag = do_while_entry_flag;\
goto merge_stmt_892_run;\
merge_stmt_892_run: ;\
;

#define _ReceiveEngineDaemon_merge_stmt_892_c_postamble_macro_ merge_stmt_892_entry_flag = 0;

#define _ReceiveEngineDaemon_stmt_893_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_893_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_893_c_macro___print_counter,"called_pop_From_queue");release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_899_c_macro_ __declare_static_bit_vector(konst_894,1);\
bit_vector_clear(&konst_894);\
konst_894.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_895,1);\
bit_vector_clear(&type_cast_895);\
type_cast_895.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_896,36);\
bit_vector_clear(&konst_894);\
konst_894.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_895), &(konst_894));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_896));\
_popFromQueue_( &(type_cast_895),  &(RPIPE_FREE_Q_896), &(rx_buffer_pointer_32), &(status));\
;

#define _ReceiveEngineDaemon_assign_stmt_905_c_macro_ __declare_static_bit_vector(konst_902,4);\
bit_vector_clear(&konst_902);\
__declare_static_bit_vector(type_cast_903,4);\
bit_vector_clear(&type_cast_903);\
__declare_static_bit_vector(CONCAT_u32_u36_904,36);\
bit_vector_clear(&konst_902);\
bit_vector_bitcast_to_bit_vector( &(type_cast_903), &(konst_902));\
bit_vector_concatenate( &(rx_buffer_pointer_32), &(type_cast_903), &(CONCAT_u32_u36_904));\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer_36), &(CONCAT_u32_u36_904));\
;

#define _ReceiveEngineDaemon_stmt_907_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_907_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_907_c_macro___print_counter,"calling_loadBuffer");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_907_c_macro___print_counter,"status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(status)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_911_c_macro_ if (has_undefined_bit(&status)) {fprintf(stderr, "Error: variable status has undefined value (%s) at test point.\n", to_string(&status));assert(0);} \
if (bit_vector_to_uint64(0, &status)) {\
_loadBuffer_( &(rx_buffer_pointer_36), &(bad_packet_identifier));\
}\
;

#define _ReceiveEngineDaemon_assign_stmt_917_c_macro_ __declare_static_bit_vector(NOT_u1_u1_915,1);\
__declare_static_bit_vector(AND_u1_u1_916,1);\
bit_vector_not( &(bad_packet_identifier), &(NOT_u1_u1_915));\
bit_vector_and(&(status), &(NOT_u1_u1_915), &(AND_u1_u1_916));\
bit_vector_cast_to_bit_vector(0, &(ok_flag), &(AND_u1_u1_916));\
;

#define _ReceiveEngineDaemon_assign_stmt_922_c_macro_ __declare_static_bit_vector(AND_u1_u1_921,1);\
bit_vector_and(&(status), &(bad_packet_identifier), &(AND_u1_u1_921));\
bit_vector_cast_to_bit_vector(0, &(free_flag), &(AND_u1_u1_921));\
;

#define _ReceiveEngineDaemon_stmt_924_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_924_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_924_c_macro___print_counter,"populating_rx_queue");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_924_c_macro___print_counter,"ok_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ok_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_927_c_macro_ if (has_undefined_bit(&ok_flag)) {fprintf(stderr, "Error: variable ok_flag has undefined value (%s) at test point.\n", to_string(&ok_flag));assert(0);} \
if (bit_vector_to_uint64(0, &ok_flag)) {\
_populateRxQueue_( &(rx_buffer_pointer_36));\
}\
;

#define _ReceiveEngineDaemon_stmt_929_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_929_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_929_c_macro___print_counter,"pushing_into_free_q");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t\t%s\t\t",_ReceiveEngineDaemon_stmt_929_c_macro___print_counter,"free_flag");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(free_flag)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _ReceiveEngineDaemon_call_stmt_937_c_macro_ if (has_undefined_bit(&free_flag)) {fprintf(stderr, "Error: variable free_flag has undefined value (%s) at test point.\n", to_string(&free_flag));assert(0);} \
__declare_static_bit_vector(konst_931,1);\
bit_vector_clear(&konst_931);\
konst_931.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_932,1);\
bit_vector_clear(&type_cast_932);\
type_cast_932.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_933,36);\
__declare_static_bit_vector(slice_935,32);\
if (bit_vector_to_uint64(0, &free_flag)) {\
bit_vector_clear(&konst_931);\
konst_931.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_932), &(konst_931));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_933));\
bit_vector_slice(&(rx_buffer_pointer_36), &(slice_935), 4);\
_pushIntoQueue_( &(type_cast_932),  &(RPIPE_FREE_Q_933),  &(slice_935), &(push_status));\
}\
;

#define _ReceiveEngineDaemon_stmt_938_c_macro_ uint32_t _ReceiveEngineDaemon_stmt_938_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]ReceiveEngineDaemon>\t%s\n",_ReceiveEngineDaemon_stmt_938_c_macro___print_counter,"complited_iteration_in_receive_engine");release_file_print_lock(__report_log_file__);;
;

#define _ReceiveEngineDaemon_branch_block_stmt_881_c_export_apply_macro_ ;

#define _ReceiveEngineDaemon_inner_outarg_prep_macro__ ;

#define _ReceiveEngineDaemon_outer_arg_decl_macro__ ;

#define _ReceiveEngineDaemon_outer_op_xfer_macro__ ;

#define _SoftwareRegisterAccessDaemon_inner_inarg_prep_macro__ 
#define _SoftwareRegisterAccessDaemon_stmt_948_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_948_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_948_c_macro___print_counter,"started_SoftwareRegisterAccessDaemon");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_branch_block_stmt_949_c_export_decl_macro_ __declare_static_bit_vector(INIT,1);\
__declare_static_bit_vector(control_register,1);\
__declare_static_bit_vector(free_q,1);\
__declare_static_bit_vector(num_server,1);\
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


#define _SoftwareRegisterAccessDaemon_merge_stmt_951_c_preamble_macro_ uint8_t merge_stmt_951_entry_flag;\
merge_stmt_951_entry_flag = do_while_entry_flag;\
goto merge_stmt_951_run;\
merge_stmt_951_run: ;\

#define _SoftwareRegisterAccessDaemon_phi_stmt_952_c_macro_ __declare_static_bit_vector(konst_954,1);\
bit_vector_clear(&konst_954);\
__declare_static_bit_vector(type_cast_955,1);\
bit_vector_clear(&type_cast_955);\
__declare_static_bit_vector(konst_956,1);\
bit_vector_clear(&konst_956);\
konst_956.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_957,1);\
bit_vector_clear(&type_cast_957);\
type_cast_957.val.byte_array[0] = 1;\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_956);\
konst_956.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_957), &(konst_956));\
bit_vector_cast_to_bit_vector(0, &(INIT), &(type_cast_957));\
}\
else {\
__declare_static_bit_vector(konst_954,1);\
bit_vector_clear(&konst_954);\
__declare_static_bit_vector(type_cast_955,1);\
bit_vector_clear(&type_cast_955);\
bit_vector_clear(&konst_954);\
bit_vector_bitcast_to_bit_vector( &(type_cast_955), &(konst_954));\
bit_vector_cast_to_bit_vector(0, &(INIT), &(type_cast_955));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_958_c_macro_ __declare_static_bit_vector(konst_960,1);\
bit_vector_clear(&konst_960);\
__declare_static_bit_vector(type_cast_961,1);\
bit_vector_clear(&type_cast_961);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(control_register), &(check_control_regsiter));\
}\
else {\
__declare_static_bit_vector(konst_960,1);\
bit_vector_clear(&konst_960);\
__declare_static_bit_vector(type_cast_961,1);\
bit_vector_clear(&type_cast_961);\
bit_vector_clear(&konst_960);\
bit_vector_bitcast_to_bit_vector( &(type_cast_961), &(konst_960));\
bit_vector_cast_to_bit_vector(0, &(control_register), &(type_cast_961));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_963_c_macro_ __declare_static_bit_vector(konst_965,1);\
bit_vector_clear(&konst_965);\
__declare_static_bit_vector(type_cast_966,1);\
bit_vector_clear(&type_cast_966);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(free_q), &(check_free_q));\
}\
else {\
__declare_static_bit_vector(konst_965,1);\
bit_vector_clear(&konst_965);\
__declare_static_bit_vector(type_cast_966,1);\
bit_vector_clear(&type_cast_966);\
bit_vector_clear(&konst_965);\
bit_vector_bitcast_to_bit_vector( &(type_cast_966), &(konst_965));\
bit_vector_cast_to_bit_vector(0, &(free_q), &(type_cast_966));\
}\
;

#define _SoftwareRegisterAccessDaemon_phi_stmt_968_c_macro_ __declare_static_bit_vector(konst_970,1);\
bit_vector_clear(&konst_970);\
__declare_static_bit_vector(type_cast_971,1);\
bit_vector_clear(&type_cast_971);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(num_server), &(check_num_server));\
}\
else {\
__declare_static_bit_vector(konst_970,1);\
bit_vector_clear(&konst_970);\
__declare_static_bit_vector(type_cast_971,1);\
bit_vector_clear(&type_cast_971);\
bit_vector_clear(&konst_970);\
bit_vector_bitcast_to_bit_vector( &(type_cast_971), &(konst_970));\
bit_vector_cast_to_bit_vector(0, &(num_server), &(type_cast_971));\
}\
;
;

#define _SoftwareRegisterAccessDaemon_merge_stmt_951_c_postamble_macro_ merge_stmt_951_entry_flag = 0;

#define _SoftwareRegisterAccessDaemon_stmt_974_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_974_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_974_c_macro___print_counter,"looping_in_SoftwareRegisterAccessDaemon");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_982_c_macro_ __declare_static_bit_vector(NOT_u1_u1_977,1);\
__declare_static_bit_vector(AND_u1_u1_980,1);\
__declare_static_bit_vector(OR_u1_u1_981,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_977));\
bit_vector_and(&(INIT), &(control_register), &(AND_u1_u1_980));\
bit_vector_or(&(NOT_u1_u1_977), &(AND_u1_u1_980), &(OR_u1_u1_981));\
bit_vector_cast_to_bit_vector(0, &(update_control_register_pipe), &(OR_u1_u1_981));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_990_c_macro_ __declare_static_bit_vector(NOT_u1_u1_985,1);\
__declare_static_bit_vector(AND_u1_u1_988,1);\
__declare_static_bit_vector(OR_u1_u1_989,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_985));\
bit_vector_and(&(INIT), &(free_q), &(AND_u1_u1_988));\
bit_vector_or(&(NOT_u1_u1_985), &(AND_u1_u1_988), &(OR_u1_u1_989));\
bit_vector_cast_to_bit_vector(0, &(update_free_q_pipe), &(OR_u1_u1_989));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_998_c_macro_ __declare_static_bit_vector(NOT_u1_u1_993,1);\
__declare_static_bit_vector(AND_u1_u1_996,1);\
__declare_static_bit_vector(OR_u1_u1_997,1);\
bit_vector_not( &(INIT), &(NOT_u1_u1_993));\
bit_vector_and(&(INIT), &(num_server), &(AND_u1_u1_996));\
bit_vector_or(&(NOT_u1_u1_993), &(AND_u1_u1_996), &(OR_u1_u1_997));\
bit_vector_cast_to_bit_vector(0, &(update_server_num), &(OR_u1_u1_997));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1003_c_macro_ if (has_undefined_bit(&update_control_register_pipe)) {fprintf(stderr, "Error: variable update_control_register_pipe has undefined value (%s) at test point.\n", to_string(&update_control_register_pipe));assert(0);} \
__declare_static_bit_vector(konst_1001,32);\
bit_vector_clear(&konst_1001);\
if (bit_vector_to_uint64(0, &update_control_register_pipe)) {\
bit_vector_clear(&konst_1001);\
write_bit_vector_to_pipe("CONTROL_REGISTER",&((nic_registers[bit_vector_to_uint64(0, &konst_1001)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1008_c_macro_ if (has_undefined_bit(&update_free_q_pipe)) {fprintf(stderr, "Error: variable update_free_q_pipe has undefined value (%s) at test point.\n", to_string(&update_free_q_pipe));assert(0);} \
__declare_static_bit_vector(konst_1006,32);\
bit_vector_clear(&konst_1006);\
konst_1006.val.byte_array[0] = 18;\
if (bit_vector_to_uint64(0, &update_free_q_pipe)) {\
bit_vector_clear(&konst_1006);\
konst_1006.val.byte_array[0] = 18;\
bit_vector_cast_to_bit_vector(0, &(FREE_Q_32), &((nic_registers[bit_vector_to_uint64(0, &konst_1006)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1016_c_macro_ if (has_undefined_bit(&update_free_q_pipe)) {fprintf(stderr, "Error: variable update_free_q_pipe has undefined value (%s) at test point.\n", to_string(&update_free_q_pipe));assert(0);} \
__declare_static_bit_vector(konst_1012,3);\
bit_vector_clear(&konst_1012);\
__declare_static_bit_vector(type_cast_1013,3);\
bit_vector_clear(&type_cast_1013);\
__declare_static_bit_vector(CONCAT_u32_u35_1014,35);\
__declare_static_bit_vector(type_cast_1015,36);\
if (bit_vector_to_uint64(0, &update_free_q_pipe)) {\
bit_vector_clear(&konst_1012);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1013), &(konst_1012));\
bit_vector_concatenate( &(FREE_Q_32), &(type_cast_1013), &(CONCAT_u32_u35_1014));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1015), &(CONCAT_u32_u35_1014));\
write_bit_vector_to_pipe("FREE_Q",&(type_cast_1015));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1021_c_macro_ if (has_undefined_bit(&update_server_num)) {fprintf(stderr, "Error: variable update_server_num has undefined value (%s) at test point.\n", to_string(&update_server_num));assert(0);} \
__declare_static_bit_vector(konst_1019,32);\
bit_vector_clear(&konst_1019);\
konst_1019.val.byte_array[0] = 1;\
if (bit_vector_to_uint64(0, &update_server_num)) {\
bit_vector_clear(&konst_1019);\
konst_1019.val.byte_array[0] = 1;\
write_bit_vector_to_pipe("NUMBER_OF_SERVERS",&((nic_registers[bit_vector_to_uint64(0, &konst_1019)])));\
}
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1024_c_macro_ __declare_static_bit_vector(RPIPE_AFB_NIC_REQUEST_1023,74);\
read_bit_vector_from_pipe("AFB_NIC_REQUEST",&(RPIPE_AFB_NIC_REQUEST_1023));\
bit_vector_cast_to_bit_vector(0, &(req), &(RPIPE_AFB_NIC_REQUEST_1023));\
;

#define _SoftwareRegisterAccessDaemon_stmt_1025_c_macro_ uint32_t _SoftwareRegisterAccessDaemon_stmt_1025_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]SoftwareRegisterAccessDaemon>\t%s\n",_SoftwareRegisterAccessDaemon_stmt_1025_c_macro___print_counter,"got_afb_req");release_file_print_lock(__report_log_file__);;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1029_c_macro_ __declare_static_bit_vector(slice_1028,1);\
bit_vector_slice(&(req), &(slice_1028), 73);\
bit_vector_cast_to_bit_vector(0, &(lock), &(slice_1028));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1033_c_macro_ __declare_static_bit_vector(slice_1032,1);\
bit_vector_slice(&(req), &(slice_1032), 72);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_1032));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1037_c_macro_ __declare_static_bit_vector(slice_1036,4);\
bit_vector_slice(&(req), &(slice_1036), 68);\
bit_vector_cast_to_bit_vector(0, &(bmask), &(slice_1036));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1041_c_macro_ __declare_static_bit_vector(slice_1040,36);\
bit_vector_slice(&(req), &(slice_1040), 32);\
bit_vector_cast_to_bit_vector(0, &(addr), &(slice_1040));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1045_c_macro_ __declare_static_bit_vector(slice_1044,32);\
bit_vector_slice(&(req), &(slice_1044), 0);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_1044));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1049_c_macro_ __declare_static_bit_vector(slice_1048,6);\
bit_vector_slice(&(addr), &(slice_1048), 0);\
bit_vector_cast_to_bit_vector(0, &(index), &(slice_1048));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1058_c_macro_ __declare_static_bit_vector(konst_1052,6);\
bit_vector_clear(&konst_1052);\
__declare_static_bit_vector(EQ_u6_u1_1053,1);\
__declare_static_bit_vector(konst_1055,1);\
bit_vector_clear(&konst_1055);\
__declare_static_bit_vector(EQ_u1_u1_1056,1);\
__declare_static_bit_vector(AND_u1_u1_1057,1);\
bit_vector_clear(&konst_1052);\
bit_vector_equal(0, &(index), &(konst_1052), &(EQ_u6_u1_1053));\
bit_vector_clear(&konst_1055);\
bit_vector_equal(0, &(rwbar), &(konst_1055), &(EQ_u1_u1_1056));\
bit_vector_and(&(EQ_u6_u1_1053), &(EQ_u1_u1_1056), &(AND_u1_u1_1057));\
bit_vector_cast_to_bit_vector(0, &(check_control_regsiter), &(AND_u1_u1_1057));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1067_c_macro_ __declare_static_bit_vector(konst_1061,6);\
bit_vector_clear(&konst_1061);\
konst_1061.val.byte_array[0] = 18;\
__declare_static_bit_vector(EQ_u6_u1_1062,1);\
__declare_static_bit_vector(konst_1064,1);\
bit_vector_clear(&konst_1064);\
__declare_static_bit_vector(EQ_u1_u1_1065,1);\
__declare_static_bit_vector(AND_u1_u1_1066,1);\
bit_vector_clear(&konst_1061);\
konst_1061.val.byte_array[0] = 18;\
bit_vector_equal(0, &(index), &(konst_1061), &(EQ_u6_u1_1062));\
bit_vector_clear(&konst_1064);\
bit_vector_equal(0, &(rwbar), &(konst_1064), &(EQ_u1_u1_1065));\
bit_vector_and(&(EQ_u6_u1_1062), &(EQ_u1_u1_1065), &(AND_u1_u1_1066));\
bit_vector_cast_to_bit_vector(0, &(check_free_q), &(AND_u1_u1_1066));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1076_c_macro_ __declare_static_bit_vector(konst_1070,6);\
bit_vector_clear(&konst_1070);\
konst_1070.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u6_u1_1071,1);\
__declare_static_bit_vector(konst_1073,1);\
bit_vector_clear(&konst_1073);\
__declare_static_bit_vector(EQ_u1_u1_1074,1);\
__declare_static_bit_vector(AND_u1_u1_1075,1);\
bit_vector_clear(&konst_1070);\
konst_1070.val.byte_array[0] = 1;\
bit_vector_equal(0, &(index), &(konst_1070), &(EQ_u6_u1_1071));\
bit_vector_clear(&konst_1073);\
bit_vector_equal(0, &(rwbar), &(konst_1073), &(EQ_u1_u1_1074));\
bit_vector_and(&(EQ_u6_u1_1071), &(EQ_u1_u1_1074), &(AND_u1_u1_1075));\
bit_vector_cast_to_bit_vector(0, &(check_num_server), &(AND_u1_u1_1075));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1080_c_macro_ bit_vector_cast_to_bit_vector(0, &(rval), &((nic_registers[bit_vector_to_uint64(0, &index)])));\
;

#define _SoftwareRegisterAccessDaemon_call_stmt_1087_c_macro_ if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if (!bit_vector_to_uint64(0, &rwbar)) {\
_UpdateRegister_( &(bmask),  &(rval),  &(wdata),  &(index), &(wval));\
}\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1094_c_macro_ __declare_static_bit_vector(konst_1091,32);\
bit_vector_clear(&konst_1091);\
__declare_static_bit_vector(type_cast_1092,32);\
bit_vector_clear(&type_cast_1092);\
__declare_static_bit_vector(MUX_1093,32);\
if (has_undefined_bit(&rwbar)) {fprintf(stderr, "Error: variable rwbar has undefined value (%s) at test point.\n", to_string(&rwbar));assert(0);} \
if(bit_vector_to_uint64(0, &rwbar)){bit_vector_cast_to_bit_vector(0, &(MUX_1093), &(rval));\
}else {bit_vector_clear(&konst_1091);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1092), &(konst_1091));\
bit_vector_cast_to_bit_vector(0, &(MUX_1093), &(type_cast_1092));\
}bit_vector_cast_to_bit_vector(0, &(rdata), &(MUX_1093));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1100_c_macro_ __declare_static_bit_vector(konst_1096,1);\
bit_vector_clear(&konst_1096);\
__declare_static_bit_vector(type_cast_1097,1);\
bit_vector_clear(&type_cast_1097);\
__declare_static_bit_vector(CONCAT_u1_u33_1099,33);\
bit_vector_clear(&konst_1096);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1097), &(konst_1096));\
bit_vector_concatenate( &(type_cast_1097), &(rdata), &(CONCAT_u1_u33_1099));\
bit_vector_cast_to_bit_vector(0, &(resp), &(CONCAT_u1_u33_1099));\
;

#define _SoftwareRegisterAccessDaemon_assign_stmt_1103_c_macro_ write_bit_vector_to_pipe("AFB_NIC_RESPONSE",&(resp));\
;
;

#define _SoftwareRegisterAccessDaemon_branch_block_stmt_949_c_export_apply_macro_ ;

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

#define _UpdateRegister_assign_stmt_117_c_macro_ __declare_static_bit_vector(slice_116,1);\
bit_vector_slice(&(bmask), &(slice_116), 3);\
bit_vector_cast_to_bit_vector(0, &(b0), &(slice_116));\
;

#define _UpdateRegister_assign_stmt_121_c_macro_ __declare_static_bit_vector(slice_120,1);\
bit_vector_slice(&(bmask), &(slice_120), 2);\
bit_vector_cast_to_bit_vector(0, &(b1), &(slice_120));\
;

#define _UpdateRegister_assign_stmt_125_c_macro_ __declare_static_bit_vector(slice_124,1);\
bit_vector_slice(&(bmask), &(slice_124), 1);\
bit_vector_cast_to_bit_vector(0, &(b2), &(slice_124));\
;

#define _UpdateRegister_assign_stmt_129_c_macro_ __declare_static_bit_vector(slice_128,1);\
bit_vector_slice(&(bmask), &(slice_128), 0);\
bit_vector_cast_to_bit_vector(0, &(b3), &(slice_128));\
;

#define _UpdateRegister_assign_stmt_133_c_macro_ __declare_static_bit_vector(slice_132,8);\
bit_vector_slice(&(rval), &(slice_132), 24);\
bit_vector_cast_to_bit_vector(0, &(r0), &(slice_132));\
;

#define _UpdateRegister_assign_stmt_137_c_macro_ __declare_static_bit_vector(slice_136,8);\
bit_vector_slice(&(rval), &(slice_136), 16);\
bit_vector_cast_to_bit_vector(0, &(r1), &(slice_136));\
;

#define _UpdateRegister_assign_stmt_141_c_macro_ __declare_static_bit_vector(slice_140,8);\
bit_vector_slice(&(rval), &(slice_140), 8);\
bit_vector_cast_to_bit_vector(0, &(r2), &(slice_140));\
;

#define _UpdateRegister_assign_stmt_145_c_macro_ __declare_static_bit_vector(slice_144,8);\
bit_vector_slice(&(rval), &(slice_144), 0);\
bit_vector_cast_to_bit_vector(0, &(r3), &(slice_144));\
;

#define _UpdateRegister_assign_stmt_149_c_macro_ __declare_static_bit_vector(slice_148,8);\
bit_vector_slice(&(wdata), &(slice_148), 24);\
bit_vector_cast_to_bit_vector(0, &(w0), &(slice_148));\
;

#define _UpdateRegister_assign_stmt_153_c_macro_ __declare_static_bit_vector(slice_152,8);\
bit_vector_slice(&(wdata), &(slice_152), 16);\
bit_vector_cast_to_bit_vector(0, &(w1), &(slice_152));\
;

#define _UpdateRegister_assign_stmt_157_c_macro_ __declare_static_bit_vector(slice_156,8);\
bit_vector_slice(&(wdata), &(slice_156), 8);\
bit_vector_cast_to_bit_vector(0, &(w2), &(slice_156));\
;

#define _UpdateRegister_assign_stmt_161_c_macro_ __declare_static_bit_vector(slice_160,8);\
bit_vector_slice(&(wdata), &(slice_160), 0);\
bit_vector_cast_to_bit_vector(0, &(w3), &(slice_160));\
;

#define _UpdateRegister_assign_stmt_182_c_macro_ __declare_static_bit_vector(MUX_166,8);\
__declare_static_bit_vector(MUX_170,8);\
__declare_static_bit_vector(CONCAT_u8_u16_171,16);\
__declare_static_bit_vector(MUX_175,8);\
__declare_static_bit_vector(MUX_179,8);\
__declare_static_bit_vector(CONCAT_u8_u16_180,16);\
__declare_static_bit_vector(CONCAT_u16_u32_181,32);\
if (has_undefined_bit(&b0)) {fprintf(stderr, "Error: variable b0 has undefined value (%s) at test point.\n", to_string(&b0));assert(0);} \
if(bit_vector_to_uint64(0, &b0)){bit_vector_cast_to_bit_vector(0, &(MUX_166), &(w0));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_166), &(r0));\
}if (has_undefined_bit(&b1)) {fprintf(stderr, "Error: variable b1 has undefined value (%s) at test point.\n", to_string(&b1));assert(0);} \
if(bit_vector_to_uint64(0, &b1)){bit_vector_cast_to_bit_vector(0, &(MUX_170), &(w1));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_170), &(r1));\
}bit_vector_concatenate( &(MUX_166), &(MUX_170), &(CONCAT_u8_u16_171));\
if (has_undefined_bit(&b2)) {fprintf(stderr, "Error: variable b2 has undefined value (%s) at test point.\n", to_string(&b2));assert(0);} \
if(bit_vector_to_uint64(0, &b2)){bit_vector_cast_to_bit_vector(0, &(MUX_175), &(w2));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_175), &(r2));\
}if (has_undefined_bit(&b3)) {fprintf(stderr, "Error: variable b3 has undefined value (%s) at test point.\n", to_string(&b3));assert(0);} \
if(bit_vector_to_uint64(0, &b3)){bit_vector_cast_to_bit_vector(0, &(MUX_179), &(w3));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_179), &(r3));\
}bit_vector_concatenate( &(MUX_175), &(MUX_179), &(CONCAT_u8_u16_180));\
bit_vector_concatenate( &(CONCAT_u8_u16_171), &(CONCAT_u8_u16_180), &(CONCAT_u16_u32_181));\
bit_vector_cast_to_bit_vector(0, &(wval), &(CONCAT_u16_u32_181));\
;

#define _UpdateRegister_assign_stmt_186_c_macro_ bit_vector_cast_to_bit_vector(0, &((nic_registers[bit_vector_to_uint64(0, &index)])), &(wval));\
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

#define _accessMemory_assign_stmt_259_c_macro_ __declare_static_bit_vector(CONCAT_u1_u2_252,2);\
__declare_static_bit_vector(CONCAT_u2_u10_254,10);\
__declare_static_bit_vector(CONCAT_u36_u100_257,100);\
__declare_static_bit_vector(CONCAT_u10_u110_258,110);\
bit_vector_concatenate( &(lock), &(rwbar), &(CONCAT_u1_u2_252));\
bit_vector_concatenate( &(CONCAT_u1_u2_252), &(bmask), &(CONCAT_u2_u10_254));\
bit_vector_concatenate( &(addr), &(wdata), &(CONCAT_u36_u100_257));\
bit_vector_concatenate( &(CONCAT_u2_u10_254), &(CONCAT_u36_u100_257), &(CONCAT_u10_u110_258));\
bit_vector_cast_to_bit_vector(0, &(request), &(CONCAT_u10_u110_258));\
;

#define _accessMemory_assign_stmt_262_c_macro_ write_bit_vector_to_pipe("NIC_TO_MEMORY_REQUEST",&(request));\
;

#define _accessMemory_assign_stmt_265_c_macro_ __declare_static_bit_vector(RPIPE_MEMORY_TO_NIC_RESPONSE_264,65);\
read_bit_vector_from_pipe("MEMORY_TO_NIC_RESPONSE",&(RPIPE_MEMORY_TO_NIC_RESPONSE_264));\
bit_vector_cast_to_bit_vector(0, &(response), &(RPIPE_MEMORY_TO_NIC_RESPONSE_264));\
;

#define _accessMemory_assign_stmt_269_c_macro_ __declare_static_bit_vector(slice_268,1);\
bit_vector_slice(&(response), &(slice_268), 64);\
bit_vector_cast_to_bit_vector(0, &(err), &(slice_268));\
;

#define _accessMemory_assign_stmt_273_c_macro_ __declare_static_bit_vector(slice_272,64);\
bit_vector_slice(&(response), &(slice_272), 0);\
bit_vector_cast_to_bit_vector(0, &(rdata), &(slice_272));\
;

#define _accessMemory_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__prdata)), &(rdata));\
;

#define _acquireMutex_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(m_ok,1);\

#define _acquireMutex_branch_block_stmt_278_c_export_decl_macro_ __declare_static_bit_vector(mutex_address,36);\
__declare_static_bit_vector(mutex_plus_nentries,64);\
__declare_static_bit_vector(mutex_val,32);\
__declare_static_bit_vector(wval,64);\
__declare_static_bit_vector(ignore,64);\


#define _acquireMutex_assign_stmt_281_c_macro_ bit_vector_cast_to_bit_vector(0, &(mutex_address), &(q_base_address));\
;

#define _acquireMutex_stmt_282_c_macro_ uint32_t _acquireMutex_stmt_282_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]acquireMutex>\t%s\n",_acquireMutex_stmt_282_c_macro___print_counter,"inside_acquire_mutex");release_file_print_lock(__report_log_file__);;

#define _acquireMutex_merge_stmt_283_c_preamble_macro_ uint8_t merge_stmt_283_entry_flag;\
merge_stmt_283_entry_flag = 1;\
uint8_t loopback_278_flag = 0;\
goto merge_stmt_283_run;\
loopback_278: loopback_278_flag = 1;\
goto merge_stmt_283_run;\
merge_stmt_283_run: ;\
;

#define _acquireMutex_merge_stmt_283_c_postamble_macro_ loopback_278_flag = 0;\
merge_stmt_283_entry_flag = 0;

#define _acquireMutex_stmt_284_c_macro_ uint32_t _acquireMutex_stmt_284_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]acquireMutex>\t%s\n",_acquireMutex_stmt_284_c_macro___print_counter,"accessing_memory");release_file_print_lock(__report_log_file__);;

#define _acquireMutex_call_stmt_296_c_macro_ __declare_static_bit_vector(konst_285,1);\
bit_vector_clear(&konst_285);\
konst_285.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_286,1);\
bit_vector_clear(&type_cast_286);\
type_cast_286.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_287,1);\
bit_vector_clear(&konst_287);\
konst_287.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_288,1);\
bit_vector_clear(&type_cast_288);\
type_cast_288.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_289,8);\
bit_vector_clear(&konst_289);\
__declare_static_bit_vector(type_cast_290,8);\
bit_vector_clear(&type_cast_290);\
__declare_static_bit_vector(NOT_u8_u8_291,8);\
bit_vector_clear(&NOT_u8_u8_291);\
NOT_u8_u8_291.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_293,64);\
bit_vector_clear(&konst_293);\
__declare_static_bit_vector(type_cast_294,64);\
bit_vector_clear(&type_cast_294);\
bit_vector_clear(&konst_285);\
konst_285.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_286), &(konst_285));\
bit_vector_clear(&konst_287);\
konst_287.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_288), &(konst_287));\
bit_vector_clear(&konst_289);\
bit_vector_bitcast_to_bit_vector( &(type_cast_290), &(konst_289));\
bit_vector_not( &(type_cast_290), &(NOT_u8_u8_291));\
bit_vector_clear(&konst_293);\
bit_vector_bitcast_to_bit_vector( &(type_cast_294), &(konst_293));\
_accessMemory_( &(type_cast_286),  &(type_cast_288),  &(NOT_u8_u8_291),  &(mutex_address),  &(type_cast_294), &(mutex_plus_nentries));\
;

#define _acquireMutex_stmt_297_c_macro_ uint32_t _acquireMutex_stmt_297_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]acquireMutex>\t%s\n",_acquireMutex_stmt_297_c_macro___print_counter,"accessed_memory");release_file_print_lock(__report_log_file__);;

#define _acquireMutex_assign_stmt_301_c_macro_ __declare_static_bit_vector(slice_300,32);\
bit_vector_slice(&(mutex_plus_nentries), &(slice_300), 32);\
bit_vector_cast_to_bit_vector(0, &(mutex_val), &(slice_300));\
;

#define _acquireMutex_assign_stmt_308_c_macro_ __declare_static_bit_vector(konst_303,32);\
bit_vector_clear(&konst_303);\
konst_303.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_304,32);\
bit_vector_clear(&type_cast_304);\
type_cast_304.val.byte_array[0] = 1;\
__declare_static_bit_vector(slice_306,32);\
__declare_static_bit_vector(CONCAT_u32_u64_307,64);\
bit_vector_clear(&konst_303);\
konst_303.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_304), &(konst_303));\
bit_vector_slice(&(mutex_plus_nentries), &(slice_306), 0);\
bit_vector_concatenate( &(type_cast_304), &(slice_306), &(CONCAT_u32_u64_307));\
bit_vector_cast_to_bit_vector(0, &(wval), &(CONCAT_u32_u64_307));\
;

#define _acquireMutex_stmt_309_c_macro_ uint32_t _acquireMutex_stmt_309_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]acquireMutex>\t%s\n",_acquireMutex_stmt_309_c_macro___print_counter,"accessing_memory_to_release_mutex");release_file_print_lock(__report_log_file__);;

#define _acquireMutex_call_stmt_320_c_macro_ __declare_static_bit_vector(konst_310,1);\
bit_vector_clear(&konst_310);\
__declare_static_bit_vector(type_cast_311,1);\
bit_vector_clear(&type_cast_311);\
__declare_static_bit_vector(konst_312,1);\
bit_vector_clear(&konst_312);\
__declare_static_bit_vector(type_cast_313,1);\
bit_vector_clear(&type_cast_313);\
__declare_static_bit_vector(konst_314,8);\
bit_vector_clear(&konst_314);\
__declare_static_bit_vector(type_cast_315,8);\
bit_vector_clear(&type_cast_315);\
__declare_static_bit_vector(NOT_u8_u8_316,8);\
bit_vector_clear(&NOT_u8_u8_316);\
NOT_u8_u8_316.val.byte_array[0] = 255;\
bit_vector_clear(&konst_310);\
bit_vector_bitcast_to_bit_vector( &(type_cast_311), &(konst_310));\
bit_vector_clear(&konst_312);\
bit_vector_bitcast_to_bit_vector( &(type_cast_313), &(konst_312));\
bit_vector_clear(&konst_314);\
bit_vector_bitcast_to_bit_vector( &(type_cast_315), &(konst_314));\
bit_vector_not( &(type_cast_315), &(NOT_u8_u8_316));\
_accessMemory_( &(type_cast_311),  &(type_cast_313),  &(NOT_u8_u8_316),  &(mutex_address),  &(wval), &(ignore));\
;

#define _acquireMutex_stmt_322_c_macro_ uint32_t _acquireMutex_stmt_322_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]acquireMutex>\t%s\n",_acquireMutex_stmt_322_c_macro___print_counter,"itertion_done");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]acquireMutex>\t\t%s\t\t",_acquireMutex_stmt_322_c_macro___print_counter,"mutex_val");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(mutex_val)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;
;

#define _acquireMutex_branch_block_stmt_278_c_export_apply_macro_ ;

#define _acquireMutex_assign_stmt_333_c_macro_ __declare_static_bit_vector(konst_331,1);\
bit_vector_clear(&konst_331);\
konst_331.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_332,1);\
bit_vector_clear(&type_cast_332);\
type_cast_332.val.byte_array[0] = 1;\
bit_vector_clear(&konst_331);\
konst_331.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_332), &(konst_331));\
bit_vector_cast_to_bit_vector(0, &(m_ok), &(type_cast_332));\
;

#define _acquireMutex_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pm_ok)), &(m_ok));\
;

#define _delay_time_inner_inarg_prep_macro__ __declare_static_bit_vector(T,32);\
bit_vector_cast_to_bit_vector(0, &(T), &((*__pT)));\
__declare_static_bit_vector(delay_done,1);\

#define _delay_time_branch_block_stmt_784_c_export_decl_macro_ __declare_static_bit_vector(R,32);\
__declare_static_bit_vector(nR,32);\


#define _delay_time_merge_stmt_786_c_preamble_macro_ uint8_t merge_stmt_786_entry_flag;\
merge_stmt_786_entry_flag = do_while_entry_flag;\
goto merge_stmt_786_run;\
merge_stmt_786_run: ;\

#define _delay_time_phi_stmt_787_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(R), &(nR));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(R), &(T));\
}\
;
;

#define _delay_time_merge_stmt_786_c_postamble_macro_ merge_stmt_786_entry_flag = 0;

#define _delay_time_assign_stmt_796_c_macro_ __declare_static_bit_vector(konst_794,32);\
bit_vector_clear(&konst_794);\
konst_794.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_795,32);\
bit_vector_clear(&konst_794);\
konst_794.val.byte_array[0] = 1;\
bit_vector_minus( &(R), &(konst_794), &(SUB_u32_u32_795));\
bit_vector_cast_to_bit_vector(0, &(nR), &(SUB_u32_u32_795));\
;

#define _delay_time_assign_stmt_803_c_macro_ __declare_static_bit_vector(konst_802,1);\
bit_vector_clear(&konst_802);\
konst_802.val.byte_array[0] = 1;\
bit_vector_clear(&konst_802);\
konst_802.val.byte_array[0] = 1;\
bit_vector_cast_to_bit_vector(0, &(delay_done), &(konst_802));\
;
;

#define _delay_time_branch_block_stmt_784_c_export_apply_macro_ ;

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

#define _getQueueElement_assign_stmt_371_c_macro_ __declare_static_bit_vector(konst_368,36);\
bit_vector_clear(&konst_368);\
konst_368.val.byte_array[0] = 16;\
__declare_static_bit_vector(type_cast_369,36);\
bit_vector_clear(&type_cast_369);\
type_cast_369.val.byte_array[0] = 16;\
__declare_static_bit_vector(ADD_u36_u36_370,36);\
bit_vector_clear(&konst_368);\
konst_368.val.byte_array[0] = 16;\
bit_vector_bitcast_to_bit_vector( &(type_cast_369), &(konst_368));\
bit_vector_plus( &(q_base_address), &(type_cast_369), &(ADD_u36_u36_370));\
bit_vector_cast_to_bit_vector(0, &(buffer_address), &(ADD_u36_u36_370));\
;

#define _getQueueElement_assign_stmt_384_c_macro_ __declare_static_bit_vector(slice_376,31);\
__declare_static_bit_vector(konst_378,3);\
bit_vector_clear(&konst_378);\
__declare_static_bit_vector(type_cast_379,3);\
bit_vector_clear(&type_cast_379);\
__declare_static_bit_vector(CONCAT_u31_u34_380,34);\
__declare_static_bit_vector(type_cast_382,36);\
__declare_static_bit_vector(ADD_u36_u36_383,36);\
bit_vector_slice(&(read_pointer), &(slice_376), 1);\
bit_vector_clear(&konst_378);\
bit_vector_bitcast_to_bit_vector( &(type_cast_379), &(konst_378));\
bit_vector_concatenate( &(slice_376), &(type_cast_379), &(CONCAT_u31_u34_380));\
bit_vector_bitcast_to_bit_vector( &(type_cast_382), &(CONCAT_u31_u34_380));\
bit_vector_plus( &(buffer_address), &(type_cast_382), &(ADD_u36_u36_383));\
bit_vector_cast_to_bit_vector(0, &(element_pair_address), &(ADD_u36_u36_383));\
;

#define _getQueueElement_call_stmt_396_c_macro_ __declare_static_bit_vector(konst_385,1);\
bit_vector_clear(&konst_385);\
__declare_static_bit_vector(type_cast_386,1);\
bit_vector_clear(&type_cast_386);\
__declare_static_bit_vector(konst_387,1);\
bit_vector_clear(&konst_387);\
konst_387.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_388,1);\
bit_vector_clear(&type_cast_388);\
type_cast_388.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_389,8);\
bit_vector_clear(&konst_389);\
__declare_static_bit_vector(type_cast_390,8);\
bit_vector_clear(&type_cast_390);\
__declare_static_bit_vector(NOT_u8_u8_391,8);\
bit_vector_clear(&NOT_u8_u8_391);\
NOT_u8_u8_391.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_393,64);\
bit_vector_clear(&konst_393);\
__declare_static_bit_vector(type_cast_394,64);\
bit_vector_clear(&type_cast_394);\
bit_vector_clear(&konst_385);\
bit_vector_bitcast_to_bit_vector( &(type_cast_386), &(konst_385));\
bit_vector_clear(&konst_387);\
konst_387.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_388), &(konst_387));\
bit_vector_clear(&konst_389);\
bit_vector_bitcast_to_bit_vector( &(type_cast_390), &(konst_389));\
bit_vector_not( &(type_cast_390), &(NOT_u8_u8_391));\
bit_vector_clear(&konst_393);\
bit_vector_bitcast_to_bit_vector( &(type_cast_394), &(konst_393));\
_accessMemory_( &(type_cast_386),  &(type_cast_388),  &(NOT_u8_u8_391),  &(element_pair_address),  &(type_cast_394), &(element_pair));\
;

#define _getQueueElement_assign_stmt_400_c_macro_ __declare_static_bit_vector(slice_399,32);\
bit_vector_slice(&(element_pair), &(slice_399), 32);\
bit_vector_cast_to_bit_vector(0, &(e0), &(slice_399));\
;

#define _getQueueElement_assign_stmt_404_c_macro_ __declare_static_bit_vector(slice_403,32);\
bit_vector_slice(&(element_pair), &(slice_403), 0);\
bit_vector_cast_to_bit_vector(0, &(e1), &(slice_403));\
;

#define _getQueueElement_assign_stmt_412_c_macro_ __declare_static_bit_vector(konst_407,32);\
bit_vector_clear(&konst_407);\
__declare_static_bit_vector(BITSEL_u32_u1_408,1);\
__declare_static_bit_vector(MUX_411,32);\
bit_vector_clear(&konst_407);\
bit_vector_bitsel( &(read_pointer), &(konst_407), &(BITSEL_u32_u1_408));\
if (has_undefined_bit(&BITSEL_u32_u1_408)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_408 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_408));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_408)){bit_vector_cast_to_bit_vector(0, &(MUX_411), &(e1));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_411), &(e0));\
}bit_vector_cast_to_bit_vector(0, &(q_r_data), &(MUX_411));\
;

#define _getQueueElement_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pq_r_data)), &(q_r_data));\
;

#define _getQueuePointers_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(wp,32);\
__declare_static_bit_vector(rp,32);\
__declare_static_bit_vector(wp_rp,64);\

#define _getQueuePointers_call_stmt_352_c_macro_ __declare_static_bit_vector(konst_339,1);\
bit_vector_clear(&konst_339);\
__declare_static_bit_vector(type_cast_340,1);\
bit_vector_clear(&type_cast_340);\
__declare_static_bit_vector(konst_341,1);\
bit_vector_clear(&konst_341);\
konst_341.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_342,1);\
bit_vector_clear(&type_cast_342);\
type_cast_342.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_343,8);\
bit_vector_clear(&konst_343);\
__declare_static_bit_vector(type_cast_344,8);\
bit_vector_clear(&type_cast_344);\
__declare_static_bit_vector(NOT_u8_u8_345,8);\
bit_vector_clear(&NOT_u8_u8_345);\
NOT_u8_u8_345.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_347,36);\
bit_vector_clear(&konst_347);\
konst_347.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_348,36);\
__declare_static_bit_vector(konst_349,64);\
bit_vector_clear(&konst_349);\
__declare_static_bit_vector(type_cast_350,64);\
bit_vector_clear(&type_cast_350);\
bit_vector_clear(&konst_339);\
bit_vector_bitcast_to_bit_vector( &(type_cast_340), &(konst_339));\
bit_vector_clear(&konst_341);\
konst_341.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_342), &(konst_341));\
bit_vector_clear(&konst_343);\
bit_vector_bitcast_to_bit_vector( &(type_cast_344), &(konst_343));\
bit_vector_not( &(type_cast_344), &(NOT_u8_u8_345));\
bit_vector_clear(&konst_347);\
konst_347.val.byte_array[0] = 8;\
bit_vector_plus( &(q_base_address), &(konst_347), &(ADD_u36_u36_348));\
bit_vector_clear(&konst_349);\
bit_vector_bitcast_to_bit_vector( &(type_cast_350), &(konst_349));\
_accessMemory_( &(type_cast_340),  &(type_cast_342),  &(NOT_u8_u8_345),  &(ADD_u36_u36_348),  &(type_cast_350), &(wp_rp));\
;

#define _getQueuePointers_assign_stmt_356_c_macro_ __declare_static_bit_vector(slice_355,32);\
bit_vector_slice(&(wp_rp), &(slice_355), 32);\
bit_vector_cast_to_bit_vector(0, &(wp), &(slice_355));\
;

#define _getQueuePointers_assign_stmt_360_c_macro_ __declare_static_bit_vector(slice_359,32);\
bit_vector_slice(&(wp_rp), &(slice_359), 0);\
bit_vector_cast_to_bit_vector(0, &(rp), &(slice_359));\
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

#define _getTxPacketPointerFromServer_assign_stmt_1117_c_macro_ __declare_static_bit_vector(ADD_u6_u6_1115,6);\
__declare_static_bit_vector(type_cast_1116,6);\
bit_vector_plus( &(queue_index), &(TX_QUEUES_REG_START_OFFSET), &(ADD_u6_u6_1115));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1116), &(ADD_u6_u6_1115));\
bit_vector_cast_to_bit_vector(0, &(register_index), &(type_cast_1116));\
;

#define _getTxPacketPointerFromServer_call_stmt_1126_c_macro_ __declare_static_bit_vector(konst_1118,1);\
bit_vector_clear(&konst_1118);\
konst_1118.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1119,1);\
bit_vector_clear(&type_cast_1119);\
type_cast_1119.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1120,4);\
bit_vector_clear(&konst_1120);\
konst_1120.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1121,4);\
bit_vector_clear(&type_cast_1121);\
type_cast_1121.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1123,32);\
bit_vector_clear(&konst_1123);\
__declare_static_bit_vector(type_cast_1124,32);\
bit_vector_clear(&type_cast_1124);\
bit_vector_clear(&konst_1118);\
konst_1118.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1119), &(konst_1118));\
bit_vector_clear(&konst_1120);\
konst_1120.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1121), &(konst_1120));\
bit_vector_clear(&konst_1123);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1124), &(konst_1123));\
_AccessRegister_( &(type_cast_1119),  &(type_cast_1121),  &(register_index),  &(type_cast_1124), &(tx_queue_pointer_32));\
;

#define _getTxPacketPointerFromServer_assign_stmt_1132_c_macro_ __declare_static_bit_vector(konst_1129,4);\
bit_vector_clear(&konst_1129);\
__declare_static_bit_vector(type_cast_1130,4);\
bit_vector_clear(&type_cast_1130);\
__declare_static_bit_vector(CONCAT_u32_u36_1131,36);\
bit_vector_clear(&konst_1129);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1130), &(konst_1129));\
bit_vector_concatenate( &(tx_queue_pointer_32), &(type_cast_1130), &(CONCAT_u32_u36_1131));\
bit_vector_cast_to_bit_vector(0, &(tx_queue_pointer_36), &(CONCAT_u32_u36_1131));\
;

#define _getTxPacketPointerFromServer_call_stmt_1138_c_macro_ __declare_static_bit_vector(konst_1133,1);\
bit_vector_clear(&konst_1133);\
__declare_static_bit_vector(type_cast_1134,1);\
bit_vector_clear(&type_cast_1134);\
bit_vector_clear(&konst_1133);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1134), &(konst_1133));\
_popFromQueue_( &(type_cast_1134),  &(tx_queue_pointer_36), &(pkt_pointer), &(status));\
;

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

#define _loadBuffer_call_stmt_661_c_macro_ _writeEthernetHeaderToMem_( &(rx_buffer_pointer), &(new_buf_pointer));\
;

#define _loadBuffer_call_stmt_667_c_macro_ _writePayloadToMem_( &(rx_buffer_pointer),  &(new_buf_pointer), &(packet_size), &(bad_packet_identifier), &(last_keep));\
;

#define _loadBuffer_call_stmt_672_c_macro_ if (has_undefined_bit(&bad_packet_identifier)) {fprintf(stderr, "Error: variable bad_packet_identifier has undefined value (%s) at test point.\n", to_string(&bad_packet_identifier));assert(0);} \
if (!bit_vector_to_uint64(0, &bad_packet_identifier)) {\
_writeControlInformationToMem_( &(rx_buffer_pointer),  &(packet_size),  &(last_keep));\
}\
;

#define _loadBuffer_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pbad_packet_identifier)), &(bad_packet_identifier));\
;

#define _macToNicInterface_inner_inarg_prep_macro__ 
#define _macToNicInterface_branch_block_stmt_1144_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,16);\


#define _macToNicInterface_merge_stmt_1146_c_preamble_macro_ uint8_t merge_stmt_1146_entry_flag;\
merge_stmt_1146_entry_flag = do_while_entry_flag;\
goto merge_stmt_1146_run;\
merge_stmt_1146_run: ;\

#define _macToNicInterface_phi_stmt_1147_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_0_1149,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data_0",&(RPIPE_mac_to_nic_data_0_1149));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mac_to_nic_data_0_1149));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_0_1149,64);\
read_bit_vector_from_pipe("mac_to_nic_data_0",&(RPIPE_mac_to_nic_data_0_1149));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mac_to_nic_data_0_1149));\
}\
;

#define _macToNicInterface_phi_stmt_1150_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_1_1152,16);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data_1",&(RPIPE_mac_to_nic_data_1_1152));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mac_to_nic_data_1_1152));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_1_1152,16);\
read_bit_vector_from_pipe("mac_to_nic_data_1",&(RPIPE_mac_to_nic_data_1_1152));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mac_to_nic_data_1_1152));\
}\
;
;

#define _macToNicInterface_merge_stmt_1146_c_postamble_macro_ merge_stmt_1146_entry_flag = 0;

#define _macToNicInterface_stmt_1156_c_macro_ uint32_t _macToNicInterface_stmt_1156_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]macToNicInterface>\t%s\n",_macToNicInterface_stmt_1156_c_macro___print_counter,"writing_data");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]macToNicInterface>\t\t%s\t\t",_macToNicInterface_stmt_1156_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]macToNicInterface>\t\t%s\t\t",_macToNicInterface_stmt_1156_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _macToNicInterface_assign_stmt_1163_c_macro_ __declare_static_bit_vector(slice_1160,9);\
__declare_static_bit_vector(CONCAT_u9_u73_1162,73);\
bit_vector_slice(&(rdata1), &(slice_1160), 0);\
bit_vector_concatenate( &(slice_1160), &(rdata0), &(CONCAT_u9_u73_1162));\
write_bit_vector_to_pipe("mac_to_nic_data",&(CONCAT_u9_u73_1162));\
;
;

#define _macToNicInterface_branch_block_stmt_1144_c_export_apply_macro_ ;

#define _macToNicInterface_inner_outarg_prep_macro__ ;

#define _macToNicInterface_outer_arg_decl_macro__ ;

#define _macToNicInterface_outer_op_xfer_macro__ ;

#define _memoryToNicInterface_inner_inarg_prep_macro__ 
#define _memoryToNicInterface_branch_block_stmt_1169_c_export_decl_macro_ __declare_static_bit_vector(rdata0,64);\
__declare_static_bit_vector(rdata1,8);\


#define _memoryToNicInterface_merge_stmt_1171_c_preamble_macro_ uint8_t merge_stmt_1171_entry_flag;\
merge_stmt_1171_entry_flag = do_while_entry_flag;\
goto merge_stmt_1171_run;\
merge_stmt_1171_run: ;\

#define _memoryToNicInterface_phi_stmt_1172_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp0_pipe0_1174,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp0_pipe0",&(RPIPE_mem_resp0_pipe0_1174));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp0_pipe0_1174));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp0_pipe0_1174,64);\
read_bit_vector_from_pipe("mem_resp0_pipe0",&(RPIPE_mem_resp0_pipe0_1174));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_mem_resp0_pipe0_1174));\
}\
;

#define _memoryToNicInterface_phi_stmt_1175_c_macro_ __declare_static_bit_vector(RPIPE_mem_resp0_pipe1_1177,8);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mem_resp0_pipe1",&(RPIPE_mem_resp0_pipe1_1177));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp0_pipe1_1177));\
}\
else {\
__declare_static_bit_vector(RPIPE_mem_resp0_pipe1_1177,8);\
read_bit_vector_from_pipe("mem_resp0_pipe1",&(RPIPE_mem_resp0_pipe1_1177));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_mem_resp0_pipe1_1177));\
}\
;
;

#define _memoryToNicInterface_merge_stmt_1171_c_postamble_macro_ merge_stmt_1171_entry_flag = 0;

#define _memoryToNicInterface_assign_stmt_1185_c_macro_ __declare_static_bit_vector(konst_1181,8);\
bit_vector_clear(&konst_1181);\
__declare_static_bit_vector(BITSEL_u8_u1_1182,1);\
__declare_static_bit_vector(CONCAT_u1_u65_1184,65);\
bit_vector_clear(&konst_1181);\
bit_vector_bitsel( &(rdata1), &(konst_1181), &(BITSEL_u8_u1_1182));\
bit_vector_concatenate( &(BITSEL_u8_u1_1182), &(rdata0), &(CONCAT_u1_u65_1184));\
write_bit_vector_to_pipe("MEMORY_TO_NIC_RESPONSE",&(CONCAT_u1_u65_1184));\
;
;

#define _memoryToNicInterface_branch_block_stmt_1169_c_export_apply_macro_ ;

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

#define _nextLSTATE_assign_stmt_1197_c_macro_ __declare_static_bit_vector(slice_1196,1);\
bit_vector_slice(&(RX), &(slice_1196), 72);\
bit_vector_cast_to_bit_vector(0, &(tlast), &(slice_1196));\
;

#define _nextLSTATE_assign_stmt_1201_c_macro_ __declare_static_bit_vector(slice_1200,64);\
bit_vector_slice(&(RX), &(slice_1200), 8);\
bit_vector_cast_to_bit_vector(0, &(tdata), &(slice_1200));\
;

#define _nextLSTATE_assign_stmt_1205_c_macro_ __declare_static_bit_vector(slice_1204,8);\
bit_vector_slice(&(RX), &(slice_1204), 0);\
bit_vector_cast_to_bit_vector(0, &(tkeep), &(slice_1204));\
;

#define _nextLSTATE_assign_stmt_1210_c_macro_ __declare_static_bit_vector(konst_1208,1);\
bit_vector_clear(&konst_1208);\
konst_1208.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_1209,1);\
bit_vector_clear(&konst_1208);\
konst_1208.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_1208), &(EQ_u1_u1_1209));\
bit_vector_cast_to_bit_vector(0, &(last_word), &(EQ_u1_u1_1209));\
;

#define _nextLSTATE_assign_stmt_1244_c_macro_ __declare_static_bit_vector(EQ_u2_u1_1214,1);\
__declare_static_bit_vector(konst_1216,2);\
bit_vector_clear(&konst_1216);\
__declare_static_bit_vector(MUX_1217,2);\
__declare_static_bit_vector(EQ_u2_u1_1220,1);\
__declare_static_bit_vector(konst_1222,2);\
bit_vector_clear(&konst_1222);\
__declare_static_bit_vector(MUX_1223,2);\
__declare_static_bit_vector(OR_u2_u2_1224,2);\
__declare_static_bit_vector(EQ_u2_u1_1227,1);\
__declare_static_bit_vector(NOT_u1_u1_1229,1);\
__declare_static_bit_vector(AND_u1_u1_1230,1);\
__declare_static_bit_vector(konst_1232,2);\
bit_vector_clear(&konst_1232);\
__declare_static_bit_vector(MUX_1233,2);\
__declare_static_bit_vector(EQ_u2_u1_1236,1);\
__declare_static_bit_vector(AND_u1_u1_1238,1);\
__declare_static_bit_vector(konst_1240,2);\
bit_vector_clear(&konst_1240);\
__declare_static_bit_vector(MUX_1241,2);\
__declare_static_bit_vector(OR_u2_u2_1242,2);\
__declare_static_bit_vector(OR_u2_u2_1243,2);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u2_u1_1214));\
if (has_undefined_bit(&EQ_u2_u1_1214)) {fprintf(stderr, "Error: variable EQ_u2_u1_1214 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1214));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1214)){bit_vector_cast_to_bit_vector(0, &(MUX_1217), &(S1));\
}else {bit_vector_clear(&konst_1216);\
bit_vector_cast_to_bit_vector(0, &(MUX_1217), &(konst_1216));\
}bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1220));\
if (has_undefined_bit(&EQ_u2_u1_1220)) {fprintf(stderr, "Error: variable EQ_u2_u1_1220 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1220));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1220)){bit_vector_cast_to_bit_vector(0, &(MUX_1223), &(S2));\
}else {bit_vector_clear(&konst_1222);\
bit_vector_cast_to_bit_vector(0, &(MUX_1223), &(konst_1222));\
}bit_vector_or(&(MUX_1217), &(MUX_1223), &(OR_u2_u2_1224));\
bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u2_u1_1227));\
bit_vector_not( &(last_word), &(NOT_u1_u1_1229));\
bit_vector_and(&(EQ_u2_u1_1227), &(NOT_u1_u1_1229), &(AND_u1_u1_1230));\
if (has_undefined_bit(&AND_u1_u1_1230)) {fprintf(stderr, "Error: variable AND_u1_u1_1230 has undefined value (%s) at test point.\n", to_string(&AND_u1_u1_1230));assert(0);} \
if(bit_vector_to_uint64(0, &AND_u1_u1_1230)){bit_vector_cast_to_bit_vector(0, &(MUX_1233), &(S2));\
}else {bit_vector_clear(&konst_1232);\
bit_vector_cast_to_bit_vector(0, &(MUX_1233), &(konst_1232));\
}bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u2_u1_1236));\
bit_vector_and(&(EQ_u2_u1_1236), &(last_word), &(AND_u1_u1_1238));\
if (has_undefined_bit(&AND_u1_u1_1238)) {fprintf(stderr, "Error: variable AND_u1_u1_1238 has undefined value (%s) at test point.\n", to_string(&AND_u1_u1_1238));assert(0);} \
if(bit_vector_to_uint64(0, &AND_u1_u1_1238)){bit_vector_cast_to_bit_vector(0, &(MUX_1241), &(S0));\
}else {bit_vector_clear(&konst_1240);\
bit_vector_cast_to_bit_vector(0, &(MUX_1241), &(konst_1240));\
}bit_vector_or(&(MUX_1233), &(MUX_1241), &(OR_u2_u2_1242));\
bit_vector_or(&(OR_u2_u2_1224), &(OR_u2_u2_1242), &(OR_u2_u2_1243));\
bit_vector_cast_to_bit_vector(0, &(nLSTATE), &(OR_u2_u2_1243));\
;

#define _nextLSTATE_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnLSTATE)), &(nLSTATE));\
;

#define _nicRxFromMacDaemon_inner_inarg_prep_macro__ 
#define _nicRxFromMacDaemon_branch_block_stmt_1247_c_export_decl_macro_ __declare_static_bit_vector(LSTATE,2);\
__declare_static_bit_vector(RX,73);\
__declare_static_bit_vector(nLSTATE,2);\
__declare_static_bit_vector(write_to_header,1);\


#define _nicRxFromMacDaemon_merge_stmt_1249_c_preamble_macro_ uint8_t merge_stmt_1249_entry_flag;\
merge_stmt_1249_entry_flag = do_while_entry_flag;\
goto merge_stmt_1249_run;\
merge_stmt_1249_run: ;\

#define _nicRxFromMacDaemon_phi_stmt_1250_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(nLSTATE));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(S0));\
}\
;

#define _nicRxFromMacDaemon_phi_stmt_1254_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_1256,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_1256));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_1256));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_1256,73);\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_1256));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_1256));\
}\
;
;

#define _nicRxFromMacDaemon_merge_stmt_1249_c_postamble_macro_ merge_stmt_1249_entry_flag = 0;

#define _nicRxFromMacDaemon_stmt_1260_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1260_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1260_c_macro___print_counter,"data_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1260_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1260_c_macro___print_counter,"LSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(LSTATE)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_call_stmt_1264_c_macro_ _nextLSTATE_( &(RX),  &(LSTATE), &(nLSTATE));\
;

#define _nicRxFromMacDaemon_assign_stmt_1273_c_macro_ __declare_static_bit_vector(EQ_u2_u1_1268,1);\
__declare_static_bit_vector(EQ_u2_u1_1271,1);\
__declare_static_bit_vector(OR_u1_u1_1272,1);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u2_u1_1268));\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1271));\
bit_vector_or(&(EQ_u2_u1_1268), &(EQ_u2_u1_1271), &(OR_u1_u1_1272));\
bit_vector_cast_to_bit_vector(0, &(write_to_header), &(OR_u1_u1_1272));\
;

#define _nicRxFromMacDaemon_assign_stmt_1285_c_macro_ if (has_undefined_bit(&write_to_header)) {fprintf(stderr, "Error: variable write_to_header has undefined value (%s) at test point.\n", to_string(&write_to_header));assert(0);} \
__declare_static_bit_vector(EQ_u2_u1_1278,1);\
__declare_static_bit_vector(slice_1280,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1282,73);\
__declare_static_bit_vector(MUX_1284,73);\
if (bit_vector_to_uint64(0, &write_to_header)) {\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u2_u1_1278));\
if (has_undefined_bit(&EQ_u2_u1_1278)) {fprintf(stderr, "Error: variable EQ_u2_u1_1278 has undefined value (%s) at test point.\n", to_string(&EQ_u2_u1_1278));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u2_u1_1278)){bit_vector_slice(&(RX), &(slice_1280), 8);\
bit_vector_concatenate( &(slice_1280), &(HEADER_TKEEP), &(CONCAT_u65_u73_1282));\
bit_vector_cast_to_bit_vector(0, &(MUX_1284), &(CONCAT_u65_u73_1282));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_1284), &(RX));\
}write_bit_vector_to_pipe("nic_rx_to_header",&(MUX_1284));\
}
;

#define _nicRxFromMacDaemon_assign_stmt_1288_c_macro_ write_bit_vector_to_pipe("nic_rx_to_packet",&(RX));\
;

#define _nicRxFromMacDaemon_stmt_1290_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_1290_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_1290_c_macro___print_counter,"data_written_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_1290_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;
;

#define _nicRxFromMacDaemon_branch_block_stmt_1247_c_export_apply_macro_ ;

#define _nicRxFromMacDaemon_inner_outarg_prep_macro__ ;

#define _nicRxFromMacDaemon_outer_arg_decl_macro__ ;

#define _nicRxFromMacDaemon_outer_op_xfer_macro__ ;

#define _nicToMacInterface_inner_inarg_prep_macro__ 
#define _nicToMacInterface_branch_block_stmt_1296_c_export_decl_macro_ __declare_static_bit_vector(rdata,73);\
__declare_static_bit_vector(nic_to_mac_data0,64);\
__declare_static_bit_vector(nic_to_mac_data1,16);\


#define _nicToMacInterface_merge_stmt_1298_c_preamble_macro_ uint8_t merge_stmt_1298_entry_flag;\
merge_stmt_1298_entry_flag = do_while_entry_flag;\
goto merge_stmt_1298_run;\
merge_stmt_1298_run: ;\

#define _nicToMacInterface_phi_stmt_1299_c_macro_ __declare_static_bit_vector(RPIPE_nic_to_mac_transmit_pipe_1301,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_to_mac_transmit_pipe",&(RPIPE_nic_to_mac_transmit_pipe_1301));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_nic_to_mac_transmit_pipe_1301));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_to_mac_transmit_pipe_1301,73);\
read_bit_vector_from_pipe("nic_to_mac_transmit_pipe",&(RPIPE_nic_to_mac_transmit_pipe_1301));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_nic_to_mac_transmit_pipe_1301));\
}\
;
;

#define _nicToMacInterface_merge_stmt_1298_c_postamble_macro_ merge_stmt_1298_entry_flag = 0;

#define _nicToMacInterface_assign_stmt_1306_c_macro_ __declare_static_bit_vector(slice_1305,64);\
bit_vector_slice(&(rdata), &(slice_1305), 0);\
bit_vector_cast_to_bit_vector(0, &(nic_to_mac_data0), &(slice_1305));\
;

#define _nicToMacInterface_assign_stmt_1311_c_macro_ __declare_static_bit_vector(slice_1309,9);\
__declare_static_bit_vector(type_cast_1310,16);\
bit_vector_slice(&(rdata), &(slice_1309), 0);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1310), &(slice_1309));\
bit_vector_cast_to_bit_vector(0, &(nic_to_mac_data1), &(type_cast_1310));\
;
;

#define _nicToMacInterface_branch_block_stmt_1296_c_export_apply_macro_ ;

#define _nicToMacInterface_inner_outarg_prep_macro__ ;

#define _nicToMacInterface_outer_arg_decl_macro__ ;

#define _nicToMacInterface_outer_op_xfer_macro__ ;

#define _nicToMemoryInterface_inner_inarg_prep_macro__ 
#define _nicToMemoryInterface_branch_block_stmt_1317_c_export_decl_macro_ __declare_static_bit_vector(rdata,110);\


#define _nicToMemoryInterface_merge_stmt_1319_c_preamble_macro_ uint8_t merge_stmt_1319_entry_flag;\
merge_stmt_1319_entry_flag = do_while_entry_flag;\
goto merge_stmt_1319_run;\
merge_stmt_1319_run: ;\

#define _nicToMemoryInterface_phi_stmt_1320_c_macro_ __declare_static_bit_vector(RPIPE_NIC_TO_MEMORY_REQUEST_1322,110);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("NIC_TO_MEMORY_REQUEST",&(RPIPE_NIC_TO_MEMORY_REQUEST_1322));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_NIC_TO_MEMORY_REQUEST_1322));\
}\
else {\
__declare_static_bit_vector(RPIPE_NIC_TO_MEMORY_REQUEST_1322,110);\
read_bit_vector_from_pipe("NIC_TO_MEMORY_REQUEST",&(RPIPE_NIC_TO_MEMORY_REQUEST_1322));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_NIC_TO_MEMORY_REQUEST_1322));\
}\
;
;

#define _nicToMemoryInterface_merge_stmt_1319_c_postamble_macro_ merge_stmt_1319_entry_flag = 0;

#define _nicToMemoryInterface_assign_stmt_1327_c_macro_ __declare_static_bit_vector(slice_1326,64);\
bit_vector_slice(&(rdata), &(slice_1326), 0);\
write_bit_vector_to_pipe("mem_req0_pipe0",&(slice_1326));\
;

#define _nicToMemoryInterface_assign_stmt_1333_c_macro_ __declare_static_bit_vector(slice_1331,46);\
__declare_static_bit_vector(type_cast_1332,64);\
bit_vector_slice(&(rdata), &(slice_1331), 0);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1332), &(slice_1331));\
write_bit_vector_to_pipe("mem_req0_pipe1",&(type_cast_1332));\
;
;

#define _nicToMemoryInterface_branch_block_stmt_1317_c_export_apply_macro_ ;

#define _nicToMemoryInterface_inner_outarg_prep_macro__ ;

#define _nicToMemoryInterface_outer_arg_decl_macro__ ;

#define _nicToMemoryInterface_outer_op_xfer_macro__ ;

#define _nicToProcessorInterface_inner_inarg_prep_macro__ 
#define _nicToProcessorInterface_branch_block_stmt_1339_c_export_decl_macro_ __declare_static_bit_vector(rdata,33);\


#define _nicToProcessorInterface_merge_stmt_1341_c_preamble_macro_ uint8_t merge_stmt_1341_entry_flag;\
merge_stmt_1341_entry_flag = do_while_entry_flag;\
goto merge_stmt_1341_run;\
merge_stmt_1341_run: ;\

#define _nicToProcessorInterface_phi_stmt_1342_c_macro_ __declare_static_bit_vector(RPIPE_AFB_NIC_RESPONSE_1344,33);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("AFB_NIC_RESPONSE",&(RPIPE_AFB_NIC_RESPONSE_1344));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_AFB_NIC_RESPONSE_1344));\
}\
else {\
__declare_static_bit_vector(RPIPE_AFB_NIC_RESPONSE_1344,33);\
read_bit_vector_from_pipe("AFB_NIC_RESPONSE",&(RPIPE_AFB_NIC_RESPONSE_1344));\
bit_vector_cast_to_bit_vector(0, &(rdata), &(RPIPE_AFB_NIC_RESPONSE_1344));\
}\
;
;

#define _nicToProcessorInterface_merge_stmt_1341_c_postamble_macro_ merge_stmt_1341_entry_flag = 0;

#define _nicToProcessorInterface_assign_stmt_1349_c_macro_ __declare_static_bit_vector(type_cast_1348,64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1348), &(rdata));\
write_bit_vector_to_pipe("control_word_response_pipe",&(type_cast_1348));\
;
;

#define _nicToProcessorInterface_branch_block_stmt_1339_c_export_apply_macro_ ;

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
__declare_static_bit_vector(next_rp,32);\

#define _popFromQueue_stmt_458_c_macro_ uint32_t _popFromQueue_stmt_458_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]popFromQueue>\t%s\n",_popFromQueue_stmt_458_c_macro___print_counter,"trying_to_acquire_mutex");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_458_c_macro___print_counter,"lock");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(lock)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _popFromQueue_call_stmt_462_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_acquireMutex_( &(q_base_address), &(m_ok));\
}\
;

#define _popFromQueue_call_stmt_467_c_macro_ _getQueuePointers_( &(q_base_address), &(write_pointer), &(read_pointer));\
;

#define _popFromQueue_stmt_470_c_macro_ uint32_t _popFromQueue_stmt_470_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]popFromQueue>\t%s\n",_popFromQueue_stmt_470_c_macro___print_counter,"got_queue_pointers");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_470_c_macro___print_counter,"write_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(write_pointer)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_470_c_macro___print_counter,"read_pointer");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(read_pointer)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _popFromQueue_assign_stmt_475_c_macro_ __declare_static_bit_vector(EQ_u32_u1_474,1);\
bit_vector_equal(0, &(write_pointer), &(read_pointer), &(EQ_u32_u1_474));\
bit_vector_cast_to_bit_vector(0, &(q_empty), &(EQ_u32_u1_474));\
;

#define _popFromQueue_assign_stmt_482_c_macro_ __declare_static_bit_vector(konst_478,32);\
bit_vector_clear(&konst_478);\
konst_478.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_479,32);\
__declare_static_bit_vector(AND_u32_u32_481,32);\
bit_vector_clear(&konst_478);\
konst_478.val.byte_array[0] = 1;\
bit_vector_plus( &(read_pointer), &(konst_478), &(ADD_u32_u32_479));\
bit_vector_and(&(ADD_u32_u32_479), &(QUEUE_SIZE_MASK), &(AND_u32_u32_481));\
bit_vector_cast_to_bit_vector(0, &(next_rp), &(AND_u32_u32_481));\
;

#define _popFromQueue_call_stmt_487_c_macro_ if (has_undefined_bit(&q_empty)) {fprintf(stderr, "Error: variable q_empty has undefined value (%s) at test point.\n", to_string(&q_empty));assert(0);} \
if (!bit_vector_to_uint64(0, &q_empty)) {\
_getQueueElement_( &(q_base_address),  &(read_pointer), &(q_r_data));\
}\
;

#define _popFromQueue_call_stmt_492_c_macro_ if (has_undefined_bit(&q_empty)) {fprintf(stderr, "Error: variable q_empty has undefined value (%s) at test point.\n", to_string(&q_empty));assert(0);} \
if (!bit_vector_to_uint64(0, &q_empty)) {\
_setQueuePointers_( &(q_base_address),  &(write_pointer),  &(next_rp));\
}\
;

#define _popFromQueue_stmt_495_c_macro_ uint32_t _popFromQueue_stmt_495_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]popFromQueue>\t%s\n",_popFromQueue_stmt_495_c_macro___print_counter,"releasing_mutex");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_495_c_macro___print_counter,"lock");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(lock)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _popFromQueue_call_stmt_498_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_releaseMutex_( &(q_base_address));\
}\
;

#define _popFromQueue_assign_stmt_502_c_macro_ __declare_static_bit_vector(NOT_u1_u1_501,1);\
bit_vector_not( &(q_empty), &(NOT_u1_u1_501));\
bit_vector_cast_to_bit_vector(0, &(status), &(NOT_u1_u1_501));\
;

#define _popFromQueue_stmt_505_c_macro_ uint32_t _popFromQueue_stmt_505_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]popFromQueue>\t%s\n",_popFromQueue_stmt_505_c_macro___print_counter,"poping_done");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_505_c_macro___print_counter,"status");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(status)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]popFromQueue>\t\t%s\t\t",_popFromQueue_stmt_505_c_macro___print_counter,"lock");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(lock)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _popFromQueue_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pq_r_data)), &(q_r_data));\
bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _populateRxQueue_inner_inarg_prep_macro__ __declare_static_bit_vector(rx_buffer_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(rx_buffer_pointer), &((*__prx_buffer_pointer)));\

#define _populateRxQueue_branch_block_stmt_808_c_export_decl_macro_ __declare_static_bit_vector(q_index,6);\
__declare_static_bit_vector(register_index,6);\
__declare_static_bit_vector(rx_queue_pointer_32,32);\
__declare_static_bit_vector(rx_queue_pointer_36,36);\
__declare_static_bit_vector(push_status,1);\
__declare_static_bit_vector(n_q_index,6);\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(selected_q_index,6);\


#define _populateRxQueue_merge_stmt_809_c_preamble_macro_ uint8_t merge_stmt_809_entry_flag;\
merge_stmt_809_entry_flag = 1;\
uint8_t loopback_808_flag = 0;\
goto merge_stmt_809_run;\
loopback_808: loopback_808_flag = 1;\
goto merge_stmt_809_run;\
merge_stmt_809_run: ;\

#define _populateRxQueue_phi_stmt_810_c_macro_ __declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_812,6);\
__declare_static_bit_vector(konst_813,6);\
bit_vector_clear(&konst_813);\
konst_813.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_814,6);\
if(loopback_808_flag) {\
bit_vector_cast_to_bit_vector(0, &(q_index), &(n_q_index));\
}\
else {\
__declare_static_bit_vector(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_812,6);\
__declare_static_bit_vector(konst_813,6);\
bit_vector_clear(&konst_813);\
konst_813.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_814,6);\
read_bit_vector_from_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_812));\
bit_vector_clear(&konst_813);\
konst_813.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_WRITTEN_RX_QUEUE_INDEX_812), &(konst_813), &(ADD_u6_u6_814));\
bit_vector_cast_to_bit_vector(0, &(q_index), &(ADD_u6_u6_814));\
}\
;
;

#define _populateRxQueue_merge_stmt_809_c_postamble_macro_ loopback_808_flag = 0;\
merge_stmt_809_entry_flag = 0;

#define _populateRxQueue_assign_stmt_822_c_macro_ __declare_static_bit_vector(ADD_u6_u6_820,6);\
__declare_static_bit_vector(type_cast_821,6);\
bit_vector_plus( &(q_index), &(RX_QUEUES_REG_START_OFFSET), &(ADD_u6_u6_820));\
bit_vector_bitcast_to_bit_vector( &(type_cast_821), &(ADD_u6_u6_820));\
bit_vector_cast_to_bit_vector(0, &(register_index), &(type_cast_821));\
;

#define _populateRxQueue_call_stmt_831_c_macro_ __declare_static_bit_vector(konst_823,1);\
bit_vector_clear(&konst_823);\
konst_823.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_824,1);\
bit_vector_clear(&type_cast_824);\
type_cast_824.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_825,4);\
bit_vector_clear(&konst_825);\
konst_825.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_826,4);\
bit_vector_clear(&type_cast_826);\
type_cast_826.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_828,32);\
bit_vector_clear(&konst_828);\
__declare_static_bit_vector(type_cast_829,32);\
bit_vector_clear(&type_cast_829);\
bit_vector_clear(&konst_823);\
konst_823.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_824), &(konst_823));\
bit_vector_clear(&konst_825);\
konst_825.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_826), &(konst_825));\
bit_vector_clear(&konst_828);\
bit_vector_bitcast_to_bit_vector( &(type_cast_829), &(konst_828));\
_AccessRegister_( &(type_cast_824),  &(type_cast_826),  &(register_index),  &(type_cast_829), &(rx_queue_pointer_32));\
;

#define _populateRxQueue_assign_stmt_837_c_macro_ __declare_static_bit_vector(konst_834,4);\
bit_vector_clear(&konst_834);\
__declare_static_bit_vector(type_cast_835,4);\
bit_vector_clear(&type_cast_835);\
__declare_static_bit_vector(CONCAT_u32_u36_836,36);\
bit_vector_clear(&konst_834);\
bit_vector_bitcast_to_bit_vector( &(type_cast_835), &(konst_834));\
bit_vector_concatenate( &(rx_queue_pointer_32), &(type_cast_835), &(CONCAT_u32_u36_836));\
bit_vector_cast_to_bit_vector(0, &(rx_queue_pointer_36), &(CONCAT_u32_u36_836));\
;

#define _populateRxQueue_call_stmt_844_c_macro_ __declare_static_bit_vector(konst_838,1);\
bit_vector_clear(&konst_838);\
__declare_static_bit_vector(type_cast_839,1);\
bit_vector_clear(&type_cast_839);\
__declare_static_bit_vector(slice_842,32);\
bit_vector_clear(&konst_838);\
bit_vector_bitcast_to_bit_vector( &(type_cast_839), &(konst_838));\
bit_vector_slice(&(rx_buffer_pointer), &(slice_842), 4);\
_pushIntoQueue_( &(type_cast_839),  &(rx_queue_pointer_36),  &(slice_842), &(push_status));\
;

#define _populateRxQueue_assign_stmt_854_c_macro_ __declare_static_bit_vector(konst_847,6);\
bit_vector_clear(&konst_847);\
konst_847.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_848,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_849,32);\
__declare_static_bit_vector(konst_850,32);\
bit_vector_clear(&konst_850);\
konst_850.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_851,32);\
__declare_static_bit_vector(type_cast_852,6);\
__declare_static_bit_vector(AND_u6_u6_853,6);\
bit_vector_clear(&konst_847);\
konst_847.val.byte_array[0] = 1;\
bit_vector_plus( &(q_index), &(konst_847), &(ADD_u6_u6_848));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_849));\
bit_vector_clear(&konst_850);\
konst_850.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_849), &(konst_850), &(SUB_u32_u32_851));\
bit_vector_bitcast_to_bit_vector( &(type_cast_852), &(SUB_u32_u32_851));\
bit_vector_and(&(ADD_u6_u6_848), &(type_cast_852), &(AND_u6_u6_853));\
bit_vector_cast_to_bit_vector(0, &(n_q_index), &(AND_u6_u6_853));\
;

#define _populateRxQueue_call_stmt_860_c_macro_ __declare_static_bit_vector(konst_858,32);\
bit_vector_clear(&konst_858);\
konst_858.val.byte_array[0] = 32;\
bit_vector_clear(&konst_858);\
konst_858.val.byte_array[0] = 32;\
_delay_time_( &(konst_858), &(status));\
;

#define _populateRxQueue_assign_stmt_870_c_macro_ write_bit_vector_to_pipe("LAST_WRITTEN_RX_QUEUE_INDEX",&(q_index));\
;

#define _populateRxQueue_assign_stmt_873_c_macro_ bit_vector_cast_to_bit_vector(0, &(selected_q_index), &(q_index));\
;
;

#define _populateRxQueue_branch_block_stmt_808_c_export_apply_macro_ ;

#define _populateRxQueue_inner_outarg_prep_macro__ ;

#define _processorToNicInterface_inner_inarg_prep_macro__ 
#define _processorToNicInterface_branch_block_stmt_1355_c_export_decl_macro_ __declare_static_bit_vector(rdata0,32);\
__declare_static_bit_vector(rdata1,64);\


#define _processorToNicInterface_merge_stmt_1357_c_preamble_macro_ uint8_t merge_stmt_1357_entry_flag;\
merge_stmt_1357_entry_flag = do_while_entry_flag;\
goto merge_stmt_1357_run;\
merge_stmt_1357_run: ;\

#define _processorToNicInterface_phi_stmt_1358_c_macro_ __declare_static_bit_vector(RPIPE_control_word_request_pipe_0_1360,32);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("control_word_request_pipe_0",&(RPIPE_control_word_request_pipe_0_1360));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_control_word_request_pipe_0_1360));\
}\
else {\
__declare_static_bit_vector(RPIPE_control_word_request_pipe_0_1360,32);\
read_bit_vector_from_pipe("control_word_request_pipe_0",&(RPIPE_control_word_request_pipe_0_1360));\
bit_vector_cast_to_bit_vector(0, &(rdata0), &(RPIPE_control_word_request_pipe_0_1360));\
}\
;

#define _processorToNicInterface_phi_stmt_1361_c_macro_ __declare_static_bit_vector(RPIPE_control_word_request_pipe_1_1363,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("control_word_request_pipe_1",&(RPIPE_control_word_request_pipe_1_1363));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_control_word_request_pipe_1_1363));\
}\
else {\
__declare_static_bit_vector(RPIPE_control_word_request_pipe_1_1363,64);\
read_bit_vector_from_pipe("control_word_request_pipe_1",&(RPIPE_control_word_request_pipe_1_1363));\
bit_vector_cast_to_bit_vector(0, &(rdata1), &(RPIPE_control_word_request_pipe_1_1363));\
}\
;
;

#define _processorToNicInterface_merge_stmt_1357_c_postamble_macro_ merge_stmt_1357_entry_flag = 0;

#define _processorToNicInterface_stmt_1367_c_macro_ uint32_t _processorToNicInterface_stmt_1367_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]processorToNicInterface>\t%s\n",_processorToNicInterface_stmt_1367_c_macro___print_counter,"got_afb_Req");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]processorToNicInterface>\t\t%s\t\t",_processorToNicInterface_stmt_1367_c_macro___print_counter,"rdata0");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata0)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]processorToNicInterface>\t\t%s\t\t",_processorToNicInterface_stmt_1367_c_macro___print_counter,"rdata1");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(rdata1)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _processorToNicInterface_assign_stmt_1374_c_macro_ __declare_static_bit_vector(slice_1371,42);\
__declare_static_bit_vector(CONCAT_u42_u74_1373,74);\
bit_vector_slice(&(rdata1), &(slice_1371), 0);\
bit_vector_concatenate( &(slice_1371), &(rdata0), &(CONCAT_u42_u74_1373));\
write_bit_vector_to_pipe("AFB_NIC_REQUEST",&(CONCAT_u42_u74_1373));\
;
;

#define _processorToNicInterface_branch_block_stmt_1355_c_export_apply_macro_ ;

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
__declare_static_bit_vector(next_wp,32);\
__declare_static_bit_vector(q_full,1);\

#define _pushIntoQueue_call_stmt_744_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_acquireMutex_( &(q_base_address), &(m_ok));\
}\
;

#define _pushIntoQueue_call_stmt_749_c_macro_ _getQueuePointers_( &(q_base_address), &(write_pointer), &(read_pointer));\
;

#define _pushIntoQueue_assign_stmt_756_c_macro_ __declare_static_bit_vector(konst_752,32);\
bit_vector_clear(&konst_752);\
konst_752.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_753,32);\
__declare_static_bit_vector(AND_u32_u32_755,32);\
bit_vector_clear(&konst_752);\
konst_752.val.byte_array[0] = 1;\
bit_vector_plus( &(write_pointer), &(konst_752), &(ADD_u32_u32_753));\
bit_vector_and(&(ADD_u32_u32_753), &(QUEUE_SIZE_MASK), &(AND_u32_u32_755));\
bit_vector_cast_to_bit_vector(0, &(next_wp), &(AND_u32_u32_755));\
;

#define _pushIntoQueue_assign_stmt_761_c_macro_ __declare_static_bit_vector(EQ_u32_u1_760,1);\
bit_vector_equal(0, &(next_wp), &(read_pointer), &(EQ_u32_u1_760));\
bit_vector_cast_to_bit_vector(0, &(q_full), &(EQ_u32_u1_760));\
;

#define _pushIntoQueue_call_stmt_766_c_macro_ if (has_undefined_bit(&q_full)) {fprintf(stderr, "Error: variable q_full has undefined value (%s) at test point.\n", to_string(&q_full));assert(0);} \
if (!bit_vector_to_uint64(0, &q_full)) {\
_setQueueElement_( &(q_base_address),  &(write_pointer),  &(q_w_data));\
}\
;

#define _pushIntoQueue_call_stmt_771_c_macro_ if (has_undefined_bit(&q_full)) {fprintf(stderr, "Error: variable q_full has undefined value (%s) at test point.\n", to_string(&q_full));assert(0);} \
if (!bit_vector_to_uint64(0, &q_full)) {\
_setQueuePointers_( &(q_base_address),  &(write_pointer),  &(next_wp));\
}\
;

#define _pushIntoQueue_call_stmt_775_c_macro_ if (has_undefined_bit(&lock)) {fprintf(stderr, "Error: variable lock has undefined value (%s) at test point.\n", to_string(&lock));assert(0);} \
if (bit_vector_to_uint64(0, &lock)) {\
_releaseMutex_( &(q_base_address));\
}\
;

#define _pushIntoQueue_assign_stmt_779_c_macro_ __declare_static_bit_vector(NOT_u1_u1_778,1);\
bit_vector_not( &(q_full), &(NOT_u1_u1_778));\
bit_vector_cast_to_bit_vector(0, &(status), &(NOT_u1_u1_778));\
;

#define _pushIntoQueue_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pstatus)), &(status));\
;

#define _releaseMutex_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(ignore,64);\

#define _releaseMutex_call_stmt_450_c_macro_ __declare_static_bit_vector(konst_436,1);\
bit_vector_clear(&konst_436);\
__declare_static_bit_vector(type_cast_437,1);\
bit_vector_clear(&type_cast_437);\
__declare_static_bit_vector(konst_438,1);\
bit_vector_clear(&konst_438);\
__declare_static_bit_vector(type_cast_439,1);\
bit_vector_clear(&type_cast_439);\
__declare_static_bit_vector(konst_440,4);\
bit_vector_clear(&konst_440);\
__declare_static_bit_vector(type_cast_441,4);\
bit_vector_clear(&type_cast_441);\
__declare_static_bit_vector(NOT_u4_u4_442,4);\
bit_vector_clear(&NOT_u4_u4_442);\
NOT_u4_u4_442.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_443,4);\
bit_vector_clear(&konst_443);\
__declare_static_bit_vector(type_cast_444,4);\
bit_vector_clear(&type_cast_444);\
__declare_static_bit_vector(CONCAT_u4_u8_445,8);\
bit_vector_clear(&CONCAT_u4_u8_445);\
CONCAT_u4_u8_445.val.byte_array[0] = 240;\
__declare_static_bit_vector(konst_447,64);\
bit_vector_clear(&konst_447);\
__declare_static_bit_vector(type_cast_448,64);\
bit_vector_clear(&type_cast_448);\
bit_vector_clear(&konst_436);\
bit_vector_bitcast_to_bit_vector( &(type_cast_437), &(konst_436));\
bit_vector_clear(&konst_438);\
bit_vector_bitcast_to_bit_vector( &(type_cast_439), &(konst_438));\
bit_vector_clear(&konst_440);\
bit_vector_bitcast_to_bit_vector( &(type_cast_441), &(konst_440));\
bit_vector_not( &(type_cast_441), &(NOT_u4_u4_442));\
bit_vector_clear(&konst_443);\
bit_vector_bitcast_to_bit_vector( &(type_cast_444), &(konst_443));\
bit_vector_concatenate( &(NOT_u4_u4_442), &(type_cast_444), &(CONCAT_u4_u8_445));\
bit_vector_clear(&konst_447);\
bit_vector_bitcast_to_bit_vector( &(type_cast_448), &(konst_447));\
_accessMemory_( &(type_cast_437),  &(type_cast_439),  &(CONCAT_u4_u8_445),  &(q_base_address),  &(type_cast_448), &(ignore));\
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

#define _setQueueElement_assign_stmt_683_c_macro_ __declare_static_bit_vector(konst_680,36);\
bit_vector_clear(&konst_680);\
konst_680.val.byte_array[0] = 16;\
__declare_static_bit_vector(type_cast_681,36);\
bit_vector_clear(&type_cast_681);\
type_cast_681.val.byte_array[0] = 16;\
__declare_static_bit_vector(ADD_u36_u36_682,36);\
bit_vector_clear(&konst_680);\
konst_680.val.byte_array[0] = 16;\
bit_vector_bitcast_to_bit_vector( &(type_cast_681), &(konst_680));\
bit_vector_plus( &(q_base_address), &(type_cast_681), &(ADD_u36_u36_682));\
bit_vector_cast_to_bit_vector(0, &(buffer_address), &(ADD_u36_u36_682));\
;

#define _setQueueElement_assign_stmt_693_c_macro_ __declare_static_bit_vector(slice_687,31);\
__declare_static_bit_vector(konst_688,3);\
bit_vector_clear(&konst_688);\
__declare_static_bit_vector(type_cast_689,3);\
bit_vector_clear(&type_cast_689);\
__declare_static_bit_vector(CONCAT_u31_u34_690,34);\
__declare_static_bit_vector(type_cast_691,36);\
__declare_static_bit_vector(ADD_u36_u36_692,36);\
bit_vector_slice(&(write_pointer), &(slice_687), 1);\
bit_vector_clear(&konst_688);\
bit_vector_bitcast_to_bit_vector( &(type_cast_689), &(konst_688));\
bit_vector_concatenate( &(slice_687), &(type_cast_689), &(CONCAT_u31_u34_690));\
bit_vector_bitcast_to_bit_vector( &(type_cast_691), &(CONCAT_u31_u34_690));\
bit_vector_plus( &(buffer_address), &(type_cast_691), &(ADD_u36_u36_692));\
bit_vector_cast_to_bit_vector(0, &(element_pair_address), &(ADD_u36_u36_692));\
;

#define _setQueueElement_assign_stmt_711_c_macro_ __declare_static_bit_vector(konst_696,32);\
bit_vector_clear(&konst_696);\
__declare_static_bit_vector(BITSEL_u32_u1_697,1);\
__declare_static_bit_vector(konst_698,4);\
bit_vector_clear(&konst_698);\
__declare_static_bit_vector(type_cast_699,4);\
bit_vector_clear(&type_cast_699);\
__declare_static_bit_vector(konst_700,4);\
bit_vector_clear(&konst_700);\
__declare_static_bit_vector(type_cast_701,4);\
bit_vector_clear(&type_cast_701);\
__declare_static_bit_vector(NOT_u4_u4_702,4);\
bit_vector_clear(&NOT_u4_u4_702);\
NOT_u4_u4_702.val.byte_array[0] = 255;\
__declare_static_bit_vector(CONCAT_u4_u8_703,8);\
bit_vector_clear(&CONCAT_u4_u8_703);\
CONCAT_u4_u8_703.val.byte_array[0] = 15;\
__declare_static_bit_vector(konst_704,4);\
bit_vector_clear(&konst_704);\
__declare_static_bit_vector(type_cast_705,4);\
bit_vector_clear(&type_cast_705);\
__declare_static_bit_vector(NOT_u4_u4_706,4);\
bit_vector_clear(&NOT_u4_u4_706);\
NOT_u4_u4_706.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_707,4);\
bit_vector_clear(&konst_707);\
__declare_static_bit_vector(type_cast_708,4);\
bit_vector_clear(&type_cast_708);\
__declare_static_bit_vector(CONCAT_u4_u8_709,8);\
bit_vector_clear(&CONCAT_u4_u8_709);\
CONCAT_u4_u8_709.val.byte_array[0] = 240;\
__declare_static_bit_vector(MUX_710,8);\
bit_vector_clear(&konst_696);\
bit_vector_bitsel( &(write_pointer), &(konst_696), &(BITSEL_u32_u1_697));\
if (has_undefined_bit(&BITSEL_u32_u1_697)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_697 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_697));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_697)){bit_vector_clear(&konst_698);\
bit_vector_bitcast_to_bit_vector( &(type_cast_699), &(konst_698));\
bit_vector_clear(&konst_700);\
bit_vector_bitcast_to_bit_vector( &(type_cast_701), &(konst_700));\
bit_vector_not( &(type_cast_701), &(NOT_u4_u4_702));\
bit_vector_concatenate( &(type_cast_699), &(NOT_u4_u4_702), &(CONCAT_u4_u8_703));\
bit_vector_cast_to_bit_vector(0, &(MUX_710), &(CONCAT_u4_u8_703));\
}else {bit_vector_clear(&konst_704);\
bit_vector_bitcast_to_bit_vector( &(type_cast_705), &(konst_704));\
bit_vector_not( &(type_cast_705), &(NOT_u4_u4_706));\
bit_vector_clear(&konst_707);\
bit_vector_bitcast_to_bit_vector( &(type_cast_708), &(konst_707));\
bit_vector_concatenate( &(NOT_u4_u4_706), &(type_cast_708), &(CONCAT_u4_u8_709));\
bit_vector_cast_to_bit_vector(0, &(MUX_710), &(CONCAT_u4_u8_709));\
}bit_vector_cast_to_bit_vector(0, &(bmask), &(MUX_710));\
;

#define _setQueueElement_assign_stmt_725_c_macro_ __declare_static_bit_vector(konst_714,32);\
bit_vector_clear(&konst_714);\
__declare_static_bit_vector(BITSEL_u32_u1_715,1);\
__declare_static_bit_vector(konst_716,32);\
bit_vector_clear(&konst_716);\
__declare_static_bit_vector(type_cast_717,32);\
bit_vector_clear(&type_cast_717);\
__declare_static_bit_vector(CONCAT_u32_u64_719,64);\
__declare_static_bit_vector(konst_721,32);\
bit_vector_clear(&konst_721);\
__declare_static_bit_vector(type_cast_722,32);\
bit_vector_clear(&type_cast_722);\
__declare_static_bit_vector(CONCAT_u32_u64_723,64);\
__declare_static_bit_vector(MUX_724,64);\
bit_vector_clear(&konst_714);\
bit_vector_bitsel( &(write_pointer), &(konst_714), &(BITSEL_u32_u1_715));\
if (has_undefined_bit(&BITSEL_u32_u1_715)) {fprintf(stderr, "Error: variable BITSEL_u32_u1_715 has undefined value (%s) at test point.\n", to_string(&BITSEL_u32_u1_715));assert(0);} \
if(bit_vector_to_uint64(0, &BITSEL_u32_u1_715)){bit_vector_clear(&konst_716);\
bit_vector_bitcast_to_bit_vector( &(type_cast_717), &(konst_716));\
bit_vector_concatenate( &(type_cast_717), &(q_w_data), &(CONCAT_u32_u64_719));\
bit_vector_cast_to_bit_vector(0, &(MUX_724), &(CONCAT_u32_u64_719));\
}else {bit_vector_clear(&konst_721);\
bit_vector_bitcast_to_bit_vector( &(type_cast_722), &(konst_721));\
bit_vector_concatenate( &(q_w_data), &(type_cast_722), &(CONCAT_u32_u64_723));\
bit_vector_cast_to_bit_vector(0, &(MUX_724), &(CONCAT_u32_u64_723));\
}bit_vector_cast_to_bit_vector(0, &(wval), &(MUX_724));\
;

#define _setQueueElement_call_stmt_734_c_macro_ __declare_static_bit_vector(konst_726,1);\
bit_vector_clear(&konst_726);\
__declare_static_bit_vector(type_cast_727,1);\
bit_vector_clear(&type_cast_727);\
__declare_static_bit_vector(konst_728,1);\
bit_vector_clear(&konst_728);\
__declare_static_bit_vector(type_cast_729,1);\
bit_vector_clear(&type_cast_729);\
bit_vector_clear(&konst_726);\
bit_vector_bitcast_to_bit_vector( &(type_cast_727), &(konst_726));\
bit_vector_clear(&konst_728);\
bit_vector_bitcast_to_bit_vector( &(type_cast_729), &(konst_728));\
_accessMemory_( &(type_cast_727),  &(type_cast_729),  &(bmask),  &(element_pair_address),  &(wval), &(ignore));\
;

#define _setQueueElement_inner_outarg_prep_macro__ ;

#define _setQueuePointers_inner_inarg_prep_macro__ __declare_static_bit_vector(q_base_address,36);\
bit_vector_cast_to_bit_vector(0, &(q_base_address), &((*__pq_base_address)));\
__declare_static_bit_vector(wp,32);\
bit_vector_cast_to_bit_vector(0, &(wp), &((*__pwp)));\
__declare_static_bit_vector(rp,32);\
bit_vector_cast_to_bit_vector(0, &(rp), &((*__prp)));\
__declare_static_bit_vector(ignore,64);\

#define _setQueuePointers_call_stmt_432_c_macro_ __declare_static_bit_vector(konst_418,1);\
bit_vector_clear(&konst_418);\
__declare_static_bit_vector(type_cast_419,1);\
bit_vector_clear(&type_cast_419);\
__declare_static_bit_vector(konst_420,1);\
bit_vector_clear(&konst_420);\
__declare_static_bit_vector(type_cast_421,1);\
bit_vector_clear(&type_cast_421);\
__declare_static_bit_vector(konst_422,8);\
bit_vector_clear(&konst_422);\
__declare_static_bit_vector(type_cast_423,8);\
bit_vector_clear(&type_cast_423);\
__declare_static_bit_vector(NOT_u8_u8_424,8);\
bit_vector_clear(&NOT_u8_u8_424);\
NOT_u8_u8_424.val.byte_array[0] = 255;\
__declare_static_bit_vector(konst_426,36);\
bit_vector_clear(&konst_426);\
konst_426.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_427,36);\
__declare_static_bit_vector(CONCAT_u32_u64_430,64);\
bit_vector_clear(&konst_418);\
bit_vector_bitcast_to_bit_vector( &(type_cast_419), &(konst_418));\
bit_vector_clear(&konst_420);\
bit_vector_bitcast_to_bit_vector( &(type_cast_421), &(konst_420));\
bit_vector_clear(&konst_422);\
bit_vector_bitcast_to_bit_vector( &(type_cast_423), &(konst_422));\
bit_vector_not( &(type_cast_423), &(NOT_u8_u8_424));\
bit_vector_clear(&konst_426);\
konst_426.val.byte_array[0] = 8;\
bit_vector_plus( &(q_base_address), &(konst_426), &(ADD_u36_u36_427));\
bit_vector_concatenate( &(wp), &(rp), &(CONCAT_u32_u64_430));\
_accessMemory_( &(type_cast_419),  &(type_cast_421),  &(NOT_u8_u8_424),  &(ADD_u36_u36_427),  &(CONCAT_u32_u64_430), &(ignore));\
;

#define _setQueuePointers_inner_outarg_prep_macro__ ;

#define _transmitEngineDaemon_inner_inarg_prep_macro__ 
#define _transmitEngineDaemon_assign_stmt_1494_c_macro_ __declare_static_bit_vector(konst_1493,6);\
bit_vector_clear(&konst_1493);\
bit_vector_clear(&konst_1493);\
write_bit_vector_to_pipe("LAST_READ_TX_QUEUE_INDEX",&(konst_1493));\
;

#define _transmitEngineDaemon_branch_block_stmt_1495_c_export_decl_macro_ __declare_static_bit_vector(tx_q_index,6);\
__declare_static_bit_vector(pkt_pointer,32);\
__declare_static_bit_vector(tx_flag,1);\
__declare_static_bit_vector(transmitted_flag,1);\
__declare_static_bit_vector(push_pointer_back_to_free_Q,1);\
__declare_static_bit_vector(push_status,1);\


#define _transmitEngineDaemon_merge_stmt_1496_c_preamble_macro_ uint8_t merge_stmt_1496_entry_flag;\
merge_stmt_1496_entry_flag = 1;\
uint8_t not_enabled_yet_loopback_1495_flag = 0;\
uint8_t disable_loopback_1495_flag = 0;\
goto merge_stmt_1496_run;\
not_enabled_yet_loopback_1495: not_enabled_yet_loopback_1495_flag = 1;\
disable_loopback_1495_flag = 0;\
goto merge_stmt_1496_run;\
disable_loopback_1495: disable_loopback_1495_flag = 1;\
not_enabled_yet_loopback_1495_flag = 0;\
goto merge_stmt_1496_run;\
merge_stmt_1496_run: ;\
;

#define _transmitEngineDaemon_merge_stmt_1496_c_postamble_macro_ not_enabled_yet_loopback_1495_flag = 0;\
disable_loopback_1495_flag = 0;\
merge_stmt_1496_entry_flag = 0;

#define _transmitEngineDaemon_merge_stmt_1505_c_preamble_macro_ uint8_t merge_stmt_1505_entry_flag;\
merge_stmt_1505_entry_flag = do_while_entry_flag;\
goto merge_stmt_1505_run;\
merge_stmt_1505_run: ;\

#define _transmitEngineDaemon_phi_stmt_1506_c_macro_ __declare_static_bit_vector(RPIPE_LAST_READ_TX_QUEUE_INDEX_1508,6);\
__declare_static_bit_vector(konst_1509,6);\
bit_vector_clear(&konst_1509);\
konst_1509.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1510,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1511,32);\
__declare_static_bit_vector(konst_1512,32);\
bit_vector_clear(&konst_1512);\
konst_1512.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1513,32);\
__declare_static_bit_vector(type_cast_1514,6);\
__declare_static_bit_vector(AND_u6_u6_1515,6);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("LAST_READ_TX_QUEUE_INDEX",&(RPIPE_LAST_READ_TX_QUEUE_INDEX_1508));\
bit_vector_clear(&konst_1509);\
konst_1509.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_READ_TX_QUEUE_INDEX_1508), &(konst_1509), &(ADD_u6_u6_1510));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1511));\
bit_vector_clear(&konst_1512);\
konst_1512.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_1511), &(konst_1512), &(SUB_u32_u32_1513));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1514), &(SUB_u32_u32_1513));\
bit_vector_and(&(ADD_u6_u6_1510), &(type_cast_1514), &(AND_u6_u6_1515));\
bit_vector_cast_to_bit_vector(0, &(tx_q_index), &(AND_u6_u6_1515));\
}\
else {\
__declare_static_bit_vector(RPIPE_LAST_READ_TX_QUEUE_INDEX_1508,6);\
__declare_static_bit_vector(konst_1509,6);\
bit_vector_clear(&konst_1509);\
konst_1509.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u6_u6_1510,6);\
__declare_static_bit_vector(RPIPE_NUMBER_OF_SERVERS_1511,32);\
__declare_static_bit_vector(konst_1512,32);\
bit_vector_clear(&konst_1512);\
konst_1512.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u32_u32_1513,32);\
__declare_static_bit_vector(type_cast_1514,6);\
__declare_static_bit_vector(AND_u6_u6_1515,6);\
read_bit_vector_from_pipe("LAST_READ_TX_QUEUE_INDEX",&(RPIPE_LAST_READ_TX_QUEUE_INDEX_1508));\
bit_vector_clear(&konst_1509);\
konst_1509.val.byte_array[0] = 1;\
bit_vector_plus( &(RPIPE_LAST_READ_TX_QUEUE_INDEX_1508), &(konst_1509), &(ADD_u6_u6_1510));\
read_bit_vector_from_pipe("NUMBER_OF_SERVERS",&(RPIPE_NUMBER_OF_SERVERS_1511));\
bit_vector_clear(&konst_1512);\
konst_1512.val.byte_array[0] = 1;\
bit_vector_minus( &(RPIPE_NUMBER_OF_SERVERS_1511), &(konst_1512), &(SUB_u32_u32_1513));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1514), &(SUB_u32_u32_1513));\
bit_vector_and(&(ADD_u6_u6_1510), &(type_cast_1514), &(AND_u6_u6_1515));\
bit_vector_cast_to_bit_vector(0, &(tx_q_index), &(AND_u6_u6_1515));\
}\
;
;

#define _transmitEngineDaemon_merge_stmt_1505_c_postamble_macro_ merge_stmt_1505_entry_flag = 0;

#define _transmitEngineDaemon_call_stmt_1520_c_macro_ _getTxPacketPointerFromServer_( &(tx_q_index), &(pkt_pointer), &(tx_flag));\
;

#define _transmitEngineDaemon_call_stmt_1524_c_macro_ if (has_undefined_bit(&tx_flag)) {fprintf(stderr, "Error: variable tx_flag has undefined value (%s) at test point.\n", to_string(&tx_flag));assert(0);} \
if (bit_vector_to_uint64(0, &tx_flag)) {\
_transmitPacket_( &(pkt_pointer), &(transmitted_flag));\
}\
;

#define _transmitEngineDaemon_assign_stmt_1529_c_macro_ __declare_static_bit_vector(AND_u1_u1_1528,1);\
bit_vector_and(&(tx_flag), &(transmitted_flag), &(AND_u1_u1_1528));\
bit_vector_cast_to_bit_vector(0, &(push_pointer_back_to_free_Q), &(AND_u1_u1_1528));\
;

#define _transmitEngineDaemon_call_stmt_1536_c_macro_ if (has_undefined_bit(&push_pointer_back_to_free_Q)) {fprintf(stderr, "Error: variable push_pointer_back_to_free_Q has undefined value (%s) at test point.\n", to_string(&push_pointer_back_to_free_Q));assert(0);} \
__declare_static_bit_vector(konst_1531,1);\
bit_vector_clear(&konst_1531);\
konst_1531.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1532,1);\
bit_vector_clear(&type_cast_1532);\
type_cast_1532.val.byte_array[0] = 1;\
__declare_static_bit_vector(RPIPE_FREE_Q_1533,36);\
if (bit_vector_to_uint64(0, &push_pointer_back_to_free_Q)) {\
bit_vector_clear(&konst_1531);\
konst_1531.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1532), &(konst_1531));\
read_bit_vector_from_pipe("FREE_Q",&(RPIPE_FREE_Q_1533));\
_pushIntoQueue_( &(type_cast_1532),  &(RPIPE_FREE_Q_1533),  &(pkt_pointer), &(push_status));\
}\
;

#define _transmitEngineDaemon_assign_stmt_1539_c_macro_ write_bit_vector_to_pipe("LAST_READ_TX_QUEUE_INDEX",&(tx_q_index));\
;
;

#define _transmitEngineDaemon_branch_block_stmt_1495_c_export_apply_macro_ ;

#define _transmitEngineDaemon_inner_outarg_prep_macro__ ;

#define _transmitEngineDaemon_outer_arg_decl_macro__ ;

#define _transmitEngineDaemon_outer_op_xfer_macro__ ;

#define _transmitPacket_inner_inarg_prep_macro__ __declare_static_bit_vector(packet_pointer,32);\
bit_vector_cast_to_bit_vector(0, &(packet_pointer), &((*__ppacket_pointer)));\
__declare_static_bit_vector(status,1);\
__declare_static_bit_vector(control_data_addr,36);\
__declare_static_bit_vector(control_data,64);\
__declare_static_bit_vector(unused,44);\
__declare_static_bit_vector(packet_size,12);\
__declare_static_bit_vector(last_tkeep,8);\

#define _transmitPacket_assign_stmt_1389_c_macro_ __declare_static_bit_vector(slice_1384,31);\
__declare_static_bit_vector(konst_1385,3);\
bit_vector_clear(&konst_1385);\
__declare_static_bit_vector(type_cast_1386,3);\
bit_vector_clear(&type_cast_1386);\
__declare_static_bit_vector(CONCAT_u31_u34_1387,34);\
__declare_static_bit_vector(type_cast_1388,36);\
bit_vector_slice(&(packet_pointer), &(slice_1384), 1);\
bit_vector_clear(&konst_1385);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1386), &(konst_1385));\
bit_vector_concatenate( &(slice_1384), &(type_cast_1386), &(CONCAT_u31_u34_1387));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1388), &(CONCAT_u31_u34_1387));\
bit_vector_cast_to_bit_vector(0, &(control_data_addr), &(type_cast_1388));\
;

#define _transmitPacket_call_stmt_1399_c_macro_ __declare_static_bit_vector(konst_1390,1);\
bit_vector_clear(&konst_1390);\
__declare_static_bit_vector(type_cast_1391,1);\
bit_vector_clear(&type_cast_1391);\
__declare_static_bit_vector(konst_1392,1);\
bit_vector_clear(&konst_1392);\
konst_1392.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1393,1);\
bit_vector_clear(&type_cast_1393);\
type_cast_1393.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1396,64);\
bit_vector_clear(&konst_1396);\
__declare_static_bit_vector(type_cast_1397,64);\
bit_vector_clear(&type_cast_1397);\
bit_vector_clear(&konst_1390);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1391), &(konst_1390));\
bit_vector_clear(&konst_1392);\
konst_1392.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1393), &(konst_1392));\
bit_vector_clear(&konst_1396);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1397), &(konst_1396));\
_accessMemory_( &(type_cast_1391),  &(type_cast_1393),  &(FULL_BYTE_MASK),  &(control_data_addr),  &(type_cast_1397), &(control_data));\
;

#define _transmitPacket_assign_stmt_1404_c_macro_ __declare_static_bit_vector(slice_1403,44);\
bit_vector_slice(&(control_data), &(slice_1403), 20);\
bit_vector_cast_to_bit_vector(0, &(unused), &(slice_1403));\
;

#define _transmitPacket_assign_stmt_1409_c_macro_ __declare_static_bit_vector(slice_1408,12);\
bit_vector_slice(&(control_data), &(slice_1408), 8);\
bit_vector_cast_to_bit_vector(0, &(packet_size), &(slice_1408));\
;

#define _transmitPacket_assign_stmt_1413_c_macro_ __declare_static_bit_vector(slice_1412,8);\
bit_vector_slice(&(control_data), &(slice_1412), 0);\
bit_vector_cast_to_bit_vector(0, &(last_tkeep), &(slice_1412));\
;

#define _transmitPacket_branch_block_stmt_1414_c_export_decl_macro_ __declare_static_bit_vector(count_down,12);\
__declare_static_bit_vector(mem_addr,36);\
__declare_static_bit_vector(data,64);\
__declare_static_bit_vector(ncount_down,12);\
__declare_static_bit_vector(nmem_addr,36);\
__declare_static_bit_vector(not_last_word,1);\
__declare_static_bit_vector(last_word,64);\
__declare_static_bit_vector(nic_to_mac_transmit_ppe,73);\


#define _transmitPacket_merge_stmt_1416_c_preamble_macro_ uint8_t merge_stmt_1416_entry_flag;\
merge_stmt_1416_entry_flag = do_while_entry_flag;\
goto merge_stmt_1416_run;\
merge_stmt_1416_run: ;\

#define _transmitPacket_phi_stmt_1417_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(count_down), &(ncount_down));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(count_down), &(packet_size));\
}\
;

#define _transmitPacket_phi_stmt_1421_c_macro_ __declare_static_bit_vector(konst_1424,36);\
bit_vector_clear(&konst_1424);\
konst_1424.val.byte_array[0] = 16;\
__declare_static_bit_vector(ADD_u36_u36_1425,36);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(mem_addr), &(nmem_addr));\
}\
else {\
__declare_static_bit_vector(konst_1424,36);\
bit_vector_clear(&konst_1424);\
konst_1424.val.byte_array[0] = 16;\
__declare_static_bit_vector(ADD_u36_u36_1425,36);\
bit_vector_clear(&konst_1424);\
konst_1424.val.byte_array[0] = 16;\
bit_vector_plus( &(control_data_addr), &(konst_1424), &(ADD_u36_u36_1425));\
bit_vector_cast_to_bit_vector(0, &(mem_addr), &(ADD_u36_u36_1425));\
}\
;
;

#define _transmitPacket_merge_stmt_1416_c_postamble_macro_ merge_stmt_1416_entry_flag = 0;

#define _transmitPacket_call_stmt_1437_c_macro_ __declare_static_bit_vector(konst_1428,1);\
bit_vector_clear(&konst_1428);\
__declare_static_bit_vector(type_cast_1429,1);\
bit_vector_clear(&type_cast_1429);\
__declare_static_bit_vector(konst_1430,1);\
bit_vector_clear(&konst_1430);\
konst_1430.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1431,1);\
bit_vector_clear(&type_cast_1431);\
type_cast_1431.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1434,64);\
bit_vector_clear(&konst_1434);\
__declare_static_bit_vector(type_cast_1435,64);\
bit_vector_clear(&type_cast_1435);\
bit_vector_clear(&konst_1428);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1429), &(konst_1428));\
bit_vector_clear(&konst_1430);\
konst_1430.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1431), &(konst_1430));\
bit_vector_clear(&konst_1434);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1435), &(konst_1434));\
_accessMemory_( &(type_cast_1429),  &(type_cast_1431),  &(FULL_BYTE_MASK),  &(mem_addr),  &(type_cast_1435), &(data));\
;

#define _transmitPacket_assign_stmt_1445_c_macro_ __declare_static_bit_vector(konst_1439,1);\
bit_vector_clear(&konst_1439);\
konst_1439.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1440,1);\
bit_vector_clear(&type_cast_1440);\
type_cast_1440.val.byte_array[0] = 1;\
__declare_static_bit_vector(CONCAT_u1_u65_1442,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1444,73);\
bit_vector_clear(&konst_1439);\
konst_1439.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1440), &(konst_1439));\
bit_vector_concatenate( &(type_cast_1440), &(data), &(CONCAT_u1_u65_1442));\
bit_vector_concatenate( &(CONCAT_u1_u65_1442), &(FULL_BYTE_MASK), &(CONCAT_u65_u73_1444));\
write_bit_vector_to_pipe("nic_to_mac_transmit_pipe",&(CONCAT_u65_u73_1444));\
;

#define _transmitPacket_assign_stmt_1450_c_macro_ __declare_static_bit_vector(konst_1448,12);\
bit_vector_clear(&konst_1448);\
konst_1448.val.byte_array[0] = 8;\
__declare_static_bit_vector(SUB_u12_u12_1449,12);\
bit_vector_clear(&konst_1448);\
konst_1448.val.byte_array[0] = 8;\
bit_vector_minus( &(count_down), &(konst_1448), &(SUB_u12_u12_1449));\
bit_vector_cast_to_bit_vector(0, &(ncount_down), &(SUB_u12_u12_1449));\
;

#define _transmitPacket_assign_stmt_1455_c_macro_ __declare_static_bit_vector(konst_1453,36);\
bit_vector_clear(&konst_1453);\
konst_1453.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_1454,36);\
bit_vector_clear(&konst_1453);\
konst_1453.val.byte_array[0] = 8;\
bit_vector_plus( &(mem_addr), &(konst_1453), &(ADD_u36_u36_1454));\
bit_vector_cast_to_bit_vector(0, &(nmem_addr), &(ADD_u36_u36_1454));\
;

#define _transmitPacket_assign_stmt_1460_c_macro_ __declare_static_bit_vector(konst_1458,12);\
bit_vector_clear(&konst_1458);\
konst_1458.val.byte_array[0] = 8;\
__declare_static_bit_vector(UGT_u12_u1_1459,1);\
bit_vector_clear(&konst_1458);\
konst_1458.val.byte_array[0] = 8;\
bit_vector_greater(0, &(ncount_down), &(konst_1458), &(UGT_u12_u1_1459));\
bit_vector_cast_to_bit_vector(0, &(not_last_word), &(UGT_u12_u1_1459));\
;

#define _transmitPacket_call_stmt_1472_c_macro_ __declare_static_bit_vector(konst_1463,1);\
bit_vector_clear(&konst_1463);\
__declare_static_bit_vector(type_cast_1464,1);\
bit_vector_clear(&type_cast_1464);\
__declare_static_bit_vector(konst_1465,1);\
bit_vector_clear(&konst_1465);\
konst_1465.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1466,1);\
bit_vector_clear(&type_cast_1466);\
type_cast_1466.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_1469,64);\
bit_vector_clear(&konst_1469);\
__declare_static_bit_vector(type_cast_1470,64);\
bit_vector_clear(&type_cast_1470);\
bit_vector_clear(&konst_1463);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1464), &(konst_1463));\
bit_vector_clear(&konst_1465);\
konst_1465.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1466), &(konst_1465));\
bit_vector_clear(&konst_1469);\
bit_vector_bitcast_to_bit_vector( &(type_cast_1470), &(konst_1469));\
_accessMemory_( &(type_cast_1464),  &(type_cast_1466),  &(FULL_BYTE_MASK),  &(nmem_addr),  &(type_cast_1470), &(last_word));\
;

#define _transmitPacket_assign_stmt_1480_c_macro_ __declare_static_bit_vector(konst_1474,1);\
bit_vector_clear(&konst_1474);\
konst_1474.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_1475,1);\
bit_vector_clear(&type_cast_1475);\
type_cast_1475.val.byte_array[0] = 1;\
__declare_static_bit_vector(CONCAT_u1_u65_1477,65);\
__declare_static_bit_vector(CONCAT_u65_u73_1479,73);\
bit_vector_clear(&konst_1474);\
konst_1474.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_1475), &(konst_1474));\
bit_vector_concatenate( &(type_cast_1475), &(last_word), &(CONCAT_u1_u65_1477));\
bit_vector_concatenate( &(CONCAT_u1_u65_1477), &(last_tkeep), &(CONCAT_u65_u73_1479));\
bit_vector_cast_to_bit_vector(0, &(nic_to_mac_transmit_ppe), &(CONCAT_u65_u73_1479));\
;

#define _transmitPacket_assign_stmt_1488_c_macro_ __declare_static_bit_vector(SUB_u36_u36_1485,36);\
__declare_static_bit_vector(type_cast_1486,12);\
__declare_static_bit_vector(EQ_u12_u1_1487,1);\
bit_vector_minus( &(nmem_addr), &(control_data_addr), &(SUB_u36_u36_1485));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1486), &(SUB_u36_u36_1485));\
bit_vector_equal(0, &(packet_size), &(type_cast_1486), &(EQ_u12_u1_1487));\
bit_vector_cast_to_bit_vector(0, &(status), &(EQ_u12_u1_1487));\
;
;

#define _transmitPacket_branch_block_stmt_1414_c_export_apply_macro_ ;

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

#define _writeControlInformationToMem_assign_stmt_645_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_643,16);\
__declare_static_bit_vector(type_cast_644,64);\
bit_vector_concatenate( &(packet_size), &(last_keep), &(CONCAT_u8_u16_643));\
bit_vector_bitcast_to_bit_vector( &(type_cast_644), &(CONCAT_u8_u16_643));\
bit_vector_cast_to_bit_vector(0, &(control_data), &(type_cast_644));\
;

#define _writeControlInformationToMem_call_stmt_654_c_macro_ __declare_static_bit_vector(konst_646,1);\
bit_vector_clear(&konst_646);\
__declare_static_bit_vector(type_cast_647,1);\
bit_vector_clear(&type_cast_647);\
__declare_static_bit_vector(konst_648,1);\
bit_vector_clear(&konst_648);\
__declare_static_bit_vector(type_cast_649,1);\
bit_vector_clear(&type_cast_649);\
bit_vector_clear(&konst_646);\
bit_vector_bitcast_to_bit_vector( &(type_cast_647), &(konst_646));\
bit_vector_clear(&konst_648);\
bit_vector_bitcast_to_bit_vector( &(type_cast_649), &(konst_648));\
_accessMemory_( &(type_cast_647),  &(type_cast_649),  &(FULL_BYTE_MASK),  &(base_buffer_pointer),  &(control_data), &(ignore_return));\
;

#define _writeControlInformationToMem_inner_outarg_prep_macro__ ;

#define _writeEthernetHeaderToMem_inner_inarg_prep_macro__ __declare_static_bit_vector(buf_pointer,36);\
bit_vector_cast_to_bit_vector(0, &(buf_pointer), &((*__pbuf_pointer)));\
__declare_static_bit_vector(buf_position,36);\

#define _writeEthernetHeaderToMem_branch_block_stmt_510_c_export_decl_macro_ __declare_static_bit_vector(I,4);\
__declare_static_bit_vector(ethernet_header,73);\
__declare_static_bit_vector(last_bit,1);\
__declare_static_bit_vector(wdata,64);\
__declare_static_bit_vector(wkeep,8);\
__declare_static_bit_vector(ignore_return,64);\
__declare_static_bit_vector(nI,4);\


#define _writeEthernetHeaderToMem_merge_stmt_512_c_preamble_macro_ uint8_t merge_stmt_512_entry_flag;\
merge_stmt_512_entry_flag = do_while_entry_flag;\
goto merge_stmt_512_run;\
merge_stmt_512_run: ;\

#define _writeEthernetHeaderToMem_phi_stmt_513_c_macro_ __declare_static_bit_vector(konst_516,36);\
bit_vector_clear(&konst_516);\
konst_516.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_517,36);\
__declare_static_bit_vector(konst_519,36);\
bit_vector_clear(&konst_519);\
konst_519.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_520,36);\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_519);\
konst_519.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_position), &(konst_519), &(ADD_u36_u36_520));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_520));\
}\
else {\
__declare_static_bit_vector(konst_516,36);\
bit_vector_clear(&konst_516);\
konst_516.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_517,36);\
bit_vector_clear(&konst_516);\
konst_516.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_pointer), &(konst_516), &(ADD_u36_u36_517));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_517));\
}\
;

#define _writeEthernetHeaderToMem_phi_stmt_521_c_macro_ __declare_static_bit_vector(konst_523,4);\
bit_vector_clear(&konst_523);\
__declare_static_bit_vector(type_cast_524,4);\
bit_vector_clear(&type_cast_524);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(I), &(nI));\
}\
else {\
__declare_static_bit_vector(konst_523,4);\
bit_vector_clear(&konst_523);\
__declare_static_bit_vector(type_cast_524,4);\
bit_vector_clear(&type_cast_524);\
bit_vector_clear(&konst_523);\
bit_vector_bitcast_to_bit_vector( &(type_cast_524), &(konst_523));\
bit_vector_cast_to_bit_vector(0, &(I), &(type_cast_524));\
}\
;

#define _writeEthernetHeaderToMem_phi_stmt_526_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_header_528,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_528));\
bit_vector_cast_to_bit_vector(0, &(ethernet_header), &(RPIPE_nic_rx_to_header_528));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_header_528,73);\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_528));\
bit_vector_cast_to_bit_vector(0, &(ethernet_header), &(RPIPE_nic_rx_to_header_528));\
}\
;
;

#define _writeEthernetHeaderToMem_merge_stmt_512_c_postamble_macro_ merge_stmt_512_entry_flag = 0;

#define _writeEthernetHeaderToMem_stmt_531_c_macro_ uint32_t _writeEthernetHeaderToMem_stmt_531_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t%s\n",_writeEthernetHeaderToMem_stmt_531_c_macro___print_counter,"received_eth_header_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]writeEthernetHeaderToMem>\t\t%s\t\t",_writeEthernetHeaderToMem_stmt_531_c_macro___print_counter,"ethernet_header");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(ethernet_header)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _writeEthernetHeaderToMem_assign_stmt_535_c_macro_ __declare_static_bit_vector(slice_534,1);\
bit_vector_slice(&(ethernet_header), &(slice_534), 72);\
bit_vector_cast_to_bit_vector(0, &(last_bit), &(slice_534));\
;

#define _writeEthernetHeaderToMem_assign_stmt_539_c_macro_ __declare_static_bit_vector(slice_538,64);\
bit_vector_slice(&(ethernet_header), &(slice_538), 8);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_538));\
;

#define _writeEthernetHeaderToMem_assign_stmt_543_c_macro_ __declare_static_bit_vector(slice_542,8);\
bit_vector_slice(&(ethernet_header), &(slice_542), 0);\
bit_vector_cast_to_bit_vector(0, &(wkeep), &(slice_542));\
;

#define _writeEthernetHeaderToMem_call_stmt_552_c_macro_ __declare_static_bit_vector(konst_544,1);\
bit_vector_clear(&konst_544);\
__declare_static_bit_vector(type_cast_545,1);\
bit_vector_clear(&type_cast_545);\
__declare_static_bit_vector(konst_546,1);\
bit_vector_clear(&konst_546);\
__declare_static_bit_vector(type_cast_547,1);\
bit_vector_clear(&type_cast_547);\
bit_vector_clear(&konst_544);\
bit_vector_bitcast_to_bit_vector( &(type_cast_545), &(konst_544));\
bit_vector_clear(&konst_546);\
bit_vector_bitcast_to_bit_vector( &(type_cast_547), &(konst_546));\
_accessMemory_( &(type_cast_545),  &(type_cast_547),  &(wkeep),  &(buf_position),  &(wdata), &(ignore_return));\
;

#define _writeEthernetHeaderToMem_assign_stmt_557_c_macro_ __declare_static_bit_vector(konst_555,4);\
bit_vector_clear(&konst_555);\
konst_555.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u4_u4_556,4);\
bit_vector_clear(&konst_555);\
konst_555.val.byte_array[0] = 1;\
bit_vector_plus( &(I), &(konst_555), &(ADD_u4_u4_556));\
bit_vector_cast_to_bit_vector(0, &(nI), &(ADD_u4_u4_556));\
;
;

#define _writeEthernetHeaderToMem_branch_block_stmt_510_c_export_apply_macro_ ;

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

#define _writePayloadToMem_branch_block_stmt_570_c_export_decl_macro_ __declare_static_bit_vector(buf_position__buf_position,36);\
__declare_static_bit_vector(tdata__wdata,64);\
__declare_static_bit_vector(tkeep__wkeep,8);\
__declare_static_bit_vector(buf_position,36);\
__declare_static_bit_vector(payload_data,73);\
__declare_static_bit_vector(last_bit,1);\
__declare_static_bit_vector(wdata,64);\
__declare_static_bit_vector(wkeep,8);\
__declare_static_bit_vector(ignore_return,64);\


#define _writePayloadToMem_merge_stmt_572_c_preamble_macro_ uint8_t merge_stmt_572_entry_flag;\
merge_stmt_572_entry_flag = do_while_entry_flag;\
goto merge_stmt_572_run;\
merge_stmt_572_run: ;\

#define _writePayloadToMem_phi_stmt_573_c_macro_ __declare_static_bit_vector(konst_576,36);\
bit_vector_clear(&konst_576);\
konst_576.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_577,36);\
__declare_static_bit_vector(konst_579,36);\
bit_vector_clear(&konst_579);\
konst_579.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_580,36);\
if(do_while_loopback_flag) {\
bit_vector_clear(&konst_579);\
konst_579.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_position), &(konst_579), &(ADD_u36_u36_580));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_580));\
}\
else {\
__declare_static_bit_vector(konst_576,36);\
bit_vector_clear(&konst_576);\
konst_576.val.byte_array[0] = 8;\
__declare_static_bit_vector(ADD_u36_u36_577,36);\
bit_vector_clear(&konst_576);\
konst_576.val.byte_array[0] = 8;\
bit_vector_plus( &(buf_pointer), &(konst_576), &(ADD_u36_u36_577));\
bit_vector_cast_to_bit_vector(0, &(buf_position), &(ADD_u36_u36_577));\
}\
;

#define _writePayloadToMem_phi_stmt_581_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_packet_583,73);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_583));\
bit_vector_cast_to_bit_vector(0, &(payload_data), &(RPIPE_nic_rx_to_packet_583));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_packet_583,73);\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_583));\
bit_vector_cast_to_bit_vector(0, &(payload_data), &(RPIPE_nic_rx_to_packet_583));\
}\
;
;

#define _writePayloadToMem_merge_stmt_572_c_postamble_macro_ merge_stmt_572_entry_flag = 0;

#define _writePayloadToMem_assign_stmt_588_c_macro_ __declare_static_bit_vector(slice_587,1);\
bit_vector_slice(&(payload_data), &(slice_587), 72);\
bit_vector_cast_to_bit_vector(0, &(last_bit), &(slice_587));\
;

#define _writePayloadToMem_assign_stmt_592_c_macro_ __declare_static_bit_vector(slice_591,64);\
bit_vector_slice(&(payload_data), &(slice_591), 8);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_591));\
;

#define _writePayloadToMem_assign_stmt_596_c_macro_ __declare_static_bit_vector(slice_595,8);\
bit_vector_slice(&(payload_data), &(slice_595), 0);\
bit_vector_cast_to_bit_vector(0, &(wkeep), &(slice_595));\
;

#define _writePayloadToMem_call_stmt_605_c_macro_ __declare_static_bit_vector(konst_597,1);\
bit_vector_clear(&konst_597);\
__declare_static_bit_vector(type_cast_598,1);\
bit_vector_clear(&type_cast_598);\
__declare_static_bit_vector(konst_599,1);\
bit_vector_clear(&konst_599);\
__declare_static_bit_vector(type_cast_600,1);\
bit_vector_clear(&type_cast_600);\
bit_vector_clear(&konst_597);\
bit_vector_bitcast_to_bit_vector( &(type_cast_598), &(konst_597));\
bit_vector_clear(&konst_599);\
bit_vector_bitcast_to_bit_vector( &(type_cast_600), &(konst_599));\
_accessMemory_( &(type_cast_598),  &(type_cast_600),  &(wkeep),  &(buf_position),  &(wdata), &(ignore_return));\
;
;

#define _writePayloadToMem_branch_block_stmt_570_c_export_apply_macro_ bit_vector_cast_to_bit_vector(0, &(buf_position__buf_position), &(buf_position));\
bit_vector_cast_to_bit_vector(0, &(tdata__wdata), &(wdata));\
bit_vector_cast_to_bit_vector(0, &(tkeep__wkeep), &(wkeep));\
;

#define _writePayloadToMem_assign_stmt_618_c_macro_ __declare_static_bit_vector(EQ_u64_u1_613,1);\
__declare_static_bit_vector(konst_615,8);\
bit_vector_clear(&konst_615);\
__declare_static_bit_vector(EQ_u8_u1_616,1);\
__declare_static_bit_vector(AND_u1_u1_617,1);\
bit_vector_equal(0, &(tdata__wdata), &(BAD_PACKET_DATA), &(EQ_u64_u1_613));\
bit_vector_clear(&konst_615);\
bit_vector_equal(0, &(tkeep__wkeep), &(konst_615), &(EQ_u8_u1_616));\
bit_vector_and(&(EQ_u64_u1_613), &(EQ_u8_u1_616), &(AND_u1_u1_617));\
bit_vector_cast_to_bit_vector(0, &(bad_packet_identifier), &(AND_u1_u1_617));\
;

#define _writePayloadToMem_assign_stmt_626_c_macro_ __declare_static_bit_vector(SUB_u36_u36_622,36);\
__declare_static_bit_vector(konst_623,36);\
bit_vector_clear(&konst_623);\
konst_623.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u36_u36_624,36);\
__declare_static_bit_vector(type_cast_625,8);\
bit_vector_minus( &(buf_position__buf_position), &(base_buf_pointer), &(SUB_u36_u36_622));\
bit_vector_clear(&konst_623);\
konst_623.val.byte_array[0] = 1;\
bit_vector_plus( &(SUB_u36_u36_622), &(konst_623), &(ADD_u36_u36_624));\
bit_vector_bitcast_to_bit_vector( &(type_cast_625), &(ADD_u36_u36_624));\
bit_vector_cast_to_bit_vector(0, &(packet_size_8), &(type_cast_625));\
;

#define _writePayloadToMem_assign_stmt_631_c_macro_ __declare_static_bit_vector(konst_629,8);\
bit_vector_clear(&konst_629);\
konst_629.val.byte_array[0] = 2;\
__declare_static_bit_vector(SHL_u8_u8_630,8);\
bit_vector_clear(&konst_629);\
konst_629.val.byte_array[0] = 2;\
bit_vector_shift_left(&(packet_size_8), &(konst_629), &(SHL_u8_u8_630));\
bit_vector_cast_to_bit_vector(0, &(packet_size_32), &(SHL_u8_u8_630));\
;

#define _writePayloadToMem_assign_stmt_634_c_macro_ bit_vector_cast_to_bit_vector(0, &(last_keep), &(tkeep__wkeep));\
;

#define _writePayloadToMem_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__ppacket_size_32)), &(packet_size_32));\
bit_vector_cast_to_bit_vector(0, &((*__pbad_packet_identifier)), &(bad_packet_identifier));\
bit_vector_cast_to_bit_vector(0, &((*__plast_keep)), &(last_keep));\
;

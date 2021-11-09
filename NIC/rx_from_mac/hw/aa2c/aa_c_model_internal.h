#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
// object initialization 

#define _global_storage_initializer__inner_inarg_prep_macro__ 
#define _global_storage_initializer__inner_outarg_prep_macro__ ;

#define _global_storage_initializer__outer_arg_decl_macro__ ;

#define _global_storage_initializer__outer_op_xfer_macro__ ;

#define _isWriteToHeader_inner_inarg_prep_macro__ __declare_static_bit_vector(LSTATE,3);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &((*__pLSTATE)));\
__declare_static_bit_vector(HLEN,4);\
bit_vector_cast_to_bit_vector(0, &(HLEN), &((*__pHLEN)));\
__declare_static_bit_vector(PLEN,16);\
bit_vector_cast_to_bit_vector(0, &(PLEN), &((*__pPLEN)));\
__declare_static_bit_vector(write_to_header,1);\
__declare_static_bit_vector(header_not_available,1);\

#define _isWriteToHeader_assign_stmt_47_c_macro_ __declare_static_bit_vector(EQ_u3_u1_46,1);\
bit_vector_equal(0, &(LSTATE), &(B), &(EQ_u3_u1_46));\
bit_vector_cast_to_bit_vector(0, &(header_not_available), &(EQ_u3_u1_46));\
;

#define _isWriteToHeader_assign_stmt_55_c_macro_ __declare_static_bit_vector(konst_50,1);\
bit_vector_clear(&konst_50);\
__declare_static_bit_vector(type_cast_51,1);\
bit_vector_clear(&type_cast_51);\
__declare_static_bit_vector(konst_52,1);\
bit_vector_clear(&konst_52);\
konst_52.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_53,1);\
bit_vector_clear(&type_cast_53);\
type_cast_53.val.byte_array[0] = 1;\
__declare_static_bit_vector(MUX_54,1);\
if (has_undefined_bit(&header_not_available)) {fprintf(stderr, "Error: variable header_not_available has undefined value (%s) at test point.\n", to_string(&header_not_available));assert(0);} \
if(bit_vector_to_uint64(0, &header_not_available)){bit_vector_clear(&konst_50);\
bit_vector_bitcast_to_bit_vector( &(type_cast_51), &(konst_50));\
bit_vector_cast_to_bit_vector(0, &(MUX_54), &(type_cast_51));\
}else {bit_vector_clear(&konst_52);\
konst_52.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_53), &(konst_52));\
bit_vector_cast_to_bit_vector(0, &(MUX_54), &(type_cast_53));\
}bit_vector_cast_to_bit_vector(0, &(write_to_header), &(MUX_54));\
;

#define _isWriteToHeader_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pwrite_to_header)), &(write_to_header));\
;

#define _load_buffer1_inner_inarg_prep_macro__ __declare_static_bit_vector(next_buf_ptr_out,10);\
__declare_static_bit_vector(pckt_status,1);\

#define _load_buffer1_branch_block_stmt_61_c_export_decl_macro_ __declare_static_bit_vector(intm_data,37);\
__declare_static_bit_vector(buf_ptr,10);\
__declare_static_bit_vector(tlast,1);\
__declare_static_bit_vector(tdata,32);\
__declare_static_bit_vector(tkeep,4);\
__declare_static_bit_vector(bad_packet,1);\
__declare_static_bit_vector(good_packet,1);\
__declare_static_bit_vector(next_buf_ptr,10);\


#define _load_buffer1_merge_stmt_63_c_preamble_macro_ uint8_t merge_stmt_63_entry_flag;\
merge_stmt_63_entry_flag = do_while_entry_flag;\
goto merge_stmt_63_run;\
merge_stmt_63_run: ;\

#define _load_buffer1_phi_stmt_64_c_macro_ __declare_static_bit_vector(RPIPE_mac_data_66,37);\
__declare_static_bit_vector(RPIPE_mac_data_67,37);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_data",&(RPIPE_mac_data_67));\
bit_vector_cast_to_bit_vector(0, &(intm_data), &(RPIPE_mac_data_67));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_data_66,37);\
read_bit_vector_from_pipe("mac_data",&(RPIPE_mac_data_66));\
bit_vector_cast_to_bit_vector(0, &(intm_data), &(RPIPE_mac_data_66));\
}\
;

#define _load_buffer1_phi_stmt_68_c_macro_ __declare_static_bit_vector(konst_70,10);\
bit_vector_clear(&konst_70);\
__declare_static_bit_vector(type_cast_71,10);\
bit_vector_clear(&type_cast_71);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(buf_ptr), &(next_buf_ptr));\
}\
else {\
__declare_static_bit_vector(konst_70,10);\
bit_vector_clear(&konst_70);\
__declare_static_bit_vector(type_cast_71,10);\
bit_vector_clear(&type_cast_71);\
bit_vector_clear(&konst_70);\
bit_vector_bitcast_to_bit_vector( &(type_cast_71), &(konst_70));\
bit_vector_cast_to_bit_vector(0, &(buf_ptr), &(type_cast_71));\
}\
;
;

#define _load_buffer1_merge_stmt_63_c_postamble_macro_ merge_stmt_63_entry_flag = 0;

#define _load_buffer1_assign_stmt_77_c_macro_ __declare_static_bit_vector(slice_76,1);\
bit_vector_slice(&(intm_data), &(slice_76), 36);\
bit_vector_cast_to_bit_vector(0, &(tlast), &(slice_76));\
;

#define _load_buffer1_assign_stmt_82_c_macro_ __declare_static_bit_vector(slice_81,32);\
bit_vector_slice(&(intm_data), &(slice_81), 4);\
bit_vector_cast_to_bit_vector(0, &(tdata), &(slice_81));\
;

#define _load_buffer1_assign_stmt_86_c_macro_ __declare_static_bit_vector(slice_85,4);\
bit_vector_slice(&(intm_data), &(slice_85), 0);\
bit_vector_cast_to_bit_vector(0, &(tkeep), &(slice_85));\
;

#define _load_buffer1_assign_stmt_99_c_macro_ __declare_static_bit_vector(konst_89,1);\
bit_vector_clear(&konst_89);\
konst_89.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_90,1);\
__declare_static_bit_vector(konst_92,32);\
bit_vector_clear(&konst_92);\
konst_92.val.byte_array[0] = 255;\
konst_92.val.byte_array[1] = 255;\
konst_92.val.byte_array[2] = 255;\
konst_92.val.byte_array[3] = 255;\
__declare_static_bit_vector(EQ_u32_u1_93,1);\
__declare_static_bit_vector(AND_u1_u1_94,1);\
__declare_static_bit_vector(konst_96,4);\
bit_vector_clear(&konst_96);\
__declare_static_bit_vector(EQ_u4_u1_97,1);\
__declare_static_bit_vector(AND_u1_u1_98,1);\
bit_vector_clear(&konst_89);\
konst_89.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_89), &(EQ_u1_u1_90));\
bit_vector_clear(&konst_92);\
konst_92.val.byte_array[0] = 255;\
konst_92.val.byte_array[1] = 255;\
konst_92.val.byte_array[2] = 255;\
konst_92.val.byte_array[3] = 255;\
bit_vector_equal(0, &(tdata), &(konst_92), &(EQ_u32_u1_93));\
bit_vector_and(&(EQ_u1_u1_90), &(EQ_u32_u1_93), &(AND_u1_u1_94));\
bit_vector_clear(&konst_96);\
bit_vector_equal(0, &(tkeep), &(konst_96), &(EQ_u4_u1_97));\
bit_vector_and(&(AND_u1_u1_94), &(EQ_u4_u1_97), &(AND_u1_u1_98));\
bit_vector_cast_to_bit_vector(0, &(bad_packet), &(AND_u1_u1_98));\
;

#define _load_buffer1_assign_stmt_108_c_macro_ __declare_static_bit_vector(konst_102,1);\
bit_vector_clear(&konst_102);\
konst_102.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_103,1);\
__declare_static_bit_vector(konst_105,4);\
bit_vector_clear(&konst_105);\
__declare_static_bit_vector(NEQ_u4_u1_106,1);\
__declare_static_bit_vector(AND_u1_u1_107,1);\
bit_vector_clear(&konst_102);\
konst_102.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_102), &(EQ_u1_u1_103));\
bit_vector_clear(&konst_105);\
bit_vector_not_equal(0, &(tkeep), &(konst_105), &NEQ_u4_u1_106);\
bit_vector_and(&(EQ_u1_u1_103), &(NEQ_u4_u1_106), &(AND_u1_u1_107));\
bit_vector_cast_to_bit_vector(0, &(good_packet), &(AND_u1_u1_107));\
;

#define _load_buffer1_assign_stmt_112_c_macro_ bit_vector_cast_to_bit_vector(0, &((buffer_1[bit_vector_to_uint64(0, &buf_ptr)])), &(intm_data));\
;

#define _load_buffer1_assign_stmt_117_c_macro_ __declare_static_bit_vector(konst_115,10);\
bit_vector_clear(&konst_115);\
konst_115.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u10_u10_116,10);\
bit_vector_clear(&konst_115);\
konst_115.val.byte_array[0] = 1;\
bit_vector_plus( &(buf_ptr), &(konst_115), &(ADD_u10_u10_116));\
bit_vector_cast_to_bit_vector(0, &(next_buf_ptr), &(ADD_u10_u10_116));\
;

#define _load_buffer1_assign_stmt_124_c_macro_ bit_vector_cast_to_bit_vector(0, &(next_buf_ptr_out), &(next_buf_ptr));\
;

#define _load_buffer1_assign_stmt_136_c_macro_ __declare_static_bit_vector(konst_127,1);\
bit_vector_clear(&konst_127);\
konst_127.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_128,1);\
bit_vector_clear(&type_cast_128);\
type_cast_128.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_130,1);\
bit_vector_clear(&konst_130);\
__declare_static_bit_vector(type_cast_131,1);\
bit_vector_clear(&type_cast_131);\
__declare_static_bit_vector(konst_132,1);\
bit_vector_clear(&konst_132);\
__declare_static_bit_vector(type_cast_133,1);\
bit_vector_clear(&type_cast_133);\
__declare_static_bit_vector(MUX_134,1);\
__declare_static_bit_vector(MUX_135,1);\
if (has_undefined_bit(&good_packet)) {fprintf(stderr, "Error: variable good_packet has undefined value (%s) at test point.\n", to_string(&good_packet));assert(0);} \
if(bit_vector_to_uint64(0, &good_packet)){bit_vector_clear(&konst_127);\
konst_127.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_128), &(konst_127));\
bit_vector_cast_to_bit_vector(0, &(MUX_135), &(type_cast_128));\
}else {if (has_undefined_bit(&bad_packet)) {fprintf(stderr, "Error: variable bad_packet has undefined value (%s) at test point.\n", to_string(&bad_packet));assert(0);} \
if(bit_vector_to_uint64(0, &bad_packet)){bit_vector_clear(&konst_130);\
bit_vector_bitcast_to_bit_vector( &(type_cast_131), &(konst_130));\
bit_vector_cast_to_bit_vector(0, &(MUX_134), &(type_cast_131));\
}else {bit_vector_clear(&konst_132);\
bit_vector_bitcast_to_bit_vector( &(type_cast_133), &(konst_132));\
bit_vector_cast_to_bit_vector(0, &(MUX_134), &(type_cast_133));\
}bit_vector_cast_to_bit_vector(0, &(MUX_135), &(MUX_134));\
}bit_vector_cast_to_bit_vector(0, &(pckt_status), &(MUX_135));\
;
;

#define _load_buffer1_branch_block_stmt_61_c_export_apply_macro_ ;

#define _load_buffer1_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnext_buf_ptr_out)), &(next_buf_ptr_out));\
bit_vector_cast_to_bit_vector(0, &((*__ppckt_status)), &(pckt_status));\
;

#define _load_buffer2_inner_inarg_prep_macro__ __declare_static_bit_vector(next_buf_ptr_out,10);\
__declare_static_bit_vector(pckt_status,1);\

#define _load_buffer2_branch_block_stmt_142_c_export_decl_macro_ __declare_static_bit_vector(intm_data,37);\
__declare_static_bit_vector(buf_ptr,10);\
__declare_static_bit_vector(tlast,1);\
__declare_static_bit_vector(tdata,32);\
__declare_static_bit_vector(tkeep,4);\
__declare_static_bit_vector(bad_packet,1);\
__declare_static_bit_vector(good_packet,1);\
__declare_static_bit_vector(next_buf_ptr,10);\


#define _load_buffer2_merge_stmt_144_c_preamble_macro_ uint8_t merge_stmt_144_entry_flag;\
merge_stmt_144_entry_flag = do_while_entry_flag;\
goto merge_stmt_144_run;\
merge_stmt_144_run: ;\

#define _load_buffer2_phi_stmt_145_c_macro_ __declare_static_bit_vector(RPIPE_mac_data_147,37);\
__declare_static_bit_vector(RPIPE_mac_data_148,37);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_data",&(RPIPE_mac_data_148));\
bit_vector_cast_to_bit_vector(0, &(intm_data), &(RPIPE_mac_data_148));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_data_147,37);\
read_bit_vector_from_pipe("mac_data",&(RPIPE_mac_data_147));\
bit_vector_cast_to_bit_vector(0, &(intm_data), &(RPIPE_mac_data_147));\
}\
;

#define _load_buffer2_phi_stmt_149_c_macro_ __declare_static_bit_vector(konst_151,10);\
bit_vector_clear(&konst_151);\
__declare_static_bit_vector(type_cast_152,10);\
bit_vector_clear(&type_cast_152);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(buf_ptr), &(next_buf_ptr));\
}\
else {\
__declare_static_bit_vector(konst_151,10);\
bit_vector_clear(&konst_151);\
__declare_static_bit_vector(type_cast_152,10);\
bit_vector_clear(&type_cast_152);\
bit_vector_clear(&konst_151);\
bit_vector_bitcast_to_bit_vector( &(type_cast_152), &(konst_151));\
bit_vector_cast_to_bit_vector(0, &(buf_ptr), &(type_cast_152));\
}\
;
;

#define _load_buffer2_merge_stmt_144_c_postamble_macro_ merge_stmt_144_entry_flag = 0;

#define _load_buffer2_assign_stmt_158_c_macro_ __declare_static_bit_vector(slice_157,1);\
bit_vector_slice(&(intm_data), &(slice_157), 36);\
bit_vector_cast_to_bit_vector(0, &(tlast), &(slice_157));\
;

#define _load_buffer2_assign_stmt_162_c_macro_ __declare_static_bit_vector(slice_161,32);\
bit_vector_slice(&(intm_data), &(slice_161), 4);\
bit_vector_cast_to_bit_vector(0, &(tdata), &(slice_161));\
;

#define _load_buffer2_assign_stmt_166_c_macro_ __declare_static_bit_vector(slice_165,4);\
bit_vector_slice(&(intm_data), &(slice_165), 0);\
bit_vector_cast_to_bit_vector(0, &(tkeep), &(slice_165));\
;

#define _load_buffer2_assign_stmt_179_c_macro_ __declare_static_bit_vector(konst_169,1);\
bit_vector_clear(&konst_169);\
konst_169.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_170,1);\
__declare_static_bit_vector(konst_172,32);\
bit_vector_clear(&konst_172);\
konst_172.val.byte_array[0] = 255;\
konst_172.val.byte_array[1] = 255;\
konst_172.val.byte_array[2] = 255;\
konst_172.val.byte_array[3] = 255;\
__declare_static_bit_vector(EQ_u32_u1_173,1);\
__declare_static_bit_vector(AND_u1_u1_174,1);\
__declare_static_bit_vector(konst_176,4);\
bit_vector_clear(&konst_176);\
__declare_static_bit_vector(EQ_u4_u1_177,1);\
__declare_static_bit_vector(AND_u1_u1_178,1);\
bit_vector_clear(&konst_169);\
konst_169.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_169), &(EQ_u1_u1_170));\
bit_vector_clear(&konst_172);\
konst_172.val.byte_array[0] = 255;\
konst_172.val.byte_array[1] = 255;\
konst_172.val.byte_array[2] = 255;\
konst_172.val.byte_array[3] = 255;\
bit_vector_equal(0, &(tdata), &(konst_172), &(EQ_u32_u1_173));\
bit_vector_and(&(EQ_u1_u1_170), &(EQ_u32_u1_173), &(AND_u1_u1_174));\
bit_vector_clear(&konst_176);\
bit_vector_equal(0, &(tkeep), &(konst_176), &(EQ_u4_u1_177));\
bit_vector_and(&(AND_u1_u1_174), &(EQ_u4_u1_177), &(AND_u1_u1_178));\
bit_vector_cast_to_bit_vector(0, &(bad_packet), &(AND_u1_u1_178));\
;

#define _load_buffer2_assign_stmt_188_c_macro_ __declare_static_bit_vector(konst_182,1);\
bit_vector_clear(&konst_182);\
konst_182.val.byte_array[0] = 1;\
__declare_static_bit_vector(EQ_u1_u1_183,1);\
__declare_static_bit_vector(konst_185,4);\
bit_vector_clear(&konst_185);\
__declare_static_bit_vector(NEQ_u4_u1_186,1);\
__declare_static_bit_vector(AND_u1_u1_187,1);\
bit_vector_clear(&konst_182);\
konst_182.val.byte_array[0] = 1;\
bit_vector_equal(0, &(tlast), &(konst_182), &(EQ_u1_u1_183));\
bit_vector_clear(&konst_185);\
bit_vector_not_equal(0, &(tkeep), &(konst_185), &NEQ_u4_u1_186);\
bit_vector_and(&(EQ_u1_u1_183), &(NEQ_u4_u1_186), &(AND_u1_u1_187));\
bit_vector_cast_to_bit_vector(0, &(good_packet), &(AND_u1_u1_187));\
;

#define _load_buffer2_assign_stmt_192_c_macro_ bit_vector_cast_to_bit_vector(0, &((buffer_2[bit_vector_to_uint64(0, &buf_ptr)])), &(intm_data));\
;

#define _load_buffer2_assign_stmt_197_c_macro_ __declare_static_bit_vector(konst_195,10);\
bit_vector_clear(&konst_195);\
konst_195.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u10_u10_196,10);\
bit_vector_clear(&konst_195);\
konst_195.val.byte_array[0] = 1;\
bit_vector_plus( &(buf_ptr), &(konst_195), &(ADD_u10_u10_196));\
bit_vector_cast_to_bit_vector(0, &(next_buf_ptr), &(ADD_u10_u10_196));\
;

#define _load_buffer2_assign_stmt_204_c_macro_ bit_vector_cast_to_bit_vector(0, &(next_buf_ptr_out), &(next_buf_ptr));\
;

#define _load_buffer2_assign_stmt_216_c_macro_ __declare_static_bit_vector(konst_207,1);\
bit_vector_clear(&konst_207);\
konst_207.val.byte_array[0] = 1;\
__declare_static_bit_vector(type_cast_208,1);\
bit_vector_clear(&type_cast_208);\
type_cast_208.val.byte_array[0] = 1;\
__declare_static_bit_vector(konst_210,1);\
bit_vector_clear(&konst_210);\
__declare_static_bit_vector(type_cast_211,1);\
bit_vector_clear(&type_cast_211);\
__declare_static_bit_vector(konst_212,1);\
bit_vector_clear(&konst_212);\
__declare_static_bit_vector(type_cast_213,1);\
bit_vector_clear(&type_cast_213);\
__declare_static_bit_vector(MUX_214,1);\
__declare_static_bit_vector(MUX_215,1);\
if (has_undefined_bit(&good_packet)) {fprintf(stderr, "Error: variable good_packet has undefined value (%s) at test point.\n", to_string(&good_packet));assert(0);} \
if(bit_vector_to_uint64(0, &good_packet)){bit_vector_clear(&konst_207);\
konst_207.val.byte_array[0] = 1;\
bit_vector_bitcast_to_bit_vector( &(type_cast_208), &(konst_207));\
bit_vector_cast_to_bit_vector(0, &(MUX_215), &(type_cast_208));\
}else {if (has_undefined_bit(&bad_packet)) {fprintf(stderr, "Error: variable bad_packet has undefined value (%s) at test point.\n", to_string(&bad_packet));assert(0);} \
if(bit_vector_to_uint64(0, &bad_packet)){bit_vector_clear(&konst_210);\
bit_vector_bitcast_to_bit_vector( &(type_cast_211), &(konst_210));\
bit_vector_cast_to_bit_vector(0, &(MUX_214), &(type_cast_211));\
}else {bit_vector_clear(&konst_212);\
bit_vector_bitcast_to_bit_vector( &(type_cast_213), &(konst_212));\
bit_vector_cast_to_bit_vector(0, &(MUX_214), &(type_cast_213));\
}bit_vector_cast_to_bit_vector(0, &(MUX_215), &(MUX_214));\
}bit_vector_cast_to_bit_vector(0, &(pckt_status), &(MUX_215));\
;
;

#define _load_buffer2_branch_block_stmt_142_c_export_apply_macro_ ;

#define _load_buffer2_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnext_buf_ptr_out)), &(next_buf_ptr_out));\
bit_vector_cast_to_bit_vector(0, &((*__ppckt_status)), &(pckt_status));\
;

#define _nextDESTMAC_inner_inarg_prep_macro__ __declare_static_bit_vector(LSTATE,3);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &((*__pLSTATE)));\
__declare_static_bit_vector(DESTMAC,48);\
bit_vector_cast_to_bit_vector(0, &(DESTMAC), &((*__pDESTMAC)));\
__declare_static_bit_vector(RX,37);\
bit_vector_cast_to_bit_vector(0, &(RX), &((*__pRX)));\
__declare_static_bit_vector(nDESTMAC,48);\
__declare_static_bit_vector(S0_state,1);\
__declare_static_bit_vector(S1_state,1);\
__declare_static_bit_vector(not_both,1);\

#define _nextDESTMAC_assign_stmt_229_c_macro_ __declare_static_bit_vector(EQ_u3_u1_228,1);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u3_u1_228));\
bit_vector_cast_to_bit_vector(0, &(S0_state), &(EQ_u3_u1_228));\
;

#define _nextDESTMAC_assign_stmt_234_c_macro_ __declare_static_bit_vector(EQ_u3_u1_233,1);\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u3_u1_233));\
bit_vector_cast_to_bit_vector(0, &(S1_state), &(EQ_u3_u1_233));\
;

#define _nextDESTMAC_assign_stmt_241_c_macro_ __declare_static_bit_vector(NOT_u1_u1_237,1);\
__declare_static_bit_vector(NOT_u1_u1_239,1);\
__declare_static_bit_vector(AND_u1_u1_240,1);\
bit_vector_not( &(S0_state), &(NOT_u1_u1_237));\
bit_vector_not( &(S1_state), &(NOT_u1_u1_239));\
bit_vector_and(&(NOT_u1_u1_237), &(NOT_u1_u1_239), &(AND_u1_u1_240));\
bit_vector_cast_to_bit_vector(0, &(not_both), &(AND_u1_u1_240));\
;

#define _nextDESTMAC_assign_stmt_263_c_macro_ __declare_static_bit_vector(slice_245,32);\
__declare_static_bit_vector(type_cast_246,48);\
__declare_static_bit_vector(konst_247,48);\
bit_vector_clear(&konst_247);\
__declare_static_bit_vector(MUX_248,48);\
__declare_static_bit_vector(slice_251,16);\
__declare_static_bit_vector(slice_253,32);\
__declare_static_bit_vector(CONCAT_u16_u48_254,48);\
__declare_static_bit_vector(konst_255,48);\
bit_vector_clear(&konst_255);\
__declare_static_bit_vector(MUX_256,48);\
__declare_static_bit_vector(OR_u48_u48_257,48);\
__declare_static_bit_vector(konst_260,48);\
bit_vector_clear(&konst_260);\
__declare_static_bit_vector(MUX_261,48);\
__declare_static_bit_vector(OR_u48_u48_262,48);\
if (has_undefined_bit(&S0_state)) {fprintf(stderr, "Error: variable S0_state has undefined value (%s) at test point.\n", to_string(&S0_state));assert(0);} \
if(bit_vector_to_uint64(0, &S0_state)){bit_vector_slice(&(RX), &(slice_245), 4);\
bit_vector_bitcast_to_bit_vector( &(type_cast_246), &(slice_245));\
bit_vector_cast_to_bit_vector(0, &(MUX_248), &(type_cast_246));\
}else {bit_vector_clear(&konst_247);\
bit_vector_cast_to_bit_vector(0, &(MUX_248), &(konst_247));\
}if (has_undefined_bit(&S1_state)) {fprintf(stderr, "Error: variable S1_state has undefined value (%s) at test point.\n", to_string(&S1_state));assert(0);} \
if(bit_vector_to_uint64(0, &S1_state)){bit_vector_slice(&(RX), &(slice_251), 4);\
bit_vector_slice(&(DESTMAC), &(slice_253), 0);\
bit_vector_concatenate( &(slice_251), &(slice_253), &(CONCAT_u16_u48_254));\
bit_vector_cast_to_bit_vector(0, &(MUX_256), &(CONCAT_u16_u48_254));\
}else {bit_vector_clear(&konst_255);\
bit_vector_cast_to_bit_vector(0, &(MUX_256), &(konst_255));\
}bit_vector_or(&(MUX_248), &(MUX_256), &(OR_u48_u48_257));\
if (has_undefined_bit(&not_both)) {fprintf(stderr, "Error: variable not_both has undefined value (%s) at test point.\n", to_string(&not_both));assert(0);} \
if(bit_vector_to_uint64(0, &not_both)){bit_vector_cast_to_bit_vector(0, &(MUX_261), &(DESTMAC));\
}else {bit_vector_clear(&konst_260);\
bit_vector_cast_to_bit_vector(0, &(MUX_261), &(konst_260));\
}bit_vector_or(&(OR_u48_u48_257), &(MUX_261), &(OR_u48_u48_262));\
bit_vector_cast_to_bit_vector(0, &(nDESTMAC), &(OR_u48_u48_262));\
;

#define _nextDESTMAC_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnDESTMAC)), &(nDESTMAC));\
;

#define _nextLSTATE_inner_inarg_prep_macro__ __declare_static_bit_vector(RX,37);\
bit_vector_cast_to_bit_vector(0, &(RX), &((*__pRX)));\
__declare_static_bit_vector(LSTATE,3);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &((*__pLSTATE)));\
__declare_static_bit_vector(HLEN,4);\
bit_vector_cast_to_bit_vector(0, &(HLEN), &((*__pHLEN)));\
__declare_static_bit_vector(PLEN,16);\
bit_vector_cast_to_bit_vector(0, &(PLEN), &((*__pPLEN)));\
__declare_static_bit_vector(nLSTATE,3);\
__declare_static_bit_vector(nHLEN,4);\
__declare_static_bit_vector(nPLEN,16);\
__declare_static_bit_vector(n_state_is_B,1);\
__declare_static_bit_vector(n_state_is_S0,1);\
__declare_static_bit_vector(H_state,1);\
__declare_static_bit_vector(B_state,1);\

#define _nextLSTATE_assign_stmt_285_c_macro_ __declare_static_bit_vector(EQ_u3_u1_276,1);\
__declare_static_bit_vector(konst_278,16);\
bit_vector_clear(&konst_278);\
konst_278.val.byte_array[0] = 2;\
__declare_static_bit_vector(UGT_u16_u1_279,1);\
__declare_static_bit_vector(OR_u1_u1_280,1);\
__declare_static_bit_vector(konst_282,4);\
bit_vector_clear(&konst_282);\
konst_282.val.byte_array[0] = 1;\
__declare_static_bit_vector(ULE_u4_u1_283,1);\
__declare_static_bit_vector(AND_u1_u1_284,1);\
bit_vector_equal(0, &(LSTATE), &(H), &(EQ_u3_u1_276));\
bit_vector_clear(&konst_278);\
konst_278.val.byte_array[0] = 2;\
bit_vector_greater(0, &(PLEN), &(konst_278), &(UGT_u16_u1_279));\
bit_vector_or(&(EQ_u3_u1_276), &(UGT_u16_u1_279), &(OR_u1_u1_280));\
bit_vector_clear(&konst_282);\
konst_282.val.byte_array[0] = 1;\
bit_vector_less_equal(0, &(HLEN), &(konst_282), &(ULE_u4_u1_283));\
bit_vector_and(&(OR_u1_u1_280), &(ULE_u4_u1_283), &(AND_u1_u1_284));\
bit_vector_cast_to_bit_vector(0, &(n_state_is_B), &(AND_u1_u1_284));\
;

#define _nextLSTATE_assign_stmt_294_c_macro_ __declare_static_bit_vector(EQ_u3_u1_289,1);\
__declare_static_bit_vector(konst_291,16);\
bit_vector_clear(&konst_291);\
konst_291.val.byte_array[0] = 2;\
__declare_static_bit_vector(ULE_u16_u1_292,1);\
__declare_static_bit_vector(AND_u1_u1_293,1);\
bit_vector_equal(0, &(LSTATE), &(B), &(EQ_u3_u1_289));\
bit_vector_clear(&konst_291);\
konst_291.val.byte_array[0] = 2;\
bit_vector_less_equal(0, &(PLEN), &(konst_291), &(ULE_u16_u1_292));\
bit_vector_and(&(EQ_u3_u1_289), &(ULE_u16_u1_292), &(AND_u1_u1_293));\
bit_vector_cast_to_bit_vector(0, &(n_state_is_S0), &(AND_u1_u1_293));\
;

#define _nextLSTATE_assign_stmt_337_c_macro_ __declare_static_bit_vector(EQ_u3_u1_298,1);\
__declare_static_bit_vector(konst_300,3);\
bit_vector_clear(&konst_300);\
__declare_static_bit_vector(MUX_301,3);\
__declare_static_bit_vector(EQ_u3_u1_304,1);\
__declare_static_bit_vector(konst_306,3);\
bit_vector_clear(&konst_306);\
__declare_static_bit_vector(MUX_307,3);\
__declare_static_bit_vector(OR_u3_u3_308,3);\
__declare_static_bit_vector(EQ_u3_u1_311,1);\
__declare_static_bit_vector(konst_313,3);\
bit_vector_clear(&konst_313);\
__declare_static_bit_vector(MUX_314,3);\
__declare_static_bit_vector(OR_u3_u3_315,3);\
__declare_static_bit_vector(EQ_u3_u1_318,1);\
__declare_static_bit_vector(konst_320,4);\
bit_vector_clear(&konst_320);\
konst_320.val.byte_array[0] = 1;\
__declare_static_bit_vector(UGT_u4_u1_321,1);\
__declare_static_bit_vector(OR_u1_u1_322,1);\
__declare_static_bit_vector(konst_324,3);\
bit_vector_clear(&konst_324);\
__declare_static_bit_vector(MUX_325,3);\
__declare_static_bit_vector(konst_328,3);\
bit_vector_clear(&konst_328);\
__declare_static_bit_vector(MUX_329,3);\
__declare_static_bit_vector(OR_u3_u3_330,3);\
__declare_static_bit_vector(konst_333,3);\
bit_vector_clear(&konst_333);\
__declare_static_bit_vector(MUX_334,3);\
__declare_static_bit_vector(OR_u3_u3_335,3);\
__declare_static_bit_vector(OR_u3_u3_336,3);\
bit_vector_equal(0, &(LSTATE), &(S0), &(EQ_u3_u1_298));\
if (has_undefined_bit(&EQ_u3_u1_298)) {fprintf(stderr, "Error: variable EQ_u3_u1_298 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_298));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_298)){bit_vector_cast_to_bit_vector(0, &(MUX_301), &(S1));\
}else {bit_vector_clear(&konst_300);\
bit_vector_cast_to_bit_vector(0, &(MUX_301), &(konst_300));\
}bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u3_u1_304));\
if (has_undefined_bit(&EQ_u3_u1_304)) {fprintf(stderr, "Error: variable EQ_u3_u1_304 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_304));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_304)){bit_vector_cast_to_bit_vector(0, &(MUX_307), &(S2));\
}else {bit_vector_clear(&konst_306);\
bit_vector_cast_to_bit_vector(0, &(MUX_307), &(konst_306));\
}bit_vector_or(&(MUX_301), &(MUX_307), &(OR_u3_u3_308));\
bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u3_u1_311));\
if (has_undefined_bit(&EQ_u3_u1_311)) {fprintf(stderr, "Error: variable EQ_u3_u1_311 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_311));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_311)){bit_vector_cast_to_bit_vector(0, &(MUX_314), &(S3));\
}else {bit_vector_clear(&konst_313);\
bit_vector_cast_to_bit_vector(0, &(MUX_314), &(konst_313));\
}bit_vector_or(&(OR_u3_u3_308), &(MUX_314), &(OR_u3_u3_315));\
bit_vector_equal(0, &(LSTATE), &(S3), &(EQ_u3_u1_318));\
bit_vector_clear(&konst_320);\
konst_320.val.byte_array[0] = 1;\
bit_vector_greater(0, &(HLEN), &(konst_320), &(UGT_u4_u1_321));\
bit_vector_or(&(EQ_u3_u1_318), &(UGT_u4_u1_321), &(OR_u1_u1_322));\
if (has_undefined_bit(&OR_u1_u1_322)) {fprintf(stderr, "Error: variable OR_u1_u1_322 has undefined value (%s) at test point.\n", to_string(&OR_u1_u1_322));assert(0);} \
if(bit_vector_to_uint64(0, &OR_u1_u1_322)){bit_vector_cast_to_bit_vector(0, &(MUX_325), &(H));\
}else {bit_vector_clear(&konst_324);\
bit_vector_cast_to_bit_vector(0, &(MUX_325), &(konst_324));\
}if (has_undefined_bit(&n_state_is_B)) {fprintf(stderr, "Error: variable n_state_is_B has undefined value (%s) at test point.\n", to_string(&n_state_is_B));assert(0);} \
if(bit_vector_to_uint64(0, &n_state_is_B)){bit_vector_cast_to_bit_vector(0, &(MUX_329), &(B));\
}else {bit_vector_clear(&konst_328);\
bit_vector_cast_to_bit_vector(0, &(MUX_329), &(konst_328));\
}bit_vector_or(&(MUX_325), &(MUX_329), &(OR_u3_u3_330));\
if (has_undefined_bit(&n_state_is_S0)) {fprintf(stderr, "Error: variable n_state_is_S0 has undefined value (%s) at test point.\n", to_string(&n_state_is_S0));assert(0);} \
if(bit_vector_to_uint64(0, &n_state_is_S0)){bit_vector_cast_to_bit_vector(0, &(MUX_334), &(S0));\
}else {bit_vector_clear(&konst_333);\
bit_vector_cast_to_bit_vector(0, &(MUX_334), &(konst_333));\
}bit_vector_or(&(OR_u3_u3_330), &(MUX_334), &(OR_u3_u3_335));\
bit_vector_or(&(OR_u3_u3_315), &(OR_u3_u3_335), &(OR_u3_u3_336));\
bit_vector_cast_to_bit_vector(0, &(nLSTATE), &(OR_u3_u3_336));\
;

#define _nextLSTATE_assign_stmt_342_c_macro_ __declare_static_bit_vector(EQ_u3_u1_341,1);\
bit_vector_equal(0, &(nLSTATE), &(H), &(EQ_u3_u1_341));\
bit_vector_cast_to_bit_vector(0, &(H_state), &(EQ_u3_u1_341));\
;

#define _nextLSTATE_assign_stmt_356_c_macro_ __declare_static_bit_vector(EQ_u3_u1_347,1);\
__declare_static_bit_vector(slice_349,4);\
__declare_static_bit_vector(konst_351,4);\
bit_vector_clear(&konst_351);\
konst_351.val.byte_array[0] = 1;\
__declare_static_bit_vector(SUB_u4_u4_352,4);\
__declare_static_bit_vector(MUX_353,4);\
__declare_static_bit_vector(MUX_355,4);\
if (has_undefined_bit(&H_state)) {fprintf(stderr, "Error: variable H_state has undefined value (%s) at test point.\n", to_string(&H_state));assert(0);} \
if(bit_vector_to_uint64(0, &H_state)){bit_vector_equal(0, &(LSTATE), &(S3), &(EQ_u3_u1_347));\
if (has_undefined_bit(&EQ_u3_u1_347)) {fprintf(stderr, "Error: variable EQ_u3_u1_347 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_347));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_347)){bit_vector_slice(&(RX), &(slice_349), 24);\
bit_vector_cast_to_bit_vector(0, &(MUX_353), &(slice_349));\
}else {bit_vector_clear(&konst_351);\
konst_351.val.byte_array[0] = 1;\
bit_vector_minus( &(HLEN), &(konst_351), &(SUB_u4_u4_352));\
bit_vector_cast_to_bit_vector(0, &(MUX_353), &(SUB_u4_u4_352));\
}bit_vector_cast_to_bit_vector(0, &(MUX_355), &(MUX_353));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_355), &(HLEN));\
}bit_vector_cast_to_bit_vector(0, &(nHLEN), &(MUX_355));\
;

#define _nextLSTATE_assign_stmt_361_c_macro_ __declare_static_bit_vector(EQ_u3_u1_360,1);\
bit_vector_equal(0, &(nLSTATE), &(B), &(EQ_u3_u1_360));\
bit_vector_cast_to_bit_vector(0, &(B_state), &(EQ_u3_u1_360));\
;

#define _nextLSTATE_assign_stmt_377_c_macro_ __declare_static_bit_vector(OR_u1_u1_365,1);\
__declare_static_bit_vector(EQ_u3_u1_368,1);\
__declare_static_bit_vector(slice_370,16);\
__declare_static_bit_vector(konst_372,16);\
bit_vector_clear(&konst_372);\
konst_372.val.byte_array[0] = 4;\
__declare_static_bit_vector(SUB_u16_u16_373,16);\
__declare_static_bit_vector(MUX_374,16);\
__declare_static_bit_vector(MUX_376,16);\
bit_vector_or(&(B_state), &(H_state), &(OR_u1_u1_365));\
if (has_undefined_bit(&OR_u1_u1_365)) {fprintf(stderr, "Error: variable OR_u1_u1_365 has undefined value (%s) at test point.\n", to_string(&OR_u1_u1_365));assert(0);} \
if(bit_vector_to_uint64(0, &OR_u1_u1_365)){bit_vector_equal(0, &(LSTATE), &(S3), &(EQ_u3_u1_368));\
if (has_undefined_bit(&EQ_u3_u1_368)) {fprintf(stderr, "Error: variable EQ_u3_u1_368 has undefined value (%s) at test point.\n", to_string(&EQ_u3_u1_368));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u3_u1_368)){bit_vector_slice(&(RX), &(slice_370), 4);\
bit_vector_cast_to_bit_vector(0, &(MUX_374), &(slice_370));\
}else {bit_vector_clear(&konst_372);\
konst_372.val.byte_array[0] = 4;\
bit_vector_minus( &(PLEN), &(konst_372), &(SUB_u16_u16_373));\
bit_vector_cast_to_bit_vector(0, &(MUX_374), &(SUB_u16_u16_373));\
}bit_vector_cast_to_bit_vector(0, &(MUX_376), &(MUX_374));\
}else {bit_vector_cast_to_bit_vector(0, &(MUX_376), &(PLEN));\
}bit_vector_cast_to_bit_vector(0, &(nPLEN), &(MUX_376));\
;

#define _nextLSTATE_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnLSTATE)), &(nLSTATE));\
bit_vector_cast_to_bit_vector(0, &((*__pnHLEN)), &(nHLEN));\
bit_vector_cast_to_bit_vector(0, &((*__pnPLEN)), &(nPLEN));\
;

#define _nextSRCMAC_inner_inarg_prep_macro__ __declare_static_bit_vector(LSTATE,3);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &((*__pLSTATE)));\
__declare_static_bit_vector(SRCMAC,48);\
bit_vector_cast_to_bit_vector(0, &(SRCMAC), &((*__pSRCMAC)));\
__declare_static_bit_vector(RX,37);\
bit_vector_cast_to_bit_vector(0, &(RX), &((*__pRX)));\
__declare_static_bit_vector(nSRCMAC,48);\
__declare_static_bit_vector(S1_state,1);\
__declare_static_bit_vector(S2_state,1);\
__declare_static_bit_vector(not_both,1);\

#define _nextSRCMAC_assign_stmt_388_c_macro_ __declare_static_bit_vector(EQ_u3_u1_387,1);\
bit_vector_equal(0, &(LSTATE), &(S1), &(EQ_u3_u1_387));\
bit_vector_cast_to_bit_vector(0, &(S1_state), &(EQ_u3_u1_387));\
;

#define _nextSRCMAC_assign_stmt_393_c_macro_ __declare_static_bit_vector(EQ_u3_u1_392,1);\
bit_vector_equal(0, &(LSTATE), &(S2), &(EQ_u3_u1_392));\
bit_vector_cast_to_bit_vector(0, &(S2_state), &(EQ_u3_u1_392));\
;

#define _nextSRCMAC_assign_stmt_400_c_macro_ __declare_static_bit_vector(NOT_u1_u1_396,1);\
__declare_static_bit_vector(NOT_u1_u1_398,1);\
__declare_static_bit_vector(AND_u1_u1_399,1);\
bit_vector_not( &(S2_state), &(NOT_u1_u1_396));\
bit_vector_not( &(S2_state), &(NOT_u1_u1_398));\
bit_vector_and(&(NOT_u1_u1_396), &(NOT_u1_u1_398), &(AND_u1_u1_399));\
bit_vector_cast_to_bit_vector(0, &(not_both), &(AND_u1_u1_399));\
;

#define _nextSRCMAC_assign_stmt_422_c_macro_ __declare_static_bit_vector(slice_404,16);\
__declare_static_bit_vector(type_cast_405,48);\
__declare_static_bit_vector(konst_406,48);\
bit_vector_clear(&konst_406);\
__declare_static_bit_vector(MUX_407,48);\
__declare_static_bit_vector(slice_410,32);\
__declare_static_bit_vector(slice_412,16);\
__declare_static_bit_vector(CONCAT_u32_u48_413,48);\
__declare_static_bit_vector(konst_414,48);\
bit_vector_clear(&konst_414);\
__declare_static_bit_vector(MUX_415,48);\
__declare_static_bit_vector(OR_u48_u48_416,48);\
__declare_static_bit_vector(konst_419,48);\
bit_vector_clear(&konst_419);\
__declare_static_bit_vector(MUX_420,48);\
__declare_static_bit_vector(OR_u48_u48_421,48);\
if (has_undefined_bit(&S1_state)) {fprintf(stderr, "Error: variable S1_state has undefined value (%s) at test point.\n", to_string(&S1_state));assert(0);} \
if(bit_vector_to_uint64(0, &S1_state)){bit_vector_slice(&(RX), &(slice_404), 20);\
bit_vector_bitcast_to_bit_vector( &(type_cast_405), &(slice_404));\
bit_vector_cast_to_bit_vector(0, &(MUX_407), &(type_cast_405));\
}else {bit_vector_clear(&konst_406);\
bit_vector_cast_to_bit_vector(0, &(MUX_407), &(konst_406));\
}if (has_undefined_bit(&S2_state)) {fprintf(stderr, "Error: variable S2_state has undefined value (%s) at test point.\n", to_string(&S2_state));assert(0);} \
if(bit_vector_to_uint64(0, &S2_state)){bit_vector_slice(&(RX), &(slice_410), 4);\
bit_vector_slice(&(SRCMAC), &(slice_412), 0);\
bit_vector_concatenate( &(slice_410), &(slice_412), &(CONCAT_u32_u48_413));\
bit_vector_cast_to_bit_vector(0, &(MUX_415), &(CONCAT_u32_u48_413));\
}else {bit_vector_clear(&konst_414);\
bit_vector_cast_to_bit_vector(0, &(MUX_415), &(konst_414));\
}bit_vector_or(&(MUX_407), &(MUX_415), &(OR_u48_u48_416));\
if (has_undefined_bit(&not_both)) {fprintf(stderr, "Error: variable not_both has undefined value (%s) at test point.\n", to_string(&not_both));assert(0);} \
if(bit_vector_to_uint64(0, &not_both)){bit_vector_cast_to_bit_vector(0, &(MUX_420), &(SRCMAC));\
}else {bit_vector_clear(&konst_419);\
bit_vector_cast_to_bit_vector(0, &(MUX_420), &(konst_419));\
}bit_vector_or(&(OR_u48_u48_416), &(MUX_420), &(OR_u48_u48_421));\
bit_vector_cast_to_bit_vector(0, &(nSRCMAC), &(OR_u48_u48_421));\
;

#define _nextSRCMAC_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnSRCMAC)), &(nSRCMAC));\
;

#define _nicRxFromMacDaemon_inner_inarg_prep_macro__ 
#define _nicRxFromMacDaemon_branch_block_stmt_425_c_export_decl_macro_ __declare_static_bit_vector(TOTAL_STATE,119);\
__declare_static_bit_vector(RX,37);\
__declare_static_bit_vector(LSTATE,3);\
__declare_static_bit_vector(SRCMAC,48);\
__declare_static_bit_vector(DESTMAC,48);\
__declare_static_bit_vector(HLEN,4);\
__declare_static_bit_vector(PLEN,16);\
__declare_static_bit_vector(nLSTATE,3);\
__declare_static_bit_vector(nHLEN,4);\
__declare_static_bit_vector(nPLEN,16);\
__declare_static_bit_vector(nSRCMAC,48);\
__declare_static_bit_vector(nDESTMAC,48);\
__declare_static_bit_vector(write_to_header,1);\
__declare_static_bit_vector(nTOTAL_STATE,119);\


#define _nicRxFromMacDaemon_merge_stmt_427_c_preamble_macro_ uint8_t merge_stmt_427_entry_flag;\
merge_stmt_427_entry_flag = do_while_entry_flag;\
goto merge_stmt_427_run;\
merge_stmt_427_run: ;\

#define _nicRxFromMacDaemon_phi_stmt_428_c_macro_ __declare_static_bit_vector(konst_431,119);\
bit_vector_clear(&konst_431);\
__declare_static_bit_vector(type_cast_432,119);\
bit_vector_clear(&type_cast_432);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(TOTAL_STATE), &(nTOTAL_STATE));\
}\
else {\
__declare_static_bit_vector(konst_431,119);\
bit_vector_clear(&konst_431);\
__declare_static_bit_vector(type_cast_432,119);\
bit_vector_clear(&type_cast_432);\
bit_vector_clear(&konst_431);\
bit_vector_bitcast_to_bit_vector( &(type_cast_432), &(konst_431));\
bit_vector_cast_to_bit_vector(0, &(TOTAL_STATE), &(type_cast_432));\
}\
;

#define _nicRxFromMacDaemon_phi_stmt_434_c_macro_ __declare_static_bit_vector(RPIPE_mac_to_nic_data_436,37);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_436));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_436));\
}\
else {\
__declare_static_bit_vector(RPIPE_mac_to_nic_data_436,37);\
read_bit_vector_from_pipe("mac_to_nic_data",&(RPIPE_mac_to_nic_data_436));\
bit_vector_cast_to_bit_vector(0, &(RX), &(RPIPE_mac_to_nic_data_436));\
}\
;
;

#define _nicRxFromMacDaemon_merge_stmt_427_c_postamble_macro_ merge_stmt_427_entry_flag = 0;

#define _nicRxFromMacDaemon_assign_stmt_441_c_macro_ __declare_static_bit_vector(slice_440,3);\
bit_vector_slice(&(TOTAL_STATE), &(slice_440), 116);\
bit_vector_cast_to_bit_vector(0, &(LSTATE), &(slice_440));\
;

#define _nicRxFromMacDaemon_assign_stmt_445_c_macro_ __declare_static_bit_vector(slice_444,48);\
bit_vector_slice(&(TOTAL_STATE), &(slice_444), 68);\
bit_vector_cast_to_bit_vector(0, &(SRCMAC), &(slice_444));\
;

#define _nicRxFromMacDaemon_assign_stmt_449_c_macro_ __declare_static_bit_vector(slice_448,48);\
bit_vector_slice(&(TOTAL_STATE), &(slice_448), 20);\
bit_vector_cast_to_bit_vector(0, &(DESTMAC), &(slice_448));\
;

#define _nicRxFromMacDaemon_assign_stmt_453_c_macro_ __declare_static_bit_vector(slice_452,4);\
bit_vector_slice(&(TOTAL_STATE), &(slice_452), 16);\
bit_vector_cast_to_bit_vector(0, &(HLEN), &(slice_452));\
;

#define _nicRxFromMacDaemon_assign_stmt_457_c_macro_ __declare_static_bit_vector(slice_456,16);\
bit_vector_slice(&(TOTAL_STATE), &(slice_456), 0);\
bit_vector_cast_to_bit_vector(0, &(PLEN), &(slice_456));\
;

#define _nicRxFromMacDaemon_stmt_465_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_465_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"data_is");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"RX");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(RX)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"TOTAL_STATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(TOTAL_STATE)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"LSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(LSTATE)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"SRCMAC");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(SRCMAC)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"DESTMAC");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(DESTMAC)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"HLEN");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(HLEN)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_465_c_macro___print_counter,"PLEN");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(PLEN)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_call_stmt_473_c_macro_ _nextLSTATE_( &(RX),  &(LSTATE),  &(HLEN),  &(PLEN), &(nLSTATE), &(nHLEN), &(nPLEN));\
;

#define _nicRxFromMacDaemon_call_stmt_478_c_macro_ _nextSRCMAC_( &(LSTATE),  &(SRCMAC),  &(RX), &(nSRCMAC));\
;

#define _nicRxFromMacDaemon_call_stmt_483_c_macro_ _nextDESTMAC_( &(LSTATE),  &(DESTMAC),  &(RX), &(nDESTMAC));\
;

#define _nicRxFromMacDaemon_call_stmt_488_c_macro_ _isWriteToHeader_( &(LSTATE),  &(HLEN),  &(PLEN), &(write_to_header));\
;

#define _nicRxFromMacDaemon_assign_stmt_492_c_macro_ if (has_undefined_bit(&write_to_header)) {fprintf(stderr, "Error: variable write_to_header has undefined value (%s) at test point.\n", to_string(&write_to_header));assert(0);} \
if (bit_vector_to_uint64(0, &write_to_header)) {\
write_bit_vector_to_pipe("nic_rx_to_header",&(RX));\
}
;

#define _nicRxFromMacDaemon_assign_stmt_495_c_macro_ write_bit_vector_to_pipe("nic_rx_to_packet",&(RX));\
;

#define _nicRxFromMacDaemon_stmt_497_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_497_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMaDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_497_c_macro___print_counter,"data2");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMaDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_497_c_macro___print_counter,"write_to_header");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(write_to_header)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;

#define _nicRxFromMacDaemon_assign_stmt_508_c_macro_ __declare_static_bit_vector(CONCAT_u3_u51_501,51);\
__declare_static_bit_vector(CONCAT_u51_u99_503,99);\
__declare_static_bit_vector(CONCAT_u4_u20_506,20);\
__declare_static_bit_vector(CONCAT_u99_u119_507,119);\
bit_vector_concatenate( &(nLSTATE), &(nSRCMAC), &(CONCAT_u3_u51_501));\
bit_vector_concatenate( &(CONCAT_u3_u51_501), &(nDESTMAC), &(CONCAT_u51_u99_503));\
bit_vector_concatenate( &(nHLEN), &(nPLEN), &(CONCAT_u4_u20_506));\
bit_vector_concatenate( &(CONCAT_u51_u99_503), &(CONCAT_u4_u20_506), &(CONCAT_u99_u119_507));\
bit_vector_cast_to_bit_vector(0, &(nTOTAL_STATE), &(CONCAT_u99_u119_507));\
;

#define _nicRxFromMacDaemon_stmt_515_c_macro_ uint32_t _nicRxFromMacDaemon_stmt_515_c_macro___print_counter= get_file_print_lock(__report_log_file__);if(__report_log_file__ != NULL) fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t%s\n",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"modified_data");if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"nTOTAL_STATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nTOTAL_STATE)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"nLSTATE");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nLSTATE)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"nSRCMAC");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nSRCMAC)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"nDESTMAC");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nDESTMAC)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"nHLEN");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nHLEN)));fflush (__report_log_file__);}if(__report_log_file__ != NULL) {fprintf(__report_log_file__,"[%u]nicRxFromMacDaemon>\t\t%s\t\t",_nicRxFromMacDaemon_stmt_515_c_macro___print_counter,"nPLEN");fprintf(__report_log_file__, ":= 0x%s\n",to_hex_string(&(nPLEN)));fflush (__report_log_file__);}release_file_print_lock(__report_log_file__);;
;

#define _nicRxFromMacDaemon_branch_block_stmt_425_c_export_apply_macro_ ;

#define _nicRxFromMacDaemon_inner_outarg_prep_macro__ ;

#define _nicRxFromMacDaemon_outer_arg_decl_macro__ ;

#define _nicRxFromMacDaemon_outer_op_xfer_macro__ ;

#define _read_from_tb_inner_inarg_prep_macro__ 
#define _read_from_tb_branch_block_stmt_521_c_export_decl_macro_ __declare_static_bit_vector(idata,64);\
__declare_static_bit_vector(send_data,37);\


#define _read_from_tb_merge_stmt_523_c_preamble_macro_ uint8_t merge_stmt_523_entry_flag;\
merge_stmt_523_entry_flag = do_while_entry_flag;\
goto merge_stmt_523_run;\
merge_stmt_523_run: ;\

#define _read_from_tb_phi_stmt_524_c_macro_ __declare_static_bit_vector(RPIPE_tb_in_pipe_526,64);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("tb_in_pipe",&(RPIPE_tb_in_pipe_526));\
bit_vector_cast_to_bit_vector(0, &(idata), &(RPIPE_tb_in_pipe_526));\
}\
else {\
__declare_static_bit_vector(RPIPE_tb_in_pipe_526,64);\
read_bit_vector_from_pipe("tb_in_pipe",&(RPIPE_tb_in_pipe_526));\
bit_vector_cast_to_bit_vector(0, &(idata), &(RPIPE_tb_in_pipe_526));\
}\
;
;

#define _read_from_tb_merge_stmt_523_c_postamble_macro_ merge_stmt_523_entry_flag = 0;

#define _read_from_tb_assign_stmt_531_c_macro_ __declare_static_bit_vector(slice_530,37);\
bit_vector_slice(&(idata), &(slice_530), 0);\
bit_vector_cast_to_bit_vector(0, &(send_data), &(slice_530));\
;

#define _read_from_tb_assign_stmt_534_c_macro_ write_bit_vector_to_pipe("mac_data",&(send_data));\
;
;

#define _read_from_tb_branch_block_stmt_521_c_export_apply_macro_ ;

#define _read_from_tb_inner_outarg_prep_macro__ ;

#define _read_from_tb_outer_arg_decl_macro__ ;

#define _read_from_tb_outer_op_xfer_macro__ ;

#define _rx_fifo_reader_inner_inarg_prep_macro__ 
#define _rx_fifo_reader_branch_block_stmt_592_c_export_decl_macro_ __declare_static_bit_vector(last_written_pointer_1,10);\
__declare_static_bit_vector(packet_status_1,1);\
__declare_static_bit_vector(last_written_pointer_2,10);\
__declare_static_bit_vector(packet_status_2,1);\


#define _rx_fifo_reader_merge_stmt_593_c_preamble_macro_ uint8_t merge_stmt_593_entry_flag;\
merge_stmt_593_entry_flag = 1;\
uint8_t loopback_592_flag = 0;\
goto merge_stmt_593_run;\
loopback_592: loopback_592_flag = 1;\
goto merge_stmt_593_run;\
merge_stmt_593_run: ;\
;

#define _rx_fifo_reader_merge_stmt_593_c_postamble_macro_ loopback_592_flag = 0;\
merge_stmt_593_entry_flag = 0;

#define _rx_fifo_reader_call_stmt_596_c_macro_ _load_buffer1_(&(last_written_pointer_1), &(packet_status_1));\
;

#define _rx_fifo_reader_call_stmt_599_c_macro_ if (has_undefined_bit(&packet_status_1)) {fprintf(stderr, "Error: variable packet_status_1 has undefined value (%s) at test point.\n", to_string(&packet_status_1));assert(0);} \
if (bit_vector_to_uint64(0, &packet_status_1)) {\
_send_to_nic1_( &(last_written_pointer_1));\
}\
;

#define _rx_fifo_reader_call_stmt_602_c_macro_ _load_buffer2_(&(last_written_pointer_2), &(packet_status_2));\
;

#define _rx_fifo_reader_call_stmt_605_c_macro_ if (has_undefined_bit(&packet_status_2)) {fprintf(stderr, "Error: variable packet_status_2 has undefined value (%s) at test point.\n", to_string(&packet_status_2));assert(0);} \
if (bit_vector_to_uint64(0, &packet_status_2)) {\
_send_to_nic2_( &(last_written_pointer_2));\
}\
;
;

#define _rx_fifo_reader_branch_block_stmt_592_c_export_apply_macro_ ;

#define _rx_fifo_reader_inner_outarg_prep_macro__ ;

#define _rx_fifo_reader_outer_arg_decl_macro__ ;

#define _rx_fifo_reader_outer_op_xfer_macro__ ;

#define _send_header_to_tb_inner_inarg_prep_macro__ 
#define _send_header_to_tb_branch_block_stmt_610_c_export_decl_macro_ __declare_static_bit_vector(rhdata,37);\


#define _send_header_to_tb_merge_stmt_612_c_preamble_macro_ uint8_t merge_stmt_612_entry_flag;\
merge_stmt_612_entry_flag = do_while_entry_flag;\
goto merge_stmt_612_run;\
merge_stmt_612_run: ;\

#define _send_header_to_tb_phi_stmt_613_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_header_615,37);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_615));\
bit_vector_cast_to_bit_vector(0, &(rhdata), &(RPIPE_nic_rx_to_header_615));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_header_615,37);\
read_bit_vector_from_pipe("nic_rx_to_header",&(RPIPE_nic_rx_to_header_615));\
bit_vector_cast_to_bit_vector(0, &(rhdata), &(RPIPE_nic_rx_to_header_615));\
}\
;
;

#define _send_header_to_tb_merge_stmt_612_c_postamble_macro_ merge_stmt_612_entry_flag = 0;

#define _send_header_to_tb_assign_stmt_620_c_macro_ __declare_static_bit_vector(type_cast_619,64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_619), &(rhdata));\
write_bit_vector_to_pipe("tb_out_pipe",&(type_cast_619));\
;
;

#define _send_header_to_tb_branch_block_stmt_610_c_export_apply_macro_ ;

#define _send_header_to_tb_inner_outarg_prep_macro__ ;

#define _send_header_to_tb_outer_arg_decl_macro__ ;

#define _send_header_to_tb_outer_op_xfer_macro__ ;

#define _send_packet_to_tb_inner_inarg_prep_macro__ 
#define _send_packet_to_tb_branch_block_stmt_626_c_export_decl_macro_ __declare_static_bit_vector(rpdata,37);\


#define _send_packet_to_tb_merge_stmt_628_c_preamble_macro_ uint8_t merge_stmt_628_entry_flag;\
merge_stmt_628_entry_flag = do_while_entry_flag;\
goto merge_stmt_628_run;\
merge_stmt_628_run: ;\

#define _send_packet_to_tb_phi_stmt_629_c_macro_ __declare_static_bit_vector(RPIPE_nic_rx_to_packet_631,37);\
if(do_while_loopback_flag) {\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_631));\
bit_vector_cast_to_bit_vector(0, &(rpdata), &(RPIPE_nic_rx_to_packet_631));\
}\
else {\
__declare_static_bit_vector(RPIPE_nic_rx_to_packet_631,37);\
read_bit_vector_from_pipe("nic_rx_to_packet",&(RPIPE_nic_rx_to_packet_631));\
bit_vector_cast_to_bit_vector(0, &(rpdata), &(RPIPE_nic_rx_to_packet_631));\
}\
;
;

#define _send_packet_to_tb_merge_stmt_628_c_postamble_macro_ merge_stmt_628_entry_flag = 0;

#define _send_packet_to_tb_assign_stmt_636_c_macro_ __declare_static_bit_vector(type_cast_635,64);\
bit_vector_bitcast_to_bit_vector( &(type_cast_635), &(rpdata));\
write_bit_vector_to_pipe("tb_out_packet_pipe",&(type_cast_635));\
;
;

#define _send_packet_to_tb_branch_block_stmt_626_c_export_apply_macro_ ;

#define _send_packet_to_tb_inner_outarg_prep_macro__ ;

#define _send_packet_to_tb_outer_arg_decl_macro__ ;

#define _send_packet_to_tb_outer_op_xfer_macro__ ;

#define _send_to_nic1_inner_inarg_prep_macro__ __declare_static_bit_vector(buf_ptr,10);\
bit_vector_cast_to_bit_vector(0, &(buf_ptr), &((*__pbuf_ptr)));\

#define _send_to_nic1_branch_block_stmt_541_c_export_decl_macro_ __declare_static_bit_vector(I,10);\
__declare_static_bit_vector(num,10);\


#define _send_to_nic1_merge_stmt_543_c_preamble_macro_ uint8_t merge_stmt_543_entry_flag;\
merge_stmt_543_entry_flag = do_while_entry_flag;\
goto merge_stmt_543_run;\
merge_stmt_543_run: ;\

#define _send_to_nic1_phi_stmt_544_c_macro_ __declare_static_bit_vector(konst_546,10);\
bit_vector_clear(&konst_546);\
__declare_static_bit_vector(type_cast_547,10);\
bit_vector_clear(&type_cast_547);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(I), &(num));\
}\
else {\
__declare_static_bit_vector(konst_546,10);\
bit_vector_clear(&konst_546);\
__declare_static_bit_vector(type_cast_547,10);\
bit_vector_clear(&type_cast_547);\
bit_vector_clear(&konst_546);\
bit_vector_bitcast_to_bit_vector( &(type_cast_547), &(konst_546));\
bit_vector_cast_to_bit_vector(0, &(I), &(type_cast_547));\
}\
;
;

#define _send_to_nic1_merge_stmt_543_c_postamble_macro_ merge_stmt_543_entry_flag = 0;

#define _send_to_nic1_assign_stmt_553_c_macro_ write_bit_vector_to_pipe("mac_to_nic_data",&((buffer_1[bit_vector_to_uint64(0, &I)])));\
;

#define _send_to_nic1_assign_stmt_558_c_macro_ __declare_static_bit_vector(konst_556,10);\
bit_vector_clear(&konst_556);\
konst_556.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u10_u10_557,10);\
bit_vector_clear(&konst_556);\
konst_556.val.byte_array[0] = 1;\
bit_vector_plus( &(I), &(konst_556), &(ADD_u10_u10_557));\
bit_vector_cast_to_bit_vector(0, &(num), &(ADD_u10_u10_557));\
;
;

#define _send_to_nic1_branch_block_stmt_541_c_export_apply_macro_ ;

#define _send_to_nic1_inner_outarg_prep_macro__ ;

#define _send_to_nic2_inner_inarg_prep_macro__ __declare_static_bit_vector(buf_ptr,10);\
bit_vector_cast_to_bit_vector(0, &(buf_ptr), &((*__pbuf_ptr)));\

#define _send_to_nic2_branch_block_stmt_567_c_export_decl_macro_ __declare_static_bit_vector(I,10);\
__declare_static_bit_vector(num,10);\


#define _send_to_nic2_merge_stmt_569_c_preamble_macro_ uint8_t merge_stmt_569_entry_flag;\
merge_stmt_569_entry_flag = do_while_entry_flag;\
goto merge_stmt_569_run;\
merge_stmt_569_run: ;\

#define _send_to_nic2_phi_stmt_570_c_macro_ __declare_static_bit_vector(konst_572,10);\
bit_vector_clear(&konst_572);\
__declare_static_bit_vector(type_cast_573,10);\
bit_vector_clear(&type_cast_573);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(I), &(num));\
}\
else {\
__declare_static_bit_vector(konst_572,10);\
bit_vector_clear(&konst_572);\
__declare_static_bit_vector(type_cast_573,10);\
bit_vector_clear(&type_cast_573);\
bit_vector_clear(&konst_572);\
bit_vector_bitcast_to_bit_vector( &(type_cast_573), &(konst_572));\
bit_vector_cast_to_bit_vector(0, &(I), &(type_cast_573));\
}\
;
;

#define _send_to_nic2_merge_stmt_569_c_postamble_macro_ merge_stmt_569_entry_flag = 0;

#define _send_to_nic2_assign_stmt_579_c_macro_ write_bit_vector_to_pipe("mac_to_nic_data",&((buffer_2[bit_vector_to_uint64(0, &I)])));\
;

#define _send_to_nic2_assign_stmt_584_c_macro_ __declare_static_bit_vector(konst_582,10);\
bit_vector_clear(&konst_582);\
konst_582.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u10_u10_583,10);\
bit_vector_clear(&konst_582);\
konst_582.val.byte_array[0] = 1;\
bit_vector_plus( &(I), &(konst_582), &(ADD_u10_u10_583));\
bit_vector_cast_to_bit_vector(0, &(num), &(ADD_u10_u10_583));\
;
;

#define _send_to_nic2_branch_block_stmt_567_c_export_apply_macro_ ;

#define _send_to_nic2_inner_outarg_prep_macro__ ;

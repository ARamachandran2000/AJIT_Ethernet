
 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_8_tx_pcs_fsm.state} \
       { }  \
       {{000 000} {001 010} {010 011} {011 100} {100 001} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_8_rx_ber_mon_fsm.mcp1_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_8_rx_pcs_fsm.mcp1_state} \
       { }  \
       {{000 000} {001 011} {010 100} {011 010} {100 001} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_8_cs_ipif_access.state} \
       { }  \
       {{000 00} {001 01} {010 10} {011 11} }

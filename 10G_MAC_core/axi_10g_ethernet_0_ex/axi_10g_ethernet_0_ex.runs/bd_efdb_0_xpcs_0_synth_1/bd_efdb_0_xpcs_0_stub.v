// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Thu Apr 28 19:05:12 2022
// Host        : ajit4-ProLiant-ML10 running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_efdb_0_xpcs_0_stub.v
// Design      : bd_efdb_0_xpcs_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ten_gig_eth_pcs_pma_v6_0_8,Vivado 2017.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(dclk, rxrecclk_out, refclk_p, refclk_n, 
  sim_speedup_control, coreclk_out, qplloutclk_out, qplloutrefclk_out, qplllock_out, 
  txusrclk_out, txusrclk2_out, areset_datapathclk_out, gttxreset_out, gtrxreset_out, 
  txuserrdy_out, reset_counter_done_out, reset, xgmii_txd, xgmii_txc, xgmii_rxd, xgmii_rxc, txp, 
  txn, rxp, rxn, configuration_vector, status_vector, core_status, resetdone_out, signal_detect, 
  tx_fault, drp_req, drp_gnt, drp_den_o, drp_dwe_o, drp_daddr_o, drp_di_o, drp_drdy_o, drp_drpdo_o, 
  drp_den_i, drp_dwe_i, drp_daddr_i, drp_di_i, drp_drdy_i, drp_drpdo_i, pma_pmd_type, tx_disable)
/* synthesis syn_black_box black_box_pad_pin="dclk,rxrecclk_out,refclk_p,refclk_n,sim_speedup_control,coreclk_out,qplloutclk_out,qplloutrefclk_out,qplllock_out,txusrclk_out,txusrclk2_out,areset_datapathclk_out,gttxreset_out,gtrxreset_out,txuserrdy_out,reset_counter_done_out,reset,xgmii_txd[63:0],xgmii_txc[7:0],xgmii_rxd[63:0],xgmii_rxc[7:0],txp,txn,rxp,rxn,configuration_vector[535:0],status_vector[447:0],core_status[7:0],resetdone_out,signal_detect,tx_fault,drp_req,drp_gnt,drp_den_o,drp_dwe_o,drp_daddr_o[15:0],drp_di_o[15:0],drp_drdy_o,drp_drpdo_o[15:0],drp_den_i,drp_dwe_i,drp_daddr_i[15:0],drp_di_i[15:0],drp_drdy_i,drp_drpdo_i[15:0],pma_pmd_type[2:0],tx_disable" */;
  input dclk;
  output rxrecclk_out;
  input refclk_p;
  input refclk_n;
  input sim_speedup_control;
  output coreclk_out;
  output qplloutclk_out;
  output qplloutrefclk_out;
  output qplllock_out;
  output txusrclk_out;
  output txusrclk2_out;
  output areset_datapathclk_out;
  output gttxreset_out;
  output gtrxreset_out;
  output txuserrdy_out;
  output reset_counter_done_out;
  input reset;
  input [63:0]xgmii_txd;
  input [7:0]xgmii_txc;
  output [63:0]xgmii_rxd;
  output [7:0]xgmii_rxc;
  output txp;
  output txn;
  input rxp;
  input rxn;
  input [535:0]configuration_vector;
  output [447:0]status_vector;
  output [7:0]core_status;
  output resetdone_out;
  input signal_detect;
  input tx_fault;
  output drp_req;
  input drp_gnt;
  output drp_den_o;
  output drp_dwe_o;
  output [15:0]drp_daddr_o;
  output [15:0]drp_di_o;
  output drp_drdy_o;
  output [15:0]drp_drpdo_o;
  input drp_den_i;
  input drp_dwe_i;
  input [15:0]drp_daddr_i;
  input [15:0]drp_di_i;
  input drp_drdy_i;
  input [15:0]drp_drpdo_i;
  input [2:0]pma_pmd_type;
  output tx_disable;
endmodule

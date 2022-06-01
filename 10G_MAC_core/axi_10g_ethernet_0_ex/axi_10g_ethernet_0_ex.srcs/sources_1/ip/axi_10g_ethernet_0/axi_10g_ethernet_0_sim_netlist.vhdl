-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Thu Apr 28 19:11:23 2022
-- Host        : ajit4-ProLiant-ML10 running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/axi_10g_ethernet_0_sim_netlist.vhdl
-- Design      : axi_10g_ethernet_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_10g_ethernet_0_bd_efdb_0 is
  port (
    areset_datapathclk_out : out STD_LOGIC;
    coreclk_out : out STD_LOGIC;
    dclk : in STD_LOGIC;
    gtrxreset_out : out STD_LOGIC;
    gttxreset_out : out STD_LOGIC;
    m_axis_rx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_rx_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_rx_tlast : out STD_LOGIC;
    m_axis_rx_tuser : out STD_LOGIC;
    m_axis_rx_tvalid : out STD_LOGIC;
    mac_rx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    mac_status_vector : out STD_LOGIC_VECTOR ( 2 downto 0 );
    mac_tx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    pcs_pma_configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    pcs_pma_status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    pcspma_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qplllock_out : out STD_LOGIC;
    qplloutclk_out : out STD_LOGIC;
    qplloutrefclk_out : out STD_LOGIC;
    refclk_n : in STD_LOGIC;
    refclk_p : in STD_LOGIC;
    reset : in STD_LOGIC;
    reset_counter_done_out : out STD_LOGIC;
    resetdone_out : out STD_LOGIC;
    rx_axis_aresetn : in STD_LOGIC;
    rx_statistics_valid : out STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 29 downto 0 );
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    s_axis_pause_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_pause_tvalid : in STD_LOGIC;
    s_axis_tx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tx_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tx_tlast : in STD_LOGIC;
    s_axis_tx_tready : out STD_LOGIC;
    s_axis_tx_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tx_tvalid : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    sim_speedup_control : in STD_LOGIC;
    tx_axis_aresetn : in STD_LOGIC;
    tx_disable : out STD_LOGIC;
    tx_fault : in STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_statistics_valid : out STD_LOGIC;
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 25 downto 0 );
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    txuserrdy_out : out STD_LOGIC;
    txusrclk2_out : out STD_LOGIC;
    txusrclk_out : out STD_LOGIC
  );
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of axi_10g_ethernet_0_bd_efdb_0 : entity is "axi_10g_ethernet_0.hwdef";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_10g_ethernet_0_bd_efdb_0 : entity is "bd_efdb_0";
end axi_10g_ethernet_0_bd_efdb_0;

architecture STRUCTURE of axi_10g_ethernet_0_bd_efdb_0 is
  component axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0;
  component axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0;
  component axi_10g_ethernet_0_bd_efdb_0_xmac_0 is
  port (
    tx_clk0 : in STD_LOGIC;
    reset : in STD_LOGIC;
    tx_axis_aresetn : in STD_LOGIC;
    tx_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    tx_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_tvalid : in STD_LOGIC;
    tx_axis_tlast : in STD_LOGIC;
    tx_axis_tuser : in STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_tready : out STD_LOGIC;
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 25 downto 0 );
    tx_statistics_valid : out STD_LOGIC;
    pause_val : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pause_req : in STD_LOGIC;
    rx_axis_aresetn : in STD_LOGIC;
    rx_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rx_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_axis_tvalid : out STD_LOGIC;
    rx_axis_tuser : out STD_LOGIC;
    rx_axis_tlast : out STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 29 downto 0 );
    rx_statistics_valid : out STD_LOGIC;
    tx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    rx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    status_vector : out STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_dcm_locked : in STD_LOGIC;
    xgmii_txd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_txc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_clk0 : in STD_LOGIC;
    rx_dcm_locked : in STD_LOGIC;
    xgmii_rxd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_rxc : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component axi_10g_ethernet_0_bd_efdb_0_xmac_0;
  component axi_10g_ethernet_0_bd_efdb_0_xpcs_0 is
  port (
    dclk : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    refclk_p : in STD_LOGIC;
    refclk_n : in STD_LOGIC;
    sim_speedup_control : in STD_LOGIC;
    coreclk_out : out STD_LOGIC;
    qplloutclk_out : out STD_LOGIC;
    qplloutrefclk_out : out STD_LOGIC;
    qplllock_out : out STD_LOGIC;
    txusrclk_out : out STD_LOGIC;
    txusrclk2_out : out STD_LOGIC;
    areset_datapathclk_out : out STD_LOGIC;
    gttxreset_out : out STD_LOGIC;
    gtrxreset_out : out STD_LOGIC;
    txuserrdy_out : out STD_LOGIC;
    reset_counter_done_out : out STD_LOGIC;
    reset : in STD_LOGIC;
    xgmii_txd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_txc : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xgmii_rxd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_rxc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    core_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    resetdone_out : out STD_LOGIC;
    signal_detect : in STD_LOGIC;
    tx_fault : in STD_LOGIC;
    drp_req : out STD_LOGIC;
    drp_gnt : in STD_LOGIC;
    drp_den_o : out STD_LOGIC;
    drp_dwe_o : out STD_LOGIC;
    drp_daddr_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_di_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_drdy_o : out STD_LOGIC;
    drp_drpdo_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_den_i : in STD_LOGIC;
    drp_dwe_i : in STD_LOGIC;
    drp_daddr_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_di_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_drdy_i : in STD_LOGIC;
    drp_drpdo_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pma_pmd_type : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_disable : out STD_LOGIC
  );
  end component axi_10g_ethernet_0_bd_efdb_0_xpcs_0;
  signal \^coreclk_out\ : STD_LOGIC;
  signal dcm_locked_driver_dout : STD_LOGIC;
  signal pma_pmd_type_driver_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xmac_xgmii_xgmac_RXC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xmac_xgmii_xgmac_RXD : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xmac_xgmii_xgmac_TXC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xmac_xgmii_xgmac_TXD : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xpcs_core_gt_drp_interface_DADDR : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xpcs_core_gt_drp_interface_DEN : STD_LOGIC;
  signal xpcs_core_gt_drp_interface_DI : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xpcs_core_gt_drp_interface_DO : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xpcs_core_gt_drp_interface_DRDY : STD_LOGIC;
  signal xpcs_core_gt_drp_interface_DWE : STD_LOGIC;
  signal xpcs_drp_req : STD_LOGIC;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dcm_locked_driver : label is "xlconstant_v1_1_3_xlconstant,Vivado 2017.1";
  attribute X_CORE_INFO of pma_pmd_type_driver : label is "xlconstant_v1_1_3_xlconstant,Vivado 2017.1";
  attribute X_CORE_INFO of xmac : label is "ten_gig_eth_mac_v15_1_2,Vivado 2017.1";
  attribute X_CORE_INFO of xpcs : label is "ten_gig_eth_pcs_pma_v6_0_8,Vivado 2017.1";
begin
  coreclk_out <= \^coreclk_out\;
dcm_locked_driver: component axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0
     port map (
      dout(0) => dcm_locked_driver_dout
    );
pma_pmd_type_driver: component axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0
     port map (
      dout(2 downto 0) => pma_pmd_type_driver_dout(2 downto 0)
    );
xmac: component axi_10g_ethernet_0_bd_efdb_0_xmac_0
     port map (
      pause_req => s_axis_pause_tvalid,
      pause_val(15 downto 0) => s_axis_pause_tdata(15 downto 0),
      reset => reset,
      rx_axis_aresetn => rx_axis_aresetn,
      rx_axis_tdata(63 downto 0) => m_axis_rx_tdata(63 downto 0),
      rx_axis_tkeep(7 downto 0) => m_axis_rx_tkeep(7 downto 0),
      rx_axis_tlast => m_axis_rx_tlast,
      rx_axis_tuser => m_axis_rx_tuser,
      rx_axis_tvalid => m_axis_rx_tvalid,
      rx_clk0 => \^coreclk_out\,
      rx_configuration_vector(79 downto 0) => mac_rx_configuration_vector(79 downto 0),
      rx_dcm_locked => dcm_locked_driver_dout,
      rx_statistics_valid => rx_statistics_valid,
      rx_statistics_vector(29 downto 0) => rx_statistics_vector(29 downto 0),
      status_vector(2 downto 0) => mac_status_vector(2 downto 0),
      tx_axis_aresetn => tx_axis_aresetn,
      tx_axis_tdata(63 downto 0) => s_axis_tx_tdata(63 downto 0),
      tx_axis_tkeep(7 downto 0) => s_axis_tx_tkeep(7 downto 0),
      tx_axis_tlast => s_axis_tx_tlast,
      tx_axis_tready => s_axis_tx_tready,
      tx_axis_tuser => s_axis_tx_tuser(0),
      tx_axis_tvalid => s_axis_tx_tvalid,
      tx_clk0 => \^coreclk_out\,
      tx_configuration_vector(79 downto 0) => mac_tx_configuration_vector(79 downto 0),
      tx_dcm_locked => dcm_locked_driver_dout,
      tx_ifg_delay(7 downto 0) => tx_ifg_delay(7 downto 0),
      tx_statistics_valid => tx_statistics_valid,
      tx_statistics_vector(25 downto 0) => tx_statistics_vector(25 downto 0),
      xgmii_rxc(7 downto 0) => xmac_xgmii_xgmac_RXC(7 downto 0),
      xgmii_rxd(63 downto 0) => xmac_xgmii_xgmac_RXD(63 downto 0),
      xgmii_txc(7 downto 0) => xmac_xgmii_xgmac_TXC(7 downto 0),
      xgmii_txd(63 downto 0) => xmac_xgmii_xgmac_TXD(63 downto 0)
    );
xpcs: component axi_10g_ethernet_0_bd_efdb_0_xpcs_0
     port map (
      areset_datapathclk_out => areset_datapathclk_out,
      configuration_vector(535 downto 0) => pcs_pma_configuration_vector(535 downto 0),
      core_status(7 downto 0) => pcspma_status(7 downto 0),
      coreclk_out => \^coreclk_out\,
      dclk => dclk,
      drp_daddr_i(15 downto 0) => xpcs_core_gt_drp_interface_DADDR(15 downto 0),
      drp_daddr_o(15 downto 0) => xpcs_core_gt_drp_interface_DADDR(15 downto 0),
      drp_den_i => xpcs_core_gt_drp_interface_DEN,
      drp_den_o => xpcs_core_gt_drp_interface_DEN,
      drp_di_i(15 downto 0) => xpcs_core_gt_drp_interface_DI(15 downto 0),
      drp_di_o(15 downto 0) => xpcs_core_gt_drp_interface_DI(15 downto 0),
      drp_drdy_i => xpcs_core_gt_drp_interface_DRDY,
      drp_drdy_o => xpcs_core_gt_drp_interface_DRDY,
      drp_drpdo_i(15 downto 0) => xpcs_core_gt_drp_interface_DO(15 downto 0),
      drp_drpdo_o(15 downto 0) => xpcs_core_gt_drp_interface_DO(15 downto 0),
      drp_dwe_i => xpcs_core_gt_drp_interface_DWE,
      drp_dwe_o => xpcs_core_gt_drp_interface_DWE,
      drp_gnt => xpcs_drp_req,
      drp_req => xpcs_drp_req,
      gtrxreset_out => gtrxreset_out,
      gttxreset_out => gttxreset_out,
      pma_pmd_type(2 downto 0) => pma_pmd_type_driver_dout(2 downto 0),
      qplllock_out => qplllock_out,
      qplloutclk_out => qplloutclk_out,
      qplloutrefclk_out => qplloutrefclk_out,
      refclk_n => refclk_n,
      refclk_p => refclk_p,
      reset => reset,
      reset_counter_done_out => reset_counter_done_out,
      resetdone_out => resetdone_out,
      rxn => rxn,
      rxp => rxp,
      rxrecclk_out => rxrecclk_out,
      signal_detect => signal_detect,
      sim_speedup_control => sim_speedup_control,
      status_vector(447 downto 0) => pcs_pma_status_vector(447 downto 0),
      tx_disable => tx_disable,
      tx_fault => tx_fault,
      txn => txn,
      txp => txp,
      txuserrdy_out => txuserrdy_out,
      txusrclk2_out => txusrclk2_out,
      txusrclk_out => txusrclk_out,
      xgmii_rxc(7 downto 0) => xmac_xgmii_xgmac_RXC(7 downto 0),
      xgmii_rxd(63 downto 0) => xmac_xgmii_xgmac_RXD(63 downto 0),
      xgmii_txc(7 downto 0) => xmac_xgmii_xgmac_TXC(7 downto 0),
      xgmii_txd(63 downto 0) => xmac_xgmii_xgmac_TXD(63 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_10g_ethernet_0 is
  port (
    tx_axis_aresetn : in STD_LOGIC;
    rx_axis_aresetn : in STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dclk : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    tx_fault : in STD_LOGIC;
    tx_disable : out STD_LOGIC;
    pcspma_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sim_speedup_control : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    mac_tx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    mac_rx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    mac_status_vector : out STD_LOGIC_VECTOR ( 2 downto 0 );
    pcs_pma_configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    pcs_pma_status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    areset_datapathclk_out : out STD_LOGIC;
    txusrclk_out : out STD_LOGIC;
    txusrclk2_out : out STD_LOGIC;
    gttxreset_out : out STD_LOGIC;
    gtrxreset_out : out STD_LOGIC;
    txuserrdy_out : out STD_LOGIC;
    coreclk_out : out STD_LOGIC;
    resetdone_out : out STD_LOGIC;
    reset_counter_done_out : out STD_LOGIC;
    qplllock_out : out STD_LOGIC;
    qplloutclk_out : out STD_LOGIC;
    qplloutrefclk_out : out STD_LOGIC;
    refclk_p : in STD_LOGIC;
    refclk_n : in STD_LOGIC;
    reset : in STD_LOGIC;
    s_axis_tx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tx_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tx_tlast : in STD_LOGIC;
    s_axis_tx_tready : out STD_LOGIC;
    s_axis_tx_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tx_tvalid : in STD_LOGIC;
    s_axis_pause_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_pause_tvalid : in STD_LOGIC;
    m_axis_rx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_rx_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_rx_tlast : out STD_LOGIC;
    m_axis_rx_tuser : out STD_LOGIC;
    m_axis_rx_tvalid : out STD_LOGIC;
    tx_statistics_valid : out STD_LOGIC;
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 25 downto 0 );
    rx_statistics_valid : out STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 29 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axi_10g_ethernet_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_10g_ethernet_0 : entity is "axi_10g_ethernet_0,bd_efdb_0,{ten_gig_eth_mac=bought,ten_gig_eth_pcs_pma_basekr=design_linking}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_10g_ethernet_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_10g_ethernet_0 : entity is "bd_efdb_0,Vivado 2017.1";
end axi_10g_ethernet_0;

architecture STRUCTURE of axi_10g_ethernet_0 is
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of inst : label is "axi_10g_ethernet_0.hwdef";
begin
inst: entity work.axi_10g_ethernet_0_bd_efdb_0
     port map (
      areset_datapathclk_out => areset_datapathclk_out,
      coreclk_out => coreclk_out,
      dclk => dclk,
      gtrxreset_out => gtrxreset_out,
      gttxreset_out => gttxreset_out,
      m_axis_rx_tdata(63 downto 0) => m_axis_rx_tdata(63 downto 0),
      m_axis_rx_tkeep(7 downto 0) => m_axis_rx_tkeep(7 downto 0),
      m_axis_rx_tlast => m_axis_rx_tlast,
      m_axis_rx_tuser => m_axis_rx_tuser,
      m_axis_rx_tvalid => m_axis_rx_tvalid,
      mac_rx_configuration_vector(79 downto 0) => mac_rx_configuration_vector(79 downto 0),
      mac_status_vector(2 downto 0) => mac_status_vector(2 downto 0),
      mac_tx_configuration_vector(79 downto 0) => mac_tx_configuration_vector(79 downto 0),
      pcs_pma_configuration_vector(535 downto 0) => pcs_pma_configuration_vector(535 downto 0),
      pcs_pma_status_vector(447 downto 0) => pcs_pma_status_vector(447 downto 0),
      pcspma_status(7 downto 0) => pcspma_status(7 downto 0),
      qplllock_out => qplllock_out,
      qplloutclk_out => qplloutclk_out,
      qplloutrefclk_out => qplloutrefclk_out,
      refclk_n => refclk_n,
      refclk_p => refclk_p,
      reset => reset,
      reset_counter_done_out => reset_counter_done_out,
      resetdone_out => resetdone_out,
      rx_axis_aresetn => rx_axis_aresetn,
      rx_statistics_valid => rx_statistics_valid,
      rx_statistics_vector(29 downto 0) => rx_statistics_vector(29 downto 0),
      rxn => rxn,
      rxp => rxp,
      rxrecclk_out => rxrecclk_out,
      s_axis_pause_tdata(15 downto 0) => s_axis_pause_tdata(15 downto 0),
      s_axis_pause_tvalid => s_axis_pause_tvalid,
      s_axis_tx_tdata(63 downto 0) => s_axis_tx_tdata(63 downto 0),
      s_axis_tx_tkeep(7 downto 0) => s_axis_tx_tkeep(7 downto 0),
      s_axis_tx_tlast => s_axis_tx_tlast,
      s_axis_tx_tready => s_axis_tx_tready,
      s_axis_tx_tuser(0) => s_axis_tx_tuser(0),
      s_axis_tx_tvalid => s_axis_tx_tvalid,
      signal_detect => signal_detect,
      sim_speedup_control => sim_speedup_control,
      tx_axis_aresetn => tx_axis_aresetn,
      tx_disable => tx_disable,
      tx_fault => tx_fault,
      tx_ifg_delay(7 downto 0) => tx_ifg_delay(7 downto 0),
      tx_statistics_valid => tx_statistics_valid,
      tx_statistics_vector(25 downto 0) => tx_statistics_vector(25 downto 0),
      txn => txn,
      txp => txp,
      txuserrdy_out => txuserrdy_out,
      txusrclk2_out => txusrclk2_out,
      txusrclk_out => txusrclk_out
    );
end STRUCTURE;

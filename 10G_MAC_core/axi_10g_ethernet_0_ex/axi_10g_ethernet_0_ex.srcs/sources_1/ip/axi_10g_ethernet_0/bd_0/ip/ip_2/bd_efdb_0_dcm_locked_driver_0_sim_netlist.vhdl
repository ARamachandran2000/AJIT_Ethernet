-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Thu Apr 28 19:01:04 2022
-- Host        : ajit4-ProLiant-ML10 running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_2/bd_efdb_0_dcm_locked_driver_0_sim_netlist.vhdl
-- Design      : bd_efdb_0_dcm_locked_driver_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_efdb_0_dcm_locked_driver_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bd_efdb_0_dcm_locked_driver_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bd_efdb_0_dcm_locked_driver_0 : entity is "bd_efdb_0_dcm_locked_driver_0,xlconstant_v1_1_3_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_efdb_0_dcm_locked_driver_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bd_efdb_0_dcm_locked_driver_0 : entity is "xlconstant_v1_1_3_xlconstant,Vivado 2017.1";
end bd_efdb_0_dcm_locked_driver_0;

architecture STRUCTURE of bd_efdb_0_dcm_locked_driver_0 is
  signal \<const1>\ : STD_LOGIC;
begin
  dout(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;

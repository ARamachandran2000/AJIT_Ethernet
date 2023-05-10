-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Mon Oct 31 15:10:13 2022
-- Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/harshad/vivadoRunDir/ip_ex/axi_ethernet_0_ex/axi_ethernet_0_ex.srcs/sources_1/ip/axi_ethernet_0/axi_ethernet_0_stub.vhdl
-- Design      : axi_ethernet_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axi_ethernet_0 is
  Port ( 
    s_axi_lite_resetn : in STD_LOGIC;
    s_axi_lite_clk : in STD_LOGIC;
    mac_irq : out STD_LOGIC;
    axis_clk : in STD_LOGIC;
    axi_txd_arstn : in STD_LOGIC;
    axi_txc_arstn : in STD_LOGIC;
    axi_rxd_arstn : in STD_LOGIC;
    axi_rxs_arstn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    signal_detect : in STD_LOGIC;
    clk125_out : out STD_LOGIC;
    clk312_out : out STD_LOGIC;
    rst_125_out : out STD_LOGIC;
    riu_valid_3 : in STD_LOGIC;
    riu_valid_2 : in STD_LOGIC;
    riu_valid_1 : in STD_LOGIC;
    riu_prsnt_3 : in STD_LOGIC;
    riu_prsnt_2 : in STD_LOGIC;
    riu_prsnt_1 : in STD_LOGIC;
    riu_rddata_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_rddata_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_rddata_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    tx_dly_rdy_1 : in STD_LOGIC;
    rx_dly_rdy_1 : in STD_LOGIC;
    tx_vtc_rdy_1 : in STD_LOGIC;
    rx_vtc_rdy_1 : in STD_LOGIC;
    tx_dly_rdy_2 : in STD_LOGIC;
    rx_dly_rdy_2 : in STD_LOGIC;
    tx_vtc_rdy_2 : in STD_LOGIC;
    rx_vtc_rdy_2 : in STD_LOGIC;
    tx_dly_rdy_3 : in STD_LOGIC;
    rx_dly_rdy_3 : in STD_LOGIC;
    tx_vtc_rdy_3 : in STD_LOGIC;
    rx_vtc_rdy_3 : in STD_LOGIC;
    tx_logic_reset : out STD_LOGIC;
    rx_logic_reset : out STD_LOGIC;
    rx_locked : out STD_LOGIC;
    tx_locked : out STD_LOGIC;
    tx_bsc_rst_out : out STD_LOGIC;
    rx_bsc_rst_out : out STD_LOGIC;
    tx_bs_rst_out : out STD_LOGIC;
    rx_bs_rst_out : out STD_LOGIC;
    tx_rst_dly_out : out STD_LOGIC;
    rx_rst_dly_out : out STD_LOGIC;
    tx_bsc_en_vtc_out : out STD_LOGIC;
    tx_bs_en_vtc_out : out STD_LOGIC;
    rx_bsc_en_vtc_out : out STD_LOGIC;
    rx_bs_en_vtc_out : out STD_LOGIC;
    riu_clk_out : out STD_LOGIC;
    riu_wr_en_out : out STD_LOGIC;
    tx_pll_clk_out : out STD_LOGIC;
    rx_pll_clk_out : out STD_LOGIC;
    tx_rdclk_out : out STD_LOGIC;
    riu_addr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    riu_wr_data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_nibble_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rx_btval_1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dummy_port_in : in STD_LOGIC;
    phy_rst_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axis_txc_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_txc_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_txc_tlast : in STD_LOGIC;
    s_axis_txc_tready : out STD_LOGIC;
    s_axis_txc_tvalid : in STD_LOGIC;
    s_axis_txd_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_txd_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_txd_tlast : in STD_LOGIC;
    s_axis_txd_tready : out STD_LOGIC;
    s_axis_txd_tvalid : in STD_LOGIC;
    m_axis_rxd_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_rxd_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rxd_tlast : out STD_LOGIC;
    m_axis_rxd_tready : in STD_LOGIC;
    m_axis_rxd_tvalid : out STD_LOGIC;
    m_axis_rxs_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_rxs_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rxs_tlast : out STD_LOGIC;
    m_axis_rxs_tready : in STD_LOGIC;
    m_axis_rxs_tvalid : out STD_LOGIC;
    sgmii_rxn : in STD_LOGIC;
    sgmii_rxp : in STD_LOGIC;
    sgmii_txn : out STD_LOGIC;
    sgmii_txp : out STD_LOGIC;
    mdio_mdc : out STD_LOGIC;
    mdio_mdio_i : in STD_LOGIC;
    mdio_mdio_o : out STD_LOGIC;
    mdio_mdio_t : out STD_LOGIC;
    lvds_clk_clk_n : in STD_LOGIC;
    lvds_clk_clk_p : in STD_LOGIC
  );

end axi_ethernet_0;

architecture stub of axi_ethernet_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_lite_resetn,s_axi_lite_clk,mac_irq,axis_clk,axi_txd_arstn,axi_txc_arstn,axi_rxd_arstn,axi_rxs_arstn,interrupt,signal_detect,clk125_out,clk312_out,rst_125_out,riu_valid_3,riu_valid_2,riu_valid_1,riu_prsnt_3,riu_prsnt_2,riu_prsnt_1,riu_rddata_3[15:0],riu_rddata_2[15:0],riu_rddata_1[15:0],tx_dly_rdy_1,rx_dly_rdy_1,tx_vtc_rdy_1,rx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,tx_vtc_rdy_2,rx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,tx_vtc_rdy_3,rx_vtc_rdy_3,tx_logic_reset,rx_logic_reset,rx_locked,tx_locked,tx_bsc_rst_out,rx_bsc_rst_out,tx_bs_rst_out,rx_bs_rst_out,tx_rst_dly_out,rx_rst_dly_out,tx_bsc_en_vtc_out,tx_bs_en_vtc_out,rx_bsc_en_vtc_out,rx_bs_en_vtc_out,riu_clk_out,riu_wr_en_out,tx_pll_clk_out,rx_pll_clk_out,tx_rdclk_out,riu_addr_out[5:0],riu_wr_data_out[15:0],riu_nibble_sel_out[1:0],rx_btval_1[8:0],rx_btval_2[8:0],rx_btval_3[8:0],dummy_port_in,phy_rst_n[0:0],s_axi_araddr[17:0],s_axi_arready,s_axi_arvalid,s_axi_awaddr[17:0],s_axi_awready,s_axi_awvalid,s_axi_bready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_rdata[31:0],s_axi_rready,s_axi_rresp[1:0],s_axi_rvalid,s_axi_wdata[31:0],s_axi_wready,s_axi_wstrb[3:0],s_axi_wvalid,s_axis_txc_tdata[31:0],s_axis_txc_tkeep[3:0],s_axis_txc_tlast,s_axis_txc_tready,s_axis_txc_tvalid,s_axis_txd_tdata[31:0],s_axis_txd_tkeep[3:0],s_axis_txd_tlast,s_axis_txd_tready,s_axis_txd_tvalid,m_axis_rxd_tdata[31:0],m_axis_rxd_tkeep[3:0],m_axis_rxd_tlast,m_axis_rxd_tready,m_axis_rxd_tvalid,m_axis_rxs_tdata[31:0],m_axis_rxs_tkeep[3:0],m_axis_rxs_tlast,m_axis_rxs_tready,m_axis_rxs_tvalid,sgmii_rxn,sgmii_rxp,sgmii_txn,sgmii_txp,mdio_mdc,mdio_mdio_i,mdio_mdio_o,mdio_mdio_t,lvds_clk_clk_n,lvds_clk_clk_p";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bd_5d9f_0,Vivado 2019.1";
begin
end;

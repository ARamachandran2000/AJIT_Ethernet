# start of pin location constraints for single lane
# Tx in upper nibble
set_property PACKAGE_PIN BJ22 [get_ports sgmii_rxp]
set_property PACKAGE_PIN BK21 [get_ports sgmii_rxn]
set_property PACKAGE_PIN BG22 [get_ports sgmii_txp]
set_property PACKAGE_PIN BH22 [get_ports sgmii_txn]
set_property PACKAGE_PIN BH27 [get_ports mgt_clk_p]
set_property PACKAGE_PIN BJ27 [get_ports mgt_clk_n]
set_property PACKAGE_PIN BL23 [get_ports dummy_port_in]


set_property PACKAGE_PIN BJ4 [get_ports clk_in_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports clk_in_p]
set_property PACKAGE_PIN BH24 [get_ports phy_rst_n]
set_property IOSTANDARD LVDS [get_ports sgmii_rxp]
set_property IOSTANDARD LVDS [get_ports sgmii_rxn]
set_property IOSTANDARD LVDS [get_ports sgmii_txp]
set_property IOSTANDARD LVDS [get_ports sgmii_txn]

set_property IOSTANDARD LVCMOS18 [get_ports phy_rst_n]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets ref_clk]

create_clock -period 10.000000 -name system_clock [get_ports clk_in_p]

set_false_path -from [get_clocks -include_generated_clocks clock] -to [get_clocks -include_generated_clocks clock_mac]
set_false_path -from [get_clocks -include_generated_clocks clock_mac] -to [get_clocks -include_generated_clocks clock]

set_false_path -to [get_pins -hier -nocase -regexp .*axi_eth_ex_des_data_sync_reg0.*/D]
set_false_path -to [get_pins -hier -nocase -regexp .*axi_eth_ex_des_reset_sync.*/PRE]

set_power_opt -exclude_cells [get_cells -hierarchical -filter { PRIMITIVE_TYPE =~ *.bram.* }]


## I2C for phy reset
set_property PACKAGE_PIN BM27     [get_ports scl] ;# Bank  67 VCCO - VCC1V8   - IO_L7N_T1L_N1_QBC_AD13N_67
set_property IOSTANDARD  LVCMOS18 [get_ports scl] ;# Bank  67 VCCO - VCC1V8   - IO_L7N_T1L_N1_QBC_AD13N_67
set_property PACKAGE_PIN BL28     [get_ports sda] ;# Bank  67 VCCO - VCC1V8   - IO_L7P_T1L_N0_QBC_AD13P_67
set_property IOSTANDARD  LVCMOS18 [get_ports sda] ;# Bank  67 VCCO - VCC1V8   - IO_L7P_T1L_N0_QBC_AD13P_67


## uart0
set_property PACKAGE_PIN BP26     [get_ports "DEBUG_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property IOSTANDARD  LVCMOS18 [get_ports "DEBUG_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property PACKAGE_PIN BN26     [get_ports "DEBUG_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67
set_property IOSTANDARD  LVCMOS18 [get_ports "DEBUG_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67

## uart1
set_property PACKAGE_PIN BK28     [get_ports "SERIAL_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9N_T1L_N5_AD12N_67
set_property IOSTANDARD  LVCMOS18 [get_ports "SERIAL_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9N_T1L_N5_AD12N_67
set_property PACKAGE_PIN BJ28     [get_ports "SERIAL_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9P_T1L_N4_AD12P_67
set_property IOSTANDARD  LVCMOS18 [get_ports "SERIAL_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9P_T1L_N4_AD12P_67


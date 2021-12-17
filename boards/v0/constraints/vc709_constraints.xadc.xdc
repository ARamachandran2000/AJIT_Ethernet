## xdc.

# Clock signal
# TODO: check if these are OK for vc709
set_property PACKAGE_PIN H19 [get_ports clk_p]
    set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p]
set_property PACKAGE_PIN G18 [get_ports clk_n]
    set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]
create_clock -period 5.000 -name clk_p [get_ports clk_p] 


# usb UART
set_property PACKAGE_PIN AU36 [get_ports {DEBUG_UART_TX}]
        set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_UART_TX}]
set_property PACKAGE_PIN AU33 [get_ports {DEBUG_UART_RX}]
        set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_UART_RX}]


#
# Push Buttons	
#North button
set_property PACKAGE_PIN AR40 [get_ports reset_clk]						
            set_property IOSTANDARD LVCMOS18 [get_ports reset_clk]           	
#East button
set_property PACKAGE_PIN AU38 [get_ports reset]						
        set_property IOSTANDARD LVCMOS18 [get_ports reset]

    
# move this to a switch
set_property PACKAGE_PIN AV30 [get_ports {CPU_RESET}]					
    set_property IOSTANDARD LVCMOS18 [get_ports {CPU_RESET}]
    
#Extreme Right DIP switch
set_property PACKAGE_PIN AY33 [get_ports {DEBUG_MODE}]					
	set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_MODE}]
#2nd from right
set_property PACKAGE_PIN BA31 [get_ports {SINGLE_STEP_MODE}]					
	set_property IOSTANDARD LVCMOS18 [get_ports {SINGLE_STEP_MODE}]
	
#LEDs
set_property PACKAGE_PIN AM39 [get_ports {CPU_MODE[1]}]					
	set_property IOSTANDARD LVCMOS18 [get_ports {CPU_MODE[1]}]
set_property PACKAGE_PIN AN39 [get_ports {CPU_MODE[0]}]					
    set_property IOSTANDARD LVCMOS18 [get_ports {CPU_MODE[0]}]


#
# On XADC: Serial Uart..
#     Rx mapped to GPIO_0
#     Tx mapped to GPIO_1
set_property PACKAGE_PIN AR38 [get_ports SERIAL_UART_RX]
	set_property IOSTANDARD LVCMOS18 [get_ports SERIAL_UART_RX]
set_property PACKAGE_PIN AR39 [get_ports SERIAL_UART_TX]
	set_property IOSTANDARD LVCMOS18 [get_ports SERIAL_UART_TX]



#
# TO BE ADDED
#
# SGMII ports!
#




## xdc.

# Clock signal
# TODO: check if these are OK for vc709
set_property PACKAGE_PIN H19 [get_ports clk_p]
    set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p]
set_property PACKAGE_PIN G18 [get_ports clk_n]
    set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]
create_clock -period 5.000 -name clk_p [get_ports clk_p] 

# set false paths
set_false_path -from [get_clocks -include_generated_clocks clk_out1*] -to [get_clocks -include_generated_clocks clk_out2*]
set_false_path -from [get_clocks -include_generated_clocks clk_out2*] -to [get_clocks -include_generated_clocks clk_out1*]


# using the J16 header on XM105
# J16 pin 5 -> FMC_LA_28P -> pad L29
set_property PACKAGE_PIN L29 [get_ports {DEBUG_UART_TX}]
        set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_UART_TX}]
# J16 pin 7 -> FMC_LA_28N -> pad L30
set_property PACKAGE_PIN L30 [get_ports {DEBUG_UART_RX}]
        set_property IOSTANDARD LVCMOS18 [get_ports {DEBUG_UART_RX}]
# GROUND is connected to J16 PIN 3.


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
# On XM105 extension card 
#
# using the J16 header on XM105
#    J16 pin 6 -> H34 on FMC ->  V30 on FPGA
set_property PACKAGE_PIN V30 [get_ports {SERIAL_UART_RX}]					
	set_property IOSTANDARD LVCMOS18 [get_ports {SERIAL_UART_RX}]
# using the J16 header on XM105
#    J16 pin 8 -> H35 on FMC -> V31 on FPGA
set_property PACKAGE_PIN V31 [get_ports {SERIAL_UART_TX}]					
	set_property IOSTANDARD LVCMOS18 [get_ports {SERIAL_UART_TX}]
# J16 pin 4 is GROUND.






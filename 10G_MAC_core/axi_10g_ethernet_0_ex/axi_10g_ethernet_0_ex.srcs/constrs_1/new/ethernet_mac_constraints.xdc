################### Transceiver TXP, TXN,RXP,RXN (LOC) ########################################

set_property PACKAGE_PIN AP4 [get_ports txp]
set_property PACKAGE_PIN AP3 [get_ports txn]

set_property PACKAGE_PIN AN6 [get_ports rxp]
set_property PACKAGE_PIN AN5 [get_ports rxn]

####################    System Clock Source     ##############################################


set_property PACKAGE_PIN H19 [get_ports clk_p]
    set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p]
set_property PACKAGE_PIN G18 [get_ports clk_n]
    set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]
create_clock -period 5.000 -name clk_p [get_ports clk_p]


####################### Transceiver Reference Clock###########################################



set_property PACKAGE_PIN AK8 [get_ports refclk_p]
set_property PACKAGE_PIN AK7 [get_ports refclk_n]

set_property PACKAGE_PIN AK34 [get_ports USER_CLOCK_P]
set_property PACKAGE_PIN AL34 [get_ports USER_CLOCK_N]
    set_property IOSTANDARD LVDS [get_ports USER_CLOCK_P]
        set_property IOSTANDARD LVDS [get_ports USER_CLOCK_N]

set_property PACKAGE_PIN AJ32 [get_ports USER_SMA_CLOCK_P]
set_property PACKAGE_PIN AK32 [get_ports USER_SMA_CLOCK_N]
    set_property IOSTANDARD LVDS [get_ports USER_SMA_CLOCK_P]
        set_property IOSTANDARD LVDS [get_ports USER_SMA_CLOCK_N]


        
############################# RESET  ###################################################        

set_property PACKAGE_PIN AU38 [get_ports reset]						
        set_property IOSTANDARD LVCMOS18 [get_ports reset]

######################################################################################

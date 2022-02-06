# AXIS_TO_PIPE

This folder contains the modules that interface directly with the MAC on an AXI-S interface and checks and discards erroneous packets. Additionally, makes a protocol conversion from AXI-S to an AHIR pipe and vice versa.


Design : 



![enter image description here](https://github.com/ARamachandran2000/AJIT_Ethernet/blob/main/axis_to_pipe/Design.png)




Modules : 
|
  1. rx_fifo.v 
        Receives data on an AXI-s interface from the MAC and adds it to a pipe that has interfaces comatible with AHIR.
  2. tx_fifo.v
        Reads from an AHIR pipe and sends it to the MAC on an AXI-s Interface.
  
  3. rx_fifo_reader/prog.aa 
        Does Error checking on packets and ensures that only good packets are sent to the NIC and all others are discarded.

TestBenches : 
|
  1. rx_fifo_tb.v
  2. tx_fifo_tb.v
  3. rx_fifo_reader/testbench.c

Script Files : 
|
  For execution of modules in rx_fifo_reader
 
Waveform Files : 
|
  1. rx_fifo_tb_behav.wcfg
  2. tx_fifo_tb_behav.wcfg



Data Format on Pipe : 

 Packet :

          tlast     tdata      tkeep
          1 bit     32 bits    4 bits
 
 
 
 When a bad packet is detected rx_fifo informs rx_fifo_reader to disacard all packets received prior using a special identifier as follows: 
 
 tlast = 1'b1
 
 tdata = 32'hFFFFFFFF
 
 tkeep = 4'h0
 
 

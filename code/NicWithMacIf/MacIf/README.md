# Mac Interface
Contains all modules that interface to the MAC and communicates to the NIC

## Folder Organization
```
axis_to_pipe : Consists of modules that converts to and from AXI-S to AHIR Pipe protocol
ConcatBlocks : Concatenates 8-bit words from MAC to 64-bit chunks 
```

Modules : 
|
  1. axis_to_pipe/rx_fifo.v 
        Receives data on an AXI-s interface from the MAC and adds it to a pipe that has interfaces comatible with AHIR.
  2. axis_to_pipe/tx_fifo.v
        Reads from an AHIR pipe and sends it to the MAC on an AXI-s Interface.
  
  3. axis_to_pipe/rx_fifo_reader/prog.aa 
        Does Error checking on packets and ensures that only good packets are sent to the NIC and all others are discarded.

	(Needed If using Tri Mode MAC)
  4. ConcatBlocks/rx_concat.v
	Concatenates 8-bit words from MAC and sends to the rx_fifo
  5. ConcatBlocks/tx_concat.v
	Splits 64-bit data words from tx_fifo and transmits it as 8-bit words to the MAC

TestBenches : 
|
  1. axis_to_pipe/rx_fifo_tb.v
  2. axis_to_pipe/tx_fifo_tb.v
  3. axis_to_pipe/rx_fifo_reader/testbench.c

Script Files : 
|
  For execution of modules in rx_fifo_reader
 
Waveform Files : 
|
  1. axis_to_pipe/rx_fifo_tb_behav.wcfg
  2. axis_to_pipe/tx_fifo_tb_behav.wcfg



Data Format on Pipe : 

 Packet :

          tlast     tdata      tkeep
          1 bit     32 bits    4 bits
 
 
 
 When a bad packet is detected rx_fifo informs rx_fifo_reader to disacard all packets received prior using a special identifier as follows: 
 
 tlast = 1'b1
 
 tdata = 32'hFFFFFFFF
 
 tkeep = 4'h0






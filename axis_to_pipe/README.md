# AXIS_TO_PIPE
Design Files : 
|
  1. rx_fifo.v
  2. tx_fifo.v


TestBenches : 
|
  1. rx_fifo_tb.v
  2. tx_fifo_tb.v

Waveform Files : 
|
  1. rx_fifo_tb_behav.wcfg
  2. tx_fifo_tb_behav.wcfg


rx_fifo receives data on an AXI-s interface from the MAC and adds it to a pipe that has interfaces comatible with AHIR.
tx_fifo reads from an AHIR pipe and sends it to the MAC on an AXI-s Interface


Packet Format on Pipe : 

tlast tdata tkeep 

  1    32.    4.    _> 37 bits

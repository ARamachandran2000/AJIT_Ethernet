#make SW

#./testbench_sw stdout 2>&1 | tee run.log

grep nicRxFromMacDaemon run.log > parser.trace
grep CPU run.log > cpu.trace
grep macToNicInterface run.log > macNicInterface.trace
grep MAC_TX run.log > mac.trace
grep ReceiveEngineDaemon run.log > rx_engine.trace
grep populateRxQueue run.log > populateRxQueue.trace

gedit *.trace &

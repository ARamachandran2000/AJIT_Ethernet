#make SW

#./testbench_sw stdout 2>&1 | tee run.log

grep nicRxFromMacDaemon run.log > parser.trace
grep CPU run.log > cpu.trace
grep macToNicInterface run.log > macNicInterface.trace
grep MAC_TX run.log > mactx.trace
grep MAC_RX run.log > macrx.trace
grep ReceiveEngineDaemon run.log > rx_engine.trace
grep populateRxQueue run.log > populateRxQueue.trace
grep transmitEngineDaemon run.log > transmitEngineDaemon.trace
grep transmitPacket run.log > transmitPacket.trace
grep NicRegisterAccessDaemon run.log > NicRegisterAccessDaemon.trace
grep pushIntoQueue run.log > pushIntoQueue.trace
grep nicToMacInterface run.log > nicToMacInterface.trace
gedit *.trace &

#make SW

#./testbench_sw stdout 2>&1 | tee run.log

grep nicRxFromMacDaemon run.log > parser.trace
grep CPU run.log > cpu.trace
grep macToNicInterface run.log > macNicInterface.trace
grep MAC_TX run.log > mac.trace


gedit *.trace &

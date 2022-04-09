onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_generator_acb_req_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_generator_acb_req.udo}

run -all

quit -force

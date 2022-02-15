all: rx_from_mac receive_engine transmit_engine

## every time create a directory to store output of
##  aalink
makedirectory : *.aa
	rm -rf .linked
	mkdir .linked

## aalink for parser
rx_from_mac : makedirectory
	AaLinkExtMem decls.aa pipes.aa signals.aa control.aa general_utils.aa memory_utils.aa queue_utils.aa register_utils.aa rx_from_mac.aa | vcFormat > .linked/rx_from_mac.linked.aa

## aalink for receive_engine
receive_engine : makedirectory
	AaLinkExtMem decls.aa pipes.aa signals.aa control.aa general_utils.aa memory_utils.aa queue_utils.aa register_utils.aa receive_engine.aa | vcFormat > .linked/receive_engine.linked.aa

## aalink for transmit_engine
transmit_engine: makedirectory
	AaLinkExtMem decls.aa pipes.aa signals.aa control.aa general_utils.aa memory_utils.aa queue_utils.aa register_utils.aa transmit_engine.aa | vcFormat > .linked/transmit_engine.linked.aa
	
clean : 
	rm -rf .linked
	rm .gsi.aa

PHONY : all clean

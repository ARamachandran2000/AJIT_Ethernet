SRC = ./src

all: rx_from_mac receive_engine transmit_engine

## every time create a directory to store output of
##  aalink
makedirectory : $(SRC)/*.aa
	rm -rf .linked
	mkdir .linked

## aalink for parser
rx_from_mac : makedirectory
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/rx_from_mac.aa | vcFormat > .linked/rx_from_mac.linked.aa

## aalink for receive_engine
receive_engine : makedirectory
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/receive_engine.aa | vcFormat > .linked/receive_engine.linked.aa

## aalink for transmit_engine
transmit_engine: makedirectory
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/transmit_engine.aa | vcFormat > .linked/transmit_engine.linked.aa
	
clean : 
	rm -rf .linked
	rm .gsi.aa

PHONY : all clean

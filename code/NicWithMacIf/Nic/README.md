# NIC

Contains all NIC Related Files

## Process Flow
1. NIC Receives packet from MAC sequentially via the 73-bit data format outlined below.
2. The parser splits the Ethernet Header information from the payload and forwards it to the Receive Engine which goes through the following steps : 

     Receive Engine : 

    * Extracts free buffer pointer from Free Queue.
    * Stores packet information from parser into the free buffer.
    * Notifies one of the CPU servers that the corresponding free buffer has been populated by pushing to the Receive Queue of server x.
   * If the packet is found to be bad then repurpose the buffer by pushing it back to the free queue.


3. CPU Processes the packets, then transmit engine transmits the packets via the MAC.

    Transmit Engine : 

    * Loop through all available servers and pop from TX Queue to identify processed buffer pointers
    * Transmit the packet from the buffer to the MAC
    * Push the now empty buffer back into the free queue.

## NIC, Memory and Processor block diagram
![NIC, Memory and Processor block diagram](https://github.com/ARamachandran2000/AJIT_Ethernet/blob/main/code/NicWithMacIf/Nic/assets/NIC_Memory_Processor_Interfaces.png)


## Folder Organization
```
memory_utils.aa
	Contains utilities to access the main memory

queue_utils.aa
	Contains utilities to access the queue

pipes.aa
	Pipe declarations for all scripts

control.aa
    Communcation with Software (via AFB Bus) and NIC to rd/wr registers

decls.aa
	Contains global constants and parameters

receive_engine.aa
	Reads packet data from parser and writes to memory

rx_from_mac.aa
	Responsible for parsing the packet and splitting ethernet header from payload

register_utils.aa
	Utilities that allows NIC to access registers

transmit_engine.aa
	Responsible for reading processed packet from memory and forwarding it to the MAC for transmission

general_utils.aa
   	Contains utilities common to all modules

InterfaceDataStructure.h
	Contains Software Interface to NIC
```

## AFB Bus Format
```
1.  Request packet:
	A 74-bit format.
	
	Request[73:0]
		Request[73]  = lock-bit
		Request[72]  = read/write-bar 
		Request[71:68] = byte mask
			write data is organized as 4-bytes. if bit 3 (MSb) of byte-mask
			is set, the top byte of write data is written, else not.
		Request[67:32] = address (36-bit)
		Request[31:0]  = write-data.

	
2.  Response packet:
	A 33-bit format.

		Response[32] = Error
		Response[31:0] = read-data


3. For every request packet, there is a response.
```
## AJIT system core memory interface 
```
1.  Request packet:
	A 110-bit format.
	
	Request[109:0]
		Request[109]  = lock-bit
		Request[108]  = read/write-bar 
		Request[107:100] = byte mask
			write data is organized as 8-bytes. if bit 7 (MSb) of byte-mask
			is set, the top byte of write data is written, else not.
		Request[99:64] = address (36-bit)
		Request[63:0]  = write-data.

	
2.  Response packet:
	A 65-bit format.

		Response[64] = Error
		Response[63:0] = read-data


3. For every request packet, there is a response.
```

## NIC Register Access Protocol
```
1.  Request packet:
	A 43-bit format.

		Request[42]  = rwbar
		Request[41 : 38]  = bmask 
		Request[37 : 32] = index
		Request[31:0]  = write-data

	
2.  Response packet:
	A 33-bit format.

		Response[32] = Response Status
		Response[31:0] = response-data

```
## MAC to NIC Interface Diagram

![MAC to NIC Interface](https://github.com/ARamachandran2000/AJIT_Ethernet/blob/main/code/NicWithMacIf/Nic/assets/macIf.png)

## MAC to NIC Data Packet Format
A 73-bit Quantity consisting of  64-bit data(tdata), last word bit identifier(tlast) and 8-bit byte mask(tkeep).
```
  tlast     tdata      tkeep
  1 bit     64 bits    8 bits
```

## Bad Packet Format
When a bad packet is detected the NIC repurposes the filled buffer in memory by overwriting its contents with the next packet.

Format (73-bit) : 
```
tdata :  32'hFFFFFFFF
tkeep :   4'h0
tlast :   1'b1
```






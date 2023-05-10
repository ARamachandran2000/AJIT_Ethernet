	.file	"main.c"
	.section	".text"
	.align 4
	.global readNicReg
	.type	readNicReg, #function
	.proc	016
readNicReg:
	sll	%o0, 2, %o0
	sethi	%hi(NIC_REG), %g1
	ld	[%g1+%lo(NIC_REG)], %o1
	add	%o1, %o0, %o1
	sra	%o1, 31, %o0
	or	%o7, %g0, %g1
	call	__ajit_load_word_from_physical_address__, 0
	 or	%g1, %g0, %o7
	.size	readNicReg, .-readNicReg
	.align 4
	.global writeNicReg
	.type	writeNicReg, #function
	.proc	020
writeNicReg:
	sll	%o0, 2, %g1
	sethi	%hi(NIC_REG), %g2
	mov	%o1, %o0
	ld	[%g2+%lo(NIC_REG)], %o2
	add	%o2, %g1, %o2
	sra	%o2, 31, %o1
	or	%o7, %g0, %g1
	call	__ajit_store_word_to_physical_address__, 0
	 or	%g1, %g0, %o7
	.size	writeNicReg, .-writeNicReg
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"data at addr = 0x%lx%lx is 0x%x\n"
	.section	".text"
	.align 4
	.global readMemory
	.type	readMemory, #function
	.proc	020
readMemory:
	save	%sp, -96, %sp
	mov	%i0, %o0
	mov	%i1, %o1
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%i1, %i2
	mov	%i0, %i1
	mov	%i0, %i3
	mov	%i2, %i4
	sethi	%hi(.LC0), %i0
	mov	%o0, %i5
	call	ee_printf, 0
	 restore %i0, %lo(.LC0), %o0
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC1:
	.asciz	"i = %u"
	.align 8
.LC2:
	.asciz	"Data at location 0x%x is = 0x%08x%08x\n"
	.section	".text"
	.align 4
	.global printMemory
	.type	printMemory, #function
	.proc	020
printMemory:
	save	%sp, -96, %sp
	mov	0, %o1
	sethi	%hi(.LC1), %o0
	sethi	%hi(MEM), %i3
	or	%o0, %lo(.LC1), %o0
	sethi	%hi(.LC2), %i4
	call	ee_printf, 0
	 mov	0, %i5
	or	%i3, %lo(MEM), %i3
	or	%i4, %lo(.LC2), %i4
	ld	[%i3], %g1
.L8:
	mov	%i4, %o0
	add	%g1, %i5, %o1
	ld	[%g1+%i5], %o2
	call	ee_printf, 0
	 ld	[%o1+4], %o3
	add	%i5, 8, %i5
	cmp	%i5, 1024
	bne,a	.L8
	 ld	[%i3], %g1
	jmp	%i7+8
	 restore
	.size	printMemory, .-printMemory
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"Data in BUFFER[0] :\n"
	.align 8
.LC4:
	.asciz	"\t0x%08x%08x\n"
	.align 8
.LC5:
	.asciz	"\n"
	.align 8
.LC6:
	.asciz	"Data in BUFFER[1] :\n"
	.section	".text"
	.align 4
	.global printBuffers
	.type	printBuffers, #function
	.proc	020
printBuffers:
	save	%sp, -96, %sp
	sethi	%hi(.LC3), %o0
	sethi	%hi(BUF3), %i3
	or	%o0, %lo(.LC3), %o0
	sethi	%hi(.LC4), %i4
	call	ee_printf, 0
	 mov	0, %i5
	or	%i3, %lo(BUF3), %i3
	or	%i4, %lo(.LC4), %i4
	ld	[%i3], %g1
.L14:
	add	%g1, %i5, %g2
	ld	[%g1+%i5], %o1
	mov	%i4, %o0
	call	ee_printf, 0
	 ld	[%g2+4], %o2
	add	%i5, 8, %i5
	cmp	%i5, 88
	bne,a	.L14
	 ld	[%i3], %g1
	sethi	%hi(.LC5), %i0
	call	ee_printf, 0
	 or	%i0, %lo(.LC5), %o0
	sethi	%hi(.LC6), %o0
	sethi	%hi(BUF5), %i3
	or	%o0, %lo(.LC6), %o0
	call	ee_printf, 0
	 mov	0, %i5
	or	%i3, %lo(BUF5), %i3
	ld	[%i3], %g1
.L15:
	add	%g1, %i5, %g2
	ld	[%g1+%i5], %o1
	mov	%i4, %o0
	call	ee_printf, 0
	 ld	[%g2+4], %o2
	add	%i5, 8, %i5
	cmp	%i5, 88
	bne,a	.L15
	 ld	[%i3], %g1
	call	ee_printf, 0
	 restore %i0, %lo(.LC5), %o0
	.size	printBuffers, .-printBuffers
	.align 4
	.global initBufferQueue
	.type	initBufferQueue, #function
	.proc	020
initBufferQueue:
	st	%g0, [%o0]
	st	%g0, [%o0+12]
	st	%g0, [%o0+8]
	jmp	%o7+8
	 st	%o1, [%o0+4]
	.size	initBufferQueue, .-initBufferQueue
	.section	.rodata.str1.8
	.align 8
.LC7:
	.asciz	"acquiring mutex\n"
	.section	".text"
	.align 4
	.global acquireMutex
	.type	acquireMutex, #function
	.proc	020
acquireMutex:
	save	%sp, -96, %sp
	sethi	%hi(.LC7), %i5
	ld	[%i0], %g1
	cmp	%g1, 1
	bne	.L19
	 or	%i5, %lo(.LC7), %i5
.L24:
	call	ee_printf, 0
	 mov	%i5, %o0
	ld	[%i0], %g1
	cmp	%g1, 1
	be	.L24
	 nop
.L19:
	mov	1, %g1
	st	%g1, [%i0]
	jmp	%i7+8
	 restore
	.size	acquireMutex, .-acquireMutex
	.align 4
	.global releaseMutex
	.type	releaseMutex, #function
	.proc	020
releaseMutex:
	jmp	%o7+8
	 st	%g0, [%o0]
	.size	releaseMutex, .-releaseMutex
	.section	.rodata.str1.8
	.align 8
.LC8:
	.asciz	"queue full."
	.section	".text"
	.align 4
	.global pushIntoBufferQueue
	.type	pushIntoBufferQueue, #function
	.proc	04
pushIntoBufferQueue:
	save	%sp, -96, %sp
	call	acquireMutex, 0
	 mov	%i0, %o0
	ld	[%i0+8], %g2
	add	%g2, 1, %g4
	ld	[%i0+4], %g1
	ld	[%i0+12], %g3
	add	%g1, -1, %g1
	mov	%i0, %i5
	and	%g1, %g4, %g1
	cmp	%g3, %g1
	be	.L30
	 add	%i0, 16, %g4
	sll	%g2, 2, %g2
	st	%i1, [%g4+%g2]
	st	%g1, [%i0+8]
	st	%g0, [%i5]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L30:
	sethi	%hi(.LC8), %o0
	mov	1, %i0
	call	ee_printf, 0
	 or	%o0, %lo(.LC8), %o0
	st	%g0, [%i5]
	jmp	%i7+8
	 restore
	.size	pushIntoBufferQueue, .-pushIntoBufferQueue
	.align 4
	.global popFromBufferQueue
	.type	popFromBufferQueue, #function
	.proc	04
popFromBufferQueue:
	save	%sp, -96, %sp
	call	acquireMutex, 0
	 mov	%i0, %o0
	ld	[%i0+12], %g1
	ld	[%i0+8], %g2
	mov	%i0, %i5
	cmp	%g2, %g1
	be	.L34
	 add	%i0, 16, %g3
	sll	%g1, 2, %g1
	ld	[%g3+%g1], %g1
	st	%g1, [%i1]
	ld	[%i5+12], %g2
	ld	[%i5+4], %g1
	add	%g2, 1, %g2
	add	%g1, -1, %g1
	st	%g0, [%i5]
	and	%g1, %g2, %g1
	st	%g1, [%i5+12]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L34:
	st	%g0, [%i5]
	jmp	%i7+8
	 restore %g0, 1, %o0
	.size	popFromBufferQueue, .-popFromBufferQueue
	.section	.rodata.str1.8
	.align 8
.LC9:
	.asciz	"NIC_REG[22]=0x%x\n"
	.section	".text"
	.align 4
	.global nicRegConfig
	.type	nicRegConfig, #function
	.proc	020
nicRegConfig:
	save	%sp, -96, %sp
	call	readNicReg, 0
	 mov	22, %o0
	mov	%o0, %o1
	sethi	%hi(.LC9), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	%i1, %o1
	call	writeNicReg, 0
	 mov	2, %o0
	mov	10, %o0
	call	writeNicReg, 0
	 mov	%i2, %o1
	mov	%i0, %o1
	mov	18, %o0
	call	writeNicReg, 0
	 mov	0, %i0
	call	writeNicReg, 0
	 restore %g0, 1, %o1
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC10:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.align 8
.LC11:
	.asciz	"Data from Nic Registers:\n"
	.align 8
.LC12:
	.asciz	"\tControl Register \t\t     = 0x%x\n"
	.align 8
.LC13:
	.asciz	"\tNumber of Servers \t\t     = 0x%x\n"
	.align 8
.LC14:
	.asciz	"\tAddress of Rx Queue \t\t     = 0x%x\n"
	.align 8
.LC15:
	.asciz	"\tAddress of Tx Queue \t\t     = 0x%x\n"
	.align 8
.LC16:
	.asciz	"\tAddress of Free Queue \t\t     = 0x%x\n"
	.align 8
.LC17:
	.asciz	"\tNumber of packets Received(from MAC) = 0x%x\n"
	.align 8
.LC18:
	.asciz	"\tNumber of packets Stored in Memory   = 0x%x\n"
	.align 8
.LC19:
	.asciz	"\tNumber of packets Sent Out(to MAC)   = 0x%x\n\n"
	.section	".text"
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	save	%sp, -96, %sp
	sethi	%hi(.LC10), %i4
	mov	0, %i5
	or	%i4, %lo(.LC10), %i4
.L37:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o1
	mov	%o0, %o2
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L37
	 nop
	sethi	%hi(.LC11), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC11), %o0
	call	readNicReg, 0
	 mov	0, %o0
	mov	%o0, %o1
	sethi	%hi(.LC12), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC12), %o0
	call	readNicReg, 0
	 mov	1, %o0
	mov	%o0, %o1
	sethi	%hi(.LC13), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC13), %o0
	call	readNicReg, 0
	 mov	2, %o0
	mov	%o0, %o1
	sethi	%hi(.LC14), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC14), %o0
	call	readNicReg, 0
	 mov	10, %o0
	mov	%o0, %o1
	sethi	%hi(.LC15), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC15), %o0
	call	readNicReg, 0
	 mov	18, %o0
	mov	%o0, %o1
	sethi	%hi(.LC16), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC16), %o0
	call	readNicReg, 0
	 mov	23, %o0
	mov	%o0, %o1
	sethi	%hi(.LC17), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC17), %o0
	call	readNicReg, 0
	 mov	25, %o0
	mov	%o0, %o1
	sethi	%hi(.LC18), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC18), %o0
	mov	21, %o0
	call	readNicReg, 0
	 sethi	%hi(.LC19), %i0
	or	%i0, %lo(.LC19), %i0
	call	ee_printf, 0
	 restore %g0, %o0, %o1
	.size	readNicRegs, .-readNicRegs
	.section	.rodata.str1.8
	.align 8
.LC20:
	.asciz	"\nStarted\n"
	.align 8
.LC21:
	.asciz	"All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[2]=0x%lx,\n\tBuffer[4]=0x%lx,\n\trx_queue1=0x%lx,\n\ttx_queue1=0x%lx,\n\tFree_Queue1=0x%lx\n"
	.align 8
.LC22:
	.asciz	"All Addresses:\n\tBuffer[1]=0x%lx,\n\tBuffer[3]=0x%lx,\n\tBuffer[5]=0x%lx,\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n"
	.align 8
.LC23:
	.asciz	"Initializing the Queues.\n"
	.align 8
.LC24:
	.asciz	"Queues Initialized,\n->Pushing free buffers.\n"
	.align 8
.LC25:
	.asciz	"Pushed free buffers,\n->Configuring NIC registers.\n"
	.align 8
.LC26:
	.asciz	"Configuration Done. \n\n---- NIC has started ----\n\n"
	.align 8
.LC27:
	.asciz	"Reading Rx_Queue\n"
	.align 8
.LC28:
	.asciz	"Nothing in Rx queue.\n--- WAIT ---\n\n\n"
	.align 8
.LC29:
	.asciz	"Written to Tx queue.\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -136, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	3, %o0
	sethi	%hi(.LC20), %o0
	add	%fp, -24, %i5
	mov	%fp, %i4
	call	ee_printf, 0
	 or	%o0, %lo(.LC20), %o0
.L40:
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%i5]
	add	%i5, 4, %i5
	cmp	%i5, %i4
	bne	.L40
	 nop
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i0
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i5
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i1
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i4
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i2
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%i1, %o5
	mov	%o0, %i3
	ld	[%fp-24], %o1
	ld	[%fp-16], %o2
	ld	[%fp-8], %o3
	mov	%i0, %o4
	st	%i2, [%sp+92]
	sethi	%hi(.LC21), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC21), %o0
	mov	%i5, %o4
	mov	%i4, %o5
	ld	[%fp-20], %o1
	ld	[%fp-12], %i1
	ld	[%fp-4], %i2
	mov	%i1, %o2
	mov	%i2, %o3
	st	%i3, [%sp+92]
	sethi	%hi(.LC22), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC22), %o0
	sethi	%hi(.LC23), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC23), %o0
	mov	8, %g1
	st	%g0, [%i3]
	st	%g1, [%i3+4]
	st	%g0, [%i3+12]
	st	%g0, [%i3+8]
	st	%g1, [%i4+4]
	st	%g0, [%i4]
	st	%g0, [%i4+12]
	st	%g0, [%i4+8]
	st	%g1, [%i5+4]
	st	%g0, [%i5]
	st	%g0, [%i5+12]
	st	%g0, [%i5+8]
	sethi	%hi(.LC24), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC24), %o0
	sethi	%hi(.LC25), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC25), %o0
	mov	%i3, %o0
	mov	%i5, %o1
	call	nicRegConfig, 0
	 mov	%i4, %o2
	sethi	%hi(.LC26), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC26), %o0
	sethi	%hi(BUF3), %g1
	ld	[%g1+%lo(BUF3)], %g4
	sethi	%hi(16384), %g1
	or	%g1, 63, %g1
	st	%g1, [%g4+4]
	sethi	%hi(BUF5), %g1
	ld	[%g1+%lo(BUF5)], %g3
	sethi	%hi(12288), %g1
	or	%g1, 63, %g1
	st	%g0, [%fp-28]
	st	%g1, [%g3+4]
	mov	0, %g2
	mov	2, %g1
.L41:
	add	%g4, %g2, %i3
	st	%g1, [%i3+12]
	add	%g1, 10, %i0
	add	%g3, %g2, %i3
	st	%i0, [%i3+12]
	add	%g1, 2, %g1
	cmp	%g1, 18
	bne	.L41
	 add	%g2, 8, %g2
	mov	%i1, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i4, %o0
	mov	%i2, %o1
	mov	%i4, %o0
	sethi	%hi(.LC27), %i1
	sethi	%hi(.LC28), %i2
	call	pushIntoBufferQueue, 0
	 sethi	%hi(.LC29), %i3
	or	%i1, %lo(.LC27), %i1
	or	%i2, %lo(.LC28), %i2
	or	%i3, %lo(.LC29), %i3
.L47:
	call	readNicRegs, 0
	 nop
	call	printBuffers, 0
	 nop
	call	printMemory, 0
	 nop
	mov	%i5, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -28, %o1
	cmp	%o0, 0
	bne	.L48
	 ld	[%fp-28], %o1
.L49:
	call	pushIntoBufferQueue, 0
	 mov	%i4, %o0
	call	ee_printf, 0
	 mov	%i3, %o0
	call	readNicRegs, 0
	 nop
	call	printBuffers, 0
	 nop
	call	printMemory, 0
	 nop
	mov	%i5, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -28, %o1
	cmp	%o0, 0
	be	.L49
	 ld	[%fp-28], %o1
.L48:
	call	ee_printf, 0
	 mov	%i1, %o0
	call	ee_printf, 0
	 mov	%i2, %o0
	b,a	.L47
	.size	main, .-main
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.global BUF5
	.align 4
	.type	BUF5, #object
	.size	BUF5, 4
BUF5:
	.long	4193760
	.global BUF3
	.align 4
	.type	BUF3, #object
	.size	BUF3, 4
BUF3:
	.long	4193936
	.global MEM
	.align 4
	.type	MEM, #object
	.size	MEM, 4
MEM:
	.long	4193280
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

	.file	"main.c"
	.section	".text"
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"acquiring mutex\n"
	.section	".text"
	.align 4
	.global acquireMutex
	.type	acquireMutex, #function
	.proc	020
acquireMutex:
	save	%sp, -96, %sp
	sethi	%hi(.LC0), %i5
	ld	[%i0], %g1
	cmp	%g1, 1
	bne	.L4
	 or	%i5, %lo(.LC0), %i5
.L9:
	call	ee_printf, 0
	 mov	%i5, %o0
	ld	[%i0], %g1
	cmp	%g1, 1
	be	.L9
	 nop
.L4:
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
.LC1:
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
	be	.L16
	 add	%i0, 16, %g4
	sll	%g2, 2, %g2
	st	%i1, [%g4+%g2]
	st	%g1, [%i0+8]
	st	%g0, [%i5]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L16:
	sethi	%hi(.LC1), %o0
	mov	1, %i0
	call	ee_printf, 0
	 or	%o0, %lo(.LC1), %o0
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
	be	.L20
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
.L20:
	st	%g0, [%i5]
	jmp	%i7+8
	 restore %g0, 1, %o0
	.size	popFromBufferQueue, .-popFromBufferQueue
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
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.section	".text"
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	save	%sp, -96, %sp
	sethi	%hi(.LC2), %i4
	mov	0, %i5
	or	%i4, %lo(.LC2), %i4
.L23:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o1
	mov	%o0, %o2
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L23
	 nop
	jmp	%i7+8
	 restore
	.size	readNicRegs, .-readNicRegs
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
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"NIC_REG[22]=0x%x\n"
	.align 8
.LC4:
	.asciz	"NIC_regs: [1]=0x%x,[2]=0x%x,[10]=0x%x,[18]=0x%x,[0]=0x%x,[21]=0x%x,[22]=0x%x\n"
	.section	".text"
	.align 4
	.global nicRegConfig
	.type	nicRegConfig, #function
	.proc	020
nicRegConfig:
	save	%sp, -104, %sp
	call	readNicReg, 0
	 mov	22, %o0
	mov	%o0, %o1
	sethi	%hi(.LC3), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC3), %o0
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	%i1, %o1
	call	writeNicReg, 0
	 mov	2, %o0
	mov	%i2, %o1
	call	writeNicReg, 0
	 mov	10, %o0
	mov	%i0, %o1
	call	writeNicReg, 0
	 mov	18, %o0
	mov	1, %o1
	call	writeNicReg, 0
	 mov	0, %o0
	call	readNicReg, 0
	 mov	1, %o0
	mov	%o0, %i0
	call	readNicReg, 0
	 mov	2, %o0
	mov	%o0, %i2
	call	readNicReg, 0
	 mov	10, %o0
	mov	%o0, %i3
	call	readNicReg, 0
	 mov	18, %o0
	mov	%o0, %i4
	call	readNicReg, 0
	 mov	0, %o0
	mov	%o0, %i5
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %i1
	call	readNicReg, 0
	 mov	22, %o0
	mov	%i0, %o1
	st	%o0, [%sp+96]
	st	%i1, [%sp+92]
	sethi	%hi(.LC4), %o0
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	mov	%i5, %o5
	call	ee_printf, 0
	 or	%o0, %lo(.LC4), %o0
	jmp	%i7+8
	 restore
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC5:
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
	sethi	%hi(.LC5), %i0
	mov	%o0, %i5
	call	ee_printf, 0
	 restore %i0, %lo(.LC5), %o0
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC6:
	.asciz	"i = %u"
	.align 8
.LC7:
	.asciz	"Data at location 0x%x is = 0x%08x%08x\n"
	.section	".text"
	.align 4
	.global printMemory
	.type	printMemory, #function
	.proc	020
printMemory:
	save	%sp, -96, %sp
	sethi	%hi(.LC6), %i2
	mov	0, %o1
	or	%i2, %lo(.LC6), %o0
	sethi	%hi(MEM), %i1
	sethi	%hi(.LC7), %i3
	call	ee_printf, 0
	 mov	0, %i5
	mov	0, %i4
	or	%i1, %lo(MEM), %i1
	or	%i2, %lo(.LC6), %i2
	or	%i3, %lo(.LC7), %i3
.L29:
	mov	%i4, %o1
	call	ee_printf, 0
	 mov	%i2, %o0
	ld	[%i1], %g1
	mov	%i3, %o0
	add	%g1, %i5, %o1
	ld	[%g1+%i5], %o2
	call	ee_printf, 0
	 ld	[%o1+4], %o3
	add	%i4, 2, %i4
	cmp	%i4, 256
	bne	.L29
	 add	%i5, 8, %i5
	jmp	%i7+8
	 restore
	.size	printMemory, .-printMemory
	.section	.rodata.str1.8
	.align 8
.LC8:
	.asciz	"\nStarted\n"
	.align 8
.LC9:
	.asciz	"All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[2]=0x%lx,\n\tBuffer[4]=0x%lx,\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n"
	.align 8
.LC10:
	.asciz	"All Addresses:\n\tBuffer[1]=0x%lx,\n\tBuffer[3]=0x%lx,\n\tBuffer[5]=0x%lx,\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n"
	.align 8
.LC11:
	.asciz	"Initializing the Queues.\n"
	.align 8
.LC12:
	.asciz	"Queues Initialized,\n->Pushing free buffers.\n"
	.align 8
.LC13:
	.asciz	"Pushed free buffers,\n->Configuring NIC registers.\n"
	.align 8
.LC14:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC15:
	.asciz	"In the loop.\n"
	.align 8
.LC16:
	.asciz	"Reading Rx_Queue\n"
	.align 8
.LC17:
	.asciz	"Nothing in Rx queue.\nNIC_REG[21]=0x%x\n"
	.align 8
.LC18:
	.asciz	"Free Queue : mutex =%u, num_of_entries=%u, wp =%u, rp =%u.\n"
	.align 8
.LC19:
	.asciz	"pop successful.\n"
	.align 8
.LC20:
	.asciz	"Tx Queue : mutex =%u, num_of_entries=%u, wp =%u, rp =%u.\n"
	.align 8
.LC21:
	.asciz	"Written to Tx queue.\nNIC_REG[21]=0x%x\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -136, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	3, %o0
	sethi	%hi(.LC8), %o0
	add	%fp, -24, %i5
	mov	%fp, %i4
	call	ee_printf, 0
	 or	%o0, %lo(.LC8), %o0
.L32:
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%i5]
	add	%i5, 4, %i5
	cmp	%i5, %i4
	bne	.L32
	 nop
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i2
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i5
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	ld	[%fp-24], %o1
	mov	%o0, %i3
	ld	[%fp-16], %o2
	ld	[%fp-8], %o3
	mov	%i2, %o4
	mov	%i5, %o5
	st	%o0, [%sp+92]
	sethi	%hi(.LC9), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	%i2, %o4
	mov	%i5, %o5
	ld	[%fp-20], %i0
	ld	[%fp-12], %i1
	mov	%i0, %o1
	mov	%i1, %o2
	ld	[%fp-4], %i4
	st	%i3, [%sp+92]
	mov	%i4, %o3
	sethi	%hi(.LC10), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC10), %o0
	sethi	%hi(.LC11), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC11), %o0
	mov	8, %g1
	st	%g0, [%i3]
	st	%g1, [%i3+4]
	st	%g0, [%i3+12]
	st	%g0, [%i3+8]
	st	%g1, [%i5+4]
	st	%g0, [%i5]
	st	%g0, [%i5+12]
	st	%g0, [%i5+8]
	st	%g1, [%i2+4]
	st	%g0, [%i2]
	st	%g0, [%i2+12]
	st	%g0, [%i2+8]
	sethi	%hi(.LC12), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC12), %o0
	mov	%i0, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i3, %o0
	mov	%i1, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i3, %o0
	mov	%i4, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i3, %o0
	sethi	%hi(.LC13), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC13), %o0
	call	printMemory, 0
	 sethi	%hi(.LC15), %i0
	mov	%i3, %o0
	mov	%i2, %o1
	call	nicRegConfig, 0
	 mov	%i5, %o2
	sethi	%hi(.LC14), %o0
	or	%o0, %lo(.LC14), %o0
	call	ee_printf, 0
	 sethi	%hi(.LC16), %l4
	sethi	%hi(.LC17), %l3
	sethi	%hi(.LC18), %l2
	sethi	%hi(.LC19), %i1
	sethi	%hi(.LC20), %l1
	sethi	%hi(.LC21), %l0
	mov	1, %i4
	st	%g0, [%fp-28]
	or	%i0, %lo(.LC15), %i0
	or	%l4, %lo(.LC16), %l4
	or	%l3, %lo(.LC17), %l3
	or	%l2, %lo(.LC18), %l2
	or	%i1, %lo(.LC19), %i1
	or	%l1, %lo(.LC20), %l1
	or	%l0, %lo(.LC21), %l0
.L38:
.L40:
	call	ee_printf, 0
	 mov	%i0, %o0
	call	readNicRegs, 0
	 nop
	call	printMemory, 0
	 nop
	mov	%i2, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -28, %o1
	cmp	%o0, 0
	bne	.L39
	 mov	%i1, %o0
.L34:
	cmp	%i4, 1
	be	.L40
	 mov	0, %i4
	call	ee_printf, 0
	 nop
	ld	[%fp-28], %o1
	call	pushIntoBufferQueue, 0
	 mov	%i5, %o0
	ld	[%i5+4], %o2
	ld	[%i5+8], %o3
	ld	[%i5+12], %o4
	ld	[%i5], %o1
	call	ee_printf, 0
	 mov	%l1, %o0
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %o1
	call	ee_printf, 0
	 mov	%l0, %o0
	call	ee_printf, 0
	 mov	%i0, %o0
	call	readNicRegs, 0
	 nop
	call	printMemory, 0
	 nop
	mov	%i2, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -28, %o1
	cmp	%o0, 0
	be	.L34
	 mov	%i1, %o0
.L39:
	call	ee_printf, 0
	 mov	%l4, %o0
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %o1
	call	ee_printf, 0
	 mov	%l3, %o0
	mov	%l2, %o0
	ld	[%i3], %o1
	ld	[%i3+4], %o2
	ld	[%i3+8], %o3
	call	ee_printf, 0
	 ld	[%i3+12], %o4
	b,a	.L38
	.size	main, .-main
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.global MEM
	.align 4
	.type	MEM, #object
	.size	MEM, 4
MEM:
	.long	4193280
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

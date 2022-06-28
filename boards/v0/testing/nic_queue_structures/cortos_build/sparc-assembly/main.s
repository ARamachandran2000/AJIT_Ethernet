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
	.align 4
	.global acquireMutex
	.type	acquireMutex, #function
	.proc	020
acquireMutex:
	ld	[%o0], %g1
	cmp	%g1, 1
	bne	.L8
	 mov	1, %g1
.L5:
	b,a	.L5
.L8:
	jmp	%o7+8
	 st	%g1, [%o0]
	.size	acquireMutex, .-acquireMutex
	.align 4
	.global releaseMutex
	.type	releaseMutex, #function
	.proc	020
releaseMutex:
	jmp	%o7+8
	 st	%g0, [%o0]
	.size	releaseMutex, .-releaseMutex
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"written buf_ptr = 0x%lx at dest = 0x%lx\n"
	.section	".text"
	.align 4
	.global pushIntoBufferQueue
	.type	pushIntoBufferQueue, #function
	.proc	04
pushIntoBufferQueue:
	save	%sp, -96, %sp
	ld	[%i0], %g1
	cmp	%g1, 1
	bne	.L17
	 mov	%i0, %i5
.L15:
	b,a	.L15
.L17:
	mov	1, %g1
	st	%g1, [%i0]
	ld	[%i0+4], %i4
	ld	[%i0+8], %g1
	ld	[%i0+12], %g2
	add	%g1, 1, %g3
	add	%i4, -1, %i4
	and	%i4, %g3, %i4
	cmp	%g2, %i4
	be	.L12
	 mov	1, %i0
	sll	%g1, 2, %g1
	add	%i5, 16, %o2
	sethi	%hi(.LC0), %o0
	st	%i1, [%o2+%g1]
	or	%o0, %lo(.LC0), %o0
	mov	%i1, %o1
	add	%o2, %g1, %o2
	call	ee_printf, 0
	 mov	0, %i0
	st	%i4, [%i5+8]
.L12:
	st	%g0, [%i5]
	jmp	%i7+8
	 restore
	.size	pushIntoBufferQueue, .-pushIntoBufferQueue
	.align 4
	.global popFromBufferQueue
	.type	popFromBufferQueue, #function
	.proc	04
popFromBufferQueue:
	ld	[%o0], %g2
	cmp	%g2, 1
	bne	.L25
	 mov	%o0, %g1
.L23:
	b,a	.L23
.L25:
	mov	1, %g2
	st	%g2, [%o0]
	ld	[%o0+8], %g3
	ld	[%o0+12], %g2
	cmp	%g3, %g2
	be	.L21
	 add	%o0, 16, %g4
	sll	%g2, 2, %g2
	ld	[%g4+%g2], %g2
	st	%g2, [%o1]
	mov	0, %o0
	ld	[%g1+12], %g3
	ld	[%g1+4], %g2
	add	%g3, 1, %g3
	add	%g2, -1, %g2
	st	%g0, [%g1]
	and	%g2, %g3, %g2
	jmp	%o7+8
	 st	%g2, [%g1+12]
.L21:
	mov	1, %o0
	jmp	%o7+8
	 st	%g0, [%g1]
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
.LC1:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.section	".text"
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	save	%sp, -96, %sp
	sethi	%hi(.LC1), %i4
	mov	0, %i5
	or	%i4, %lo(.LC1), %i4
.L28:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o1
	mov	%o0, %o2
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L28
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
.LC2:
	.asciz	"NIC_REG[22]=0x%x\n"
	.align 8
.LC3:
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
	sethi	%hi(.LC2), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC2), %o0
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
	sethi	%hi(.LC3), %o0
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	mov	%i5, %o5
	call	ee_printf, 0
	 or	%o0, %lo(.LC3), %o0
	jmp	%i7+8
	 restore
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC4:
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
	sethi	%hi(.LC4), %i0
	mov	%o0, %i5
	call	ee_printf, 0
	 restore %i0, %lo(.LC4), %o0
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC5:
	.asciz	"Started\n"
	.align 8
.LC6:
	.asciz	"All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[1]=0x%lx,\n\tBuffer[2]=0x%lx,\n\tBuffer[3]=0x%lx,\n\tBuffer[4]=0x%lx,\n\tBuffer[5]=0x%lx,\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n"
	.align 8
.LC7:
	.asciz	"Initializing the Queues.\tFree_Queue=0x%lx\n"
	.align 8
.LC8:
	.asciz	"Queues Initialized,\n Pushing free buffers.\n"
	.align 8
.LC9:
	.asciz	"Pushed free buffers,\n Configuring NIC registers.\n"
	.align 8
.LC10:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC11:
	.asciz	"In the loop.\n"
	.align 8
.LC12:
	.asciz	"Reading Rx_Queue\n"
	.align 8
.LC13:
	.asciz	"Nothing in Rx queue.\nNIC_REG[21]=0x%x\n"
	.align 8
.LC14:
	.asciz	"Free Queue : mutex =%u, num_of_entries=%u, wp =%u, rp =%u.\n"
	.align 8
.LC15:
	.asciz	"Written to Tx queue.\nNIC_REG[21]=0x%x\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -128, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	3, %o0
	sethi	%hi(.LC5), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC5), %o0
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%fp-12]
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%fp-8]
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%fp-4]
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %l4
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %l3
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	0, %o4
	mov	%o0, %l2
	ld	[%fp-8], %o2
	ld	[%fp-12], %i5
	ld	[%fp-4], %i3
	mov	%i5, %o1
	mov	%i3, %o3
	mov	0, %i4
	st	%o0, [%sp+104]
	mov	%i4, %o5
	st	%g0, [%sp+92]
	st	%l4, [%sp+96]
	st	%l3, [%sp+100]
	sethi	%hi(.LC6), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC6), %o0
	mov	%l2, %o1
	sethi	%hi(.LC7), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC7), %o0
	mov	8, %g1
	st	%g0, [%l2]
	st	%g1, [%l2+4]
	st	%g0, [%l2+12]
	st	%g0, [%l2+8]
	st	%g1, [%l3+4]
	st	%g0, [%l3]
	st	%g0, [%l3+12]
	st	%g0, [%l3+8]
	st	%g1, [%l4+4]
	st	%g0, [%l4]
	st	%g0, [%l4+12]
	st	%g0, [%l4+8]
	sethi	%hi(.LC8), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC8), %o0
	mov	%i5, %o1
	call	pushIntoBufferQueue, 0
	 mov	%l2, %o0
	mov	%i3, %o1
	call	pushIntoBufferQueue, 0
	 mov	%l2, %o0
	mov	%i4, %o1
	call	pushIntoBufferQueue, 0
	 mov	%l2, %o0
	sethi	%hi(.LC9), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	%l2, %o0
	mov	%l4, %o1
	call	nicRegConfig, 0
	 mov	%l3, %o2
	sethi	%hi(.LC10), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC10), %o0
	mov	52, %g1
	stb	%g1, [%i5]
	sll	%l2, 3, %i5
	addcc	%i5, 4, %l1
	sra	%l2, 31, %g2
	srl	%l2, 29, %g1
	sll	%g2, 3, %i4
	or	%g1, %i4, %i4
	addx	%i4, 0, %l0
	addcc	%i5, 8, %i1
	sethi	%hi(.LC11), %l5
	addx	%i4, 0, %i0
	sethi	%hi(.LC12), %l7
	addcc	%i5, 12, %i3
	sethi	%hi(.LC15), %l6
	st	%g0, [%fp-16]
	addx	%i4, 0, %i2
	or	%l5, %lo(.LC11), %l5
	or	%l7, %lo(.LC12), %l7
	or	%l6, %lo(.LC15), %l6
.L37:
	call	ee_printf, 0
	 mov	%l5, %o0
	mov	%l4, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -16, %o1
	cmp	%o0, 0
	bne	.L38
	 mov	%l3, %o0
.L35:
	call	pushIntoBufferQueue, 0
	 ld	[%fp-16], %o1
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %o1
	call	ee_printf, 0
	 mov	%l6, %o0
	call	ee_printf, 0
	 mov	%l5, %o0
	mov	%l4, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -16, %o1
	cmp	%o0, 0
	be	.L35
	 mov	%l3, %o0
.L38:
	call	ee_printf, 0
	 mov	%l7, %o0
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %o1
	sethi	%hi(.LC13), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC13), %o0
	ld	[%l2+4], %o2
	ld	[%l2+8], %o3
	ld	[%l2+12], %o4
	ld	[%l2], %o1
	sethi	%hi(.LC14), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC14), %o0
	mov	%i4, %o0
	call	readMemory, 0
	 mov	%i5, %o1
	mov	%l0, %o0
	call	readMemory, 0
	 mov	%l1, %o1
	mov	%i0, %o0
	call	readMemory, 0
	 mov	%i1, %o1
	mov	%i2, %o0
	call	readMemory, 0
	 mov	%i3, %o1
	b,a	.L37
	.size	main, .-main
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

	.file	"main.c"
	.section	".text"
	.align 4
	.global cortos_writeMessagesNew
	.type	cortos_writeMessagesNew, #function
	.proc	016
cortos_writeMessagesNew:
	save	%sp, -96, %sp
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L9
	 mov	%i0, %i5
	ld	[%i5+12], %g4
.L11:
	ld	[%i5+8], %g2
	ld	[%i5+4], %g3
	add	%g2, 1, %g1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, %g4, %i4
	smul	%i4, %g4, %g4
	sub	%g1, %g4, %g1
	cmp	%g3, %g1
	be	.L10
	 sll	%g2, 2, %g2
	ldub	[%i1], %g3
	add	%i5, %g2, %g2
	st	%g3, [%g2+32]
	st	%g1, [%i5+8]
	ld	[%i5+28], %g1
	andcc	%g1, 1, %g0
	be	.L7
	 mov	1, %i0
.L13:
	jmp	%i7+8
	 restore
.L10:
	ld	[%i5+28], %g1
	andcc	%g1, 1, %g0
	bne	.L13
	 mov	0, %i0
.L7:
	call	cortos_lock_release, 0
	 ld	[%i5+20], %o0
	jmp	%i7+8
	 restore
.L9:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	b	.L11
	 ld	[%i5+12], %g4
	.size	cortos_writeMessagesNew, .-cortos_writeMessagesNew
	.align 4
	.global cortos_readMessagesNew
	.type	cortos_readMessagesNew, #function
	.proc	016
cortos_readMessagesNew:
	save	%sp, -96, %sp
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L21
	 mov	%i0, %i5
	ld	[%i5+4], %g1
.L23:
	ld	[%i5+8], %g2
	cmp	%g1, %g2
	be	.L22
	 add	%i5, %g1, %g1
	ldub	[%g1+32], %g1
	stb	%g1, [%i1]
	ld	[%i5+28], %g1
	andcc	%g1, 1, %g0
	be	.L20
	 mov	1, %i0
.L25:
	jmp	%i7+8
	 restore
.L22:
	ld	[%i5+28], %g1
	andcc	%g1, 1, %g0
	bne	.L25
	 mov	0, %i0
.L20:
	call	cortos_lock_release, 0
	 ld	[%i5+20], %o0
	jmp	%i7+8
	 restore
.L21:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	b	.L23
	 ld	[%i5+4], %g1
	.size	cortos_readMessagesNew, .-cortos_readMessagesNew
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.section	".text"
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	save	%sp, -96, %sp
	sethi	%hi(.LC0), %i4
	mov	0, %i5
	or	%i4, %lo(.LC0), %i4
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
	.align 4
	.global nicRegInit
	.type	nicRegInit, #function
	.proc	020
nicRegInit:
	save	%sp, -96, %sp
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	2, %o0
	call	writeNicReg, 0
	 mov	%i1, %o1
	mov	10, %o0
	call	writeNicReg, 0
	 mov	%i2, %o1
	mov	18, %o0
	call	writeNicReg, 0
	 mov	%i0, %o1
	sethi	%hi(I), %i5
	call	cortos_get_clock_time, 0
	 ld	[%i5+%lo(I)], %i3
	sll	%i3, 3, %g1
	sethi	%hi(T), %i4
	add	%i3, 1, %i3
	or	%i4, %lo(T), %i4
	st	%i3, [%i5+%lo(I)]
	std	%o0, [%i4+%g1]
	mov	0, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	call	cortos_get_clock_time, 0
	 ld	[%i5+%lo(I)], %i3
	sll	%i3, 3, %g1
	add	%i3, 1, %i3
	std	%o0, [%i4+%g1]
	st	%i3, [%i5+%lo(I)]
	jmp	%i7+8
	 restore
	.size	nicRegInit, .-nicRegInit
	.align 4
	.global loadEthernetHeader
	.type	loadEthernetHeader, #function
	.proc	020
loadEthernetHeader:
	ld	[%o0+8], %g1
	st	%g1, [%o1]
	ld	[%o0+12], %g1
	st	%g1, [%o1+4]
	ld	[%o0+16], %g1
	st	%g1, [%o1+8]
	ld	[%o0+20], %g1
	jmp	%o7+8
	 st	%g1, [%o1+12]
	.size	loadEthernetHeader, .-loadEthernetHeader
	.align 4
	.global readBufControlData
	.type	readBufControlData, #function
	.proc	020
readBufControlData:
	ld	[%o0+4], %g1
	srl	%g1, 8, %g2
	sth	%g2, [%o1]
	jmp	%o7+8
	 stb	%g1, [%o2]
	.size	readBufControlData, .-readBufControlData
	.section	.rodata.str1.8
	.align 8
.LC1:
	.asciz	"control data = 0x%08x\n"
	.section	".text"
	.align 4
	.global writeBufControlData
	.type	writeBufControlData, #function
	.proc	020
writeBufControlData:
	save	%sp, -96, %sp
	sethi	%hi(.LC1), %o0
	sll	%i1, 8, %i1
	or	%o0, %lo(.LC1), %o0
	or	%i2, %i1, %i2
	call	ee_printf, 0
	 mov	%i2, %o1
	st	%i2, [%i0+4]
	jmp	%i7+8
	 restore
	.size	writeBufControlData, .-writeBufControlData
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"\n*********Started*********\n"
	.align 8
.LC3:
	.asciz	"Buffers[0] = 0x%08x\n"
	.align 8
.LC4:
	.asciz	"No_of_pksts = %d \t No_of_Buffers = %d\n"
	.align 8
.LC5:
	.asciz	"\tT[%d] = %u %u\tdiff = %u %u\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -136, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	sethi	%hi(.LC2), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC2), %o0
	mov	112, %o1
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	112, %o1
	mov	1, %o2
	mov	%o0, %l1
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	112, %o1
	mov	%o0, %i2
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	1, %g1
	st	%g1, [%i2+28]
	add	%sp, -456, %sp
	mov	%o0, %l0
	add	%sp, 92, %i4
	st	%g1, [%o0+28]
	add	%sp, -456, %sp
	mov	0, %i5
	add	%sp, 92, %i3
.L36:
	call	cortos_bget_ncram, 0
	 mov	300, %o0
	st	%o0, [%i4+%i5]
	st	%o0, [%i3+%i5]
	add	%i5, 4, %i5
	cmp	%i5, 448
	bne	.L36
	 sethi	%hi(.LC3), %o0
	ld	[%i4], %l2
	mov	%l2, %o1
	call	ee_printf, 0
	 or	%o0, %lo(.LC3), %o0
	mov	111, %o2
	mov	%i3, %o1
	call	cortos_writeMessages, 0
	 mov	%l1, %o0
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	2, %o0
	call	writeNicReg, 0
	 mov	%i2, %o1
	mov	10, %o0
	call	writeNicReg, 0
	 mov	%l0, %o1
	mov	18, %o0
	call	writeNicReg, 0
	 mov	%l1, %o1
	call	cortos_get_clock_time, 0
	 sethi	%hi(T), %i0
	std	%o0, [%i0+%lo(T)]
	mov	0, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	call	cortos_get_clock_time, 0
	 or	%i0, %lo(T), %i0
	sethi	%hi(INIT), %i5
	std	%o0, [%i0+8]
	ld	[%i5+%lo(INIT)], %g1
.L48:
	cmp	%g1, 0
	be	.L43
	 nop
.L40:
	add	%fp, -40, %o1
	mov	1, %o2
	call	cortos_readMessagesNew, 0
	 mov	%i2, %o0
	cmp	%o0, 0
	be	.L48
	 ld	[%i5+%lo(INIT)], %g1
	mov	%l0, %o0
	add	%fp, -40, %o1
	call	cortos_writeMessagesNew, 0
	 mov	1, %o2
	ld	[%i5+%lo(INIT)], %g1
	add	%g1, -1, %g1
	cmp	%g1, 0
	bne	.L40
	 st	%g1, [%i5+%lo(INIT)]
.L43:
	call	readNicReg, 0
	 mov	21, %o0
	cmp	%o0, 1000
	bne	.L43
	 nop
	call	cortos_get_clock_time, 0
	 sethi	%hi(.LC5), %l3
	mov	112, %o2
	std	%o0, [%i0+16]
	mov	1000, %o1
	sethi	%hi(.LC4), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC4), %o0
	mov	0, %i5
	mov	0, %o4
	mov	0, %o5
	or	%l3, %lo(.LC5), %l3
.L42:
	sll	%i5, 3, %g1
	ld	[%i0+%g1], %i3
	add	%i0, %g1, %g1
	mov	%i5, %o1
	ld	[%g1+4], %i1
	sub	%i3, %o4, %o4
	sub	%i1, %o5, %o5
	mov	%l3, %o0
	mov	%i3, %o2
	call	ee_printf, 0
	 mov	%i1, %o3
	add	%i5, 1, %i5
	mov	%i1, %o5
	cmp	%i5, 3
	bne	.L42
	 mov	%i3, %o4
	mov	0, %o1
	call	writeNicReg, 0
	 mov	0, %o0
	call	cortos_freeQueue, 0
	 mov	%i2, %o0
	call	cortos_freeQueue, 0
	 mov	%l0, %o0
	call	cortos_freeQueue, 0
	 mov	%l1, %o0
	call	cortos_brel, 0
	 mov	%l2, %o0
	call	cortos_brel, 0
	 ld	[%i4+4], %o0
	mov	0, %i0
	call	cortos_brel, 0
	 ld	[%i4+8], %o0
	jmp	%i7+8
	 restore
	.size	main, .-main
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
.L50:
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
	bne	.L50
	 add	%i5, 8, %i5
	jmp	%i7+8
	 restore
	.size	printMemory, .-printMemory
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.global INIT
	.align 4
	.type	INIT, #object
	.size	INIT, 4
INIT:
	.long	1000
	.global I
	.section	".bss"
	.align 4
	.type	I, #object
	.size	I, 4
I:
	.skip	4
	.common	t,88,8
	.common	T,80,8
	.global MEM
	.section	".data"
	.align 4
	.type	MEM, #object
	.size	MEM, 4
MEM:
	.long	334848
	.ident	"GCC: (Buildroot 2014.08-gc0f1a29) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

	.file	"main.c"
	.section	".text"
	.align 4
	.global loadEthernetHeader
	.type	loadEthernetHeader, #function
	.proc	020
loadEthernetHeader:
	sethi	%hi(167779328), %g1
	or	%g1, 782, %g1
	st	%g1, [%o0+24]
	sethi	%hi(359784448), %g1
	or	%g1, 304, %g1
	st	%g1, [%o0+28]
	sethi	%hi(1750335488), %g1
	or	%g1, 8, %g1
	st	%g1, [%o0+32]
	sethi	%hi(1344143360), %g1
	or	%g1, 821, %g1
	jmp	%o7+8
	 st	%g1, [%o0+36]
	.size	loadEthernetHeader, .-loadEthernetHeader
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
.L4:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o1
	mov	%o0, %o2
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L4
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
.LC1:
	.asciz	"NIC_REG[22]=0x%x\n"
	.align 8
.LC2:
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
	sethi	%hi(.LC1), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC1), %o0
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
	sethi	%hi(.LC2), %o0
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	mov	%i5, %o5
	call	ee_printf, 0
	 or	%o0, %lo(.LC2), %o0
	jmp	%i7+8
	 restore
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"Started\n"
	.align 8
.LC4:
	.asciz	"All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[1]=0x%lx,\n\tBuffer[2]=0x%lx,\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n"
	.align 8
.LC5:
	.asciz	"Configuration Done. NIC has started\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -144, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	sethi	%hi(.LC3), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC3), %o0
	mov	8, %o1
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	1, %o2
	mov	%o0, %i2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	%o0, %i5
	mov	1, %o2
	mov	4, %o0
	call	cortos_reserveQueue, 0
	 add	%fp, -32, %i3
	mov	%fp, %i1
	mov	%o0, %i4
.L10:
	call	cortos_bget_ncram, 0
	 mov	180, %o0
	st	%o0, [%i3]
	add	%i3, 4, %i3
	cmp	%i3, %i1
	bne	.L10
	 ld	[%fp-24], %o3
	mov	%i5, %o4
	mov	%i4, %o5
	ld	[%fp-28], %o2
	st	%i2, [%sp+92]
	ld	[%fp-32], %o1
	sethi	%hi(.LC4), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC4), %o0
	mov	%i2, %o0
	add	%fp, -32, %o1
	call	cortos_writeMessages, 0
	 mov	4, %o2
	mov	%i2, %o0
	mov	%i5, %o1
	call	nicRegConfig, 0
	 mov	%i4, %o2
	sethi	%hi(.LC5), %o0
	sethi	%hi(167779328), %i0
	or	%o0, %lo(.LC5), %o0
	sethi	%hi(359784448), %i1
	sethi	%hi(1750335488), %i2
	call	ee_printf, 0
	 sethi	%hi(1344143360), %i3
	or	%i0, 782, %i0
	or	%i1, 304, %i1
	or	%i2, 8, %i2
	or	%i3, 821, %i3
	add	%fp, -36, %o1
.L20:
	mov	%i5, %o0
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L20
	 add	%fp, -36, %o1
	ld	[%fp-36], %g1
	mov	%i4, %o0
	st	%i0, [%g1+24]
	st	%i1, [%g1+28]
	st	%i2, [%g1+32]
	st	%i3, [%g1+36]
	call	cortos_writeMessages, 0
	 mov	1, %o2
	b	.L20
	 add	%fp, -36, %o1
	.size	main, .-main
	.section	.rodata.str1.8
	.align 8
.LC6:
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
	sethi	%hi(.LC6), %i0
	mov	%o0, %i5
	call	ee_printf, 0
	 restore %i0, %lo(.LC6), %o0
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC7:
	.asciz	"i = %u"
	.align 8
.LC8:
	.asciz	"Data at location 0x%x is = 0x%08x%08x\n"
	.section	".text"
	.align 4
	.global printMemory
	.type	printMemory, #function
	.proc	020
printMemory:
	save	%sp, -96, %sp
	sethi	%hi(.LC7), %i2
	mov	0, %o1
	or	%i2, %lo(.LC7), %o0
	sethi	%hi(MEM), %i1
	sethi	%hi(.LC8), %i3
	call	ee_printf, 0
	 mov	0, %i5
	mov	0, %i4
	or	%i1, %lo(MEM), %i1
	or	%i2, %lo(.LC7), %i2
	or	%i3, %lo(.LC8), %i3
.L23:
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
	cmp	%i4, 512
	bne	.L23
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
	.global MEM
	.align 4
	.type	MEM, #object
	.size	MEM, 4
MEM:
	.long	333824
	.ident	"GCC: (Buildroot 2014.08-gc0f1a29) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

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
	.asciz	"Writing DATA\n"
	.align 8
.LC1:
	.asciz	"DATA = %u\n"
	.align 8
.LC2:
	.asciz	"addr = 0x%x\n"
	.align 8
.LC3:
	.asciz	"value = 0x%lx\n"
	.align 8
.LC4:
	.asciz	"T[%d] = %u %u\tdiff = %u %u\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -144, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	3, %o0
	sethi	%hi(.LC0), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	mov	1110, %o1
	call	writeNicReg, 0
	 mov	0, %o0
	call	readNicReg, 0
	 mov	0, %o0
	mov	%o0, %o1
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	call	cortos_bget_ncram, 0
	 mov	1, %o0
	mov	%o0, %i5
	mov	%o0, %o1
	sethi	%hi(.LC2), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC2), %o0
	sethi	%hi(-1412585472), %o1
	sethi	%hi(.LC3), %o0
	or	%o1, 973, %o1
	or	%o0, %lo(.LC3), %o0
	st	%o1, [%i5]
	mov	%fp, %i4
	call	cortos_printf, 0
	 add	%fp, -40, %i5
.L4:
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%i5]
	add	%i5, 4, %i5
	cmp	%i5, %i4
	bne	.L4
	 mov	1, %o2
	mov	10, %o1
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	call	cortos_get_clock_time, 0
	 mov	%o0, %i5
	sethi	%hi(T), %g1
	mov	10, %o2
	or	%g1, %lo(T), %i2
	std	%o0, [%g1+%lo(T)]
	add	%fp, -40, %o1
	call	cortos_writeMessages, 0
	 mov	%i5, %o0
	call	cortos_get_clock_time, 0
	 sethi	%hi(.LC4), %i1
	mov	1, %o2
	std	%o0, [%i2+8]
	add	%fp, -44, %o1
	call	cortos_readMessages, 0
	 mov	%i5, %o0
	call	cortos_get_clock_time, 0
	 mov	0, %i5
	call	cortos_get_clock_time, 0
	 std	%o0, [%i2+16]
	std	%o0, [%i2+24]
	mov	0, %o4
	mov	0, %o5
	or	%i1, %lo(.LC4), %i1
.L5:
	sll	%i5, 3, %g1
	ld	[%i2+%g1], %i4
	add	%i2, %g1, %g1
	mov	%i5, %o1
	ld	[%g1+4], %i3
	sub	%i4, %o4, %o4
	sub	%i3, %o5, %o5
	mov	%i1, %o0
	mov	%i4, %o2
	call	ee_printf, 0
	 mov	%i3, %o3
	add	%i5, 1, %i5
	mov	%i3, %o5
	cmp	%i5, 4
	bne	.L5
	 mov	%i4, %o4
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	main, .-main
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.global I
	.section	".bss"
	.align 4
	.type	I, #object
	.size	I, 4
I:
	.skip	4
	.common	T,80,8
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

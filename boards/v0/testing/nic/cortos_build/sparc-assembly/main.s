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
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -96, %sp
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
	mov	0, %i0
	sethi	%hi(-1412585472), %o1
	sethi	%hi(.LC3), %o0
	or	%o1, 973, %o1
	or	%o0, %lo(.LC3), %o0
	call	cortos_printf, 0
	 st	%o1, [%i5]
	jmp	%i7+8
	 restore
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

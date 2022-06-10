	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Writing DATA...\n"
	.align 8
.LC1:
	.asciz	"Writing DATA = %d at nic addr = 0x%x\n"
	.align 8
.LC2:
	.asciz	"Reading DATA...\n"
	.align 8
.LC3:
	.asciz	"NIC_REG[%d] = %u\t nic addr = 0x%x\n"
	.align 8
.LC4:
	.asciz	"SUCCESS...!\n"
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
	call	ee_printf, 0
	 or	%o0, %lo(.LC0), %o0
	sethi	%hi(NIC_REG), %i3
	sethi	%hi(.LC1), %i2
	ld	[%i3+%lo(NIC_REG)], %o2
	mov	0, %i5
	or	%i3, %lo(NIC_REG), %i3
	or	%i2, %lo(.LC1), %i2
	sll	%i5, 2, %i4
.L7:
	mov	%i5, %o1
	add	%o2, %i4, %o2
	call	ee_printf, 0
	 mov	%i2, %o0
	ld	[%i3], %o2
	st	%i5, [%o2+%i4]
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L7
	 sll	%i5, 2, %i4
	sethi	%hi(.LC2), %o0
	sethi	%hi(.LC3), %i4
	or	%o0, %lo(.LC2), %o0
	call	ee_printf, 0
	 mov	0, %i5
	or	%i4, %lo(.LC3), %i4
	sll	%i5, 2, %g1
.L8:
	ld	[%i3], %o3
	mov	%i5, %o1
	ld	[%o3+%g1], %o2
	mov	%i4, %o0
	call	ee_printf, 0
	 add	%o3, %g1, %o3
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L8
	 sll	%i5, 2, %g1
	mov	0, %i0
	sethi	%hi(.LC4), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC4), %o0
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

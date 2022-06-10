	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Writing DATA\n"
	.align 8
.LC1:
	.asciz	"DATA = %u\n"
	.align 8
.LC2:
	.asciz	"array0=0x%x,array1=0x%x,array2=0x%x,array3=0x%x,array4=0x%x,array5=0x%x,array6=0x%x,array7=0x%x"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -152, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	3, %o0
	sethi	%hi(.LC0), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	mov	1110, %g2
	sethi	%hi(NIC_REG), %g1
	ld	[%g1+%lo(NIC_REG)], %g1
	mov	1110, %o1
	st	%g2, [%g1]
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	add	%fp, -35, %g1
	st	%g1, [%sp+92]
	add	%fp, -34, %g1
	st	%g1, [%sp+96]
	add	%fp, -33, %g1
	sethi	%hi(.LC2), %i5
	add	%fp, -40, %o1
	add	%fp, -39, %o2
	add	%fp, -38, %o3
	add	%fp, -37, %o4
	add	%fp, -36, %o5
	st	%g1, [%sp+100]
	call	cortos_printf, 0
	 or	%i5, %lo(.LC2), %o0
	add	%fp, -12, %g1
	st	%g1, [%sp+92]
	add	%fp, -8, %g1
	st	%g1, [%sp+96]
	add	%fp, -4, %g1
	mov	0, %i0
	or	%i5, %lo(.LC2), %o0
	add	%fp, -32, %o1
	st	%g1, [%sp+100]
	add	%fp, -28, %o2
	add	%fp, -24, %o3
	add	%fp, -20, %o4
	call	cortos_printf, 0
	 add	%fp, -16, %o5
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

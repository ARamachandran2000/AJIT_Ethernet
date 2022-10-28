	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"return = %u\n"
	.align 8
.LC1:
	.asciz	"data[%d] = %u\n"
	.align 8
.LC2:
	.asciz	"queue : queue->totalMsgs=%u,readIndex=%u,writeIndex=%u,length=%u,msgSizeInBytes=%u\n"
	.align 8
.LC3:
	.asciz	"addresses queue=0x%x queue1=0x%x: queue->totalMsgs=0x%x,readIndex=0x%x,writeIndex=0x%x,length=0x%x,msgSizeInBytes=0x%x\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -128, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	1, %o0
	mov	8, %o1
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	%o0, %i5
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	1, %g1
	st	%g1, [%fp-24]
	mov	2, %g1
	st	%g1, [%fp-20]
	mov	3, %g1
	mov	%o0, %i4
	st	%g1, [%fp-16]
	mov	3, %o2
	add	%fp, -24, %o1
	call	cortos_writeMessages, 0
	 mov	%i5, %o0
	mov	%o0, %o1
	sethi	%hi(.LC0), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC0), %o0
	add	%fp, -12, %o1
	mov	%i5, %o0
	call	cortos_readMessages, 0
	 mov	1, %o2
	ld	[%fp-12], %o2
	mov	0, %o1
	sethi	%hi(.LC1), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC1), %o0
	ld	[%i5], %o1
	ld	[%i5+4], %o2
	ld	[%i5+8], %o3
	ld	[%i5+12], %o4
	ld	[%i5+16], %o5
	sethi	%hi(.LC2), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC2), %o0
	add	%i5, 12, %g1
	mov	%i5, %o1
	mov	0, %i0
	add	%i5, 16, %i5
	st	%g1, [%sp+92]
	st	%i5, [%sp+96]
	mov	%i4, %o2
	sethi	%hi(.LC3), %o0
	mov	%o1, %o3
	add	%o1, 4, %o4
	add	%o1, 8, %o5
	call	ee_printf, 0
	 or	%o0, %lo(.LC3), %o0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

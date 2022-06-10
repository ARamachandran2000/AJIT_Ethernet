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
	sethi	%hi(NIC_REG), %i5
	ld	[%i5+%lo(NIC_REG)], %g1
	sethi	%hi(.LC1), %o0
	ld	[%g1+88], %o1
	call	ee_printf, 0
	 or	%o0, %lo(.LC1), %o0
	ld	[%i5+%lo(NIC_REG)], %g1
	mov	1, %g2
	st	%i1, [%g1+8]
	st	%g2, [%g1+4]
	st	%i2, [%g1+40]
	st	%i0, [%g1+72]
	st	%g2, [%g1]
	ld	[%g1+84], %g2
	st	%g2, [%sp+92]
	ld	[%g1+88], %g1
	sethi	%hi(.LC2), %o0
	mov	1, %o1
	st	%g1, [%sp+96]
	mov	%i1, %o2
	mov	%i2, %o3
	mov	%i0, %o4
	mov	1, %o5
	call	ee_printf, 0
	 or	%o0, %lo(.LC2), %o0
	jmp	%i7+8
	 restore
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.section	".text"
	.align 4
	.global readNicReg
	.type	readNicReg, #function
	.proc	020
readNicReg:
	save	%sp, -96, %sp
	sethi	%hi(NIC_REG), %i3
	sethi	%hi(.LC3), %i4
	mov	0, %i5
	or	%i3, %lo(NIC_REG), %i3
	or	%i4, %lo(.LC3), %i4
	sll	%i5, 2, %g1
.L30:
	ld	[%i3], %g2
	mov	%i5, %o1
	mov	%i4, %o0
	call	ee_printf, 0
	 ld	[%g2+%g1], %o2
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L30
	 sll	%i5, 2, %g1
	jmp	%i7+8
	 restore
	.size	readNicReg, .-readNicReg
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"Started\n"
	.align 8
.LC5:
	.asciz	"All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[1]=0x%lx,\n\tBuffer[2]=0x%lx,\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n"
	.align 8
.LC6:
	.asciz	"Initializing the Queues.\tFree_Queue=0x%lx\n"
	.align 8
.LC7:
	.asciz	"Queues Initialized,\n Pushing free buffers.\n"
	.align 8
.LC8:
	.asciz	"Pushed free buffers,\n Configuring NIC registers.\n"
	.align 8
.LC9:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC10:
	.asciz	"In the loop.\n"
	.align 8
.LC11:
	.asciz	"Reading Rx_Queue\n"
	.align 8
.LC12:
	.asciz	"Nothing in Rx queue.\nNIC_REG[21]=0x%x\n"
	.align 8
.LC13:
	.asciz	"Written to Tx queue.\nNIC_REG[21]=0x%x\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -120, %sp
	call	__ajit_write_serial_control_register__, 0
	 mov	3, %o0
	sethi	%hi(.LC4), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC4), %o0
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%fp-12]
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	st	%o0, [%fp-8]
	call	cortos_bget_ncram, 0
	 mov	80, %o0
	sethi	%hi(NIC_REG), %g1
	st	%o0, [%fp-4]
	ld	[%g1+%lo(NIC_REG)], %g4
	mov	1, %g2
	mov	0, %g1
.L32:
	cmp	%g1, 22
	be	.L33
	 sll	%g1, 2, %g3
	cmp	%g2, 64
	be	.L41
	 st	%g1, [%g4+%g3]
.L33:
	add	%g1, 1, %g1
	b	.L32
	 add	%g2, 1, %g2
.L41:
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i4
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%o0, %i5
	call	cortos_bget_ncram, 0
	 mov	48, %o0
	mov	%i4, %o4
	mov	%o0, %i3
	mov	%i5, %o5
	ld	[%fp-12], %i2
	ld	[%fp-8], %i0
	ld	[%fp-4], %i1
	mov	%i0, %o2
	mov	%i1, %o3
	mov	%i2, %o1
	st	%o0, [%sp+92]
	sethi	%hi(.LC5), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC5), %o0
	mov	%i3, %o1
	sethi	%hi(.LC6), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC6), %o0
	mov	8, %g1
	st	%g0, [%i3]
	st	%g1, [%i3+4]
	st	%g0, [%i3+12]
	st	%g0, [%i3+8]
	st	%g1, [%i5+4]
	st	%g0, [%i5]
	st	%g0, [%i5+12]
	st	%g0, [%i5+8]
	st	%g1, [%i4+4]
	st	%g0, [%i4]
	st	%g0, [%i4+12]
	st	%g0, [%i4+8]
	sethi	%hi(.LC7), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC7), %o0
	mov	%i2, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i3, %o0
	mov	%i0, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i3, %o0
	mov	%i1, %o1
	call	pushIntoBufferQueue, 0
	 mov	%i3, %o0
	sethi	%hi(.LC8), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC8), %o0
	call	readNicReg, 0
	 sethi	%hi(.LC11), %l0
	mov	%i3, %o0
	mov	%i4, %o1
	call	nicRegConfig, 0
	 mov	%i5, %o2
	call	readNicReg, 0
	 sethi	%hi(.LC10), %i3
	sethi	%hi(.LC9), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	52, %g1
	st	%g1, [%i2]
	sethi	%hi(NIC_REG), %i2
	sethi	%hi(.LC12), %i0
	sethi	%hi(.LC13), %i1
	st	%g0, [%fp-16]
	or	%i2, %lo(NIC_REG), %i2
	or	%i3, %lo(.LC10), %i3
	or	%l0, %lo(.LC11), %l0
	or	%i0, %lo(.LC12), %i0
	or	%i1, %lo(.LC13), %i1
.L40:
	call	ee_printf, 0
	 mov	%i3, %o0
	call	readNicReg, 0
	 nop
	mov	%i4, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -16, %o1
	cmp	%o0, 0
	bne	.L42
	 mov	%i5, %o0
.L35:
	call	pushIntoBufferQueue, 0
	 ld	[%fp-16], %o1
	ld	[%i2], %g1
	mov	%i1, %o0
	call	ee_printf, 0
	 ld	[%g1+84], %o1
	call	ee_printf, 0
	 mov	%i3, %o0
	call	readNicReg, 0
	 nop
	mov	%i4, %o0
	call	popFromBufferQueue, 0
	 add	%fp, -16, %o1
	cmp	%o0, 0
	be	.L35
	 mov	%i5, %o0
.L42:
	call	ee_printf, 0
	 mov	%l0, %o0
	ld	[%i2], %g1
	mov	%i0, %o0
	call	ee_printf, 0
	 ld	[%g1+84], %o1
	b,a	.L40
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

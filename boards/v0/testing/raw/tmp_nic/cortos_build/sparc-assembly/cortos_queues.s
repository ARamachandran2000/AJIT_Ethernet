	.file	"cortos_queues.c"
	.section	".text"
	.align 4
	.global cortos_reserveQueue
	.type	cortos_reserveQueue, #function
	.proc	0110
cortos_reserveQueue:
	save	%sp, -96, %sp
	smul	%i1, %i0, %o0
	cmp	%i2, 0
	be	.L2
	 add	%o0, 24, %o0
	call	cortos_bget_ncram, 0
	 nop
	mov	%o0, %i5
.L3:
	cmp	%i5, 0
	be	.L5
	 mov	1, %o0
	st	%i0, [%i5+16]
	st	%g0, [%i5]
	st	%g0, [%i5+4]
	st	%g0, [%i5+8]
	st	%i1, [%i5+12]
	call	cortos_reserveLock, 0
	 mov	%i5, %i0
	st	%o0, [%i5+20]
	jmp	%i7+8
	 restore
.L2:
	call	cortos_bget, 0
	 nop
	b	.L3
	 mov	%o0, %i5
.L5:
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	cortos_reserveQueue, .-cortos_reserveQueue
	.align 4
	.global cortos_freeQueue
	.type	cortos_freeQueue, #function
	.proc	020
cortos_freeQueue:
	save	%sp, -96, %sp
	call	cortos_freeLock, 0
	 ld	[%i0+20], %o0
	call	cortos_IsNcRamAddr, 0
	 mov	%i0, %o0
	andcc	%o0, 0xff, %g0
	bne	.L9
	 nop
	call	cortos_brel, 0
	 restore
.L9:
	call	cortos_brel_ncram, 0
	 restore
	.size	cortos_freeQueue, .-cortos_freeQueue
	.align 4
	.global cortos_writeMessages
	.type	cortos_writeMessages, #function
	.proc	016
cortos_writeMessages:
	save	%sp, -96, %sp
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	ld	[%i0+12], %o7
	ld	[%i0], %i5
	ld	[%i0+8], %i4
	ld	[%i0+16], %g3
	cmp	%i2, 0
	be	.L11
	 add	%i0, 24, %o5
	cmp	%i5, %o7
	bgeu	.L16
	 mov	%i2, %i3
.L15:
	smul	%i4, %g3, %g4
	mov	0, %g1
	cmp	%g3, 0
	be	.L14
	 add	%o5, %g4, %g4
	ldub	[%i1+%g1], %g2
.L24:
	stb	%g2, [%g4+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L24
	 ldub	[%i1+%g1], %g2
.L14:
	add	%i4, 1, %i4
	add	%i5, 1, %i5
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i4, %o7, %g1
	addcc	%i3, -1, %i3
	smul	%g1, %o7, %g1
	be	.L11
	 sub	%i4, %g1, %i4
	ld	[%i0+12], %g1
	cmp	%g1, %i5
	bgu	.L15
	 add	%i1, %g3, %i1
	sub	%i2, %i3, %i2
.L11:
	st	%i5, [%i0]
	st	%i4, [%i0+8]
	ld	[%i0+20], %o0
	call	cortos_lock_release, 0
	 mov	%i2, %i0
	jmp	%i7+8
	 restore
.L16:
	b	.L11
	 mov	0, %i2
	.size	cortos_writeMessages, .-cortos_writeMessages
	.align 4
	.global cortos_readMessages
	.type	cortos_readMessages, #function
	.proc	016
cortos_readMessages:
	save	%sp, -96, %sp
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	ld	[%i0+12], %o7
	ld	[%i0], %i5
	ld	[%i0+4], %i4
	ld	[%i0+16], %g3
	cmp	%i2, 0
	be	.L32
	 add	%i0, 24, %o5
	cmp	%i5, 0
	be,a	.L46
	 st	%i5, [%i0]
	mov	%i2, %i3
	smul	%i4, %g3, %g4
.L48:
	mov	0, %g1
	cmp	%g3, 0
	be	.L31
	 add	%o5, %g4, %g4
	ldub	[%g4+%g1], %g2
.L47:
	stb	%g2, [%i1+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L47
	 ldub	[%g4+%g1], %g2
.L31:
	add	%i4, 1, %i4
	add	%i3, -1, %i3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i4, %o7, %g1
	add	%i1, %g3, %i1
	smul	%g1, %o7, %g1
	addcc	%i5, -1, %i5
	be	.L30
	 sub	%i4, %g1, %i4
	cmp	%i3, 0
	bne	.L48
	 smul	%i4, %g3, %g4
.L30:
	st	%i5, [%i0]
	st	%i4, [%i0+4]
	ld	[%i0+20], %o0
	call	cortos_lock_release, 0
	 sub	%i2, %i3, %i3
	jmp	%i7+8
	 restore %g0, %i3, %o0
.L32:
	st	%i5, [%i0]
.L46:
	st	%i4, [%i0+4]
	ld	[%i0+20], %o0
	call	cortos_lock_release, 0
	 mov	0, %i3
	jmp	%i7+8
	 restore %g0, %i3, %o0
	.size	cortos_readMessages, .-cortos_readMessages
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

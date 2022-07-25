	.file	"cortos_util_ee_printf.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"0123456789abcdefghijklmnopqrstuvwxyz"
	.align 8
.LC1:
	.asciz	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.section	".text"
	.align 4
	.type	number, #function
	.proc	0102
number:
	save	%sp, -168, %sp
	andcc	%i5, 64, %g0
	be	.L26
	 sethi	%hi(.LC0), %o7
	sethi	%hi(.LC1), %o7
	or	%o7, %lo(.LC1), %o7
.L2:
	andcc	%i5, 16, %g0
	bne,a	.L3
	 and	%i5, -2, %i5
.L3:
	add	%i2, -2, %g1
	cmp	%g1, 34
	bgu	.L27
	 and	%i5, 1, %g1
	subcc	%g0, %g1, %g0
	mov	0, %o4
	addx	%g0, -1, %o5
	andcc	%i5, 2, %g0
	and	%o5, 240, %o5
	be	.L6
	 add	%o5, 48, %o5
	cmp	%i1, 0
	bl	.L55
	 andcc	%i5, 4, %g0
	bne,a	.L56
	 add	%i3, -1, %i3
	andcc	%i5, 8, %g0
	be	.L64
	 andcc	%i5, 32, %o3
	add	%i3, -1, %i3
	mov	32, %o4
.L6:
	andcc	%i5, 32, %o3
.L64:
	be	.L65
	 cmp	%i1, 0
	cmp	%i2, 16
.L62:
	be	.L57
	 xor	%i2, 8, %g1
	subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
.L9:
	cmp	%i1, 0
.L65:
	bne	.L66
	 mov	0, %g1
	mov	48, %g1
.L63:
	add	%fp, -72, %g4
	stb	%g1, [%fp-72]
	mov	1, %g1
.L12:
	cmp	%g1, %i4
	bge	.L13
	 mov	%g1, %g3
	mov	%i4, %g3
.L13:
	andcc	%i5, 17, %g0
	bne	.L14
	 sub	%i3, %g3, %i4
	cmp	%i4, 0
	ble	.L32
	 add	%i4, -1, %g2
	add	%i0, %i4, %i4
	mov	32, %g2
	stb	%g2, [%i0]
.L67:
	add	%i0, 1, %i0
	cmp	%i0, %i4
	bne,a	.L67
	 stb	%g2, [%i0]
	mov	-1, %i4
.L14:
	andcc	%o4, 0xff, %g0
	be	.L68
	 cmp	%o3, 0
	stb	%o4, [%i0]
	add	%i0, 1, %i0
.L68:
	be	.L69
	 andcc	%i5, 16, %g0
	cmp	%i2, 8
	be	.L58
	 cmp	%i2, 16
	be,a	.L59
	 mov	48, %g2
.L17:
	andcc	%i5, 16, %g0
.L69:
	bne	.L70
	 cmp	%g3, %g1
	cmp	%i4, 0
	ble	.L33
	 add	%i4, -1, %g2
	add	%i0, %i4, %i4
	stb	%o5, [%i0]
.L71:
	add	%i0, 1, %i0
	cmp	%i0, %i4
	bne,a	.L71
	 stb	%o5, [%i0]
	mov	-1, %i4
.L19:
	cmp	%g3, %g1
.L70:
	ble	.L21
	 sub	%g3, %g1, %g1
	mov	48, %g3
	add	%i0, %g1, %g1
	stb	%g3, [%i0]
.L72:
	add	%i0, 1, %i0
	cmp	%i0, %g1
	bne,a	.L72
	 stb	%g3, [%i0]
.L21:
	mov	%i1, %g1
	mov	%i0, %g2
.L23:
	ldub	[%g4+%g1], %g3
	stb	%g3, [%g2]
	add	%g1, -1, %g1
	add	%g1, 1, %g3
	cmp	%g3, 0
	bg	.L23
	 add	%g2, 1, %g2
	xnor	%g0, %i1, %g1
	cmp	%i4, 0
	sra	%g1, 31, %g1
	and	%i1, %g1, %g1
	add	%g1, 1, %g1
	ble	.L75
	 add	%i0, %g1, %i0
	add	%i0, %i4, %g2
	mov	32, %g1
	stb	%g1, [%i0]
.L73:
	add	%i0, 1, %i0
	cmp	%i0, %g2
	bne,a	.L73
	 stb	%g1, [%i0]
.L75:
	jmp	%i7+8
	 restore
.L26:
	b	.L2
	 or	%o7, %lo(.LC0), %o7
.L31:
	mov	0, %g1
.L66:
	add	%fp, -72, %g4
.L11:
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i1, %i2, %g2
	smul	%g2, %i2, %g3
	sub	%i1, %g3, %i1
	ldub	[%o7+%i1], %g3
	stb	%g3, [%g4+%g1]
	mov	%g2, %i1
	cmp	%g2, 0
	bne	.L11
	 add	%g1, 1, %g1
	b	.L12
	 add	%g1, -1, %i1
.L27:
	mov	0, %i0
	jmp	%i7+8
	 restore
.L56:
	andcc	%i5, 32, %o3
	be	.L9
	 mov	43, %o4
	b	.L62
	 cmp	%i2, 16
.L58:
	mov	48, %g2
	stb	%g2, [%i0]
	b	.L17
	 add	%i0, 1, %i0
.L57:
	cmp	%i1, 0
	bne	.L31
	 add	%i3, -2, %i3
	b	.L63
	 mov	48, %g1
.L55:
	sub	%g0, %i1, %i1
	add	%i3, -1, %i3
	andcc	%i5, 32, %o3
	be	.L9
	 mov	45, %o4
	b	.L62
	 cmp	%i2, 16
.L59:
	stb	%g2, [%i0]
	mov	120, %g2
	stb	%g2, [%i0+1]
	b	.L17
	 add	%i0, 2, %i0
.L32:
	b	.L14
	 mov	%g2, %i4
.L33:
	b	.L19
	 mov	%g2, %i4
	.size	number, .-number
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"<NULL>"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	0
	.section	".text"
	.align 4
	.global ee_vsprintf
	.type	ee_vsprintf, #function
	.proc	04
ee_vsprintf:
	save	%sp, -296, %sp
	ldub	[%i1], %g2
	sll	%g2, 24, %g1
	cmp	%g1, 0
	be	.L202
	 mov	%i0, %i5
	sethi	%hi(.L86), %l4
	sethi	%hi(.L110), %i3
	sethi	%hi(.LC3), %l1
	add	%fp, -80, %l3
	add	%fp, 96, %l5
	sethi	%hi(.LC0), %l0
	b	.L199
	 sethi	%hi(.LC1), %l2
.L294:
	add	%i5, 1, %i5
	ldub	[%i1+1], %g2
.L79:
	sll	%g2, 24, %g1
	cmp	%g1, 0
	be	.L195
	 add	%i1, 1, %i1
.L199:
	sra	%g1, 24, %g1
	cmp	%g1, 37
	bne,a	.L294
	 stb	%g2, [%i5]
	mov	0, %o5
.L78:
	ldub	[%i1+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 16
	bleu	.L295
	 add	%i1, 1, %g2
.L80:
	add	%g1, -48, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 9
	bgu	.L88
	 sll	%g1, 24, %g3
	mov	0, %i4
.L89:
	add	%i4, %i4, %g3
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	sll	%i4, 3, %i4
	add	%g2, 1, %g2
	add	%g3, %i4, %i4
	add	%i4, %g1, %i4
	ldub	[%g2], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 9
	bleu	.L89
	 add	%i4, -48, %i4
.L286:
	sll	%g1, 24, %g3
	mov	%g2, %i1
	sra	%g3, 24, %g3
	cmp	%g3, 46
	be	.L296
	 mov	-1, %l6
.L92:
	and	%g1, -33, %g2
	sll	%g2, 24, %g2
	sra	%g2, 24, %g2
	cmp	%g2, 76
	bne	.L97
	 mov	-1, %g3
	sll	%g1, 24, %g3
	ldub	[%i1+1], %g1
	sra	%g3, 24, %g3
	add	%i1, 1, %i1
.L97:
	add	%g1, -65, %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 55
	bleu	.L297
	 or	%i3, %lo(.L110), %g4
.L98:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 37
	be	.L194
	 mov	37, %g1
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	ldsb	[%i1], %g2
	cmp	%g2, 0
	be	.L195
	 ldub	[%i1], %g1
.L194:
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	ldub	[%i1+1], %g2
	sll	%g2, 24, %g1
	cmp	%g1, 0
	bne	.L199
	 add	%i1, 1, %i1
.L195:
	sub	%i5, %i0, %i0
.L77:
	stb	%g0, [%i5]
	jmp	%i7+8
	 restore
.L295:
	or	%l4, %lo(.L86), %g4
	sll	%g3, 2, %g3
	ld	[%g4+%g3], %g3
	jmp	%g3
	 nop
	.section	".rodata"
	.section	".text"
.L85:
	or	%o5, 1, %o5
	b	.L78
	 mov	%g2, %i1
.L84:
	or	%o5, 16, %o5
	b	.L78
	 mov	%g2, %i1
.L83:
	or	%o5, 4, %o5
	b	.L78
	 mov	%g2, %i1
.L82:
	or	%o5, 32, %o5
	b	.L78
	 mov	%g2, %i1
.L81:
	or	%o5, 8, %o5
	b	.L78
	 mov	%g2, %i1
.L297:
	sll	%g2, 2, %g2
	ld	[%g4+%g2], %g2
	jmp	%g2
	 nop
	.section	".rodata"
	.section	".text"
.L88:
	sra	%g3, 24, %g4
	cmp	%g4, 42
	be	.L298
	 sra	%g3, 24, %g3
	mov	%g2, %i1
	mov	-1, %i4
	cmp	%g3, 46
	bne	.L92
	 mov	-1, %l6
.L296:
	ldub	[%i1+1], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 9
	bgu	.L93
	 add	%i1, 1, %g2
	mov	0, %l6
.L94:
	add	%l6, %l6, %g3
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	sll	%l6, 3, %l6
	add	%g2, 1, %g2
	add	%g3, %l6, %l6
	add	%l6, %g1, %l6
	ldub	[%g2], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 9
	bleu	.L94
	 add	%l6, -48, %l6
.L95:
	b	.L92
	 mov	%g2, %i1
.L93:
	sll	%g1, 24, %g3
	sra	%g3, 24, %g3
	cmp	%g3, 42
	be	.L299
	 mov	0, %l6
	b	.L92
	 mov	%g2, %i1
.L99:
	or	%o5, 64, %o5
.L101:
	cmp	%g3, 108
	be	.L300
	 mov	0, %g2
	ld	[%i2], %o7
	add	%i2, 4, %i2
	ldub	[%o7+%g2], %g1
	mov	0, %g3
	mov	48, %o2
	cmp	%g1, 0
	bne	.L137
	 mov	46, %o3
.L302:
	add	%fp, %g3, %g1
	stb	%o2, [%g1-80]
	add	%g2, 1, %g2
	cmp	%g2, 4
	be	.L301
	 add	%g3, 1, %g3
.L141:
	add	%fp, %g3, %g1
	stb	%o3, [%g1-80]
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
	be	.L302
	 add	%g3, 1, %g3
.L137:
	cmp	%g1, 99
	ble	.L139
	 cmp	%g1, 9
	sra	%g1, 31, %g4
	wr	%g4, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 100, %o4
	or	%l0, %lo(.LC0), %g4
	smul	%o4, 100, %o0
	ldub	[%g4+%o4], %o4
	add	%fp, %g3, %o1
	sub	%g1, %o0, %g1
	stb	%o4, [%o1-80]
	add	%g3, 2, %g3
	sra	%g1, 31, %o0
	wr	%o0, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %o4
	ldub	[%g4+%o4], %l6
	add	%o4, %o4, %o0
	stb	%l6, [%o1-79]
	sll	%o4, 3, %o4
	add	%o0, %o4, %o4
	sub	%g1, %o4, %g1
.L140:
	add	%fp, %g3, %o4
	ldub	[%g4+%g1], %g1
	stb	%g1, [%o4-80]
	add	%g2, 1, %g2
	cmp	%g2, 4
	bne	.L141
	 add	%g3, 1, %g3
.L301:
	andcc	%o5, 16, %g0
	bne,a	.L144
	 mov	0, %g1
	cmp	%i4, %g3
	ble	.L216
	 add	%i4, -1, %g1
	sub	%i4, %g3, %g1
	mov	32, %g2
	add	%i5, %g1, %g1
	stb	%g2, [%i5]
.L317:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L317
	 stb	%g2, [%i5]
	add	%g3, -1, %i4
.L142:
	mov	0, %g1
.L144:
	ldub	[%l3+%g1], %g2
.L318:
	stb	%g2, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L318
	 ldub	[%l3+%g1], %g2
	cmp	%i4, %g1
	ble	.L293
	 add	%i5, %g1, %i5
	sub	%i4, %g1, %g1
	mov	32, %g2
	add	%i5, %g1, %g1
	stb	%g2, [%i5]
.L319:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L319
	 stb	%g2, [%i5]
.L293:
	b	.L79
	 ldub	[%i1+1], %g2
.L100:
	or	%o5, 64, %o5
	mov	16, %o2
.L109:
	ld	[%i2], %o1
	mov	%i5, %o0
	mov	%i4, %o3
	call	number, 0
	 mov	%l6, %o4
	add	%i2, 4, %i2
	mov	%o0, %i5
	b	.L79
	 ldub	[%i1+1], %g2
.L107:
	ld	[%i2], %g4
	cmp	%g4, 0
	be	.L303
	 add	%i2, 4, %i2
.L116:
	ldsb	[%g4], %g1
	cmp	%g1, 0
	be	.L212
	 cmp	%l6, 0
	be	.L212
	 mov	%g4, %g1
	b	.L344
	 add	%g1, 1, %g1
.L118:
	be	.L117
	 sub	%g1, %g4, %g3
	add	%g1, 1, %g1
.L344:
	ldsb	[%g1], %g2
	cmp	%g2, 0
	bne,a	.L118
	 addcc	%l6, -1, %l6
	sub	%g1, %g4, %g3
.L117:
	andcc	%o5, 16, %g0
	bne	.L320
	 cmp	%g3, 0
	cmp	%i4, %g3
	ble	.L213
	 add	%i4, -1, %g1
	sub	%i4, %g3, %g1
	mov	32, %g2
	add	%i5, %g1, %g1
	stb	%g2, [%i5]
.L321:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L321
	 stb	%g2, [%i5]
	add	%g3, -1, %i4
.L120:
	cmp	%g3, 0
.L320:
	ble	.L122
	 mov	0, %g1
	ldub	[%g4+%g1], %g2
.L322:
	stb	%g2, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L322
	 ldub	[%g4+%g1], %g2
	add	%i5, %g3, %i5
.L122:
	sub	%i4, %g3, %g1
	mov	32, %g2
	cmp	%i4, %g3
	ble	.L293
	 add	%i5, %g1, %g1
	stb	%g2, [%i5]
.L323:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L323
	 stb	%g2, [%i5]
	b	.L79
	 ldub	[%i1+1], %g2
.L106:
	cmp	%i4, -1
	be,a	.L304
	 or	%o5, 1, %o5
.L126:
	ld	[%i2], %o1
	mov	%i5, %o0
	mov	16, %o2
	mov	%i4, %o3
	call	number, 0
	 mov	%l6, %o4
	add	%i2, 4, %i2
	mov	%o0, %i5
	b	.L79
	 ldub	[%i1+1], %g2
.L105:
	b	.L109
	 mov	8, %o2
.L104:
	mov	%i2, %o1
	st	%o5, [%fp-188]
	add	%fp, -168, %o0
	call	memcpy, 0
	 mov	8, %o2
	ld	[%fp-188], %o5
	add	%i2, 8, %i2
	ldd	[%fp-168], %f8
	andcc	%o5, 16, %g0
	bne	.L305
	 or	%o5, 2, %g1
	and	%g1, 1, %g2
	ldd	[%l1+%lo(.LC3)], %f10
	subcc	%g0, %g2, %g0
	fcmped	%f8, %f10
	addx	%g0, -1, %l7
	and	%l7, 240, %l7
	nop
	fbl	.L306
	 add	%l7, 48, %l7
.L282:
	andcc	%g1, 4, %g0
	bne,a	.L307
	 add	%i4, -1, %i4
	andcc	%g1, 8, %g0
	be	.L152
	 mov	0, %g4
	add	%i4, -1, %i4
	b	.L152
	 mov	32, %g4
.L208:
	b	.L109
	 mov	16, %o2
.L108:
	b	.L109
	 mov	10, %o2
.L103:
	or	%o5, 2, %o5
	b	.L109
	 mov	10, %o2
.L102:
	andcc	%o5, 16, %g0
	bne,a	.L324
	 ld	[%i2], %g1
	add	%i4, -1, %i4
	cmp	%i4, 0
	ble	.L111
	 mov	32, %g1
	add	%i5, %i4, %g2
	stb	%g1, [%i5]
.L325:
	add	%i5, 1, %i5
	cmp	%i5, %g2
	bne,a	.L325
	 stb	%g1, [%i5]
	ld	[%i2], %g1
	add	%i2, 4, %i2
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	b	.L79
	 ldub	[%i1+1], %g2
.L298:
	ld	[%i2], %i4
	add	%i1, 2, %g2
	add	%i2, 4, %i2
	cmp	%i4, 0
	bge	.L286
	 ldub	[%i1+2], %g1
	sub	%g0, %i4, %i4
	b	.L286
	 or	%o5, 16, %o5
.L139:
	ble,a	.L140
	 or	%l0, %lo(.LC0), %g4
	sra	%g1, 31, %g4
	wr	%g4, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %o4
	add	%fp, %g3, %o0
	add	%o4, %o4, %o1
	or	%l0, %lo(.LC0), %g4
	add	%g3, 1, %g3
	ldub	[%g4+%o4], %l6
	sll	%o4, 3, %o4
	stb	%l6, [%o0-80]
	add	%o1, %o4, %o4
	b	.L140
	 sub	%g1, %o4, %g1
.L111:
	ld	[%i2], %g1
.L324:
	stb	%g1, [%i5]
	add	%i5, 1, %g3
	add	%i2, 4, %i2
	add	%i5, %i4, %i5
	mov	%g3, %g1
	cmp	%i4, 1
	ble	.L309
	 mov	32, %g2
	stb	%g2, [%g1]
.L326:
	add	%g1, 1, %g1
	cmp	%g1, %i5
	bne,a	.L326
	 stb	%g2, [%g1]
	add	%i4, -1, %i5
	ldub	[%i1+1], %g2
	b	.L79
	 add	%g3, %i5, %i5
.L305:
	and	%o5, -2, %g1
	ldd	[%l1+%lo(.LC3)], %f10
	or	%g1, 2, %g1
	fcmped	%f8, %f10
	and	%g1, 1, %g2
	subcc	%g0, %g2, %g0
	addx	%g0, -1, %l7
	and	%l7, 240, %l7
	nop
	fbuge	.L282
	 add	%l7, 48, %l7
	b	.L316
	 fnegs	%f8, %f8
.L304:
	b	.L126
	 mov	8, %i4
.L300:
	ld	[%i2], %o2
	andcc	%o5, 64, %g0
	be	.L214
	 add	%i2, 4, %i2
	or	%l2, %lo(.LC1), %o7
.L128:
	mov	0, %g1
	ldub	[%o2+%g1], %g4
	and	%g4, 0xff, %o3
	and	%g4, 15, %g4
	mov	0, %g2
	ldub	[%o7+%g4], %o4
	add	%fp, %g2, %g3
	srl	%o3, 4, %o3
	stb	%o4, [%g3-79]
	ldub	[%o7+%o3], %g4
	stb	%g4, [%g3-80]
	add	%g1, 1, %g1
	mov	58, %o1
	cmp	%g1, 6
	be	.L310
	 add	%g2, 2, %g3
.L130:
	add	%fp, %g3, %g3
	stb	%o1, [%g3-80]
	ldub	[%o2+%g1], %g4
	and	%g4, 0xff, %o3
	and	%g4, 15, %g4
	add	%g2, 3, %g2
	ldub	[%o7+%g4], %o4
	add	%fp, %g2, %g3
	srl	%o3, 4, %o3
	stb	%o4, [%g3-79]
	ldub	[%o7+%o3], %g4
	stb	%g4, [%g3-80]
	add	%g1, 1, %g1
	cmp	%g1, 6
	bne	.L130
	 add	%g2, 2, %g3
.L310:
	andcc	%o5, 16, %g0
	bne,a	.L133
	 mov	0, %g1
	cmp	%i4, %g3
	ble	.L215
	 add	%i4, -1, %g1
	sub	%i4, %g3, %g1
	mov	32, %g2
	add	%i5, %g1, %g1
	stb	%g2, [%i5]
.L327:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L327
	 stb	%g2, [%i5]
	add	%g3, -1, %i4
.L131:
	mov	0, %g1
.L133:
	ldub	[%l3+%g1], %g2
.L328:
	stb	%g2, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L328
	 ldub	[%l3+%g1], %g2
	cmp	%i4, %g1
	ble	.L293
	 add	%i5, %g1, %i5
	sub	%i4, %g1, %g1
	mov	32, %g2
	add	%i5, %g1, %g1
	stb	%g2, [%i5]
.L329:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L329
	 stb	%g2, [%i5]
	b	.L79
	 ldub	[%i1+1], %g2
.L299:
	ld	[%i2], %l6
	add	%i1, 2, %g2
	add	%i2, 4, %i2
	cmp	%l6, 0
	bge	.L95
	 ldub	[%i1+2], %g1
	mov	0, %l6
	b	.L92
	 mov	%g2, %i1
.L202:
	b	.L77
	 mov	0, %i0
.L214:
	b	.L128
	 or	%l0, %lo(.LC0), %o7
.L306:
	fnegs	%f8, %f8
.L316:
	add	%i4, -1, %i4
	mov	45, %g4
.L152:
	cmp	%l6, -1
	be,a	.L154
	 mov	6, %l6
.L154:
	std	%f8, [%fp-200]
	st	%g1, [%fp-180]
	st	%g4, [%fp-184]
	ldd	[%fp-200], %o0
	mov	%l6, %o2
	add	%fp, -176, %o3
	add	%fp, -172, %o4
	call	fcvtbuf, 0
	 mov	%l3, %o5
	ld	[%fp-172], %g3
	add	%fp, -160, %g2
	cmp	%g3, 0
	ld	[%fp-180], %g1
	be	.L155
	 ld	[%fp-184], %g4
	mov	45, %g3
	add	%fp, -159, %g2
	stb	%g3, [%fp-160]
.L155:
	ldsb	[%o0], %g3
	cmp	%g3, 0
	be	.L156
	 ldub	[%o0], %o7
	ld	[%fp-176], %o4
	mov	%o0, %g3
	cmp	%o4, 0
	bg	.L246
	 mov	46, %o3
	b	.L315
	 mov	48, %g3
.L162:
	stb	%o7, [%g2]
.L330:
	add	%g3, 1, %g3
	add	%g2, 1, %g2
	ldsb	[%g3], %o5
	cmp	%o5, 0
	be	.L161
	 ldub	[%g3], %o7
.L246:
	sub	%g3, %o0, %o5
	cmp	%o4, %o5
	bne,a	.L330
	 stb	%o7, [%g2]
	stb	%o3, [%g2]
	b	.L162
	 add	%g2, 1, %g2
.L307:
	b	.L152
	 mov	43, %g4
.L315:
	stb	%g3, [%g2]
	mov	46, %g3
	stb	%g3, [%g2+1]
	subcc	%g0, %o4, %o5
	be	.L245
	 add	%g2, 2, %g2
	add	%g2, %o5, %o5
	mov	48, %g3
	stb	%g3, [%g2]
.L331:
	add	%g2, 1, %g2
	cmp	%g2, %o5
	bne,a	.L331
	 stb	%g3, [%g2]
.L245:
	stb	%o7, [%g2]
	add	%o0, 1, %o0
	add	%g2, 1, %g2
	ldsb	[%o0], %g3
	cmp	%g3, 0
	bne	.L245
	 ldub	[%o0], %o7
.L161:
	andcc	%g1, 32, %g0
	be	.L291
	 stb	%g0, [%g2]
	cmp	%l6, 0
	be	.L332
	 ldsb	[%fp-160], %g3
.L291:
	ldub	[%fp-160], %g2
	sll	%g2, 24, %g3
	cmp	%g3, 0
	be,a	.L333
	 mov	0, %o7
	add	%fp, -160, %g3
.L201:
.L339:
	b	.L183
	 mov	%g3, %o7
.L182:
	be,a	.L333
	 sub	%l5, %g3, %o7
.L183:
	add	%o7, 1, %o7
	ldsb	[%o7], %o5
	cmp	%o5, 0
	bne	.L182
	 cmp	%o7, %l5
	sub	%o7, %g3, %o7
.L181:
.L333:
	andcc	%g1, 17, %g0
	bne	.L184
	 sub	%i4, %o7, %i4
	cmp	%i4, 0
	ble	.L224
	 add	%i4, -1, %g3
	add	%i5, %i4, %i4
	mov	32, %g3
	stb	%g3, [%i5]
.L334:
	add	%i5, 1, %i5
	cmp	%i5, %i4
	bne,a	.L334
	 stb	%g3, [%i5]
	mov	-1, %i4
.L184:
	andcc	%g4, 0xff, %g0
	be	.L335
	 andcc	%g1, 16, %g0
	stb	%g4, [%i5]
	add	%i5, 1, %i5
.L335:
	bne	.L336
	 cmp	%o7, 0
	cmp	%i4, 0
	ble	.L225
	 add	%i4, -1, %g1
	add	%i5, %i4, %i4
	stb	%l7, [%i5]
.L337:
	add	%i5, 1, %i5
	cmp	%i5, %i4
	bne,a	.L337
	 stb	%l7, [%i5]
	mov	-1, %i4
.L187:
	cmp	%o7, 0
.L336:
	ble	.L189
	 mov	0, %g1
	b	.L345
	 stb	%g2, [%i5+%g1]
.L314:
	ldub	[%g3+%g1], %g2
	stb	%g2, [%i5+%g1]
.L345:
	add	%g1, 1, %g1
	cmp	%g1, %o7
	bne	.L314
	 add	%fp, -160, %g3
	add	%i5, %g1, %i5
.L189:
	cmp	%i4, 0
	ble	.L293
	 mov	32, %g1
	add	%i5, %i4, %g2
	stb	%g1, [%i5]
.L338:
	add	%i5, 1, %i5
	cmp	%i5, %g2
	bne,a	.L338
	 stb	%g1, [%i5]
	b	.L79
	 ldub	[%i1+1], %g2
.L164:
	andcc	%g1, 32, %g0
	be	.L291
	 stb	%g0, [%g2+1]
	ldsb	[%fp-160], %g3
.L332:
	cmp	%g3, 0
	be	.L221
	 ldub	[%fp-160], %g2
	cmp	%g3, 46
	be	.L339
	 add	%fp, -160, %g3
	and	%g2, -33, %g3
	sll	%g3, 24, %g3
	sra	%g3, 24, %g3
	cmp	%g3, 69
	be	.L222
	 add	%fp, -160, %g3
	b	.L173
	 mov	%g3, %o7
.L174:
	cmp	%o5, 46
	be	.L201
	 and	%o4, -33, %o5
	sll	%o5, 24, %o5
	sra	%o5, 24, %o5
	cmp	%o5, 69
	be	.L340
	 add	%o7, 256, %o5
.L173:
	add	%o7, 1, %o7
	ldsb	[%o7], %o5
	cmp	%o5, 0
	bne	.L174
	 ldub	[%o7], %o4
	stb	%g0, [%o7+1]
.L290:
	mov	46, %g2
.L343:
	b	.L291
	 stb	%g2, [%o7]
.L303:
	sethi	%hi(.LC2), %g4
	b	.L116
	 or	%g4, %lo(.LC2), %g4
.L212:
	b	.L117
	 mov	0, %g3
.L156:
	mov	48, %g3
	cmp	%l6, 0
	be	.L164
	 stb	%g3, [%g2]
	mov	46, %o7
	add	%g2, 2, %g3
	stb	%o7, [%g2+1]
	mov	0, %g2
	mov	48, %o7
	stb	%o7, [%g3+%g2]
.L341:
	add	%g2, 1, %g2
	cmp	%l6, %g2
	bg,a	.L341
	 stb	%o7, [%g3+%g2]
	cmp	%l6, 0
	ble,a	.L200
	 mov	1, %l6
.L200:
	b	.L291
	 stb	%g0, [%g3+%l6]
.L216:
	b	.L142
	 mov	%g1, %i4
.L222:
	add	%fp, -160, %o7
	add	%o7, 256, %o5
.L340:
	b	.L177
	 mov	%o7, %g2
.L175:
	be,a	.L342
	 sub	%g2, %o7, %g2
.L177:
	add	%g2, 1, %g2
	ldsb	[%g2], %g3
	cmp	%g3, 0
	bne	.L175
	 cmp	%g2, %o5
	sub	%g2, %o7, %g2
.L342:
	cmp	%g2, 0
	ble,a	.L343
	 mov	46, %g2
.L244:
	ldub	[%o7+%g2], %o5
	add	%o7, %g2, %g3
	addcc	%g2, -1, %g2
	bne	.L244
	 stb	%o5, [%g3+1]
	mov	46, %g2
	b	.L291
	 stb	%g2, [%o7]
.L213:
	b	.L120
	 mov	%g1, %i4
.L224:
	b	.L184
	 mov	%g3, %i4
.L225:
	b	.L187
	 mov	%g1, %i4
.L215:
	b	.L131
	 mov	%g1, %i4
.L221:
	add	%fp, -160, %o7
	b	.L290
	 stb	%g0, [%o7+1]
.L309:
	mov	%g3, %i5
	b	.L79
	 ldub	[%i1+1], %g2
	.align 4
	.subsection	-1
	.align 4
.L110:
	.word	.L99
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L100
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L101
	.word	.L98
	.word	.L102
	.word	.L103
	.word	.L98
	.word	.L104
	.word	.L98
	.word	.L98
	.word	.L103
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L105
	.word	.L106
	.word	.L98
	.word	.L98
	.word	.L107
	.word	.L98
	.word	.L108
	.word	.L98
	.word	.L98
	.word	.L208
	.previous
	.subsection	-1
	.align 4
.L86:
	.word	.L81
	.word	.L80
	.word	.L80
	.word	.L82
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L83
	.word	.L80
	.word	.L84
	.word	.L80
	.word	.L80
	.word	.L85
	.previous
	.size	ee_vsprintf, .-ee_vsprintf
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
	save	%sp, -96, %sp
.L347:
	call	__ajit_serial_putchar__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L347
	 sethi	%hi(-53248), %g2
	or	%g2, 512, %g2
.L353:
#APP
! 635 "cortos_src/cortos_util_ee_printf.c" 1
	lda [%g2] 32, %g1
	
! 0 "" 2
#NO_APP
	and	%g1, 9, %g1
	cmp	%g1, 9
	be	.L353
	 nop
	jmp	%i7+8
	 restore
	.size	uart_send_char, .-uart_send_char
	.align 4
	.global ee_printf
	.type	ee_printf, #function
	.proc	04
ee_printf:
	save	%sp, -1128, %sp
	add	%fp, 72, %o2
	st	%i5, [%fp+88]
	mov	%i0, %o1
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%o2, [%fp-1028]
	add	%fp, -1024, %i5
	call	ee_vsprintf, 0
	 mov	%i5, %o0
	ldub	[%fp-1024], %o0
	sll	%o0, 24, %o0
	cmp	%o0, 0
	be	.L364
	 mov	0, %i0
.L360:
	call	uart_send_char, 0
	 sra	%o0, 24, %o0
	add	%i0, 1, %i0
	ldub	[%i5+%i0], %o0
	sll	%o0, 24, %o0
	cmp	%o0, 0
	bne	.L360
	 nop
.L364:
	jmp	%i7+8
	 restore
	.size	ee_printf, .-ee_printf
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

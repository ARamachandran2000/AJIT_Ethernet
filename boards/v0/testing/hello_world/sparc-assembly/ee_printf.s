	.file	"ee_printf.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.section	".rodata"
	.align 8
.LC0:
	.asciz	"0123456789abcdefghijklmnopqrstuvwxyz"
	.section	".data"
	.align 4
	.type	digits, #object
	.size	digits, 4
digits:
	.long	.LC0
	.section	".rodata"
	.align 8
.LC1:
	.asciz	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.section	".data"
	.align 4
	.type	upper_digits, #object
	.size	upper_digits, 4
upper_digits:
	.long	.LC1
	.section	".text"
	.align 4
	.type	strnlen, #function
	.proc	016
strnlen:
.LFB3:
	.file 1 "/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/minimal_printf_timer/src/ee_printf.c"
	.loc 1 64 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 66 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	b	.L2
	 nop
.L4:
	.loc 1 66 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L2:
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	be	.L3
	 nop
	.loc 1 66 0 discriminator 2
	ld	[%fp+72], %g1
	xor	%g1, 0, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, 0, %g1
	ld	[%fp+72], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+72]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L4
	 nop
.L3:
	.loc 1 67 0 is_stmt 1
	ld	[%fp-4], %g2
	ld	[%fp+68], %g1
	sub	%g2, %g1, %g1
	.loc 1 68 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	strnlen, .-strnlen
	.align 4
	.type	skip_atoi, #function
	.proc	04
skip_atoi:
.LFB4:
	.loc 1 71 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 72 0
	st	%g0, [%fp-4]
	.loc 1 73 0
	b	.L7
	 nop
.L9:
	.loc 1 73 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	add	%g1, %g1, %g1
	sll	%g1, 2, %g2
	add	%g1, %g2, %g3
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ldub	[%g1], %g2
	sll	%g2, 24, %g2
	sra	%g2, 24, %g2
	add	%g3, %g2, %g2
	add	%g2, -48, %g2
	st	%g2, [%fp-4]
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
.L7:
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 47
	ble	.L8
	 nop
	.loc 1 73 0 discriminator 2
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 57
	ble	.L9
	 nop
.L8:
	.loc 1 74 0 is_stmt 1
	ld	[%fp-4], %g1
	.loc 1 75 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	skip_atoi, .-skip_atoi
	.align 4
	.type	number, #function
	.proc	0102
number:
.LFB5:
	.loc 1 78 0
	.cfi_startproc
	save	%sp, -176, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 80 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g1
	st	%g1, [%fp-8]
	.loc 1 83 0
	ld	[%fp+88], %g1
	and	%g1, 64, %g1
	cmp	%g1, 0
	be	.L12
	 nop
	.loc 1 83 0 is_stmt 0 discriminator 1
	sethi	%hi(upper_digits), %g1
	or	%g1, %lo(upper_digits), %g1
	ld	[%g1], %g1
	st	%g1, [%fp-8]
.L12:
	.loc 1 84 0 is_stmt 1
	ld	[%fp+88], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	be	.L13
	 nop
	.loc 1 84 0 is_stmt 0 discriminator 1
	ld	[%fp+88], %g1
	and	%g1, -2, %g1
	st	%g1, [%fp+88]
.L13:
	.loc 1 85 0 is_stmt 1
	ld	[%fp+76], %g1
	cmp	%g1, 1
	ble	.L14
	 nop
	.loc 1 85 0 is_stmt 0 discriminator 2
	ld	[%fp+76], %g1
	cmp	%g1, 36
	ble	.L15
	 nop
.L14:
	.loc 1 85 0 discriminator 1
	mov	0, %g1
	b	.L45
	 nop
.L15:
	.loc 1 87 0 is_stmt 1
	ld	[%fp+88], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L17
	 nop
	.loc 1 87 0 is_stmt 0 discriminator 1
	mov	48, %g1
	b	.L18
	 nop
.L17:
	.loc 1 87 0 discriminator 2
	mov	32, %g1
.L18:
	.loc 1 87 0 discriminator 3
	stb	%g1, [%fp-13]
	.loc 1 88 0 is_stmt 1 discriminator 3
	stb	%g0, [%fp-1]
	.loc 1 89 0 discriminator 3
	ld	[%fp+88], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	be	.L19
	 nop
	.loc 1 91 0
	ld	[%fp+72], %g1
	cmp	%g1, 0
	bge	.L20
	 nop
	.loc 1 93 0
	mov	45, %g1
	stb	%g1, [%fp-1]
	.loc 1 94 0
	ld	[%fp+72], %g1
	sub	%g0, %g1, %g1
	st	%g1, [%fp+72]
	.loc 1 95 0
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
	b	.L19
	 nop
.L20:
	.loc 1 97 0
	ld	[%fp+88], %g1
	and	%g1, 4, %g1
	cmp	%g1, 0
	be	.L21
	 nop
	.loc 1 99 0
	mov	43, %g1
	stb	%g1, [%fp-1]
	.loc 1 100 0
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
	b	.L19
	 nop
.L21:
	.loc 1 102 0
	ld	[%fp+88], %g1
	and	%g1, 8, %g1
	cmp	%g1, 0
	be	.L19
	 nop
	.loc 1 104 0
	mov	32, %g1
	stb	%g1, [%fp-1]
	.loc 1 105 0
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
.L19:
	.loc 1 109 0
	ld	[%fp+88], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	be	.L22
	 nop
	.loc 1 111 0
	ld	[%fp+76], %g1
	cmp	%g1, 16
	bne	.L23
	 nop
	.loc 1 112 0
	ld	[%fp+80], %g1
	add	%g1, -2, %g1
	st	%g1, [%fp+80]
	b	.L22
	 nop
.L23:
	.loc 1 113 0
	ld	[%fp+76], %g1
	cmp	%g1, 8
	bne	.L22
	 nop
	.loc 1 114 0
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
.L22:
	.loc 1 117 0
	st	%g0, [%fp-12]
	.loc 1 119 0
	ld	[%fp+72], %g1
	cmp	%g1, 0
	bne	.L26
	 nop
	.loc 1 120 0
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1-80]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	b	.L25
	 nop
.L27:
	.loc 1 125 0
	ld	[%fp+72], %g1
	ld	[%fp+76], %g2
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, %g2, %g3
	smul	%g3, %g2, %g2
	sub	%g1, %g2, %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-80]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 126 0
	ld	[%fp+72], %g3
	ld	[%fp+76], %g2
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g3, %g2, %g1
	st	%g1, [%fp+72]
.L26:
	.loc 1 123 0 discriminator 1
	ld	[%fp+72], %g1
	cmp	%g1, 0
	bne	.L27
	 nop
.L25:
	.loc 1 130 0
	ld	[%fp-12], %g2
	ld	[%fp+84], %g1
	cmp	%g2, %g1
	ble	.L28
	 nop
	.loc 1 130 0 is_stmt 0 discriminator 1
	ld	[%fp-12], %g1
	st	%g1, [%fp+84]
.L28:
	.loc 1 131 0 is_stmt 1
	ld	[%fp+80], %g2
	ld	[%fp+84], %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp+80]
	.loc 1 132 0
	ld	[%fp+88], %g1
	and	%g1, 17, %g1
	cmp	%g1, 0
	bne	.L29
	 nop
	b	.L30
	 nop
.L31:
	.loc 1 132 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L30:
	.loc 1 132 0 discriminator 1
	ld	[%fp+80], %g1
	sra	%g1, 31, %g2
	ld	[%fp+80], %g1
	sub	%g2, %g1, %g1
	srl	%g1, 31, %g1
	ld	[%fp+80], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+80]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L31
	 nop
.L29:
	.loc 1 133 0 is_stmt 1
	ldub	[%fp-1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	be	.L32
	 nop
	.loc 1 133 0 is_stmt 0 discriminator 1
	ld	[%fp+68], %g1
	ldub	[%fp-1], %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L32:
	.loc 1 135 0 is_stmt 1
	ld	[%fp+88], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	be	.L33
	 nop
	.loc 1 137 0
	ld	[%fp+76], %g1
	cmp	%g1, 8
	bne	.L34
	 nop
	.loc 1 138 0
	ld	[%fp+68], %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
	b	.L33
	 nop
.L34:
	.loc 1 139 0
	ld	[%fp+76], %g1
	cmp	%g1, 16
	bne	.L33
	 nop
	.loc 1 141 0
	ld	[%fp+68], %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
	.loc 1 142 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g1
	ldub	[%g1+33], %g2
	ld	[%fp+68], %g1
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L33:
	.loc 1 146 0
	ld	[%fp+88], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	bne	.L46
	 nop
	b	.L36
	 nop
.L37:
	.loc 1 146 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	ldub	[%fp-13], %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L36:
	.loc 1 146 0 discriminator 1
	ld	[%fp+80], %g1
	sra	%g1, 31, %g2
	ld	[%fp+80], %g1
	sub	%g2, %g1, %g1
	srl	%g1, 31, %g1
	ld	[%fp+80], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+80]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L37
	 nop
	.loc 1 147 0 is_stmt 1
	b	.L46
	 nop
.L40:
	.loc 1 147 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
	b	.L38
	 nop
.L46:
	.loc 1 147 0
	nop
.L38:
	.loc 1 147 0 discriminator 1
	mov	1, %g1
	ld	[%fp+84], %g3
	ld	[%fp-12], %g2
	cmp	%g3, %g2
	bg	.L39
	 nop
	mov	0, %g1
.L39:
	ld	[%fp+84], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+84]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L40
	 nop
	.loc 1 148 0 is_stmt 1
	b	.L41
	 nop
.L42:
	.loc 1 148 0 is_stmt 0 discriminator 2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	ldub	[%g1-80], %g2
	ld	[%fp+68], %g1
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L41:
	.loc 1 148 0 discriminator 1
	ld	[%fp-12], %g1
	sra	%g1, 31, %g2
	ld	[%fp-12], %g1
	sub	%g2, %g1, %g1
	srl	%g1, 31, %g1
	ld	[%fp-12], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp-12]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L42
	 nop
	.loc 1 149 0 is_stmt 1
	b	.L43
	 nop
.L44:
	.loc 1 149 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L43:
	.loc 1 149 0 discriminator 1
	ld	[%fp+80], %g1
	sra	%g1, 31, %g2
	ld	[%fp+80], %g1
	sub	%g2, %g1, %g1
	srl	%g1, 31, %g1
	ld	[%fp+80], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+80]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L44
	 nop
	.loc 1 151 0 is_stmt 1
	ld	[%fp+68], %g1
.L45:
	.loc 1 152 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	number, .-number
	.align 4
	.type	eaddr, #function
	.proc	0102
eaddr:
.LFB6:
	.loc 1 155 0
	.cfi_startproc
	save	%sp, -136, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	.loc 1 157 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
	.loc 1 160 0
	ld	[%fp+84], %g1
	and	%g1, 64, %g1
	cmp	%g1, 0
	be	.L48
	 nop
	.loc 1 160 0 is_stmt 0 discriminator 1
	sethi	%hi(upper_digits), %g1
	or	%g1, %lo(upper_digits), %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
.L48:
	.loc 1 161 0 is_stmt 1
	st	%g0, [%fp-12]
	.loc 1 162 0
	st	%g0, [%fp-8]
	b	.L49
	 nop
.L51:
	.loc 1 164 0
	ld	[%fp-8], %g1
	cmp	%g1, 0
	be	.L50
	 nop
	.loc 1 164 0 is_stmt 0 discriminator 1
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	mov	58, %g2
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
.L50:
	.loc 1 165 0 is_stmt 1
	ld	[%fp-8], %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	srl	%g1, 4, %g1
	and	%g1, 0xff, %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 166 0
	ld	[%fp-8], %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	and	%g1, 15, %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 162 0
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L49:
	.loc 1 162 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g1
	cmp	%g1, 5
	ble	.L51
	 nop
	.loc 1 169 0 is_stmt 1
	ld	[%fp+84], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	bne	.L52
	 nop
	b	.L53
	 nop
.L55:
	.loc 1 169 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L53:
	.loc 1 169 0 discriminator 1
	mov	1, %g1
	ld	[%fp+76], %g3
	ld	[%fp-12], %g2
	cmp	%g3, %g2
	bg	.L54
	 nop
	mov	0, %g1
.L54:
	ld	[%fp+76], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+76]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L55
	 nop
.L52:
	.loc 1 170 0 is_stmt 1
	st	%g0, [%fp-8]
	b	.L56
	 nop
.L57:
	.loc 1 170 0 is_stmt 0 discriminator 2
	ld	[%fp-8], %g1
	add	%fp, %g1, %g1
	ldub	[%g1-40], %g2
	ld	[%fp+68], %g1
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L56:
	.loc 1 170 0 discriminator 1
	ld	[%fp-8], %g2
	ld	[%fp-12], %g1
	cmp	%g2, %g1
	bl	.L57
	 nop
	.loc 1 171 0 is_stmt 1
	b	.L58
	 nop
.L60:
	.loc 1 171 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L58:
	.loc 1 171 0 discriminator 1
	mov	1, %g1
	ld	[%fp+76], %g3
	ld	[%fp-12], %g2
	cmp	%g3, %g2
	bg	.L59
	 nop
	mov	0, %g1
.L59:
	ld	[%fp+76], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+76]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L60
	 nop
	.loc 1 173 0 is_stmt 1
	ld	[%fp+68], %g1
	.loc 1 174 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	eaddr, .-eaddr
	.align 4
	.type	iaddr, #function
	.proc	0102
iaddr:
.LFB7:
	.loc 1 177 0
	.cfi_startproc
	save	%sp, -136, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	.loc 1 181 0
	st	%g0, [%fp-12]
	.loc 1 182 0
	st	%g0, [%fp-4]
	b	.L63
	 nop
.L69:
	.loc 1 184 0
	ld	[%fp-4], %g1
	cmp	%g1, 0
	be	.L64
	 nop
	.loc 1 184 0 is_stmt 0 discriminator 1
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	mov	46, %g2
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
.L64:
	.loc 1 185 0 is_stmt 1
	ld	[%fp-4], %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	st	%g1, [%fp-8]
	.loc 1 187 0
	ld	[%fp-8], %g1
	cmp	%g1, 0
	bne	.L65
	 nop
	.loc 1 188 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	b	.L66
	 nop
.L65:
	.loc 1 191 0
	ld	[%fp-8], %g1
	cmp	%g1, 99
	ble	.L67
	 nop
	.loc 1 193 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g2
	ld	[%fp-8], %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 100, %g1
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 194 0
	ld	[%fp-8], %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 100, %g2
	smul	%g2, 100, %g2
	sub	%g1, %g2, %g1
	st	%g1, [%fp-8]
	.loc 1 195 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g2
	ld	[%fp-8], %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %g1
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 196 0
	ld	[%fp-8], %g2
	sra	%g2, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g2, 10, %g1
	add	%g1, %g1, %g1
	sll	%g1, 2, %g3
	add	%g1, %g3, %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp-8]
	b	.L68
	 nop
.L67:
	.loc 1 198 0
	ld	[%fp-8], %g1
	cmp	%g1, 9
	ble	.L68
	 nop
	.loc 1 200 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g2
	ld	[%fp-8], %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %g1
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 201 0
	ld	[%fp-8], %g2
	sra	%g2, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g2, 10, %g1
	add	%g1, %g1, %g1
	sll	%g1, 2, %g3
	add	%g1, %g3, %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp-8]
.L68:
	.loc 1 204 0
	sethi	%hi(digits), %g1
	or	%g1, %lo(digits), %g1
	ld	[%g1], %g2
	ld	[%fp-8], %g1
	add	%g2, %g1, %g1
	ldub	[%g1], %g2
	ld	[%fp-12], %g1
	add	%fp, %g1, %g1
	stb	%g2, [%g1-40]
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
.L66:
	.loc 1 182 0
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L63:
	.loc 1 182 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 3
	ble	.L69
	 nop
	.loc 1 208 0 is_stmt 1
	ld	[%fp+84], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	bne	.L70
	 nop
	b	.L71
	 nop
.L73:
	.loc 1 208 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L71:
	.loc 1 208 0 discriminator 1
	mov	1, %g1
	ld	[%fp+76], %g3
	ld	[%fp-12], %g2
	cmp	%g3, %g2
	bg	.L72
	 nop
	mov	0, %g1
.L72:
	ld	[%fp+76], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+76]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L73
	 nop
.L70:
	.loc 1 209 0 is_stmt 1
	st	%g0, [%fp-4]
	b	.L74
	 nop
.L75:
	.loc 1 209 0 is_stmt 0 discriminator 2
	ld	[%fp-4], %g1
	add	%fp, %g1, %g1
	ldub	[%g1-40], %g2
	ld	[%fp+68], %g1
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L74:
	.loc 1 209 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp-12], %g1
	cmp	%g2, %g1
	bl	.L75
	 nop
	.loc 1 210 0 is_stmt 1
	b	.L76
	 nop
.L78:
	.loc 1 210 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+68], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+68]
.L76:
	.loc 1 210 0 discriminator 1
	mov	1, %g1
	ld	[%fp+76], %g3
	ld	[%fp-12], %g2
	cmp	%g3, %g2
	bg	.L77
	 nop
	mov	0, %g1
.L77:
	ld	[%fp+76], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+76]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L78
	 nop
	.loc 1 212 0 is_stmt 1
	ld	[%fp+68], %g1
	.loc 1 213 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	iaddr, .-iaddr
	.section	".rodata"
	.align 8
.LC2:
	.asciz	"<NULL>"
	.section	".text"
	.align 4
	.type	ee_vsprintf, #function
	.proc	04
ee_vsprintf:
.LFB8:
	.loc 1 431 0
	.cfi_startproc
	save	%sp, -136, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 444 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-16]
	b	.L81
	 nop
.L136:
	.loc 1 446 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 37
	be	.L82
	 nop
	.loc 1 448 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g2
	ld	[%fp-16], %g1
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
	.loc 1 449 0
	b	.L83
	 nop
.L82:
	.loc 1 453 0
	st	%g0, [%fp-24]
.L84:
	.loc 1 455 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 456 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%g1, -32, %g1
	cmp	%g1, 16
	bgu	.L85
	 nop
	sll	%g1, 2, %g2
	sethi	%hi(.L91), %g1
	or	%g1, %lo(.L91), %g1
	ld	[%g2+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L89:
	.loc 1 458 0
	ld	[%fp-24], %g1
	or	%g1, 16, %g1
	st	%g1, [%fp-24]
	b	.L84
	 nop
.L88:
	.loc 1 459 0
	ld	[%fp-24], %g1
	or	%g1, 4, %g1
	st	%g1, [%fp-24]
	b	.L84
	 nop
.L86:
	.loc 1 460 0
	ld	[%fp-24], %g1
	or	%g1, 8, %g1
	st	%g1, [%fp-24]
	b	.L84
	 nop
.L87:
	.loc 1 461 0
	ld	[%fp-24], %g1
	or	%g1, 32, %g1
	st	%g1, [%fp-24]
	b	.L84
	 nop
.L90:
	.loc 1 462 0
	ld	[%fp-24], %g1
	or	%g1, 1, %g1
	st	%g1, [%fp-24]
	b	.L84
	 nop
.L85:
	.loc 1 466 0
	mov	-1, %g1
	st	%g1, [%fp-28]
	.loc 1 467 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 47
	ble	.L92
	 nop
	.loc 1 467 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 57
	bg	.L92
	 nop
	.loc 1 468 0 is_stmt 1
	add	%fp, 72, %g1
	mov	%g1, %o0
	call	skip_atoi, 0
	 nop
	st	%o0, [%fp-28]
	b	.L93
	 nop
.L92:
	.loc 1 469 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 42
	bne	.L93
	 nop
	.loc 1 471 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 472 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-28]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 473 0
	ld	[%fp-28], %g1
	cmp	%g1, 0
	bge	.L93
	 nop
	.loc 1 475 0
	ld	[%fp-28], %g1
	sub	%g0, %g1, %g1
	st	%g1, [%fp-28]
	.loc 1 476 0
	ld	[%fp-24], %g1
	or	%g1, 16, %g1
	st	%g1, [%fp-24]
.L93:
	.loc 1 481 0
	mov	-1, %g1
	st	%g1, [%fp-32]
	.loc 1 482 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 46
	bne	.L94
	 nop
	.loc 1 484 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 485 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 47
	ble	.L95
	 nop
	.loc 1 485 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 57
	bg	.L95
	 nop
	.loc 1 486 0 is_stmt 1
	add	%fp, 72, %g1
	mov	%g1, %o0
	call	skip_atoi, 0
	 nop
	st	%o0, [%fp-32]
	b	.L96
	 nop
.L95:
	.loc 1 487 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 42
	bne	.L96
	 nop
	.loc 1 489 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 490 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-32]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
.L96:
	.loc 1 492 0
	ld	[%fp-32], %g1
	cmp	%g1, 0
	bge	.L94
	 nop
	.loc 1 492 0 is_stmt 0 discriminator 1
	st	%g0, [%fp-32]
.L94:
	.loc 1 496 0 is_stmt 1
	mov	-1, %g1
	st	%g1, [%fp-36]
	.loc 1 497 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 108
	be	.L97
	 nop
	.loc 1 497 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 76
	bne	.L98
	 nop
.L97:
	.loc 1 499 0 is_stmt 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	st	%g1, [%fp-36]
	.loc 1 500 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
.L98:
	.loc 1 504 0
	mov	10, %g1
	st	%g1, [%fp-12]
	.loc 1 506 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%g1, -65, %g1
	cmp	%g1, 55
	bgu	.L99
	 nop
	sll	%g1, 2, %g2
	sethi	%hi(.L110), %g1
	or	%g1, %lo(.L110), %g1
	ld	[%g2+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L103:
	.loc 1 509 0
	ld	[%fp-24], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	bne	.L111
	 nop
	b	.L112
	 nop
.L113:
	.loc 1 509 0 is_stmt 0 discriminator 2
	ld	[%fp-16], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
.L112:
	.loc 1 509 0 discriminator 1
	ld	[%fp-28], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-28]
	ld	[%fp-28], %g1
	cmp	%g1, 0
	bg	.L113
	 nop
.L111:
	.loc 1 510 0 is_stmt 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	mov	%g1, %g2
	ld	[%fp-16], %g1
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 511 0
	b	.L114
	 nop
.L115:
	.loc 1 511 0 is_stmt 0 discriminator 2
	ld	[%fp-16], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
.L114:
	.loc 1 511 0 discriminator 1
	ld	[%fp-28], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-28]
	ld	[%fp-28], %g1
	cmp	%g1, 0
	bg	.L115
	 nop
	.loc 1 512 0 is_stmt 1
	b	.L83
	 nop
.L107:
	.loc 1 515 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-20]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 516 0
	ld	[%fp-20], %g1
	cmp	%g1, 0
	bne	.L116
	 nop
	.loc 1 516 0 is_stmt 0 discriminator 1
	sethi	%hi(.LC2), %g1
	or	%g1, %lo(.LC2), %g1
	st	%g1, [%fp-20]
.L116:
	.loc 1 517 0 is_stmt 1
	ld	[%fp-32], %g1
	ld	[%fp-20], %o0
	mov	%g1, %o1
	call	strnlen, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-40]
	.loc 1 518 0
	ld	[%fp-24], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	bne	.L117
	 nop
	b	.L118
	 nop
.L120:
	.loc 1 518 0 is_stmt 0 discriminator 2
	ld	[%fp-16], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
.L118:
	.loc 1 518 0 discriminator 1
	mov	1, %g1
	ld	[%fp-28], %g3
	ld	[%fp-40], %g2
	cmp	%g3, %g2
	bg	.L119
	 nop
	mov	0, %g1
.L119:
	ld	[%fp-28], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp-28]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L120
	 nop
.L117:
	.loc 1 519 0 is_stmt 1
	st	%g0, [%fp-8]
	b	.L121
	 nop
.L122:
	.loc 1 519 0 is_stmt 0 discriminator 2
	ld	[%fp-20], %g1
	ldub	[%g1], %g2
	ld	[%fp-16], %g1
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
	ld	[%fp-20], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L121:
	.loc 1 519 0 discriminator 1
	ld	[%fp-8], %g2
	ld	[%fp-40], %g1
	cmp	%g2, %g1
	bl	.L122
	 nop
	.loc 1 520 0 is_stmt 1
	b	.L123
	 nop
.L125:
	.loc 1 520 0 is_stmt 0 discriminator 2
	ld	[%fp-16], %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
.L123:
	.loc 1 520 0 discriminator 1
	mov	1, %g1
	ld	[%fp-28], %g3
	ld	[%fp-40], %g2
	cmp	%g3, %g2
	bg	.L124
	 nop
	mov	0, %g1
.L124:
	ld	[%fp-28], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp-28]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L125
	 nop
	.loc 1 521 0 is_stmt 1
	b	.L83
	 nop
.L106:
	.loc 1 524 0
	ld	[%fp-28], %g1
	cmp	%g1, -1
	bne	.L126
	 nop
	.loc 1 526 0
	mov	8, %g1
	st	%g1, [%fp-28]
	.loc 1 527 0
	ld	[%fp-24], %g1
	or	%g1, 1, %g1
	st	%g1, [%fp-24]
.L126:
	.loc 1 529 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	ld	[%fp-16], %o0
	mov	%g1, %o1
	mov	16, %o2
	ld	[%fp-28], %o3
	ld	[%fp-32], %o4
	ld	[%fp-24], %o5
	call	number, 0
	 nop
	st	%o0, [%fp-16]
	.loc 1 530 0
	b	.L83
	 nop
.L100:
	.loc 1 533 0
	ld	[%fp-24], %g1
	or	%g1, 64, %g1
	st	%g1, [%fp-24]
.L102:
	.loc 1 536 0
	ld	[%fp-36], %g1
	cmp	%g1, 108
	bne	.L127
	 nop
	.loc 1 537 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	ld	[%fp-16], %o0
	mov	%g1, %o1
	ld	[%fp-28], %o2
	ld	[%fp-32], %o3
	ld	[%fp-24], %o4
	call	eaddr, 0
	 nop
	st	%o0, [%fp-16]
	.loc 1 540 0
	b	.L83
	 nop
.L127:
	.loc 1 539 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	ld	[%fp-16], %o0
	mov	%g1, %o1
	ld	[%fp-28], %o2
	ld	[%fp-32], %o3
	ld	[%fp-24], %o4
	call	iaddr, 0
	 nop
	st	%o0, [%fp-16]
	.loc 1 540 0
	b	.L83
	 nop
.L105:
	.loc 1 544 0
	mov	8, %g1
	st	%g1, [%fp-12]
	.loc 1 545 0
	b	.L129
	 nop
.L101:
	.loc 1 548 0
	ld	[%fp-24], %g1
	or	%g1, 64, %g1
	st	%g1, [%fp-24]
.L109:
	.loc 1 551 0
	mov	16, %g1
	st	%g1, [%fp-12]
	.loc 1 552 0
	b	.L129
	 nop
.L104:
	.loc 1 556 0
	ld	[%fp-24], %g1
	or	%g1, 2, %g1
	st	%g1, [%fp-24]
	.loc 1 559 0
	b	.L138
	 nop
.L99:
	.loc 1 570 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 37
	be	.L130
	 nop
	.loc 1 570 0 is_stmt 0 discriminator 1
	ld	[%fp-16], %g1
	mov	37, %g2
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
.L130:
	.loc 1 571 0 is_stmt 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	be	.L131
	 nop
	.loc 1 572 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g2
	ld	[%fp-16], %g1
	stb	%g2, [%g1]
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
	.loc 1 575 0
	b	.L83
	 nop
.L131:
	.loc 1 574 0
	ld	[%fp+72], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+72]
	.loc 1 575 0
	b	.L83
	 nop
.L138:
	.loc 1 559 0
	nop
.L129:
	.loc 1 578 0
	ld	[%fp-36], %g1
	cmp	%g1, 108
	bne	.L133
	 nop
	.loc 1 579 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	b	.L134
	 nop
.L133:
	.loc 1 580 0
	ld	[%fp-24], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	be	.L135
	 nop
	.loc 1 581 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	b	.L134
	 nop
.L135:
	.loc 1 583 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
.L134:
	.loc 1 585 0
	ld	[%fp-4], %g1
	ld	[%fp-16], %o0
	mov	%g1, %o1
	ld	[%fp-12], %o2
	ld	[%fp-28], %o3
	ld	[%fp-32], %o4
	ld	[%fp-24], %o5
	call	number, 0
	 nop
	st	%o0, [%fp-16]
.L83:
	.loc 1 444 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
.L81:
	.loc 1 444 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	bne	.L136
	 nop
	.loc 1 588 0 is_stmt 1
	ld	[%fp-16], %g1
	stb	%g0, [%g1]
	.loc 1 589 0
	ld	[%fp-16], %g2
	ld	[%fp+68], %g1
	sub	%g2, %g1, %g1
	.loc 1 590 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.align 4
	.subsection	-1
	.align 4
.L110:
	.word	.L100
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L101
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L102
	.word	.L99
	.word	.L103
	.word	.L104
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L104
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L99
	.word	.L105
	.word	.L106
	.word	.L99
	.word	.L99
	.word	.L107
	.word	.L99
	.word	.L138
	.word	.L99
	.word	.L99
	.word	.L109
	.previous
	.subsection	-1
	.align 4
.L91:
	.word	.L86
	.word	.L85
	.word	.L85
	.word	.L87
	.word	.L85
	.word	.L85
	.word	.L85
	.word	.L85
	.word	.L85
	.word	.L85
	.word	.L85
	.word	.L88
	.word	.L85
	.word	.L89
	.word	.L85
	.word	.L85
	.word	.L90
	.previous
	.cfi_endproc
.LFE8:
	.size	ee_vsprintf, .-ee_vsprintf
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
.LFB9:
	.loc 1 593 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	stb	%g1, [%fp+68]
	b	.L142
	 nop
.L144:
	.loc 1 620 0
	nop
.L142:
.LBB2:
	.loc 1 616 0
	ldub	[%fp+68], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	__ajit_serial_putchar__, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 618 0
	ld	[%fp-4], %g1
	cmp	%g1, 0
	be	.L144
	 nop
	.loc 1 619 0
	nop
	b	.L141
	 nop
.L145:
.LBE2:
	.loc 1 635 0
	nop
.L141:
.LBB3:
	.loc 1 627 0
	st	%g0, [%fp-8]
	.loc 1 631 0
	sethi	%hi(-53248), %g1
	or	%g1, 512, %g1
#APP
! 631 "/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/minimal_printf_timer/src/ee_printf.c" 1
	lda [%g1] 32, %i5
	
! 0 "" 2
#NO_APP
	st	%i5, [%fp-8]
	.loc 1 633 0
	ld	[%fp-8], %g1
	and	%g1, 8, %g1
	cmp	%g1, 0
	be	.L139
	 nop
	.loc 1 633 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L145
	 nop
.L139:
.LBE3:
	.loc 1 638 0 is_stmt 1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE9:
	.size	uart_send_char, .-uart_send_char
	.align 4
	.global ee_printf
	.type	ee_printf, #function
	.proc	04
ee_printf:
.LFB10:
	.loc 1 641 0
	.cfi_startproc
	save	%sp, -1136, %sp
.LCFI7:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 646 0
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 641 0
	st	%i0, [%fp+68]
	.loc 1 644 0
	st	%g0, [%fp-8]
	.loc 1 646 0
	add	%fp, 72, %g1
	st	%g1, [%fp-1036]
	.loc 1 647 0
	ld	[%fp-1036], %g1
	add	%fp, -1032, %g2
	mov	%g2, %o0
	ld	[%fp+68], %o1
	mov	%g1, %o2
	call	ee_vsprintf, 0
	 nop
	.loc 1 649 0
	add	%fp, -1032, %g1
	st	%g1, [%fp-4]
	.loc 1 650 0
	b	.L147
	 nop
.L148:
	.loc 1 651 0
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	uart_send_char, 0
	 nop
	.loc 1 652 0
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
	.loc 1 653 0
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L147:
	.loc 1 650 0 discriminator 1
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	bne	.L148
	 nop
	.loc 1 656 0
	ld	[%fp-8], %g1
	.loc 1 657 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE10:
	.size	ee_printf, .-ee_printf
.Letext0:
	.file 2 "/home/tools_shared/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdarg.h"
	.file 3 "/home/tools_shared/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stddef.h"
	.file 4 "/home/tools_shared/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x541
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF36
	.byte	0x1
	.uaword	.LASF37
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.uaword	.LASF0
	.byte	0x2
	.byte	0x28
	.uaword	0x2c
	.uleb128 0x3
	.byte	0x4
	.uaword	.LASF38
	.uleb128 0x2
	.uaword	.LASF1
	.byte	0x2
	.byte	0x66
	.uaword	0x21
	.uleb128 0x2
	.uaword	.LASF2
	.byte	0x3
	.byte	0xd7
	.uaword	0x48
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.uaword	.LASF3
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.uaword	.LASF4
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.uaword	.LASF5
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.uaword	.LASF6
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.uaword	.LASF8
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.uaword	.LASF9
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.uaword	.LASF10
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.uaword	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.uaword	.LASF12
	.uleb128 0x6
	.byte	0x4
	.uaword	0x9b
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.uaword	.LASF13
	.uleb128 0x7
	.uaword	0x9b
	.uaword	0xb2
	.uleb128 0x8
	.uaword	0x8e
	.byte	0x17
	.byte	0
	.uleb128 0x2
	.uaword	.LASF14
	.byte	0x4
	.byte	0x34
	.uaword	0x48
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.uaword	0x3d
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x104
	.uleb128 0xa
	.asciz	"s"
	.byte	0x1
	.byte	0x3f
	.uaword	0x104
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xb
	.uaword	.LASF15
	.byte	0x1
	.byte	0x3f
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xc
	.asciz	"sc"
	.byte	0x1
	.byte	0x41
	.uaword	0x104
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.uaword	0x10a
	.uleb128 0xd
	.uaword	0x9b
	.uleb128 0x9
	.uaword	.LASF17
	.byte	0x1
	.byte	0x46
	.byte	0x1
	.uaword	0x4f
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x146
	.uleb128 0xa
	.asciz	"s"
	.byte	0x1
	.byte	0x46
	.uaword	0x146
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xc
	.asciz	"i"
	.byte	0x1
	.byte	0x48
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.uaword	0x104
	.uleb128 0x9
	.uaword	.LASF18
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.uaword	0x95
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x207
	.uleb128 0xa
	.asciz	"str"
	.byte	0x1
	.byte	0x4d
	.uaword	0x95
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.asciz	"num"
	.byte	0x1
	.byte	0x4d
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xb
	.uaword	.LASF19
	.byte	0x1
	.byte	0x4d
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xb
	.uaword	.LASF20
	.byte	0x1
	.byte	0x4d
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0xb
	.uaword	.LASF21
	.byte	0x1
	.byte	0x4d
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xb
	.uaword	.LASF22
	.byte	0x1
	.byte	0x4d
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0xc
	.asciz	"c"
	.byte	0x1
	.byte	0x4f
	.uaword	0x9b
	.byte	0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0xe
	.uaword	.LASF23
	.byte	0x1
	.byte	0x4f
	.uaword	0x9b
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.uleb128 0xc
	.asciz	"tmp"
	.byte	0x1
	.byte	0x4f
	.uaword	0x207
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xc
	.asciz	"dig"
	.byte	0x1
	.byte	0x50
	.uaword	0x95
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xc
	.asciz	"i"
	.byte	0x1
	.byte	0x51
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.uaword	0x9b
	.uaword	0x217
	.uleb128 0x8
	.uaword	0x8e
	.byte	0x41
	.byte	0
	.uleb128 0x9
	.uaword	.LASF24
	.byte	0x1
	.byte	0x9a
	.byte	0x1
	.uaword	0x95
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x2b6
	.uleb128 0xa
	.asciz	"str"
	.byte	0x1
	.byte	0x9a
	.uaword	0x95
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xb
	.uaword	.LASF25
	.byte	0x1
	.byte	0x9a
	.uaword	0x2b6
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xb
	.uaword	.LASF20
	.byte	0x1
	.byte	0x9a
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xb
	.uaword	.LASF21
	.byte	0x1
	.byte	0x9a
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0xb
	.uaword	.LASF22
	.byte	0x1
	.byte	0x9a
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xc
	.asciz	"tmp"
	.byte	0x1
	.byte	0x9c
	.uaword	0xa2
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.asciz	"dig"
	.byte	0x1
	.byte	0x9d
	.uaword	0x95
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xc
	.asciz	"i"
	.byte	0x1
	.byte	0x9e
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xc
	.asciz	"len"
	.byte	0x1
	.byte	0x9e
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.uaword	0x64
	.uleb128 0x9
	.uaword	.LASF26
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.uaword	0x95
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x359
	.uleb128 0xa
	.asciz	"str"
	.byte	0x1
	.byte	0xb0
	.uaword	0x95
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xb
	.uaword	.LASF25
	.byte	0x1
	.byte	0xb0
	.uaword	0x2b6
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xb
	.uaword	.LASF20
	.byte	0x1
	.byte	0xb0
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xb
	.uaword	.LASF21
	.byte	0x1
	.byte	0xb0
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0xb
	.uaword	.LASF22
	.byte	0x1
	.byte	0xb0
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xc
	.asciz	"tmp"
	.byte	0x1
	.byte	0xb2
	.uaword	0xa2
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.asciz	"i"
	.byte	0x1
	.byte	0xb3
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xc
	.asciz	"n"
	.byte	0x1
	.byte	0xb3
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xc
	.asciz	"len"
	.byte	0x1
	.byte	0xb3
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.uaword	.LASF27
	.byte	0x1
	.uahalf	0x1ae
	.byte	0x1
	.uaword	0x4f
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x446
	.uleb128 0x10
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x1ae
	.uaword	0x95
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x10
	.asciz	"fmt"
	.byte	0x1
	.uahalf	0x1ae
	.uaword	0x104
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x11
	.uaword	.LASF28
	.byte	0x1
	.uahalf	0x1ae
	.uaword	0x32
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x12
	.asciz	"len"
	.byte	0x1
	.uahalf	0x1b0
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.asciz	"num"
	.byte	0x1
	.uahalf	0x1b1
	.uaword	0x72
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x12
	.asciz	"i"
	.byte	0x1
	.uahalf	0x1b2
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x13
	.uaword	.LASF19
	.byte	0x1
	.uahalf	0x1b2
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.asciz	"str"
	.byte	0x1
	.uahalf	0x1b3
	.uaword	0x95
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x12
	.asciz	"s"
	.byte	0x1
	.uahalf	0x1b4
	.uaword	0x95
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.uaword	.LASF29
	.byte	0x1
	.uahalf	0x1b6
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.uaword	.LASF30
	.byte	0x1
	.uahalf	0x1b8
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.uaword	.LASF21
	.byte	0x1
	.uahalf	0x1b9
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.uaword	.LASF31
	.byte	0x1
	.uahalf	0x1ba
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.uaword	.LASF39
	.byte	0x1
	.uahalf	0x1c6
	.uaword	.L84
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x251
	.byte	0x1
	.uaword	.LFB9
	.uaword	.LFE9
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x4a6
	.uleb128 0x10
	.asciz	"c"
	.byte	0x1
	.uahalf	0x251
	.uaword	0x9b
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LBB2
	.uaword	.LBE2
	.uaword	0x48c
	.uleb128 0x13
	.uaword	.LASF32
	.byte	0x1
	.uahalf	0x268
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x17
	.uaword	.LBB3
	.uaword	.LBE3
	.uleb128 0x13
	.uaword	.LASF33
	.byte	0x1
	.uahalf	0x273
	.uaword	0xb2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.uaword	.LASF41
	.byte	0x1
	.uahalf	0x280
	.byte	0x1
	.uaword	0x4f
	.uaword	.LFB10
	.uaword	.LFE10
	.uaword	.LLST7
	.byte	0x1
	.uaword	0x511
	.uleb128 0x10
	.asciz	"fmt"
	.byte	0x1
	.uahalf	0x280
	.uaword	0x104
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x19
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x282
	.uaword	0x511
	.byte	0x3
	.byte	0x91
	.sleb128 -1032
	.uleb128 0x12
	.asciz	"p"
	.byte	0x1
	.uahalf	0x282
	.uaword	0x95
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.uaword	.LASF28
	.byte	0x1
	.uahalf	0x283
	.uaword	0x32
	.byte	0x3
	.byte	0x91
	.sleb128 -1036
	.uleb128 0x12
	.asciz	"n"
	.byte	0x1
	.uahalf	0x284
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.uaword	0x9b
	.uaword	0x522
	.uleb128 0x1a
	.uaword	0x8e
	.uahalf	0x3ff
	.byte	0
	.uleb128 0xe
	.uaword	.LASF34
	.byte	0x1
	.byte	0x3b
	.uaword	0x95
	.byte	0x5
	.byte	0x3
	.uaword	digits
	.uleb128 0xe
	.uaword	.LASF35
	.byte	0x1
	.byte	0x3c
	.uaword	0x95
	.byte	0x5
	.byte	0x3
	.uaword	upper_digits
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LFB3-.Ltext0
	.uaword	.LCFI0-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI0-.Ltext0
	.uaword	.LFE3-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LFB4-.Ltext0
	.uaword	.LCFI1-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI1-.Ltext0
	.uaword	.LFE4-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LFB5-.Ltext0
	.uaword	.LCFI2-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI2-.Ltext0
	.uaword	.LFE5-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LFB6-.Ltext0
	.uaword	.LCFI3-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI3-.Ltext0
	.uaword	.LFE6-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LFB7-.Ltext0
	.uaword	.LCFI4-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI4-.Ltext0
	.uaword	.LFE7-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LFB8-.Ltext0
	.uaword	.LCFI5-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI5-.Ltext0
	.uaword	.LFE8-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LFB9-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE9-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LFB10-.Ltext0
	.uaword	.LCFI7-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI7-.Ltext0
	.uaword	.LFE10-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
	.section	.debug_aranges,"",@progbits
	.uaword	0x1c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.Ltext0
	.uaword	.Letext0-.Ltext0
	.uaword	0
	.uaword	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.asciz	"success"
.LASF38:
	.asciz	"__builtin_va_list"
.LASF17:
	.asciz	"skip_atoi"
.LASF27:
	.asciz	"ee_vsprintf"
.LASF15:
	.asciz	"count"
.LASF7:
	.asciz	"short unsigned int"
.LASF40:
	.asciz	"uart_send_char"
.LASF33:
	.asciz	"ctrl_reg"
.LASF20:
	.asciz	"size"
.LASF8:
	.asciz	"long unsigned int"
.LASF25:
	.asciz	"addr"
.LASF2:
	.asciz	"size_t"
.LASF1:
	.asciz	"va_list"
.LASF26:
	.asciz	"iaddr"
.LASF6:
	.asciz	"unsigned char"
.LASF24:
	.asciz	"eaddr"
.LASF10:
	.asciz	"short int"
.LASF0:
	.asciz	"__gnuc_va_list"
.LASF19:
	.asciz	"base"
.LASF3:
	.asciz	"unsigned int"
.LASF29:
	.asciz	"flags"
.LASF31:
	.asciz	"qualifier"
.LASF11:
	.asciz	"long long unsigned int"
.LASF35:
	.asciz	"upper_digits"
.LASF39:
	.asciz	"repeat"
.LASF16:
	.asciz	"strnlen"
.LASF18:
	.asciz	"number"
.LASF12:
	.asciz	"sizetype"
.LASF5:
	.asciz	"long long int"
.LASF21:
	.asciz	"precision"
.LASF13:
	.asciz	"char"
.LASF34:
	.asciz	"digits"
.LASF36:
	.asciz	"GNU C 4.7.4"
.LASF22:
	.asciz	"type"
.LASF30:
	.asciz	"field_width"
.LASF28:
	.asciz	"args"
.LASF14:
	.asciz	"uint32_t"
.LASF4:
	.asciz	"long int"
.LASF37:
	.asciz	"/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/minimal_printf_timer/src/ee_printf.c"
.LASF9:
	.asciz	"signed char"
.LASF23:
	.asciz	"sign"
.LASF41:
	.asciz	"ee_printf"
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

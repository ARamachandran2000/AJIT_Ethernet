	.file	"ajit_mmap.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global ajit_mmap_index_into_table
	.type	ajit_mmap_index_into_table, #function
	.proc	016
ajit_mmap_index_into_table:
.LFB0:
	.file 1 "/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mmap.c"
	.loc 1 8 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	st	%i1, [%fp+72]
	stb	%g1, [%fp+68]
	.loc 1 9 0
	st	%g0, [%fp-4]
	.loc 1 10 0
	ldub	[%fp+68], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 2
	be	.L4
	 nop
	cmp	%g1, 3
	be	.L5
	 nop
	cmp	%g1, 1
	bne	.L8
	 nop
.L3:
	.loc 1 13 0
	ld	[%fp+72], %g1
	srl	%g1, 24, %g1
	st	%g1, [%fp-4]
	.loc 1 14 0
	b	.L6
	 nop
.L4:
	.loc 1 16 0
	ld	[%fp+72], %g1
	srl	%g1, 18, %g1
	and	%g1, 63, %g1
	st	%g1, [%fp-4]
	.loc 1 17 0
	b	.L6
	 nop
.L5:
	.loc 1 19 0
	ld	[%fp+72], %g1
	srl	%g1, 12, %g1
	and	%g1, 63, %g1
	st	%g1, [%fp-4]
	.loc 1 20 0
	b	.L6
	 nop
.L8:
	.loc 1 22 0
	nop
.L6:
	.loc 1 24 0
	ld	[%fp-4], %g1
	.loc 1 25 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	ajit_mmap_index_into_table, .-ajit_mmap_index_into_table
	.align 4
	.global ajit_mmap_is_pte
	.type	ajit_mmap_is_pte, #function
	.proc	014
ajit_mmap_is_pte:
.LFB1:
	.loc 1 28 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 29 0
	ld	[%fp+68], %g1
	and	%g1, 3, %g1
	xor	%g1, 2, %g1
	subcc	%g0, %g1, %g0
	subx	%g0, -1, %g1
	stb	%g1, [%fp-1]
	.loc 1 30 0
	ldub	[%fp-1], %g1
	and	%g1, 0xff, %g1
	.loc 1 31 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	ajit_mmap_is_pte, .-ajit_mmap_is_pte
	.align 4
	.global ajit_mmap_is_ptd
	.type	ajit_mmap_is_ptd, #function
	.proc	014
ajit_mmap_is_ptd:
.LFB2:
	.loc 1 34 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 35 0
	ld	[%fp+68], %g1
	and	%g1, 3, %g1
	xor	%g1, 1, %g1
	subcc	%g0, %g1, %g0
	subx	%g0, -1, %g1
	stb	%g1, [%fp-1]
	.loc 1 36 0
	ldub	[%fp-1], %g1
	and	%g1, 0xff, %g1
	.loc 1 37 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	ajit_mmap_is_ptd, .-ajit_mmap_is_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_ptd
	.type	ajit_mmap_get_phy_addr_from_ptd, #function
	.proc	017
ajit_mmap_get_phy_addr_from_ptd:
.LFB3:
	.loc 1 40 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g1
	st	%i2, [%fp+76]
	stb	%g1, [%fp+72]
	.loc 1 41 0
	ld	[%fp+68], %g1
	mov	0, %g2
	mov	%g1, %g3
	mov	0, %o4
	sethi	%hi(4294966272), %o5
	or	%o5, 1020, %o5
	and	%g2, %o4, %g2
	and	%g3, %o5, %g3
	std	%g2, [%fp-8]
	.loc 1 43 0
	ld	[%fp-4], %g1
	srl	%g1, 28, %g1
	ld	[%fp-8], %g2
	sll	%g2, 4, %g2
	or	%g2, %g1, %g1
	st	%g1, [%fp-8]
	ld	[%fp-4], %g1
	sll	%g1, 4, %g1
	st	%g1, [%fp-4]
	.loc 1 44 0
	ld	[%fp+76], %g1
	sll	%g1, 2, %g1
	mov	0, %g2
	mov	%g1, %g3
	ldd	[%fp-8], %i4
	or	%i4, %g2, %g2
	or	%i5, %g3, %g3
	std	%g2, [%fp-8]
	.loc 1 46 0
	ldd	[%fp-8], %g2
	.loc 1 48 0
	mov	%g2, %i0
	mov	%g3, %i1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	ajit_mmap_get_phy_addr_from_ptd, .-ajit_mmap_get_phy_addr_from_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_pte
	.type	ajit_mmap_get_phy_addr_from_pte, #function
	.proc	017
ajit_mmap_get_phy_addr_from_pte:
.LFB4:
	.loc 1 51 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g1
	st	%i2, [%fp+76]
	stb	%g1, [%fp+72]
	.loc 1 52 0
	st	%g0, [%fp-8]
	st	%g0, [%fp-4]
	.loc 1 53 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 3
	bne	.L16
	 nop
	.loc 1 54 0
	ld	[%fp+76], %g1
	mov	0, %g2
	mov	%g1, %g3
	and	%g2, 0, %g2
	and	%g3, 4095, %g3
	std	%g2, [%fp-8]
	b	.L17
	 nop
.L16:
	.loc 1 55 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 2
	bne	.L18
	 nop
	.loc 1 56 0
	ld	[%fp+76], %g1
	mov	0, %i4
	mov	%g1, %i5
	mov	0, %g2
	sethi	%hi(15360), %g3
	or	%g3, 1023, %g3
	and	%i4, %g2, %g2
	and	%i5, %g3, %g3
	std	%g2, [%fp-8]
	b	.L17
	 nop
.L18:
	.loc 1 57 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 1
	bne	.L19
	 nop
	.loc 1 58 0
	ld	[%fp+76], %g1
	mov	0, %i4
	mov	%g1, %i5
	mov	0, %g2
	sethi	%hi(16776192), %g3
	or	%g3, 1023, %g3
	and	%i4, %g2, %g2
	and	%i5, %g3, %g3
	std	%g2, [%fp-8]
	b	.L17
	 nop
.L19:
	.loc 1 60 0
	ld	[%fp+76], %g1
	mov	0, %g2
	mov	%g1, %g3
	std	%g2, [%fp-8]
.L17:
	.loc 1 62 0
	ld	[%fp+68], %g1
	srl	%g1, 8, %g1
	st	%g1, [%fp-12]
	.loc 1 63 0
	st	%g0, [%fp-24]
	st	%g0, [%fp-20]
	.loc 1 64 0
	ld	[%fp-12], %g1
	mov	0, %g2
	mov	%g1, %g3
	std	%g2, [%fp-24]
	.loc 1 65 0
	ld	[%fp-20], %g1
	srl	%g1, 20, %g1
	ld	[%fp-24], %g2
	sll	%g2, 12, %g2
	or	%g2, %g1, %g1
	st	%g1, [%fp-24]
	ld	[%fp-20], %g1
	sll	%g1, 12, %g1
	st	%g1, [%fp-20]
	.loc 1 66 0
	ldd	[%fp-24], %i4
	ldd	[%fp-8], %g2
	or	%i4, %g2, %g2
	or	%i5, %g3, %g3
	std	%g2, [%fp-24]
	.loc 1 68 0
	ldd	[%fp-24], %g2
	.loc 1 69 0
	mov	%g2, %i0
	mov	%g3, %i1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	ajit_mmap_get_phy_addr_from_pte, .-ajit_mmap_get_phy_addr_from_pte
	.align 4
	.global ajit_mmap_make_ptd
	.type	ajit_mmap_make_ptd, #function
	.proc	016
ajit_mmap_make_ptd:
.LFB5:
	.loc 1 72 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	st	%i1, [%fp-24]
	st	%i2, [%fp-20]
	stb	%g1, [%fp+68]
	.loc 1 73 0
	ldd	[%fp-24], %i4
	std	%i4, [%fp-8]
	.loc 1 74 0
	ld	[%fp-8], %g1
	sll	%g1, 26, %g1
	ld	[%fp-4], %g4
	srl	%g4, 6, %g3
	or	%g1, %g3, %g3
	ld	[%fp-8], %g1
	srl	%g1, 6, %g2
	srl	%g3, 30, %g1
	sll	%g2, 2, %g4
	or	%g4, %g1, %g1
	st	%g1, [%fp-8]
	sll	%g3, 2, %g1
	st	%g1, [%fp-4]
	.loc 1 75 0
	ld	[%fp-4], %g1
	or	%g1, 1, %g1
	st	%g1, [%fp-12]
	.loc 1 76 0
	ld	[%fp-12], %g1
	.loc 1 77 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	ajit_mmap_make_ptd, .-ajit_mmap_make_ptd
	.align 4
	.global ajit_mmap_make_pte
	.type	ajit_mmap_make_pte, #function
	.proc	016
ajit_mmap_make_pte:
.LFB6:
	.loc 1 80 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g2
	mov	%i1, %g1
	st	%i2, [%fp+76]
	st	%i3, [%fp-24]
	st	%i4, [%fp-20]
	stb	%g2, [%fp+68]
	stb	%g1, [%fp+72]
	.loc 1 81 0
	ld	[%fp-24], %g1
	sll	%g1, 20, %g1
	ld	[%fp-20], %g2
	srl	%g2, 12, %g2
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
	ld	[%fp-24], %g1
	srl	%g1, 12, %g1
	st	%g1, [%fp-8]
	.loc 1 82 0
	ld	[%fp-4], %g2
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	sll	%g1, 2, %g1
	or	%g2, %g1, %g1
	or	%g1, 2, %g1
	st	%g1, [%fp-12]
	.loc 1 83 0
	ld	[%fp-12], %g1
	.loc 1 84 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	ajit_mmap_make_pte, .-ajit_mmap_make_pte
	.align 4
	.global ajit_lookup_mmap
	.type	ajit_lookup_mmap, #function
	.proc	04
ajit_lookup_mmap:
.LFB7:
	.loc 1 111 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI7:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-48]
	mov	%i2, %g1
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	stb	%g1, [%fp+76]
	.loc 1 112 0
	st	%g0, [%fp-4]
	.loc 1 113 0
	ld	[%fp+84], %g1
	stb	%g0, [%g1]
	.loc 1 114 0
	ld	[%fp+88], %g1
	st	%g0, [%g1]
	st	%g0, [%g1+4]
	.loc 1 115 0
	ld	[%fp+92], %g1
	st	%g0, [%g1]
	st	%g0, [%g1+4]
	.loc 1 116 0
	ld	[%fp+96], %g1
	st	%g0, [%g1]
	.loc 1 118 0
	ldd	[%fp-48], %i4
	std	%i4, [%fp-32]
	.loc 1 119 0
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	sll	%g1, 2, %g1
	mov	%g1, %g3
	sra	%g1, 31, %g1
	mov	%g1, %g2
	ldd	[%fp-32], %i2
	addcc	%g3, %i3, %i5
	addx	%g2, %i2, %i4
	std	%i4, [%fp-16]
	.loc 1 120 0
	stb	%g0, [%fp-17]
.L32:
.LBB2:
	.loc 1 125 0
	ldd	[%fp-16], %o0
	call	__ajit_load_word_from_physical_address__, 0
	 nop
	st	%o0, [%fp-36]
	.loc 1 129 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L26
	 nop
	.loc 1 129 0 is_stmt 0 discriminator 1
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	b	.L27
	 nop
.L26:
	.loc 1 129 0 discriminator 2
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	mov	%g1, %o0
	ld	[%fp+80], %o1
	call	ajit_mmap_index_into_table, 0
	 nop
	mov	%o0, %g1
.L27:
	.loc 1 128 0 is_stmt 1
	st	%g1, [%fp-40]
	.loc 1 132 0
	ld	[%fp+84], %g1
	ldub	[%fp-17], %g2
	stb	%g2, [%g1]
	.loc 1 133 0
	ld	[%fp+92], %g1
	ldd	[%fp-16], %g2
	std	%g2, [%g1]
	.loc 1 134 0
	ld	[%fp+96], %g1
	ld	[%fp-36], %g2
	st	%g2, [%g1]
	.loc 1 137 0
	ld	[%fp-36], %o0
	call	ajit_mmap_is_ptd, 0
	 nop
	mov	%o0, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L28
	 nop
	.loc 1 141 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-36], %o0
	mov	%g1, %o1
	ld	[%fp-40], %o2
	call	ajit_mmap_get_phy_addr_from_ptd, 0
	 nop
	std	%o0, [%fp-16]
	b	.L29
	 nop
.L28:
	.loc 1 145 0
	ld	[%fp-36], %o0
	call	ajit_mmap_is_pte, 0
	 nop
	mov	%o0, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L29
	 nop
	.loc 1 148 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-36], %o0
	mov	%g1, %o1
	ld	[%fp+80], %o2
	call	ajit_mmap_get_phy_addr_from_pte, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	ld	[%fp+88], %g1
	std	%g2, [%g1]
	.loc 1 149 0
	mov	1, %g1
	st	%g1, [%fp-4]
	.loc 1 150 0
	b	.L30
	 nop
.L29:
	.loc 1 153 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 3
	be	.L34
	 nop
.L31:
	.loc 1 158 0
	ldub	[%fp-17], %g1
	add	%g1, 1, %g1
	stb	%g1, [%fp-17]
.LBE2:
	.loc 1 159 0
	b	.L32
	 nop
.L34:
.LBB3:
	.loc 1 155 0
	nop
.L30:
.LBE3:
	.loc 1 161 0
	ld	[%fp-4], %g1
	.loc 1 162 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	ajit_lookup_mmap, .-ajit_lookup_mmap
	.align 4
	.global ajit_mmap_operation
	.type	ajit_mmap_operation, #function
	.proc	04
ajit_mmap_operation:
.LFB8:
	.loc 1 184 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI8:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-40]
	mov	%i2, %g4
	mov	%i3, %g3
	mov	%i4, %g2
	mov	%i5, %g1
	stb	%g4, [%fp+76]
	stb	%g3, [%fp+80]
	stb	%g2, [%fp+84]
	stb	%g1, [%fp+88]
	.loc 1 185 0
	st	%g0, [%fp-4]
	.loc 1 191 0
	ldub	[%fp+80], %g1
	and	%g1, 0xff, %g3
	add	%fp, -6, %g2
	add	%fp, -32, %g1
	add	%fp, -24, %g4
	st	%g4, [%sp+92]
	add	%fp, -12, %g4
	st	%g4, [%sp+96]
	ldd	[%fp-40], %o0
	mov	%g3, %o2
	ld	[%fp+92], %o3
	mov	%g2, %o4
	mov	%g1, %o5
	call	ajit_lookup_mmap, 0
	 nop
	mov	%o0, %g1
	stb	%g1, [%fp-5]
	.loc 1 197 0
	ldub	[%fp-6], %g1
	and	%g1, 0xff, %g2
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g2, %g1
	bne	.L36
	 nop
	.loc 1 199 0
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 1
	bne	.L37
	 nop
	.loc 1 202 0
	ld	[%fp+96], %g1
	mov	0, %g2
	mov	%g1, %g3
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g4
	ldub	[%fp+88], %g1
	and	%g1, 0xff, %g1
	mov	%g4, %o0
	mov	%g1, %o1
	ld	[%fp+92], %o2
	mov	%g2, %o3
	mov	%g3, %o4
	call	ajit_mmap_make_pte, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-12]
	b	.L38
	 nop
.L37:
	.loc 1 204 0
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 2
	bne	.L38
	 nop
	.loc 1 206 0
	st	%g0, [%fp-12]
.L38:
	.loc 1 209 0
	ld	[%fp-12], %g1
	ldd	[%fp-24], %g2
	mov	%g1, %o0
	mov	%g2, %o1
	mov	%g3, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 nop
	b	.L39
	 nop
.L36:
	.loc 1 213 0
	mov	1, %g1
	st	%g1, [%fp-4]
.L39:
	.loc 1 216 0
	ld	[%fp-4], %g1
	.loc 1 217 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE8:
	.size	ajit_mmap_operation, .-ajit_mmap_operation
.Letext0:
	.file 2 "/home/tools_shared/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x4b2
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF46
	.byte	0x1
	.uaword	.LASF47
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF2
	.uleb128 0x4
	.uaword	.LASF5
	.byte	0x2
	.byte	0x2e
	.uaword	0x48
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x4
	.uaword	.LASF6
	.byte	0x2
	.byte	0x34
	.uaword	0x61
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x4
	.uaword	.LASF8
	.byte	0x2
	.byte	0x37
	.uaword	0x73
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF12
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF13
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF15
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.uaword	0x56
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xe0
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0x7
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.asciz	"va"
	.byte	0x1
	.byte	0x7
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x9
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF16
	.byte	0x1
	.byte	0x1b
	.byte	0x1
	.uaword	0x3d
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x11b
	.uleb128 0x6
	.uaword	.LASF17
	.byte	0x1
	.byte	0x1b
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.asciz	"rv"
	.byte	0x1
	.byte	0x1d
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF19
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.uaword	0x3d
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x156
	.uleb128 0x6
	.uaword	.LASF17
	.byte	0x1
	.byte	0x21
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.asciz	"rv"
	.byte	0x1
	.byte	0x23
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF20
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.uaword	0x68
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x1b0
	.uleb128 0x7
	.asciz	"ptd"
	.byte	0x1
	.byte	0x27
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0x27
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.uaword	.LASF21
	.byte	0x1
	.byte	0x27
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x8
	.uaword	.LASF22
	.byte	0x1
	.byte	0x29
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0x32
	.byte	0x1
	.uaword	0x68
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x224
	.uleb128 0x7
	.asciz	"pte"
	.byte	0x1
	.byte	0x32
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0x32
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x7
	.asciz	"va"
	.byte	0x1
	.byte	0x32
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x8
	.uaword	.LASF24
	.byte	0x1
	.byte	0x34
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x9
	.asciz	"ppn"
	.byte	0x1
	.byte	0x3e
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.asciz	"pa"
	.byte	0x1
	.byte	0x3f
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF25
	.byte	0x1
	.byte	0x47
	.byte	0x1
	.uaword	0x56
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x27b
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0x47
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.asciz	"pa"
	.byte	0x1
	.byte	0x47
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.uaword	.LASF26
	.byte	0x1
	.byte	0x49
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x9
	.asciz	"ptd"
	.byte	0x1
	.byte	0x4b
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF27
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.uaword	0x56
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x2ef
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0x4f
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.asciz	"acc"
	.byte	0x1
	.byte	0x4f
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x7
	.asciz	"va"
	.byte	0x1
	.byte	0x4f
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x7
	.asciz	"pa"
	.byte	0x1
	.byte	0x4f
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.uaword	.LASF28
	.byte	0x1
	.byte	0x51
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x9
	.asciz	"pte"
	.byte	0x1
	.byte	0x52
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.uaword	.LASF29
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.uaword	0x2f
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST7
	.byte	0x1
	.uaword	0x3ce
	.uleb128 0x6
	.uaword	.LASF30
	.byte	0x1
	.byte	0x61
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.uaword	.LASF31
	.byte	0x1
	.byte	0x63
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x7
	.asciz	"va"
	.byte	0x1
	.byte	0x65
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0x67
	.uaword	0x3ce
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x7
	.asciz	"pa"
	.byte	0x1
	.byte	0x69
	.uaword	0x3d4
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x6
	.uaword	.LASF32
	.byte	0x1
	.byte	0x6b
	.uaword	0x3d4
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x6
	.uaword	.LASF33
	.byte	0x1
	.byte	0x6e
	.uaword	0x3da
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x70
	.uaword	0x2f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x8
	.uaword	.LASF34
	.byte	0x1
	.byte	0x76
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.uaword	.LASF35
	.byte	0x1
	.byte	0x77
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x8
	.uaword	.LASF36
	.byte	0x1
	.byte	0x78
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xb
	.uaword	.Ldebug_ranges0+0
	.uleb128 0x8
	.uaword	.LASF37
	.byte	0x1
	.byte	0x7d
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.uaword	.LASF38
	.byte	0x1
	.byte	0x80
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.uaword	0x3d
	.uleb128 0xc
	.byte	0x4
	.uaword	0x68
	.uleb128 0xc
	.byte	0x4
	.uaword	0x56
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF48
	.byte	0x1
	.byte	0xa8
	.byte	0x1
	.uaword	0x2f
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST8
	.byte	0x1
	.uleb128 0x6
	.uaword	.LASF39
	.byte	0x1
	.byte	0xaa
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.uaword	.LASF40
	.byte	0x1
	.byte	0xac
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x6
	.uaword	.LASF31
	.byte	0x1
	.byte	0xae
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x1
	.byte	0xb0
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x7
	.asciz	"acc"
	.byte	0x1
	.byte	0xb2
	.uaword	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x7
	.asciz	"va"
	.byte	0x1
	.byte	0xb4
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x7
	.asciz	"pa"
	.byte	0x1
	.byte	0xb6
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0xb9
	.uaword	0x2f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x8
	.uaword	.LASF41
	.byte	0x1
	.byte	0xbb
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x8
	.uaword	.LASF42
	.byte	0x1
	.byte	0xbc
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x8
	.uaword	.LASF43
	.byte	0x1
	.byte	0xbd
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.uaword	.LASF44
	.byte	0x1
	.byte	0xbe
	.uaword	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.uaword	.LASF45
	.byte	0x1
	.byte	0xbf
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -5
	.byte	0
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
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
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
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
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LFB0-.Ltext0
	.uaword	.LCFI0-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI0-.Ltext0
	.uaword	.LFE0-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LFB1-.Ltext0
	.uaword	.LCFI1-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI1-.Ltext0
	.uaword	.LFE1-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LFB2-.Ltext0
	.uaword	.LCFI2-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI2-.Ltext0
	.uaword	.LFE2-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LFB3-.Ltext0
	.uaword	.LCFI3-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI3-.Ltext0
	.uaword	.LFE3-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LFB4-.Ltext0
	.uaword	.LCFI4-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI4-.Ltext0
	.uaword	.LFE4-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LFB5-.Ltext0
	.uaword	.LCFI5-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI5-.Ltext0
	.uaword	.LFE5-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LFB6-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE6-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LFB7-.Ltext0
	.uaword	.LCFI7-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI7-.Ltext0
	.uaword	.LFE7-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LFB8-.Ltext0
	.uaword	.LCFI8-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI8-.Ltext0
	.uaword	.LFE8-.Ltext0
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LBB2-.Ltext0
	.uaword	.LBE2-.Ltext0
	.uaword	.LBB3-.Ltext0
	.uaword	.LBE3-.Ltext0
	.uaword	0
	.uaword	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF33:
	.asciz	"ptde"
.LASF23:
	.asciz	"ajit_mmap_get_phy_addr_from_pte"
.LASF36:
	.asciz	"current_level"
.LASF26:
	.asciz	"pa_shifted"
.LASF28:
	.asciz	"ppn_64"
.LASF47:
	.asciz	"/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mmap.c"
.LASF14:
	.asciz	"level"
.LASF7:
	.asciz	"unsigned int"
.LASF17:
	.asciz	"entry"
.LASF8:
	.asciz	"uint64_t"
.LASF45:
	.asciz	"status"
.LASF24:
	.asciz	"page_offset"
.LASF29:
	.asciz	"ajit_lookup_mmap"
.LASF39:
	.asciz	"page_table_base_phy_address"
.LASF3:
	.asciz	"unsigned char"
.LASF10:
	.asciz	"long unsigned int"
.LASF4:
	.asciz	"short unsigned int"
.LASF15:
	.asciz	"ajit_mmap_index_into_table"
.LASF41:
	.asciz	"pdte_level"
.LASF43:
	.asciz	"pdte_a"
.LASF37:
	.asciz	"current_entry"
.LASF18:
	.asciz	"ret_val"
.LASF27:
	.asciz	"ajit_mmap_make_pte"
.LASF30:
	.asciz	"page_table_base_phy_addr"
.LASF44:
	.asciz	"ign_pa"
.LASF19:
	.asciz	"ajit_mmap_is_ptd"
.LASF16:
	.asciz	"ajit_mmap_is_pte"
.LASF9:
	.asciz	"long long unsigned int"
.LASF5:
	.asciz	"uint8_t"
.LASF40:
	.asciz	"operation"
.LASF25:
	.asciz	"ajit_mmap_make_ptd"
.LASF38:
	.asciz	"index_into_table"
.LASF31:
	.asciz	"context"
.LASF12:
	.asciz	"sizetype"
.LASF2:
	.asciz	"long long int"
.LASF13:
	.asciz	"char"
.LASF21:
	.asciz	"index"
.LASF46:
	.asciz	"GNU C 4.7.4"
.LASF1:
	.asciz	"short int"
.LASF42:
	.asciz	"pdte"
.LASF6:
	.asciz	"uint32_t"
.LASF11:
	.asciz	"long int"
.LASF22:
	.asciz	"phy_addr"
.LASF35:
	.asciz	"current_entry_address"
.LASF0:
	.asciz	"signed char"
.LASF34:
	.asciz	"context_table_base_address"
.LASF48:
	.asciz	"ajit_mmap_operation"
.LASF32:
	.asciz	"ptde_a"
.LASF20:
	.asciz	"ajit_mmap_get_phy_addr_from_ptd"
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

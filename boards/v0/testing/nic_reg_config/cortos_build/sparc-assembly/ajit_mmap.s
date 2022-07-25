	.file	"ajit_mmap.c"
	.section	".text"
	.align 4
	.global ajit_mmap_index_into_table
	.type	ajit_mmap_index_into_table, #function
	.proc	016
ajit_mmap_index_into_table:
	cmp	%o0, 2
	be	.L4
	 cmp	%o0, 3
	be	.L5
	 cmp	%o0, 1
	be	.L9
	 nop
	jmp	%o7+8
	 mov	0, %o0
.L9:
	jmp	%o7+8
	 srl	%o1, 24, %o0
.L5:
	srl	%o1, 12, %o0
	jmp	%o7+8
	 and	%o0, 63, %o0
.L4:
	srl	%o1, 18, %o0
	jmp	%o7+8
	 and	%o0, 63, %o0
	.size	ajit_mmap_index_into_table, .-ajit_mmap_index_into_table
	.align 4
	.global ajit_mmap_is_pte
	.type	ajit_mmap_is_pte, #function
	.proc	014
ajit_mmap_is_pte:
	and	%o0, 3, %o0
	xor	%o0, 2, %o0
	subcc	%g0, %o0, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	ajit_mmap_is_pte, .-ajit_mmap_is_pte
	.align 4
	.global ajit_mmap_is_ptd
	.type	ajit_mmap_is_ptd, #function
	.proc	014
ajit_mmap_is_ptd:
	and	%o0, 3, %o0
	xor	%o0, 1, %o0
	subcc	%g0, %o0, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	ajit_mmap_is_ptd, .-ajit_mmap_is_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_ptd
	.type	ajit_mmap_get_phy_addr_from_ptd, #function
	.proc	017
ajit_mmap_get_phy_addr_from_ptd:
	and	%o0, -4, %o0
	sll	%o2, 2, %o2
	srl	%o0, 28, %g2
	mov	%o2, %o3
	sll	%o0, 4, %g3
	mov	0, %o2
	or	%o3, %g3, %g3
	or	%o2, %g2, %g2
	mov	%g3, %o1
	jmp	%o7+8
	 mov	%g2, %o0
	.size	ajit_mmap_get_phy_addr_from_ptd, .-ajit_mmap_get_phy_addr_from_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_pte
	.type	ajit_mmap_get_phy_addr_from_pte, #function
	.proc	017
ajit_mmap_get_phy_addr_from_pte:
	cmp	%o1, 3
	be	.L18
	 cmp	%o1, 2
	be	.L19
	 mov	0, %o4
	cmp	%o1, 1
	be	.L20
	 mov	%o2, %o5
	srl	%o0, 8, %g1
	srl	%o0, 28, %g2
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
.L18:
	and	%o2, 4095, %o4
	srl	%o0, 8, %g1
	mov	%o4, %o5
	srl	%o0, 28, %g2
	mov	0, %o4
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
.L19:
	sethi	%hi(-16384), %o4
	andn	%o2, %o4, %o4
	srl	%o0, 8, %g1
	mov	%o4, %o5
	srl	%o0, 28, %g2
	mov	0, %o4
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
.L20:
	sethi	%hi(-16777216), %o4
	andn	%o2, %o4, %o4
	srl	%o0, 8, %g1
	mov	%o4, %o5
	srl	%o0, 28, %g2
	mov	0, %o4
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
	.size	ajit_mmap_get_phy_addr_from_pte, .-ajit_mmap_get_phy_addr_from_pte
	.align 4
	.global ajit_mmap_make_ptd
	.type	ajit_mmap_make_ptd, #function
	.proc	016
ajit_mmap_make_ptd:
	sll	%o1, 26, %g1
	srl	%o2, 6, %o2
	or	%g1, %o2, %o2
	sll	%o2, 2, %g3
	jmp	%o7+8
	 or	%g3, 1, %o0
	.size	ajit_mmap_make_ptd, .-ajit_mmap_make_ptd
	.align 4
	.global ajit_mmap_make_pte
	.type	ajit_mmap_make_pte, #function
	.proc	016
ajit_mmap_make_pte:
	sll	%o1, 2, %o1
	sll	%o3, 20, %o3
	or	%o1, 2, %o0
	srl	%o4, 12, %o4
	or	%o3, %o4, %o4
	jmp	%o7+8
	 or	%o0, %o4, %o0
	.size	ajit_mmap_make_pte, .-ajit_mmap_make_pte
	.align 4
	.global ajit_lookup_mmap
	.type	ajit_lookup_mmap, #function
	.proc	04
ajit_lookup_mmap:
	save	%sp, -96, %sp
	stb	%g0, [%i4]
	st	%g0, [%i5]
	st	%g0, [%i5+4]
	ld	[%fp+92], %l2
	st	%g0, [%l2]
	st	%g0, [%l2+4]
	ld	[%fp+96], %l3
	sll	%i2, 2, %g1
	srl	%i3, 18, %l4
	addcc	%g1, %i1, %o5
	srl	%i3, 12, %l5
	mov	0, %g2
	st	%g0, [%l3]
	addx	%g2, %i0, %o4
	mov	%o5, %i1
	mov	%o4, %i0
	srl	%i3, 24, %l6
	and	%l4, 63, %l4
	and	%l5, 63, %l5
	mov	0, %l7
.L35:
	mov	%i0, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%i1, %o1
	andcc	%l7, 0xff, %g1
	be	.L25
	 mov	%i2, %g3
	cmp	%g1, 2
	be	.L25
	 mov	%l4, %g3
	cmp	%g1, 3
	be	.L25
	 mov	%l5, %g3
	mov	%l6, %g3
.L25:
	stb	%l7, [%i4]
	std	%i0, [%l2]
	and	%o0, 3, %g2
	cmp	%g2, 1
	be	.L40
	 st	%o0, [%l3]
	cmp	%g2, 2
	be	.L41
	 cmp	%g1, 3
	be	.L37
	 nop
.L42:
	b	.L35
	 add	%l7, 1, %l7
.L40:
	sll	%g3, 2, %i0
	and	%o0, -4, %o0
	mov	%i0, %i1
	srl	%o0, 28, %l0
	mov	0, %i0
	sll	%o0, 4, %l1
	or	%i0, %l0, %i0
	cmp	%g1, 3
	bne	.L42
	 or	%i1, %l1, %i1
.L37:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L41:
	be	.L43
	 cmp	%g1, 2
	be	.L44
	 cmp	%g1, 1
	mov	0, %o4
	be	.L45
	 mov	%i3, %o5
.L31:
	srl	%o0, 8, %g1
	srl	%o0, 28, %g2
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	std	%g2, [%i5]
	jmp	%i7+8
	 restore %g0, 1, %o0
.L45:
	sethi	%hi(-16777216), %g1
	mov	0, %o4
	andn	%i3, %g1, %i3
	b	.L31
	 mov	%i3, %o5
.L43:
	and	%i3, 4095, %i3
	mov	0, %o4
	b	.L31
	 mov	%i3, %o5
.L44:
	sethi	%hi(-16384), %g1
	mov	0, %o4
	andn	%i3, %g1, %i3
	b	.L31
	 mov	%i3, %o5
	.size	ajit_lookup_mmap, .-ajit_lookup_mmap
	.align 4
	.global ajit_mmap_operation
	.type	ajit_mmap_operation, #function
	.proc	04
ajit_mmap_operation:
	save	%sp, -128, %sp
	add	%fp, -16, %g1
	st	%g1, [%sp+92]
	add	%fp, -20, %g1
	mov	%i0, %o0
	st	%g1, [%sp+96]
	mov	%i1, %o1
	mov	%i3, %o2
	ld	[%fp+92], %o3
	add	%fp, -21, %o4
	call	ajit_lookup_mmap, 0
	 add	%fp, -8, %o5
	cmp	%o0, 1
	be	.L51
	 ldub	[%fp-21], %g1
	cmp	%g1, %i4
	bne	.L56
	 mov	1, %i0
	cmp	%i2, 1
	be	.L54
	 cmp	%i2, 2
	be	.L55
	 ld	[%fp-20], %o0
.L49:
	ld	[%fp-16], %o1
	ld	[%fp-12], %o2
	call	__ajit_store_word_to_physical_address__, 0
	 mov	0, %i0
.L56:
	jmp	%i7+8
	 restore
.L54:
	sll	%i5, 2, %i5
	ld	[%fp+96], %g1
	or	%i5, 2, %o0
	srl	%g1, 12, %g1
	or	%o0, %g1, %o0
	b	.L49
	 st	%o0, [%fp-20]
.L51:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L55:
	st	%g0, [%fp-20]
	b	.L49
	 mov	0, %o0
	.size	ajit_mmap_operation, .-ajit_mmap_operation
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

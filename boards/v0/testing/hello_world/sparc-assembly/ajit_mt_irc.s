	.file	"ajit_mt_irc.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global readInterruptControlRegister
	.type	readInterruptControlRegister, #function
	.proc	016
readInterruptControlRegister:
.LFB0:
	.file 1 "/home/madhav/AjitToolChain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mt_irc.c"
	.loc 1 9 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 10 0
	ld	[%fp+68], %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+72], %g1
	add	%g2, %g1, %g1
	sll	%g1, 2, %g1
	mov	%g1, %g2
	sethi	%hi(-53248), %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 11 0
	ld	[%fp-4], %o0
	call	__ajit_load_word_mmu_bypass__, 0
	 nop
	st	%o0, [%fp-8]
	.loc 1 12 0
	ld	[%fp-8], %g1
	.loc 1 13 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	readInterruptControlRegister, .-readInterruptControlRegister
	.align 4
	.global writeInterruptControlRegister
	.type	writeInterruptControlRegister, #function
	.proc	020
writeInterruptControlRegister:
.LFB1:
	.loc 1 16 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 17 0
	ld	[%fp+68], %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+72], %g1
	add	%g2, %g1, %g1
	sll	%g1, 2, %g1
	mov	%g1, %g2
	sethi	%hi(-53248), %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 18 0
	ld	[%fp-4], %o0
	ld	[%fp+76], %o1
	call	__ajit_store_word_mmu_bypass__, 0
	 nop
	.loc 1 20 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	writeInterruptControlRegister, .-writeInterruptControlRegister
	.align 4
	.global enableInterruptController
	.type	enableInterruptController, #function
	.proc	020
enableInterruptController:
.LFB2:
	.loc 1 25 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 26 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 27 0
	ld	[%fp-4], %g1
	or	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 28 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 29 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	enableInterruptController, .-enableInterruptController
	.align 4
	.global disableInterruptController
	.type	disableInterruptController, #function
	.proc	020
disableInterruptController:
.LFB3:
	.loc 1 33 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 34 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 35 0
	ld	[%fp-4], %g1
	and	%g1, -2, %g1
	st	%g1, [%fp-4]
	.loc 1 36 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 37 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	disableInterruptController, .-disableInterruptController
	.align 4
	.global enableInterrupt
	.type	enableInterrupt, #function
	.proc	020
enableInterrupt:
.LFB4:
	.loc 1 42 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 43 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 44 0
	mov	1, %g2
	ld	[%fp+76], %g1
	sll	%g2, %g1, %g1
	ld	[%fp-4], %g2
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 45 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 46 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	enableInterrupt, .-enableInterrupt
	.align 4
	.global disableInterrupt
	.type	disableInterrupt, #function
	.proc	020
disableInterrupt:
.LFB5:
	.loc 1 50 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 51 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 52 0
	mov	1, %g2
	ld	[%fp+76], %g1
	sll	%g2, %g1, %g1
	xnor	%g0, %g1, %g1
	ld	[%fp-4], %g2
	and	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 53 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 54 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	disableInterrupt, .-disableInterrupt
.Letext0:
	.file 2 "/home/madhav/AjitToolChain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x25e
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF21
	.byte	0x1
	.uaword	.LASF22
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x4
	.uaword	.LASF23
	.byte	0x2
	.byte	0x34
	.uaword	0x56
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF10
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF24
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.uaword	0x4b
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xd9
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x8
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x8
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x7
	.uaword	.LASF13
	.byte	0x1
	.byte	0xa
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.uaword	.LASF14
	.byte	0x1
	.byte	0xb
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF16
	.byte	0x1
	.byte	0xf
	.byte	0x1
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x12f
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0xf
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0xf
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.uaword	.LASF15
	.byte	0x1
	.byte	0xf
	.uaword	0x4b
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x7
	.uaword	.LASF13
	.byte	0x1
	.byte	0x11
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF17
	.byte	0x1
	.byte	0x18
	.byte	0x1
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x175
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x18
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x18
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.asciz	"cv"
	.byte	0x1
	.byte	0x1a
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF18
	.byte	0x1
	.byte	0x20
	.byte	0x1
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x1bb
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x20
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x20
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.asciz	"cv"
	.byte	0x1
	.byte	0x22
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF19
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x210
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x29
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x29
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.uaword	.LASF20
	.byte	0x1
	.byte	0x29
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x9
	.asciz	"cv"
	.byte	0x1
	.byte	0x2b
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.uaword	.LASF25
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST5
	.byte	0x1
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x31
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x31
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.uaword	.LASF20
	.byte	0x1
	.byte	0x31
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x9
	.asciz	"cv"
	.byte	0x1
	.byte	0x33
	.uaword	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
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
	.uleb128 0x2116
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
	.uleb128 0x8
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
.LASF2:
	.asciz	"long long int"
.LASF5:
	.asciz	"unsigned int"
.LASF18:
	.asciz	"disableInterruptController"
.LASF16:
	.asciz	"writeInterruptControlRegister"
.LASF17:
	.asciz	"enableInterruptController"
.LASF21:
	.asciz	"GNU C 4.7.4"
.LASF7:
	.asciz	"long unsigned int"
.LASF6:
	.asciz	"long long unsigned int"
.LASF13:
	.asciz	"addr"
.LASF25:
	.asciz	"disableInterrupt"
.LASF3:
	.asciz	"unsigned char"
.LASF10:
	.asciz	"char"
.LASF23:
	.asciz	"uint32_t"
.LASF8:
	.asciz	"long int"
.LASF14:
	.asciz	"ret_val"
.LASF20:
	.asciz	"interrupt_id"
.LASF4:
	.asciz	"short unsigned int"
.LASF0:
	.asciz	"signed char"
.LASF24:
	.asciz	"readInterruptControlRegister"
.LASF15:
	.asciz	"value"
.LASF11:
	.asciz	"core_id"
.LASF19:
	.asciz	"enableInterrupt"
.LASF1:
	.asciz	"short int"
.LASF12:
	.asciz	"thread_id"
.LASF9:
	.asciz	"sizetype"
.LASF22:
	.asciz	"/home/madhav/AjitToolChain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mt_irc.c"
	.ident	"GCC: (Buildroot 2014.08-g9d8f423-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

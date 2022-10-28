	.file	"cortos_traps_init.c"
	.section	".text"
	.align 4
	.global cortos_init_hw_traps
	.type	cortos_init_hw_traps, #function
	.proc	020
cortos_init_hw_traps:
	save	%sp, -96, %sp
	call	ajit_initialize_interrupt_handlers_to_null, 0
	 mov	0, %i0
	call	enableInterruptControllerAndAllInterrupts, 0
	 restore %g0, 0, %o1
	.size	cortos_init_hw_traps, .-cortos_init_hw_traps
	.align 4
	.global cortos_init_sw_traps
	.type	cortos_init_sw_traps, #function
	.proc	020
cortos_init_sw_traps:
	or	%o7, %g0, %g1
	call	ajit_initialize_sw_trap_handlers_to_null, 0
	 or	%g1, %g0, %o7
	.size	cortos_init_sw_traps, .-cortos_init_sw_traps
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits

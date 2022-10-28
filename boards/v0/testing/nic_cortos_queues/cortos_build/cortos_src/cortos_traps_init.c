


void cortos_init_hw_traps() {
  ajit_initialize_interrupt_handlers_to_null();


  enableInterruptControllerAndAllInterrupts(0,0);
}

void cortos_init_sw_traps() {
  ajit_initialize_sw_trap_handlers_to_null();

}

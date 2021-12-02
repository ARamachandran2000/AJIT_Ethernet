
// Description: Used on signals crossing from one clock domain to another, this
//              is a multiple flip-flop pipeline, with all flops placed together
//              into the same slice.  Thus the routing delay between the two is
//              minimum to safe-guard against metastability issues.
// -----------------------------------------------------------------------------

`timescale 1ps / 1ps

(* dont_touch = "yes" *)
module axi_10g_ethernet_0_sync_block #(
  parameter   C_NUM_SYNC_REGS = 5
  )
  (
    input   wire  clk,
    input   wire  data_in,
    output  wire  data_out
  );

(* shreg_extract = "no", ASYNC_REG = "TRUE" *) reg  [C_NUM_SYNC_REGS-1:0]    sync1_r = {C_NUM_SYNC_REGS{1'b0}};

  //----------------------------------------------------------------------------
  // Synchronizer
  //----------------------------------------------------------------------------
  always @(posedge clk) begin
    sync1_r <= {sync1_r[C_NUM_SYNC_REGS-2:0], data_in};
  end

  assign data_out = sync1_r[C_NUM_SYNC_REGS-1];
endmodule


// Description: This module provides a parameterizable multi stage
//              FF Synchronizer with appropriate synth attributes
//              to mark ASYNC_REG and prevent SRL inference
//              An active high reset is included with a parameterized reset
//              value
//---------------------------------------------------------------------------

`timescale 1ns / 1ps

module axi_10g_ethernet_0_ff_synchronizer_rst2 #(
  parameter   C_NUM_SYNC_REGS = 3,
  parameter   C_RVAL = 1'b0
  )
  (
    input   wire  clk,
    input   wire  rst,
    input   wire  data_in,
    output  wire  data_out
  );

(* shreg_extract = "no", ASYNC_REG = "TRUE" *) reg  [C_NUM_SYNC_REGS-1:0]    sync1_r = {C_NUM_SYNC_REGS{C_RVAL}};

  //----------------------------------------------------------------------------
  // Synchronizer
  //----------------------------------------------------------------------------
  always @(posedge clk or posedge rst) begin
    if(rst)
      sync1_r <= {C_NUM_SYNC_REGS{C_RVAL}};
    else
      sync1_r <= {sync1_r[C_NUM_SYNC_REGS-2:0], data_in};
  end

  assign data_out = sync1_r[C_NUM_SYNC_REGS-1];
endmodule

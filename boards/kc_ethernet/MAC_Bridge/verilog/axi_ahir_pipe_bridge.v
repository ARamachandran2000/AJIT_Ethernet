`timescale 1ns / 1ps

module axi_ahir_pipe_bridge(
     input rx_reset,
     input rx_aclk,
       // tx clk resets
     input tx_reset,
     input tx_aclk,
       
       // rx inputs
     input [7:0] rx_axis_mac_tdata,
     input       rx_axis_mac_tvalid,
     input       rx_axis_mac_tlast,
     input       rx_axis_mac_tuser,
       
       // rx pipe outputs
     output  [9:0]  rx_pipe_pipe_write_data,
     output  rx_pipe_pipe_write_req,
     input   rx_pipe_pipe_write_ack,
       
       // tx pipe inputs
     output  [7:0]  tx_axis_mac_tdata,
     output  tx_axis_mac_tvalid, 
     output  tx_axis_mac_tlast, 
     output  tx_axis_mac_tuser, 
     input   tx_axis_mac_tready,
       
       // tx outputs
     input [9:0]  tx_pipe_pipe_read_data,
     output  tx_pipe_pipe_read_req,
     input   tx_pipe_pipe_read_ack

    );
    
    // assuming no crc error.
    assign tx_axis_mac_tuser = 1'b0;
    
    mac_rx_interface rx_fifo_inst(
        .clk(rx_aclk),
        .reset(rx_reset),
        .rx_axis_tdata(rx_axis_mac_tdata),
        .rx_axis_tkeep(),
        .rx_axis_tvalid(rx_axis_mac_tvalid),
        .rx_axis_tlast(rx_axis_mac_tlast),
        .RX_FIFO_pipe_read_data(rx_pipe_pipe_write_data), // out
        .RX_FIFO_pipe_read_req(rx_pipe_pipe_write_ack), // in 
        .RX_FIFO_pipe_read_ack(rx_pipe_pipe_write_req)// out
    
    );
    
    mac_tx_interface tx_fifo_inst(
        .clk(tx_aclk),
        .reset(tx_reset),
        .tx_axis_tdata(tx_axis_mac_tdata),
        .tx_axis_tkeep(),
        .tx_axis_tvalid(tx_axis_mac_tvalid),
        .tx_axis_tlast(tx_axis_mac_tlast),
        .tx_axis_tready(tx_axis_mac_tready),
        .TX_FIFO_pipe_write_data(tx_pipe_pipe_read_data), // in
        .TX_FIFO_pipe_write_req(tx_pipe_pipe_read_ack), // in
        .TX_FIFO_pipe_write_ack(tx_pipe_pipe_read_req) // out
    );
    
    
endmodule

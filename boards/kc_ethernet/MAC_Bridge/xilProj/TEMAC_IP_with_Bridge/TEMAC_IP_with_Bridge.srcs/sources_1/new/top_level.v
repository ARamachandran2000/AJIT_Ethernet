`timescale 1ns / 1ps

module top_level(
    
     // asynchronous reset
     input         glbl_rst,

     // 200MHz clock input from board
     input         clk_in_p,
     input         clk_in_n,
     // 125 MHz clock from MMCM
     output        gtx_clk_bufg_out,

     output        phy_resetn,

    
    
    // uart
    input serIn,
    output serOut,


     // RGMII Interface
     //----------------
     output [3:0]  rgmii_txd,
     output        rgmii_tx_ctl,
     output        rgmii_txc,
     input  [3:0]  rgmii_rxd,
     input         rgmii_rx_ctl,
     input         rgmii_rxc,

     
     // MDIO Interface
     //---------------
     inout         mdio,
     output        mdc,


     // Serialised statistics vectors
     //------------------------------
     output        tx_statistics_s,
     output        rx_statistics_s,

     // Serialised Pause interface controls
     //------------------------------------
     input         pause_req_s,

     // Main example design controls
     //-----------------------------
     input  [1:0]  mac_speed,
     input         update_speed,
     //input         serial_command, // tied to pause_req_s
     input         config_board,
     output        serial_response,
     input         gen_tx_data,
     input         chk_tx_data,
     input         reset_error,
     output        frame_error,
     output        frame_errorn,
     output        activity_flash,
     output        activity_flashn

    );
    
    
        
    (* mark_debug = "true" *)wire [9:0]  rx_pipe_pipe_write_data;//in
    (* mark_debug = "true" *)wire        rx_pipe_pipe_write_req;//in
    (* mark_debug = "true" *)wire        rx_pipe_pipe_write_ack; //out
    (* mark_debug = "true" *)wire [9:0]  tx_pipe_pipe_read_data;//out
    (* mark_debug = "true" *)wire        tx_pipe_pipe_read_req;//in
    (* mark_debug = "true" *)wire        tx_pipe_pipe_read_ack;
    
    // rx
    (* mark_debug = "true" *)wire [7:0] rx_axis_mac_tdata;
    (* mark_debug = "true" *)wire rx_axis_mac_tvalid;
    (* mark_debug = "true" *)wire rx_axis_mac_tlast;
    (* mark_debug = "true" *)wire rx_axis_mac_tuser;
    
    // tx
    (* mark_debug = "true" *)wire [7:0] tx_axis_mac_tdata;
    (* mark_debug = "true" *)wire tx_axis_mac_tvalid;
    (* mark_debug = "true" *)wire tx_axis_mac_tlast;
    (* mark_debug = "true" *)wire tx_axis_mac_tuser;
    (* mark_debug = "true" *)wire tx_axis_mac_tready;
    
    // e.g. wires
    wire                 gtx_clk_bufg;
       
       wire                 refclk_bufg;
       wire                 s_axi_aclk;
       wire                 rx_mac_aclk;
       wire                 tx_mac_aclk;
       // resets (and reset generation)
       wire                 s_axi_resetn;
       wire                 chk_resetn;
       
       wire                 gtx_resetn;
       
       wire                 rx_reset;
       wire                 tx_reset;
    
       wire                 dcm_locked;
       wire                 glbl_rst_intn;
    
    
       // USER side RX AXI-S interface
       wire                 rx_fifo_clock;
       wire                 rx_fifo_resetn;
       
       wire  [7:0]          rx_axis_fifo_tdata;
       
       wire                 rx_axis_fifo_tvalid;
       wire                 rx_axis_fifo_tlast;
       wire                 rx_axis_fifo_tready;
    
       // USER side TX AXI-S interface
       wire                 tx_fifo_clock;
       wire                 tx_fifo_resetn;
       
       wire  [7:0]          tx_axis_fifo_tdata;
       
       wire                 tx_axis_fifo_tvalid;
       wire                 tx_axis_fifo_tlast;
       wire                 tx_axis_fifo_tready;
    
       // RX Statistics serialisation signals
       wire                 rx_statistics_valid;
       reg                  rx_statistics_valid_reg;
       wire  [27:0]         rx_statistics_vector;
       reg   [27:0]         rx_stats;
       reg   [29:0]         rx_stats_shift;
       reg                  rx_stats_toggle = 0;
       wire                 rx_stats_toggle_sync;
       reg                  rx_stats_toggle_sync_reg = 0;
    
       // TX Statistics serialisation signals
       wire                 tx_statistics_valid;
       reg                  tx_statistics_valid_reg;
       wire  [31:0]         tx_statistics_vector;
       reg   [31:0]         tx_stats;
       reg   [33:0]         tx_stats_shift;
       reg                  tx_stats_toggle = 0;
       wire                 tx_stats_toggle_sync;
       reg                  tx_stats_toggle_sync_reg = 0;
       wire                 inband_link_status;
       wire  [1:0]          inband_clock_speed;
       wire                 inband_duplex_status;
    
       // Pause interface DESerialisation
       reg   [18:0]         pause_shift;
       reg                  pause_req;
       reg   [15:0]         pause_val;
    
       // AXI-Lite interface
       wire  [11:0]         s_axi_awaddr;
       wire                 s_axi_awvalid;
       wire                 s_axi_awready;
       wire  [31:0]         s_axi_wdata;
       wire                 s_axi_wvalid;
       wire                 s_axi_wready;
       wire  [1:0]          s_axi_bresp;
       wire                 s_axi_bvalid;
       wire                 s_axi_bready;
       wire  [11:0]         s_axi_araddr;
       wire                 s_axi_arvalid;
       wire                 s_axi_arready;
       wire  [31:0]         s_axi_rdata;
       wire  [1:0]          s_axi_rresp;
       wire                 s_axi_rvalid;
       wire                 s_axi_rready;
    
       // set board defaults - only updated when reprogrammed
       reg                  enable_address_swap = 1;
                
       reg                  enable_phy_loopback = 0;
    
       // signal tie offs
       wire  [7:0]          tx_ifg_delay = 0;    // not used in this example
    
       (* mark_debug = "true" *)wire loopback_reset;
        
       assign loopback_reset = !glbl_rst_intn;  //for gtx_clk_bufg clk
                        //!gtx_resetn;   // for s_axi_clk clk
                    //!glbl_rst_intn;  //for gtx_clk_bufg clk
                    //!;    //for refclk_bufg clk
    
    // clocking logic
    //----------------------------------------------------------------------------
      // Clock logic to generate required clocks from the 200MHz on board
      // if 125MHz is available directly this can be removed
      //----------------------------------------------------------------------------
      clocks_gen example_clocks
       (
          // differential clock inputs
          .clk_in_p         (clk_in_p),
          .clk_in_n         (clk_in_n),
    
          // asynchronous control/resets
          .glbl_rst         (glbl_rst),
          .dcm_locked       (dcm_locked),
    
          // clock outputs
          .gtx_clk_bufg     (gtx_clk_bufg),
          .refclk_bufg      (refclk_bufg),
          .s_axi_aclk       (s_axi_aclk)
       );
    
    // reset logic
    reset_gen example_resets
       (
          // clocks
          .s_axi_aclk       (s_axi_aclk),
          .gtx_clk          (gtx_clk_bufg),
    
          // asynchronous resets
          .glbl_rst         (glbl_rst),
          .reset_error      (reset_error),
          .rx_reset         (rx_reset),
          .tx_reset         (tx_reset),
    
          .dcm_locked       (dcm_locked),
    
          // synchronous reset outputs
      
          .glbl_rst_intn    (glbl_rst_intn),
       
       
          .gtx_resetn       (gtx_resetn),
       
          .s_axi_resetn     (s_axi_resetn),
          .phy_resetn       (phy_resetn),
          .chk_resetn       (chk_resetn)
       );
    
    // ip
    tri_mode_ethernet_mac_0 TEMAC_0 (
      .s_axi_aclk(s_axi_aclk),                      // input wire s_axi_aclk
      .s_axi_resetn(s_axi_resetn),                  // input wire s_axi_resetn
      .gtx_clk(gtx_clk_bufg),                            // input wire gtx_clk
      .gtx_clk_out(),                    // output wire gtx_clk_out
      .gtx_clk90_out(),                // output wire gtx_clk90_out
      .glbl_rstn(glbl_rst_intn),                        // input wire glbl_rstn
      .rx_axi_rstn(1'b1),                    // input wire rx_axi_rstn
      .tx_axi_rstn(1'b1),                    // input wire tx_axi_rstn
      .rx_statistics_vector(rx_statistics_vector),  // output wire [27 : 0] rx_statistics_vector
      .rx_statistics_valid(rx_statistics_valid),    // output wire rx_statistics_valid
      .rx_mac_aclk(rx_mac_aclk),                    // output wire rx_mac_aclk
      .rx_reset(rx_reset),                          // output wire rx_reset
      .rx_enable(),                        // output wire rx_enable
      .rx_axis_filter_tuser(),  // output wire [4 : 0] rx_axis_filter_tuser
      .rx_axis_mac_tdata(rx_axis_mac_tdata),        // output wire [7 : 0] rx_axis_mac_tdata
      .rx_axis_mac_tvalid(rx_axis_mac_tvalid),      // output wire rx_axis_mac_tvalid
      .rx_axis_mac_tlast(rx_axis_mac_tlast),        // output wire rx_axis_mac_tlast
      .rx_axis_mac_tuser(rx_axis_mac_tuser),        // output wire rx_axis_mac_tuser
      .tx_ifg_delay(tx_ifg_delay),                  // input wire [7 : 0] tx_ifg_delay
      .tx_statistics_vector(tx_statistics_vector),  // output wire [31 : 0] tx_statistics_vector
      .tx_statistics_valid(tx_statistics_valid),    // output wire tx_statistics_valid
      .tx_mac_aclk(tx_mac_aclk),                    // output wire tx_mac_aclk
      .tx_reset(tx_reset),                          // output wire tx_reset
      .tx_enable(),                        // output wire tx_enable
      .tx_axis_mac_tdata(tx_axis_mac_tdata),        // input wire [7 : 0] tx_axis_mac_tdata
      .tx_axis_mac_tvalid(tx_axis_mac_tvalid),      // input wire tx_axis_mac_tvalid
      .tx_axis_mac_tlast(tx_axis_mac_tlast),        // input wire tx_axis_mac_tlast
      .tx_axis_mac_tuser(tx_axis_mac_tuser),        // input wire [0 : 0] tx_axis_mac_tuser
      .tx_axis_mac_tready(tx_axis_mac_tready),      // output wire tx_axis_mac_tready
      .pause_req(pause_req),                        // input wire pause_req
      .pause_val(pause_val),                        // input wire [15 : 0] pause_val
      .refclk(refclk_bufg),                              // input wire refclk
      .speedis100(),                      // output wire speedis100
      .speedis10100(),                  // output wire speedis10100
      .rgmii_txd(rgmii_txd),                        // output wire [3 : 0] rgmii_txd
      .rgmii_tx_ctl(rgmii_tx_ctl),                  // output wire rgmii_tx_ctl
      .rgmii_txc(rgmii_txc),                        // output wire rgmii_txc
      .rgmii_rxd(rgmii_rxd),                        // input wire [3 : 0] rgmii_rxd
      .rgmii_rx_ctl(rgmii_rx_ctl),                  // input wire rgmii_rx_ctl
      .rgmii_rxc(rgmii_rxc),                        // input wire rgmii_rxc
      .inband_link_status(inband_link_status),      // output wire inband_link_status
      .inband_clock_speed(inband_clock_speed),      // output wire [1 : 0] inband_clock_speed
      .inband_duplex_status(inband_duplex_status),  // output wire inband_duplex_status
      .mdio(mdio),                                  // inout wire mdio
      .mdc(mdc),                                    // output wire mdc
      .s_axi_awaddr(s_axi_awaddr),                  // input wire [11 : 0] s_axi_awaddr
      .s_axi_awvalid(s_axi_awvalid),                // input wire s_axi_awvalid
      .s_axi_awready(s_axi_awready),                // output wire s_axi_awready
      .s_axi_wdata(s_axi_wdata),                    // input wire [31 : 0] s_axi_wdata
      .s_axi_wvalid(s_axi_wvalid),                  // input wire s_axi_wvalid
      .s_axi_wready(s_axi_wready),                  // output wire s_axi_wready
      .s_axi_bresp(s_axi_bresp),                    // output wire [1 : 0] s_axi_bresp
      .s_axi_bvalid(s_axi_bvalid),                  // output wire s_axi_bvalid
      .s_axi_bready(s_axi_bready),                  // input wire s_axi_bready
      .s_axi_araddr(s_axi_araddr),                  // input wire [11 : 0] s_axi_araddr
      .s_axi_arvalid(s_axi_arvalid),                // input wire s_axi_arvalid
      .s_axi_arready(s_axi_arready),                // output wire s_axi_arready
      .s_axi_rdata(s_axi_rdata),                    // output wire [31 : 0] s_axi_rdata
      .s_axi_rresp(s_axi_rresp),                    // output wire [1 : 0] s_axi_rresp
      .s_axi_rvalid(s_axi_rvalid),                  // output wire s_axi_rvalid
      .s_axi_rready(s_axi_rready),                  // input wire s_axi_rready
      .mac_irq()                            // output wire mac_irq
    );
    
    // axi lite controller
    axi_lite_controller axi_lite_controller (
          .s_axi_aclk                   (s_axi_aclk),
          .s_axi_resetn                 (s_axi_resetn),
    
          .mac_speed                    (mac_speed),
          .update_speed                 (update_speed),   // may need glitch protection on this..
          .serial_command               (pause_req_s),
          .serial_response              (serial_response),
                
          .phy_loopback                 (enable_phy_loopback),
    
          .s_axi_awaddr                 (s_axi_awaddr),
          .s_axi_awvalid                (s_axi_awvalid),
          .s_axi_awready                (s_axi_awready),
    
          .s_axi_wdata                  (s_axi_wdata),
          .s_axi_wvalid                 (s_axi_wvalid),
          .s_axi_wready                 (s_axi_wready),
    
          .s_axi_bresp                  (s_axi_bresp),
          .s_axi_bvalid                 (s_axi_bvalid),
          .s_axi_bready                 (s_axi_bready),
    
          .s_axi_araddr                 (s_axi_araddr),
          .s_axi_arvalid                (s_axi_arvalid),
          .s_axi_arready                (s_axi_arready),
    
          .s_axi_rdata                  (s_axi_rdata),
          .s_axi_rresp                  (s_axi_rresp),
          .s_axi_rvalid                 (s_axi_rvalid),
          .s_axi_rready                 (s_axi_rready)
       );
       
      /*
      //assign rx_axis_mac_tready = tx_axis_mac_tready;  
      
      reg [7:0]   tx_axis_mac_tdata_int;
      reg tx_axis_mac_tvalid_int;
      reg tx_axis_mac_tlast_int;
      
      wire rx_axis_mac_tvalid_sync;
      wire rx_axis_mac_tlast_sync;
      wire [7:0] rx_axis_mac_tdata_sync;
      
      tri_mode_ethernet_mac_0_sync_block rx_tvalid_sync (
         .clk              (tx_mac_aclk),
         .data_in          (rx_axis_mac_tvalid),
         .data_out         (rx_axis_mac_tvalid_sync)
      );
      
      tri_mode_ethernet_mac_0_sync_block rx_tlast_sync (
               .clk              (tx_mac_aclk),
               .data_in          (rx_axis_mac_tlast),
               .data_out         (rx_axis_mac_tlast_sync)
      );
      
      genvar i;
      
      generate for(i = 0; i <= 8; i = i + 1)
        begin
            tri_mode_ethernet_mac_0_sync_block rx_tlast_sync (
                       .clk              (tx_mac_aclk),
                       .data_in          (rx_axis_mac_tdata[i]),
                       .data_out         (rx_axis_mac_tdata_sync[i])
              );
        end
      endgenerate
      
      assign tx_axis_mac_tdata = tx_axis_mac_tdata_int;
      assign tx_axis_mac_tvalid = tx_axis_mac_tvalid_int;
      assign tx_axis_mac_tlast = tx_axis_mac_tlast_int;
    
        always @ (posedge tx_mac_aclk)
            begin
                if(tx_reset == 1'b1)
                    begin
                            tx_axis_mac_tdata_int <=  8'd0;  
                            tx_axis_mac_tvalid_int <= 1'b0;
                            tx_axis_mac_tlast_int <= 1'b0;
                    end
                    
                else
                    begin
                        if((tx_axis_mac_tready == 1'b1) && (rx_axis_mac_tvalid == 1'b1))
                        begin
                            tx_axis_mac_tdata_int <= rx_axis_mac_tdata_sync;
                            tx_axis_mac_tvalid_int <= rx_axis_mac_tvalid_sync;
                            tx_axis_mac_tlast_int <= rx_axis_mac_tlast_sync;
                        end
                    end
            end
    
    */
    wire rx_axis_mac_tvalid_sync;
    wire rx_axis_mac_tlast_sync;
    wire [7:0] rx_axis_mac_tdata_sync;
    
    /*tri_mode_ethernet_mac_0_sync_block rx_tvalid_sync (
             .clk              (tx_mac_aclk),
             .data_in          (rx_axis_mac_tvalid),
             .data_out         (rx_axis_mac_tvalid_sync)
          );
          
          tri_mode_ethernet_mac_0_sync_block rx_tlast_sync (
                   .clk              (tx_mac_aclk),
                   .data_in          (rx_axis_mac_tlast),
                   .data_out         (rx_axis_mac_tlast_sync)
          );
          
          genvar i;
          
          generate for(i = 0; i <= 8; i = i + 1)
            begin
                tri_mode_ethernet_mac_0_sync_block rx_tlast_sync (
                           .clk              (tx_mac_aclk),
                           .data_in          (rx_axis_mac_tdata[i]),
                           .data_out         (rx_axis_mac_tdata_sync[i])
                  );
             end
         endgenerate*/
    
    
    // bridge
    axi_ahir_pipe_bridge bridge_inst(
        // rx clk resets
        .rx_reset(rx_reset),
        .rx_aclk(rx_mac_aclk),
        // tx clk resets
        .tx_reset(tx_reset),
        .tx_aclk(tx_mac_aclk),
        
        // rx inputs
        .rx_axis_mac_tdata(rx_axis_mac_tdata),      //in    8 
        .rx_axis_mac_tvalid(rx_axis_mac_tvalid),    //in
        .rx_axis_mac_tlast(rx_axis_mac_tlast),      //in
        .rx_axis_mac_tuser(rx_axis_mac_tuser),      //in
        
        // rx pipe outputs
        .rx_pipe_pipe_write_data(rx_pipe_pipe_write_data),//out 8
        .rx_pipe_pipe_write_req(rx_pipe_pipe_write_req),//out
        .rx_pipe_pipe_write_ack(rx_pipe_pipe_write_ack), //in
        
        // tx pipe inputs
        .tx_axis_mac_tdata(tx_axis_mac_tdata),        // out    8
        .tx_axis_mac_tvalid(tx_axis_mac_tvalid),      // out 
        .tx_axis_mac_tlast(tx_axis_mac_tlast),        // out 
        .tx_axis_mac_tuser(tx_axis_mac_tuser),        // out 
        .tx_axis_mac_tready(tx_axis_mac_tready),      // in
        
        // tx outputs
        .tx_pipe_pipe_read_data(tx_pipe_pipe_read_data),//in    8
        .tx_pipe_pipe_read_req(tx_pipe_pipe_read_req),//out
        .tx_pipe_pipe_read_ack(tx_pipe_pipe_read_ack)//in
    );
    
    // loopback module
    nic loopback_module ( 
        .clk(rx_mac_aclk),
        .reset(rx_reset),
        .rx_pipe_pipe_write_data(rx_pipe_pipe_write_data),//in
        .rx_pipe_pipe_write_req(rx_pipe_pipe_write_req),//in
        .rx_pipe_pipe_write_ack(rx_pipe_pipe_write_ack), //out
        .tx_pipe_pipe_read_data(tx_pipe_pipe_read_data),//out
        .tx_pipe_pipe_read_req(tx_pipe_pipe_read_req),//in
        .tx_pipe_pipe_read_ack(tx_pipe_pipe_read_ack)//out
        );
    
   /* uartTopGenericEasilyConfigurable 
           #(115200, 2500000) debug_uart
           (
                .reset(tx_mac_aclk),
                .clk(tx_reset), 
                // uart serial signals
                .serIn(serIn),
                .serOut(serOut),
                // pipe signals for tx/rx.
                .uart_rx_pipe_read_data(tx_pipe_pipe_read_data[8:1]), //o
                .uart_rx_pipe_read_req(tx_pipe_pipe_read_req), // i
                .uart_rx_pipe_read_ack(tx_pipe_pipe_read_ack), // o
                .uart_tx_pipe_write_data(rx_pipe_pipe_write_data[8:1]), // i
                .uart_tx_pipe_write_req(rx_pipe_pipe_write_req), // i
                .uart_tx_pipe_write_ack(rx_pipe_pipe_write_ack) // o
               );*/
   
    
    // other logic
    
    // when the config_board button is pushed capture and hold the
      // state of the gne/chek tx_data inputs.  These values will persist until the
      // board is reprogrammed or config_board is pushed again
      always @(posedge gtx_clk_bufg)
      begin
         if (config_board) begin
            enable_address_swap   <= gen_tx_data;
         end
      end
    
                
      always @(posedge s_axi_aclk)
      begin
         if (config_board) begin
            enable_phy_loopback   <= chk_tx_data;
         end
      end
    
    
      //----------------------------------------------------------------------------
      // Serialize the stats vectors
      // This is a single bit approach, retimed onto gtx_clk
      // this code is only present to prevent code being stripped..
      //----------------------------------------------------------------------------
    
      // RX STATS
    
      // first capture the stats on the appropriate clock
      always @(posedge rx_mac_aclk)
      begin
         rx_statistics_valid_reg <= rx_statistics_valid;
         if (!rx_statistics_valid_reg & rx_statistics_valid) begin
            rx_stats <= rx_statistics_vector;
            rx_stats_toggle <= !rx_stats_toggle;
         end
      end
    
      tri_mode_ethernet_mac_0_sync_block rx_stats_sync (
         .clk              (gtx_clk_bufg),
         .data_in          (rx_stats_toggle),
         .data_out         (rx_stats_toggle_sync)
      );
    
      always @(posedge gtx_clk_bufg)
      begin
         rx_stats_toggle_sync_reg <= rx_stats_toggle_sync;
      end
    
      // when an update is rxd load shifter (plus start/stop bit)
      // shifter always runs (no power concerns as this is an example design)
      always @(posedge gtx_clk_bufg)
      begin
         if (rx_stats_toggle_sync_reg != rx_stats_toggle_sync) begin
            rx_stats_shift <= {1'b1, rx_stats, 1'b1};
         end
         else begin
            rx_stats_shift <= {rx_stats_shift[28:0], 1'b0};
         end
      end
    
      assign rx_statistics_s = rx_stats_shift[29];
    
      // TX STATS
    
      // first capture the stats on the appropriate clock
      always @(posedge tx_mac_aclk)
      begin
         tx_statistics_valid_reg <= tx_statistics_valid;
         if (!tx_statistics_valid_reg & tx_statistics_valid) begin
            tx_stats <= tx_statistics_vector;
            tx_stats_toggle <= !tx_stats_toggle;
         end
      end
    
      tri_mode_ethernet_mac_0_sync_block tx_stats_sync (
         .clk              (gtx_clk_bufg),
         .data_in          (tx_stats_toggle),
         .data_out         (tx_stats_toggle_sync)
      );
    
      always @(posedge gtx_clk_bufg)
      begin
         tx_stats_toggle_sync_reg <= tx_stats_toggle_sync;
      end
    
      // when an update is txd load shifter (plus start bit)
      // shifter always runs (no power concerns as this is an example design)
      always @(posedge gtx_clk_bufg)
      begin
         if (tx_stats_toggle_sync_reg != tx_stats_toggle_sync) begin
            tx_stats_shift <= {1'b1, tx_stats, 1'b1};
         end
         else begin
            tx_stats_shift <= {tx_stats_shift[32:0], 1'b0};
         end
      end
    
      assign tx_statistics_s = tx_stats_shift[33];
    
      //----------------------------------------------------------------------------
      // DSerialize the Pause interface
      // This is a single bit approachtimed on gtx_clk
      // this code is only present to prevent code being stripped..
      //----------------------------------------------------------------------------
      // the serialised pause info has a start bit followed by the quanta and a stop bit
      // capture the quanta when the start bit hits the msb and the stop bit is in the lsb
      always @(posedge gtx_clk_bufg)
      begin
         pause_shift <= {pause_shift[17:0], pause_req_s};
      end
    
      always @(posedge gtx_clk_bufg)
      begin
         if (pause_shift[18] == 1'b0 & pause_shift[17] == 1'b1 & pause_shift[0] == 1'b1) begin
            pause_req <= 1'b1;
            pause_val <= pause_shift[16:1];
         end
         else begin
            pause_req <= 1'b0;
            pause_val <= 0;
         end
      end
    
    
endmodule

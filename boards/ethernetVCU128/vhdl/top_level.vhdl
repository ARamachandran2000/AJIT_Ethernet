library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;

library DualClockedQueuelib;
use DualClockedQueuelib.DualClockedQueuePackage.all;

library GenericCoreAddOnLib;
use GenericCoreAddOnLib.GenericCoreAddOnPackage.all;

library GlueModules;
use GlueModules.GlueModulesBaseComponents.all;

library GenericGlueStuff;
use GenericGlueStuff.GenericGlueStuffComponents.all;

library simpleI2clib;
use simpleI2clib.i2cBaseComponents.all;

library ahir_system_global_packagelib;
use ahir_system_global_packagelib.ahir_system_global_package.all;


library UNISIM;
use UNISIM.vcomponents.all;

entity top_level is
port(
--      CPU_RESET : in std_logic_vector(0 downto 0);
--      DEBUG_MODE : in std_logic_vector(0 downto 0);
--      SINGLE_STEP_MODE : in std_logic_vector(0 downto 0);
--      CPU_MODE : out std_logic_vector(1 downto 0);
      DEBUG_UART_RX : in std_logic_vector(0 downto 0);
      DEBUG_UART_TX : out std_logic_vector(0 downto 0);
      SERIAL_UART_RX : in std_logic_vector(0 downto 0);
      SERIAL_UART_TX : out std_logic_vector(0 downto 0);

	scl : inout std_logic_vector(0 downto 0);
	sda : inout std_logic_vector(0 downto 0);

      -- TODO:
      -- SGMIII interface ports (mapped to PHY on the board)
	     --phy_rst_n : out std_logic;                      

	     sgmii_rxn : in std_logic;                       
	     sgmii_rxp : in std_logic;                       
	     sgmii_txn : out std_logic;                      
	     sgmii_txp : out std_logic;                      
	
	     mgt_clk_n : in std_logic;                       
	     mgt_clk_p : in std_logic;                       
	     dummy_port_in : in std_logic;                   

	     -- MDIO Interface
	     -----------------
	    mdio : inout std_logic;                  
	    mdc : out std_logic; 


      -- ENABLE FOR MAC+FIFO (mapped to a switch on the board)
--      reset,reset_clk: in std_logic;
      clk_p : in std_logic;
      clk_n : in std_logic
	);
end entity top_level;

architecture structure of top_level is


  component processor_1x1x32 is -- 
   port( -- 
    CONSOLE_to_SERIAL_RX_pipe_write_data : in std_logic_vector(7 downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_req  : in std_logic_vector(0  downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_ack  : out std_logic_vector(0  downto 0);
    EXTERNAL_INTERRUPT : in std_logic_vector(0 downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_data : in std_logic_vector(29 downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_ack  : out std_logic_vector(0  downto 0);
    MAIN_MEM_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
    MAIN_MEM_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_data : in std_logic_vector(7 downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_req  : in std_logic_vector(0  downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_ack  : out std_logic_vector(0  downto 0);
    THREAD_RESET : in std_logic_vector(3 downto 0);
    MAIN_MEM_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
    MAIN_MEM_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
    PROCESSOR_MODE : out std_logic_vector(15 downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_data : out std_logic_vector(7 downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_req  : in std_logic_vector(0  downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_data : out std_logic_vector(7 downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_req  : in std_logic_vector(0  downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
  end component processor_1x1x32;
  
  -- NIC component
  component ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_NIC_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_NIC_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_NIC_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_NIC_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_NIC_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_NIC_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    MEMORY_TO_NIC_RESPONSE_pipe_write_data: in std_logic_vector(64 downto 0);
    MEMORY_TO_NIC_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    MEMORY_TO_NIC_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    NIC_TO_MEMORY_REQUEST_pipe_read_data: out std_logic_vector(109 downto 0);
    NIC_TO_MEMORY_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    NIC_TO_MEMORY_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    enable_mac_pipe_read_data: out std_logic_vector(0 downto 0);
    enable_mac_pipe_read_req : in std_logic_vector(0 downto 0);
    enable_mac_pipe_read_ack : out std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_data: in std_logic_vector(72 downto 0);
    mac_to_nic_data_pipe_write_req : in std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_data: out std_logic_vector(72 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  
  component nic_mac_pipe_reset is
	port(
		clk : in std_logic;

		ENABLE_MAC_pipe_data: in std_logic; 
		ENABLE_MAC_pipe_req : in std_logic;
		ENABLE_MAC_pipe_ack : out std_logic;

		reset : out std_logic);
  end component;


  signal PROCESSOR_MODE: std_logic_vector(15 downto 0);


   
   -- to generate a 156 and 80  Mhz clock
   component clk_wiz_0
   port
    (-- Clock in ports
     -- Clock out ports
     clk_out1          : out    std_logic; -- 156.25 Mhz Clock
     clk_out2	       : out    std_logic; -- 75 MHz clock
     -- Status and control signals
     reset             : in     std_logic;
     locked            : out    std_logic;
     clk_in1_p         : in     std_logic;
     clk_in1_n         : in     std_logic
    );
   end component;
   
	component ila_1 is
		port (
		         clk : in std_logic; --input wire clk
		         probe0 : in std_logic; --input wire [0:0]  probe0
		         probe1 : in std_logic_vector(31 downto 0); --input wire [31:0]  probe1
		         probe2 : in std_logic_vector(3 downto 0); --input wire [3:0]  probe2
		         probe3 : in std_logic; --input wire [0:0]  probe3
		         probe4 : in std_logic; --input wire [0:0]  probe4
		         probe5 : in std_logic; --input wire [0:0]  probe5
		         probe6 : in std_logic; --input wire [0:0]  probe6
		         probe7 : in std_logic_vector(31 downto 0); --input wire [31:0]  probe7
		         probe8 : in std_logic_vector(3 downto 0); --input wire [3:0]  probe8
		         probe9 : in std_logic; --input wire [0:0]  probe9
		         probe10 : in std_logic; --input wire [0:0]  probe10
		         probe11 : in std_logic);
	end component;

   component axi_ethernet_0_clocks_resets is
    	port(
        clk_in_p : in std_logic;
        clk_in_n : in std_logic;
        -- asynchronous control/resets
        sys_rst : in std_logic;
        clk_rst : in std_logic;
        soft_rst : in std_logic;
        mmcm_locked_out : out std_logic;

        --reset outputs
        axi_lite_resetn : out std_logic;
        axis_rstn : out std_logic;
        sys_out_rst : out std_logic;

        -- clock outputs
        gtx_clk_bufg : out std_logic;
        ref_clk_bufg : out std_logic;
        ref_clk_50_bufg : out std_logic;
        axis_clk_bufg : out std_logic;
        axi_lite_clk_bufg : out std_logic);
   end component;


    -- vio for reset
  component vio_0 is
  port (
    clk : in std_logic;
    probe_in0 : in std_logic;
    probe_in1 : in std_logic;
    probe_in2 : in std_logic;
    probe_out0 : out std_logic;
    probe_out1 : OUT std_logic;
    probe_out2 : OUT std_logic;
    probe_out3 : OUT std_logic;
    probe_out4 : OUT std_logic
  );
  end component;

  COMPONENT vio_1 is
	    PORT (
	        clk : IN STD_LOGIC;
	        probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_in2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	        probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		  );
  END COMPONENT;
  component ila_0 is 
	  port(
	  	clk : in std_logic ;
	  	probe0 : in std_logic_vector(73 downto 0); 
	  	probe1 : in std_logic_vector(0 downto 0);
	  	probe2 : in std_logic_vector(0 downto 0);
	  	probe3 : in std_logic_vector(32 downto 0);
	  	probe4 : in std_logic_vector(0 downto 0);
	  	probe5 : in std_logic_vector(0 downto 0));
  end component;

  component axi_ethernet_0_example is
    port(
     phy_rst_n : out std_logic;

     sgmii_rxn : in std_logic;
     sgmii_rxp : in std_logic;
     sgmii_txn : out std_logic;
     sgmii_txp : out std_logic;

     mgt_clk_n : in std_logic;
     mgt_clk_p : in std_logic;
     dummy_port_in : in std_logic;

     -- MDIO Interface
     -----------------
    mdio : inout std_logic;
    mdc : out std_logic;

    soft_rst : out std_logic;

     -- from reset and clock generator
    axi_lite_resetn : in std_logic;
    axis_rstn : in std_logic;
    sys_out_rst : in std_logic;

     -- clock  : out std_logic;s
    clkgen_gtx_clk : in std_logic;
    ref_clk : in std_logic;
    ref_clk_50_bufg : in std_logic;
    axis_clk : in std_logic;
    axi_lite_clk : in std_logic;

     -- control signals

    mtrlb_activity_flash : out std_logic;
    mtrlb_pktchk_error : out std_logic;
    control_ready : out std_logic;

    control_valid : in std_logic;
    control_data : in std_logic_vector(3 downto 0);
    start_config : in std_logic;

     --/ ip data
    s_axis_txc_tdata : in std_logic_vector(31 downto 0);
    s_axis_txc_tkeep : in std_logic_vector(3 downto 0);
    s_axis_txc_tlast : in std_logic;
    s_axis_txc_tready : out std_logic;
    s_axis_txc_tvalid : in std_logic;

    s_axis_txd_tdata : in std_logic_vector(31 downto 0);
    s_axis_txd_tkeep : in std_logic_vector(3 downto 0);
    s_axis_txd_tlast : in std_logic;
    s_axis_txd_tready : out std_logic;
    s_axis_txd_tvalid : in std_logic;

    m_axis_rxd_tdata : out std_logic_vector(31 downto 0);
    m_axis_rxd_tkeep : out std_logic_vector(3 downto 0);
    m_axis_rxd_tlast : out std_logic;
    m_axis_rxd_tready : in std_logic;
    m_axis_rxd_tvalid : out std_logic;

    m_axis_rxs_tdata : out std_logic_vector(31 downto 0);
    m_axis_rxs_tkeep : out std_logic_vector(3 downto 0);
    m_axis_rxs_tlast : out std_logic;
    m_axis_rxs_tready : in std_logic;
    m_axis_rxs_tvalid : out std_logic);

  end component;


   signal MAIN_MEM_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_MEM_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_MEM_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_MEM_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_MEM_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_MEM_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

   -- main tap bus signals (including buffering)
   signal MAIN_TAP_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_TAP_RESPONSE_pipe_write_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_RESPONSE_pipe_write_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_TAP_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_RESPONSE_BUF_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_TAP_RESPONSE_BUF_pipe_write_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_RESPONSE_BUF_pipe_write_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_REQUEST_BUF_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_TAP_REQUEST_BUF_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_REQUEST_BUF_pipe_read_ack:std_logic_vector(0  downto 0);

   -- main through bus signals (including buffering)
   signal MAIN_THROUGH_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_THROUGH_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_THROUGH_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_THROUGH_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_THROUGH_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_THROUGH_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);
   
   signal MAIN_THROUGH_RESPONSE_BUF_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_THROUGH_RESPONSE_BUF_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_THROUGH_REQUEST_BUF_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_THROUGH_REQUEST_BUF_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_THROUGH_REQUEST_BUF_pipe_read_ack:std_logic_vector(0  downto 0);

   -- buffer betwwen acb_mux and acb_sram
   signal MUX_TO_MEM_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MUX_TO_MEM_REQUEST_pipe_read_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_REQUEST_pipe_read_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MUX_TO_MEM_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_REQUEST_BUF_pipe_read_data:std_logic_vector(109 downto 0);
   signal MUX_TO_MEM_REQUEST_BUF_pipe_read_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_REQUEST_BUF_pipe_read_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_RESPONSE_BUF_pipe_write_data:std_logic_vector(64 downto 0);
   signal MUX_TO_MEM_RESPONSE_BUF_pipe_write_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack:std_logic_vector(0 downto 0);
   
   --
   
   signal reset1,reset2, reset_sync_pre_buf, reset_sync: std_logic;
   signal reset1_mac,reset2_mac, reset_sync_pre_buf_mac, reset_sync_mac: std_logic;
   signal EXTERNAL_INTERRUPT : std_logic_vector(0 downto 0);
   signal LOGGER_MODE : std_logic_vector(0 downto 0);
   signal clock,clock_mac,lock:std_logic;

   signal MONITOR_to_DEBUG_pipe_write_data : std_logic_vector(7 downto 0);
   signal MONITOR_to_DEBUG_pipe_write_req  : std_logic_vector(0  downto 0);
   signal MONITOR_to_DEBUG_pipe_write_ack  : std_logic_vector(0  downto 0);

   signal DEBUG_to_MONITOR_pipe_read_data : std_logic_vector(7 downto 0);
   signal DEBUG_to_MONITOR_pipe_read_req  : std_logic_vector(0  downto 0);
   signal DEBUG_to_MONITOR_pipe_read_ack  : std_logic_vector(0  downto 0);

   signal CONSOLE_to_SERIAL_RX_pipe_write_data : std_logic_vector(7 downto 0);
   signal CONSOLE_to_SERIAL_RX_pipe_write_req  : std_logic_vector(0  downto 0);
   signal CONSOLE_to_SERIAL_RX_pipe_write_ack  : std_logic_vector(0  downto 0);

   signal SERIAL_TX_to_CONSOLE_pipe_read_data : std_logic_vector(7 downto 0);
   signal SERIAL_TX_to_CONSOLE_pipe_read_req  : std_logic_vector(0  downto 0);
   signal SERIAL_TX_to_CONSOLE_pipe_read_ack  : std_logic_vector(0  downto 0);

   signal CONFIG_UART_BAUD_CONTROL_WORD: std_logic_vector(31 downto 0);
    
   signal INVALIDATE_REQUEST_pipe_write_data : std_logic_vector(29 downto 0);
   signal INVALIDATE_REQUEST_pipe_write_req  : std_logic_vector(0  downto 0);
   signal INVALIDATE_REQUEST_pipe_write_ack  : std_logic_vector(0  downto 0);

    				
   signal MAX_ADDR_TAP : std_logic_vector(35 downto 0);
   signal MIN_ADDR_TAP : std_logic_vector(35 downto 0);
   
   -- ACB to AFB bridge and queues(Dual clocked fifos)
   signal AFB_NIC_RESPONSE_DFIFO_pipe_write_data : std_logic_vector(32 downto 0);
   signal AFB_NIC_RESPONSE_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_RESPONSE_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_REQUEST_DFIFO_pipe_write_data : std_logic_vector(73 downto 0);
   signal AFB_NIC_REQUEST_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_REQUEST_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_REQUEST_pipe_read_data : std_logic_vector(73 downto 0);
   signal AFB_NIC_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_RESPONSE_pipe_read_data : std_logic_vector(32 downto 0);
   signal AFB_NIC_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
   
   -- NIC to mem
   signal NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_data : std_logic_vector(109 downto 0);
   signal NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal NIC_TO_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
   signal NIC_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal NIC_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_NIC_RESPONSE_pipe_read_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   

   
   
   
   
   signal RX_FIFO_pipe_read_data : std_logic_vector (72 downto 0);
   signal RX_FIFO_pipe_read_req : std_logic_vector (0 downto 0);
   signal RX_FIFO_pipe_read_ack : std_logic_vector (0 downto 0);
   
--   signal RX_FIFO_BUF_pipe_read_data : std_logic_vector (72 downto 0);
--   signal RX_FIFO_BUF_pipe_read_req : std_logic_vector (0 downto 0);
--   signal RX_FIFO_BUF_pipe_read_ack : std_logic_vector (0 downto 0);
   
   signal TX_FIFO_pipe_write_data : std_logic_vector (72 downto 0);
   signal TX_FIFO_pipe_write_req : std_logic_vector (0 downto 0);
   signal TX_FIFO_pipe_write_ack : std_logic_vector (0 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of RX_FIFO_pipe_read_data  : signal is "true";


    --attribute mark_debug : string;
    attribute mark_debug of RX_FIFO_pipe_read_req: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of RX_FIFO_pipe_read_ack: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of TX_FIFO_pipe_write_data: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of TX_FIFO_pipe_write_req: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of TX_FIFO_pipe_write_ack: signal is "true";


--   signal TX_FIFO_BUF_pipe_write_data : std_logic_vector (72 downto 0);
--   signal TX_FIFO_BUF_pipe_write_req : std_logic_vector (0 downto 0);
--   signal TX_FIFO_BUF_pipe_write_ack : std_logic_vector (0 downto 0);
   
   signal enable_mac_pipe_read_data: std_logic_vector (0 downto 0);
   signal enable_mac_pipe_read_req : std_logic_vector (0 downto 0);
   signal enable_mac_pipe_read_ack : std_logic_vector (0 downto 0);

	signal AFB_TAP_RESP_DATA : std_logic_vector(32 downto 0);
	signal AFB_TAP_RESP_REQ : std_logic_vector(0 downto 0);
	signal AFB_TAP_RESP_ACK : std_logic_vector(0 downto 0);

	signal AFB_NIC_REQUEST_tap_pipe_read_data : std_logic_vector(73 downto 0);
	signal AFB_NIC_REQUEST_tap_pipe_read_req : std_logic_vector(0 downto 0);
	signal AFB_NIC_REQUEST_tap_pipe_read_ack : std_logic_vector(0 downto 0);

	signal AFB_BUS_REQUEST_pipe_write_data :   std_logic_vector(73 downto 0);
	signal AFB_BUS_REQUEST_pipe_write_req  :   std_logic_vector(0  downto 0);
	signal AFB_BUS_REQUEST_pipe_write_ack  :   std_logic_vector(0  downto 0);

	signal AFB_BUS_RESPONSE_pipe_read_data :   std_logic_vector(32 downto 0);
	signal AFB_BUS_RESPONSE_pipe_read_req  :   std_logic_vector(0  downto 0);
	signal AFB_BUS_RESPONSE_pipe_read_ack  :   std_logic_vector(0  downto 0);
	
	signal scl_in, sda_in, scl_pull_down, sda_pull_down : std_logic_vector(0 downto 0);
	signal driven_scl_out, driven_sda_out: std_logic_vector(0 downto 0);
	signal MAX_ADDR_TAP_AFB, MIN_ADDR_TAP_AFB : std_logic_vector(35 downto 0);

   signal enable_reset : std_logic_vector (0 downto 0);
   
   -- mac side connections   
   signal rx_axis_resetn : std_logic;
   signal rx_axis_tdata : std_logic_vector (63 downto 0);
   signal rx_axis_tkeep : std_logic_vector (7 downto 0);
   signal rx_axis_tvalid : std_logic;
   signal rx_axis_tuser : std_logic;
   signal rx_axis_tlast : std_logic;
   signal rx_axis_tready : std_logic;
   
   signal tx_axis_resetn : std_logic;
   signal tx_axis_tdata : std_logic_vector (63 downto 0);
   signal tx_axis_tkeep : std_logic_vector (7 downto 0);
   signal tx_axis_tvalid : std_logic;
   signal tx_axis_tuser : std_logic;
   signal tx_axis_tlast : std_logic;
   signal tx_axis_tready : std_logic;
   
   signal one_bit_one : std_logic_vector(0 downto 0);
   
   
   signal reset,reset_clk : std_logic;

   signal CPU_RESET : std_logic_vector(0 downto 0);
   signal DEBUG_MODE : std_logic_vector(0 downto 0);
   signal SINGLE_STEP_MODE : std_logic_vector(0 downto 0);
   signal CPU_MODE : std_logic_vector(1 downto 0);

   signal clk_in_p,clk_in_n,sys_rst,clk_rst,soft_rst,mmcm_locked_out,axi_lite_resetn : std_logic;
   signal axis_rstn,sys_out_rst,clkgen_gtx_clk,ref_clk,ref_clk_50_bufg,axis_clk,axi_lite_clk : std_logic;

   -- vio connections
	signal phy_rst_n : std_logic;
	signal mtrlb_activity_flash,mtrlb_pktchk_error,control_ready : std_logic_vector(0 downto 0);
	signal control_valid, start_config : std_logic_vector(0 downto 0);
	signal control_data : std_logic_vector(3 downto 0);

	-- ila connections
	signal s_axis_txc_tlast,s_axis_txc_tready,s_axis_txc_tvalid : std_logic;
	signal s_axis_txd_tlast,s_axis_txd_tready,s_axis_txd_tvalid : std_logic;
	signal m_axis_rxd_tlast,m_axis_rxd_tready,m_axis_rxd_tvalid : std_logic;
	signal m_axis_rxs_tlast,m_axis_rxs_tready,m_axis_rxs_tvalid : std_logic;
	signal s_axis_txc_tdata,s_axis_txd_tdata,m_axis_rxd_tdata,m_axis_rxs_tdata : std_logic_vector(31 downto 0);
	signal s_axis_txc_tkeep,s_axis_txd_tkeep,m_axis_rxd_tkeep,m_axis_rxs_tkeep : std_logic_vector(3  downto 0);

   
   -- ADDITIONAL SIGNALS FOR MAC + NIC + SWITCH 
begin

	-- make '1'
   one_bit_one(0) <= '1';

   -- tie it off for this board.
   INVALIDATE_REQUEST_pipe_write_req(0) <= '0'; 
   INVALIDATE_REQUEST_pipe_write_data  <= (others => '0');

   -- Info: Baudrate 115200 ClkFreq 65000000:  Baud-freq = 1152, Baud-limit= 39473 Baud-control=0x9a310480
   -- Info: Baudrate 115200 ClkFreq 70000000:  Baud-freq = 576, Baud-limit= 21299 Baud-control=0x53330240
   -- Info: Baudrate 115200 ClkFreq 75000000:  Baud-freq = 384, Baud-limit= 15241 Baud-control=0x3b890180
   -- clock freq = 80MHz, baud-rate=115200.
   --CONFIG_UART_BAUD_CONTROL_WORD <= X"0bed0048";
   CONFIG_UART_BAUD_CONTROL_WORD <= X"3b890180";


       
   -- 156 and 80 MHz generator
   --clocking1 : clk_wiz_0
   --   port map ( 
   --     -- Clock out ports  
   --      clk_out1 => clock,
	-- clk_out2 => clock_mac,
	     --clk_out2 => clock,
        -- Status and control signals                
         --reset => reset_clk,
        -- locked => lock,
         -- Clock in ports
        -- clk_in1_p => clk_p,
        -- clk_in1_n => clk_n
      -- );
       

	example_clocks_resets : axi_ethernet_0_clocks_resets
    		port map(
		        clk_in_p           => clk_p       ,
		        clk_in_n           => clk_n       ,
		        -- asynchronous control/resets
		        sys_rst            => reset_sync        ,
		        clk_rst            => clk_rst        ,
		        soft_rst           => soft_rst       ,
		        mmcm_locked_out    => mmcm_locked_out,
		
		        --reset outputs
		        axi_lite_resetn    => axi_lite_resetn,
		        axis_rstn          => axis_rstn      ,
		        sys_out_rst        => sys_out_rst    ,
		
		        -- clock outputs
		        gtx_clk_bufg       => clock,  -- 75 clkgen_gtx_clk
		        ref_clk_bufg       => ref_clk,  -- 300
		        ref_clk_50_bufg    => ref_clk_50_bufg,  -- 50
		        axis_clk_bufg      => clock_mac,  -- 100 axis_clk
		        axi_lite_clk_bufg  => axi_lite_clk); -- 100


    -- VIO for reset 
    virtual_reset : vio_0
        port map (
                        clk => clock,
                        probe_in0 =>  lock,
                        probe_in1 =>  CPU_MODE(1),
                        probe_in2 =>  CPU_MODE(0),
                        probe_out0 => reset_sync,
                        probe_out1 => reset_clk,
                        probe_out2 => CPU_RESET(0),
                        probe_out3 => DEBUG_MODE(0),
                        probe_out4 => SINGLE_STEP_MODE(0));

    vio_config : vio_1
       PORT MAP (
         clk => clock_mac,
          probe_in0 => mtrlb_activity_flash,
	  probe_in1 => mtrlb_pktchk_error,
	  probe_in2 => control_ready,
	  probe_out0 => start_config,
	  probe_out1 => control_data,
	  probe_out2 => control_valid);

    -- VIO for reset 
--    virtual_reset_mac : vio_0
--        port map (
--                        clk => clock_mac,
--                        probe_in0 =>  o1,
--                       probe_in1 =>  o2,
--                        probe_in2 =>  o3,
--                        probe_out0 => reset_sync_mac,
--                        probe_out1 => o4,
--                        probe_out2 => o5,
--                        probe_out3 => o6,
--                        probe_out4 => o7);
 
    EXTERNAL_INTERRUPT(0) <= '0';
    LOGGER_MODE(0) <= '0';

    test_inst: processor_1x1x32 port map(
		THREAD_RESET(0) => CPU_RESET(0),
      		THREAD_RESET(1) => DEBUG_MODE(0),
      		THREAD_RESET(2) => SINGLE_STEP_MODE(0),
      		THREAD_RESET(3) => LOGGER_MODE(0),
		EXTERNAL_INTERRUPT => EXTERNAL_INTERRUPT,
		-- only bottom 2 bits used.
		PROCESSOR_MODE => PROCESSOR_MODE,
    		MAIN_MEM_INVALIDATE_pipe_write_data  => INVALIDATE_REQUEST_pipe_write_data , -- in
    		MAIN_MEM_INVALIDATE_pipe_write_req   => INVALIDATE_REQUEST_pipe_write_req  , -- in
    		MAIN_MEM_INVALIDATE_pipe_write_ack   => INVALIDATE_REQUEST_pipe_write_ack  , -- out
    		SOC_MONITOR_to_DEBUG_pipe_write_data  => MONITOR_to_DEBUG_pipe_write_data , -- in
    		SOC_MONITOR_to_DEBUG_pipe_write_req  => MONITOR_to_DEBUG_pipe_write_req , -- in
    		SOC_MONITOR_to_DEBUG_pipe_write_ack  => MONITOR_to_DEBUG_pipe_write_ack , -- out
    		SOC_DEBUG_to_MONITOR_pipe_read_data  => DEBUG_to_MONITOR_pipe_read_data , -- out
    		SOC_DEBUG_to_MONITOR_pipe_read_req   => DEBUG_to_MONITOR_pipe_read_req  , -- in
    		SOC_DEBUG_to_MONITOR_pipe_read_ack   => DEBUG_to_MONITOR_pipe_read_ack  , -- out
    		CONSOLE_to_SERIAL_RX_pipe_write_data  => CONSOLE_to_SERIAL_RX_pipe_write_data , -- in
    		CONSOLE_to_SERIAL_RX_pipe_write_req  => CONSOLE_to_SERIAL_RX_pipe_write_req , -- in
    		CONSOLE_to_SERIAL_RX_pipe_write_ack  => CONSOLE_to_SERIAL_RX_pipe_write_ack , -- out
    		SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_read_data, -- out
    		SERIAL_TX_to_CONSOLE_pipe_read_req  => SERIAL_TX_to_CONSOLE_pipe_read_req , -- in
    		SERIAL_TX_to_CONSOLE_pipe_read_ack   => SERIAL_TX_to_CONSOLE_pipe_read_ack  , -- out
		--  The memory interface to the processor.
      		MAIN_MEM_RESPONSE_pipe_write_data => MAIN_MEM_RESPONSE_pipe_write_data, -- in
      		MAIN_MEM_RESPONSE_pipe_write_req => MAIN_MEM_RESPONSE_pipe_write_req, -- in
      		MAIN_MEM_RESPONSE_pipe_write_ack => MAIN_MEM_RESPONSE_pipe_write_ack, -- out
      		MAIN_MEM_REQUEST_pipe_read_data => MAIN_MEM_REQUEST_pipe_read_data, -- out
      		MAIN_MEM_REQUEST_pipe_read_req => MAIN_MEM_REQUEST_pipe_read_req, -- in
      		MAIN_MEM_REQUEST_pipe_read_ack => MAIN_MEM_REQUEST_pipe_read_ack, -- out
      		clk => clock,
      		reset => reset_sync
	);
   	CPU_MODE <= PROCESSOR_MODE(1 downto 0);

  ---------------------------------------------------------------------------
  -- ACB fast tap!  
  ---------------------------------------------------------------------------
	main_tap: acb_fast_tap  -- done
		port map (
				clk => clock, reset => reset_sync,

    				CORE_BUS_REQUEST_pipe_write_data => MAIN_MEM_REQUEST_pipe_read_data, -- in
    				CORE_BUS_REQUEST_pipe_write_req  => MAIN_MEM_REQUEST_pipe_read_ack, -- in
    				CORE_BUS_REQUEST_pipe_write_ack  => MAIN_MEM_REQUEST_pipe_read_req, -- out

    				CORE_BUS_RESPONSE_pipe_read_data => MAIN_MEM_RESPONSE_pipe_write_data, -- out
    				CORE_BUS_RESPONSE_pipe_read_req  => MAIN_MEM_RESPONSE_pipe_write_ack, -- in
    				CORE_BUS_RESPONSE_pipe_read_ack  => MAIN_MEM_RESPONSE_pipe_write_req, -- out

				-- connect to the tap.
    				CORE_BUS_REQUEST_TAP_pipe_read_data => MAIN_TAP_REQUEST_pipe_read_data, -- out
    				CORE_BUS_REQUEST_TAP_pipe_read_req  => MAIN_TAP_REQUEST_pipe_read_req, -- in
    				CORE_BUS_REQUEST_TAP_pipe_read_ack  => MAIN_TAP_REQUEST_pipe_read_ack, -- out
				-- MAIN_TAP_RESPONSE
    				CORE_BUS_RESPONSE_TAP_pipe_write_data => MAIN_TAP_RESPONSE_pipe_write_data, -- in
    				CORE_BUS_RESPONSE_TAP_pipe_write_req  => MAIN_TAP_RESPONSE_pipe_write_ack, -- in
    				CORE_BUS_RESPONSE_TAP_pipe_write_ack  => MAIN_TAP_RESPONSE_pipe_write_req, -- out

				-- MAIN_THROUGH_REQUEST
    				CORE_BUS_REQUEST_THROUGH_pipe_read_data => MAIN_THROUGH_REQUEST_pipe_read_data, -- out
    				CORE_BUS_REQUEST_THROUGH_pipe_read_req  => MAIN_THROUGH_REQUEST_pipe_read_req, -- in
    				CORE_BUS_REQUEST_THROUGH_pipe_read_ack  => MAIN_THROUGH_REQUEST_pipe_read_ack, -- out
				-- MAIN_THROUGH_RESPONSE
    				CORE_BUS_RESPONSE_THROUGH_pipe_write_data => MAIN_THROUGH_RESPONSE_pipe_write_data, -- in
    				CORE_BUS_RESPONSE_THROUGH_pipe_write_req  => MAIN_THROUGH_RESPONSE_pipe_write_req, -- in
    				CORE_BUS_RESPONSE_THROUGH_pipe_write_ack  => MAIN_THROUGH_RESPONSE_pipe_write_ack, -- out

    				MAX_ADDR_TAP => MAX_ADDR_TAP, -- in
    				MIN_ADDR_TAP => MIN_ADDR_TAP -- in
			);

   --MAX_ADDR_TAP <= X"00040ffff";  -- 4MB + 64KB-1
   --MIN_ADDR_TAP <= X"000400000"; -- 4MB
   --MAX_ADDR_TAP <= X"0FFFF50FF";  -- MMIO for NIC+ 256B-1
   --MIN_ADDR_TAP <= X"0FFFF5000"; -- MMIO for NIC
   MAX_ADDR_TAP <= X"01FFFFFFF";  -- MMIO for NIC+ 256B-1
   MIN_ADDR_TAP <= X"010000000"; -- MMIO for NIC

  -- two buffers between TAP and acb_afb_bridge
  qb_req_tap: QueueBase -- done
	generic map (name => "main_tap_req_buffer", queue_depth => 2,
			data_width => 110, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_TAP_REQUEST_pipe_read_data, -- in
			push_req => MAIN_TAP_REQUEST_pipe_read_ack(0), -- in
			push_ack => MAIN_TAP_REQUEST_pipe_read_req(0), -- out
			data_out => MAIN_TAP_REQUEST_BUF_pipe_read_data, -- out
			pop_req => MAIN_TAP_REQUEST_BUF_pipe_read_ack(0), -- in
			pop_ack => MAIN_TAP_REQUEST_BUF_pipe_read_req(0) -- out
		);
  qb_resp_tap: QueueBase -- done
	generic map (name => "main_tap_resp_buffer", queue_depth => 2,
			data_width => 65, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_TAP_RESPONSE_BUF_pipe_write_data, -- in
			push_req => MAIN_TAP_RESPONSE_BUF_pipe_write_req(0), -- in
			push_ack => MAIN_TAP_RESPONSE_BUF_pipe_write_ack(0), -- out
			data_out => MAIN_TAP_RESPONSE_pipe_write_data, -- out
			pop_req => MAIN_TAP_RESPONSE_pipe_write_req(0), -- in
			pop_ack => MAIN_TAP_RESPONSE_pipe_write_ack(0) -- out
		);
  acb_afb_bridge_nic: acb_afb_bridge  -- done
	port map(
		clk => clock, reset => reset_sync,
		AFB_BUS_RESPONSE_pipe_write_data => AFB_NIC_RESPONSE_DFIFO_pipe_write_data, -- in 
		AFB_BUS_RESPONSE_pipe_write_req  => AFB_NIC_RESPONSE_DFIFO_pipe_write_ack, -- in
		AFB_BUS_RESPONSE_pipe_write_ack  => AFB_NIC_RESPONSE_DFIFO_pipe_write_req, -- out
		CORE_BUS_REQUEST_pipe_write_data => MAIN_TAP_REQUEST_BUF_pipe_read_data, -- in
		CORE_BUS_REQUEST_pipe_write_req  => MAIN_TAP_REQUEST_BUF_pipe_read_req, -- in
		CORE_BUS_REQUEST_pipe_write_ack  => MAIN_TAP_REQUEST_BUF_pipe_read_ack, -- out
		AFB_BUS_REQUEST_pipe_read_data 	 => AFB_NIC_REQUEST_pipe_read_data, -- out
		AFB_BUS_REQUEST_pipe_read_req    => AFB_NIC_REQUEST_pipe_read_req, -- in
		AFB_BUS_REQUEST_pipe_read_ack    => AFB_NIC_REQUEST_pipe_read_ack, -- out
		CORE_BUS_RESPONSE_pipe_read_data => MAIN_TAP_RESPONSE_BUF_pipe_write_data, -- out
		CORE_BUS_RESPONSE_pipe_read_req  => MAIN_TAP_RESPONSE_BUF_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_pipe_read_ack  => MAIN_TAP_RESPONSE_BUF_pipe_write_req -- out
  );
  
  -- two buffers between TAP and acb_mux
  qb_req_through: QueueBase -- done
	generic map (name => "main_through_req_buffer", queue_depth => 2,
			data_width => 110, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_THROUGH_REQUEST_pipe_read_data, -- in
			push_req => MAIN_THROUGH_REQUEST_pipe_read_ack(0), -- in
			push_ack => MAIN_THROUGH_REQUEST_pipe_read_req(0), -- out
			data_out => MAIN_THROUGH_REQUEST_BUF_pipe_read_data, -- out
			pop_req => MAIN_THROUGH_REQUEST_BUF_pipe_read_ack(0), -- in
			pop_ack => MAIN_THROUGH_REQUEST_BUF_pipe_read_req(0) -- out
		);
  qb_resp_through: QueueBase  -- done
	generic map (name => "main_through_resp_buffer", queue_depth => 2,
			data_width => 65, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_THROUGH_RESPONSE_BUF_pipe_write_data, -- in
			push_req => MAIN_THROUGH_RESPONSE_BUF_pipe_write_req(0), -- in
			push_ack => MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack(0), -- out
			data_out => MAIN_THROUGH_RESPONSE_pipe_write_data, -- out
			pop_req => MAIN_THROUGH_RESPONSE_pipe_write_ack(0), -- in
			pop_ack => MAIN_THROUGH_RESPONSE_pipe_write_req(0) -- out
		);
  
  acb_mux: acb_fast_mux   -- done
	port map( 
		clk => clock, reset => reset_sync,
		CORE_BUS_REQUEST_HIGH_pipe_write_data => MAIN_THROUGH_REQUEST_BUF_pipe_read_data, -- in
		CORE_BUS_REQUEST_HIGH_pipe_write_req  => MAIN_THROUGH_REQUEST_BUF_pipe_read_req, -- in
		CORE_BUS_REQUEST_HIGH_pipe_write_ack  => MAIN_THROUGH_REQUEST_BUF_pipe_read_ack, -- out
		CORE_BUS_REQUEST_LOW_pipe_write_data  => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_data, -- in
		CORE_BUS_REQUEST_LOW_pipe_write_req   => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_ack, -- in
		CORE_BUS_REQUEST_LOW_pipe_write_ack   => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_req, -- out
		CORE_BUS_RESPONSE_pipe_write_data     => MUX_TO_MEM_RESPONSE_pipe_write_data, -- in
		CORE_BUS_RESPONSE_pipe_write_req      => MUX_TO_MEM_RESPONSE_pipe_write_req, -- in
		CORE_BUS_RESPONSE_pipe_write_ack      => MUX_TO_MEM_RESPONSE_pipe_write_ack, -- out
		CORE_BUS_REQUEST_pipe_read_data       => MUX_TO_MEM_REQUEST_pipe_read_data, --out
		CORE_BUS_REQUEST_pipe_read_req        => MUX_TO_MEM_REQUEST_pipe_read_ack, -- in
		CORE_BUS_REQUEST_pipe_read_ack        => MUX_TO_MEM_REQUEST_pipe_read_req, -- out
		CORE_BUS_RESPONSE_HIGH_pipe_read_data => MAIN_THROUGH_RESPONSE_BUF_pipe_write_data, -- out
		CORE_BUS_RESPONSE_HIGH_pipe_read_req  => MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_HIGH_pipe_read_ack  => MAIN_THROUGH_RESPONSE_BUF_pipe_write_req, -- out
		CORE_BUS_RESPONSE_LOW_pipe_read_data  => MEMORY_TO_NIC_RESPONSE_pipe_read_data, -- out
		CORE_BUS_RESPONSE_LOW_pipe_read_req   => MEMORY_TO_NIC_RESPONSE_pipe_read_req, -- in
		CORE_BUS_RESPONSE_LOW_pipe_read_ack   => MEMORY_TO_NIC_RESPONSE_pipe_read_ack -- out
	);


  -- two buffers between acb_mux acb_ram
  qb_req_mem: QueueBase  -- done
	generic map (name => "mux_mem_req_buffer", queue_depth => 2,
			data_width => 110, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MUX_TO_MEM_REQUEST_pipe_read_data, -- in
			push_req => MUX_TO_MEM_REQUEST_pipe_read_req(0), -- in
			push_ack => MUX_TO_MEM_REQUEST_pipe_read_ack(0), -- out
			data_out => MUX_TO_MEM_REQUEST_BUF_pipe_read_data, -- out
			pop_req => MUX_TO_MEM_REQUEST_BUF_pipe_read_ack(0), -- in
			pop_ack => MUX_TO_MEM_REQUEST_BUF_pipe_read_req(0) -- out
		);
  qb_resp_mem: QueueBase   -- done
	generic map (name => "mux_mem_resp_buffer", queue_depth => 2, 
			data_width => 65, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MUX_TO_MEM_RESPONSE_BUF_pipe_write_data, -- in
			push_req => MUX_TO_MEM_RESPONSE_BUF_pipe_write_req(0), -- in
			push_ack => MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack(0), -- out
			data_out => MUX_TO_MEM_RESPONSE_pipe_write_data, -- out
			pop_req => MUX_TO_MEM_RESPONSE_pipe_write_ack(0), -- in
			pop_ack => MUX_TO_MEM_RESPONSE_pipe_write_req(0) -- out
		);
  
  nic_instance : ahir_system 			-- TODO : done
	port map( 
		clk => clock_mac, 
		reset => reset_sync_mac,
		AFB_NIC_REQUEST_pipe_write_data => AFB_NIC_REQUEST_tap_pipe_read_data, -- in
		AFB_NIC_REQUEST_pipe_write_req => AFB_NIC_REQUEST_tap_pipe_read_ack, -- in
		AFB_NIC_REQUEST_pipe_write_ack => AFB_NIC_REQUEST_tap_pipe_read_req, -- out
		AFB_NIC_RESPONSE_pipe_read_data => AFB_NIC_RESPONSE_pipe_read_data, -- out
		AFB_NIC_RESPONSE_pipe_read_req => AFB_NIC_RESPONSE_pipe_read_req, -- in
		AFB_NIC_RESPONSE_pipe_read_ack  => AFB_NIC_RESPONSE_pipe_read_ack, -- out
		MEMORY_TO_NIC_RESPONSE_pipe_write_data => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_req => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_ack => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_data => NIC_TO_MEMORY_REQUEST_pipe_read_data, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_req => NIC_TO_MEMORY_REQUEST_pipe_read_req, -- in
		NIC_TO_MEMORY_REQUEST_pipe_read_ack => NIC_TO_MEMORY_REQUEST_pipe_read_ack, -- out
   		enable_mac_pipe_read_data => enable_mac_pipe_read_data, --out
    		enable_mac_pipe_read_req =>  enable_mac_pipe_read_req, --in
    		enable_mac_pipe_read_ack =>  enable_mac_pipe_read_ack, -- out
		mac_to_nic_data_pipe_write_data => RX_FIFO_pipe_read_data, -- in
		mac_to_nic_data_pipe_write_req => RX_FIFO_pipe_read_ack, -- in
		mac_to_nic_data_pipe_write_ack => RX_FIFO_pipe_read_req, -- out
		nic_to_mac_transmit_pipe_pipe_read_data => TX_FIFO_pipe_write_data, --out
		nic_to_mac_transmit_pipe_pipe_read_req => TX_FIFO_pipe_write_req, -- in
		nic_to_mac_transmit_pipe_pipe_read_ack => TX_FIFO_pipe_write_ack -- out
	); 

  
   	
   	
  	 nic_mac_reset_sync : nic_mac_pipe_reset 
	port map(
		clk => clock_mac,

		ENABLE_MAC_pipe_data => enable_mac_pipe_read_data(0),
		ENABLE_MAC_pipe_req => enable_mac_pipe_read_ack(0),
		ENABLE_MAC_pipe_ack =>  enable_mac_pipe_read_req(0),

		reset => enable_reset(0)
	);

   DualClockedQueue_ACB_req_instance: DualClockedQueue_ACB_req  -- done
	port map( 
		    -- read 
		    read_req_in => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_req(0),
		    read_data_out => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_data,
		    read_ack_out => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_ack(0),
		    -- write 
		    write_req_out => NIC_TO_MEMORY_REQUEST_pipe_read_req(0),
		    write_data_in => NIC_TO_MEMORY_REQUEST_pipe_read_data,
		    write_ack_in => NIC_TO_MEMORY_REQUEST_pipe_read_ack(0),
		
		    read_clk => clock,
		    write_clk => clock_mac,
		    
		    reset => reset_sync);	
	
	DualClockedQueue_ACB_resp_inst : DualClockedQueue_ACB_resp -- done
		port map( 
		    -- read
		    read_req_in => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack(0),
		    read_data_out =>MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data,
		    read_ack_out => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req(0),
		    -- write 
		    write_req_out => MEMORY_TO_NIC_RESPONSE_pipe_read_req(0),
		    write_data_in => MEMORY_TO_NIC_RESPONSE_pipe_read_data,
		    write_ack_in => MEMORY_TO_NIC_RESPONSE_pipe_read_ack(0),
		
		    read_clk => clock_mac,
		    write_clk => clock,
		    
		    reset => reset_sync_mac);
	
	DualClockedQueue_AFB_req_inst : DualClockedQueue_AFB_req -- done
		port map( 
		    -- read 
		    read_req_in => AFB_NIC_REQUEST_DFIFO_pipe_write_ack(0),
		    read_data_out => AFB_NIC_REQUEST_DFIFO_pipe_write_data,
		    read_ack_out => AFB_NIC_REQUEST_DFIFO_pipe_write_req(0),
		    -- write 
		    write_req_out => AFB_NIC_REQUEST_pipe_read_req(0),
		    write_data_in => AFB_NIC_REQUEST_pipe_read_data,
		    write_ack_in => AFB_NIC_REQUEST_pipe_read_ack(0),
		
		    read_clk => clock_mac,
		    write_clk => clock,
		    
		    reset => reset_sync_mac);
	
	DualClockedQueue_AFB_resp_inst : DualClockedQueue_AFB_resp -- done
		port map( 
		    -- read
		    read_req_in => AFB_NIC_RESPONSE_DFIFO_pipe_write_req(0),
		    read_data_out => AFB_NIC_RESPONSE_DFIFO_pipe_write_data,
		    read_ack_out => AFB_NIC_RESPONSE_DFIFO_pipe_write_ack(0),
		    -- write 
		    --write_req_out => AFB_NIC_RESPONSE_pipe_read_req(0),
		    --write_data_in => AFB_NIC_RESPONSE_pipe_read_data,
		    --write_ack_in => AFB_NIC_RESPONSE_pipe_read_ack(0),
		
		    write_req_out => AFB_TAP_RESP_REQ(0),
		    write_data_in => AFB_TAP_RESP_DATA, 
		    write_ack_in => AFB_TAP_RESP_ACK(0),

		    read_clk => clock,
		    write_clk => clock_mac,
		    
		    reset => reset_sync);

	--scl_in <= (not scl_pull_down) and scl;
	--sda_in <= (not sda_pull_down) and sda;

	scl_in(0) <= '0' when ((scl_pull_down(0) = '1') or (scl(0) = '0')) else '1';
        sda_in(0) <= '0' when ((sda_pull_down(0) = '1') or (sda(0) = '0')) else '1';

        driven_scl_out(0) <= '0' when (scl_pull_down(0) = '1') else 'Z';
        driven_sda_out(0) <= '0' when (sda_pull_down(0) = '1') else 'Z';

        scl <= driven_scl_out;
        sda <= driven_sda_out;


	afb_i2c_ins : afb_i2c_master
        	port map(
                	AFB_BUS_REQUEST_pipe_write_data  =>  AFB_BUS_REQUEST_pipe_write_data,  -- in std_logic_vector(73 downto 0);
                	AFB_BUS_REQUEST_pipe_write_req   =>  AFB_BUS_REQUEST_pipe_write_req,  -- in std_logic_vector(0  downto 0);
                	AFB_BUS_REQUEST_pipe_write_ack   =>  AFB_BUS_REQUEST_pipe_write_ack,  -- out std_logic_vector(0  downto 0);
                	AFB_BUS_RESPONSE_pipe_read_data  =>  AFB_BUS_RESPONSE_pipe_read_data,  -- out std_logic_vector(32 downto 0);
                	AFB_BUS_RESPONSE_pipe_read_req   =>  AFB_BUS_RESPONSE_pipe_read_req,  -- in std_logic_vector(0  downto 0);
                	AFB_BUS_RESPONSE_pipe_read_ack   =>  AFB_BUS_RESPONSE_pipe_read_ack,  -- out std_logic_vector(0  downto 0);
                	sda_pull_down        =>  sda_pull_down,  -- out  std_logic_vector(0 downto 0);
                	sda_in               =>  sda_in,  -- in  std_logic_vector(0 downto 0);
                	scl_pull_down        =>  scl_pull_down,  -- out std_logic_vector(0 downto 0);
                	scl_in               =>  scl_in,  -- in  std_logic_vector(0 downto 0);
                	clk => clock_mac,
                	reset =>  reset_sync_mac);  -- in std_logic
	ila_0_inst : ila_0 
		port map(
			clk => clock_mac,
			probe0 => AFB_BUS_REQUEST_pipe_write_data,
			probe1 => AFB_BUS_REQUEST_pipe_write_req,
			probe2 => AFB_BUS_REQUEST_pipe_write_ack,
			probe3 => AFB_BUS_RESPONSE_pipe_read_data,
			probe4 => AFB_BUS_RESPONSE_pipe_read_req,
			probe5 => AFB_BUS_RESPONSE_pipe_read_ack);

	ila_0_inst1 : ila_0 
		port map(
			clk => clock_mac,
			probe0 => AFB_NIC_REQUEST_tap_pipe_read_data,
			probe1 => AFB_NIC_REQUEST_tap_pipe_read_req,
			probe2 => AFB_NIC_REQUEST_tap_pipe_read_ack,
			probe3 => AFB_NIC_RESPONSE_pipe_read_data,
			probe4 => AFB_NIC_RESPONSE_pipe_read_ack,
			probe5 => AFB_NIC_RESPONSE_pipe_read_req);

	afb_tap_inst : afb_fast_tap
	  port map( -- 
		    AFB_BUS_REQUEST_pipe_write_data  => AFB_NIC_REQUEST_DFIFO_pipe_write_data ,  -- in std_logic_vector(73 downto 0);
		    AFB_BUS_REQUEST_pipe_write_req   => AFB_NIC_REQUEST_DFIFO_pipe_write_req ,  -- in std_logic_vector(0  downto 0);
		    AFB_BUS_REQUEST_pipe_write_ack   => AFB_NIC_REQUEST_DFIFO_pipe_write_ack ,  -- out std_logic_vector(0  downto 0);
		    AFB_BUS_RESPONSE_TAP_pipe_write_data  =>  AFB_NIC_RESPONSE_pipe_read_data,  -- in std_logic_vector(32 downto 0);
		    AFB_BUS_RESPONSE_TAP_pipe_write_req   =>  AFB_NIC_RESPONSE_pipe_read_ack,  -- in std_logic_vector(0  downto 0);
		    AFB_BUS_RESPONSE_TAP_pipe_write_ack   =>  AFB_NIC_RESPONSE_pipe_read_req,  -- out std_logic_vector(0  downto 0);
		    AFB_BUS_RESPONSE_THROUGH_pipe_write_data  => AFB_BUS_RESPONSE_pipe_read_data ,  -- in std_logic_vector(32 downto 0);
		    AFB_BUS_RESPONSE_THROUGH_pipe_write_req   => AFB_BUS_RESPONSE_pipe_read_ack ,  -- in std_logic_vector(0  downto 0);
		    AFB_BUS_RESPONSE_THROUGH_pipe_write_ack   => AFB_BUS_RESPONSE_pipe_read_req ,  -- out std_logic_vector(0  downto 0);
		    MAX_ADDR_TAP  =>  MAX_ADDR_TAP_AFB,  -- in std_logic_vector(35 downto 0);
		    MIN_ADDR_TAP  =>  MIN_ADDR_TAP_AFB,  -- in std_logic_vector(35 downto 0);
		    AFB_BUS_REQUEST_TAP_pipe_read_data  =>  AFB_NIC_REQUEST_tap_pipe_read_data,  -- out std_logic_vector(73 downto 0);
		    AFB_BUS_REQUEST_TAP_pipe_read_req   =>  AFB_NIC_REQUEST_tap_pipe_read_req,  -- in std_logic_vector(0  downto 0);
		    AFB_BUS_REQUEST_TAP_pipe_read_ack   =>  AFB_NIC_REQUEST_tap_pipe_read_ack,  -- out std_logic_vector(0  downto 0);
		    AFB_BUS_REQUEST_THROUGH_pipe_read_data  => AFB_BUS_REQUEST_pipe_write_data ,  -- out std_logic_vector(73 downto 0);
		    AFB_BUS_REQUEST_THROUGH_pipe_read_req   => AFB_BUS_REQUEST_pipe_write_ack ,  -- in std_logic_vector(0  downto 0);
		    AFB_BUS_REQUEST_THROUGH_pipe_read_ack   => AFB_BUS_REQUEST_pipe_write_req ,  -- out std_logic_vector(0  downto 0);
		    AFB_BUS_RESPONSE_pipe_read_data  =>  AFB_TAP_RESP_DATA,  -- out std_logic_vector(32 downto 0);
		    AFB_BUS_RESPONSE_pipe_read_req   =>  AFB_TAP_RESP_REQ,  -- in std_logic_vector(0  downto 0);
		    AFB_BUS_RESPONSE_pipe_read_ack   =>  AFB_TAP_RESP_ACK,  -- out std_logic_vector(0  downto 0);
		    clk => clock_mac, 
		    reset =>  reset_sync_mac);  -- in std_logic

	--MAX_ADDR_TAP_AFB <= X"010FFFFFF";
	--MIN_ADDR_TAP_AFB <= X"010000000";
	  -- i2c reg start at 0x010000400
	MAX_ADDR_TAP_AFB <= X"0100003ff";
	MIN_ADDR_TAP_AFB <= X"010000000";



   mac_support : axi_ethernet_0_example
	port map(
        phy_rst_n => phy_rst_n,
        sgmii_rxn => sgmii_rxn,
        sgmii_rxp => sgmii_rxp,
        sgmii_txn => sgmii_txn,
        sgmii_txp => sgmii_txp,
        
        mgt_clk_n => mgt_clk_n,
        mgt_clk_p => mgt_clk_p,
        
        dummy_port_in => dummy_port_in,
        mdio => mdio,
        mdc => mdc,
        
        soft_rst => soft_rst,
    
        -- from reset and clock generator
        axi_lite_resetn => axi_lite_resetn ,
        axis_rstn => axis_rstn       ,
        sys_out_rst => sys_out_rst     ,
        
         -- clock outputs
        clkgen_gtx_clk => clock_mac, --clkgen_gtx_clk
        ref_clk => ref_clk  ,
        ref_clk_50_bufg => ref_clk_50_bufg,
        axis_clk => clock, -- axis_clk
        axi_lite_clk => axi_lite_clk,
            
        -- control signals
            
        mtrlb_activity_flash => mtrlb_activity_flash(0),
        mtrlb_pktchk_error => mtrlb_pktchk_error(0),
        control_ready => control_ready(0),
            
        control_valid => control_valid(0),
        control_data => control_data,
        start_config => start_config(0),
        
         --/ ip data
        s_axis_txc_tdata => s_axis_txc_tdata    , 
        s_axis_txc_tkeep => s_axis_txc_tkeep    , 
        s_axis_txc_tlast => s_axis_txc_tlast    , 
        s_axis_txc_tready => s_axis_txc_tready   , 
        s_axis_txc_tvalid => s_axis_txc_tvalid   , 
        
        s_axis_txd_tdata => s_axis_txd_tdata    , 
        s_axis_txd_tkeep => s_axis_txd_tkeep    , 
        s_axis_txd_tlast => s_axis_txd_tlast    , 
        s_axis_txd_tready => s_axis_txd_tready   , 
        s_axis_txd_tvalid => s_axis_txd_tvalid   , 
         
        m_axis_rxd_tdata => m_axis_rxd_tdata    , 
        m_axis_rxd_tkeep => m_axis_rxd_tkeep    , 
        m_axis_rxd_tlast => m_axis_rxd_tlast    , 
        m_axis_rxd_tready => m_axis_rxd_tready   , 
        m_axis_rxd_tvalid => m_axis_rxd_tvalid   , 
            
        m_axis_rxs_tdata => m_axis_rxs_tdata    , 
        m_axis_rxs_tkeep => m_axis_rxs_tkeep    , 
        m_axis_rxs_tlast => m_axis_rxs_tlast    , 
        m_axis_rxs_tready => m_axis_rxs_tready   , 
        m_axis_rxs_tvalid => m_axis_rxs_tvalid);

	
	ILA_inst1 : ila_1
		port map( 
	         clk =>  clock_mac , -- input wire clk
	         probe0 =>  axis_rstn , -- input wire [0:0]  probe0  
	         probe1 =>  m_axis_rxs_tdata , -- input wire [31:0]  probe1 
	         probe2 =>  m_axis_rxs_tkeep , -- input wire [3:0]  probe2 
	         probe3 =>  s_axis_txc_tlast , -- input wire [0:0]  probe3 
	         probe4 =>  s_axis_txc_tready , -- input wire [0:0]  probe4 
	         probe5 =>  m_axis_rxs_tvalid , -- input wire [0:0]  probe5 
	         probe6 =>  axis_rstn , -- input wire [0:0]  probe6 
	         probe7 =>  m_axis_rxd_tdata , -- input wire [31:0]  probe7 
        	 probe8 =>  m_axis_rxd_tkeep , -- input wire [3:0]  probe8 
	         probe9 =>  m_axis_rxd_tlast , -- input wire [0:0]  probe9 
	         probe10 =>  m_axis_rxd_tready , -- input wire [0:0]  probe10 
        	 probe11 =>  m_axis_rxd_tvalid  -- input wire [0:0]  probe11
	         );
	
	ILA_inst2 : ila_1  
		port map(  
	         clk =>  scl_in(0) , -- input wire clk
	         probe0 =>  scl_in(0) , -- input wire [0:0]  probe0  
	         probe1 =>  s_axis_txc_tdata , -- input wire [31:0]  probe1 
	         probe2 =>  s_axis_txc_tkeep , -- input wire [3:0]  probe2 
	         probe3 =>  sda_in(0) , -- input wire [0:0]  probe3 
	         probe4 =>  scl_pull_down(0) , -- input wire [0:0]  probe4 
	         probe5 =>  sda_pull_down(0) , -- input wire [0:0]  probe5 
	         probe6 =>  driven_sda_out(0), -- input wire [0:0]  probe6 
	         probe7 =>  s_axis_txd_tdata , -- input wire [31:0]  probe7 
	         probe8 =>  s_axis_txd_tkeep , -- input wire [3:0]  probe8 
        	 probe9 =>  driven_scl_out(0) , -- input wire [0:0]  probe9 
	         probe10 =>  scl(0) , -- input wire [0:0]  probe10 
	         probe11 =>  sda(0)  -- input wire [0:0]  probe11
	 	 );
  

  
  bram:acb_sram_stub generic map (addr_width => 22) port map (
      CORE_BUS_REQUEST_PIPE_WRITE_DATA => MUX_TO_MEM_REQUEST_BUF_pipe_read_data, -- in
      CORE_BUS_REQUEST_PIPE_WRITE_REQ  => MUX_TO_MEM_REQUEST_BUF_pipe_read_req, -- in
      CORE_BUS_REQUEST_PIPE_WRITE_ACK  => MUX_TO_MEM_REQUEST_BUF_pipe_read_ack, -- out
      CORE_BUS_RESPONSE_PIPE_READ_DATA => MUX_TO_MEM_RESPONSE_BUF_pipe_write_data, -- out
      CORE_BUS_RESPONSE_PIPE_READ_REQ  => MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack, -- in
      CORE_BUS_RESPONSE_PIPE_READ_ACK  => MUX_TO_MEM_RESPONSE_BUF_pipe_write_req, -- out
      clk => clock, 
      reset => reset_sync
   );


  debug_uart_inst: configurable_uart
  port map ( --
    CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD, -- in
    CONSOLE_to_RX_pipe_read_data => MONITOR_to_DEBUG_pipe_write_data, -- out
    CONSOLE_to_RX_pipe_read_req => MONITOR_to_DEBUG_pipe_write_ack, -- in
    CONSOLE_to_RX_pipe_read_ack => MONITOR_to_DEBUG_pipe_write_req, -- out
    TX_to_CONSOLE_pipe_write_data => DEBUG_to_MONITOR_pipe_read_data, -- in
    TX_to_CONSOLE_pipe_write_req => DEBUG_to_MONITOR_pipe_read_ack, -- in
    TX_to_CONSOLE_pipe_write_ack => DEBUG_to_MONITOR_pipe_read_req, -- out
    UART_RX => DEBUG_UART_RX, -- in
    UART_TX => DEBUG_UART_TX, -- out
    clk => clock, reset => reset_sync
    ); -- 

  serial_uart_inst: configurable_uart
  port map ( --
    CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD, -- in
    CONSOLE_to_RX_pipe_read_data => CONSOLE_to_SERIAL_RX_pipe_write_data, -- out
    CONSOLE_to_RX_pipe_read_req => CONSOLE_to_SERIAL_RX_pipe_write_ack, -- in
    CONSOLE_to_RX_pipe_read_ack => CONSOLE_to_SERIAL_RX_pipe_write_req, -- out
    TX_to_CONSOLE_pipe_write_data => SERIAL_TX_to_CONSOLE_pipe_read_data, -- in
    TX_to_CONSOLE_pipe_write_req => SERIAL_TX_to_CONSOLE_pipe_read_ack, -- in
    TX_to_CONSOLE_pipe_write_ack => SERIAL_TX_to_CONSOLE_pipe_read_req, -- out
    UART_RX => SERIAL_UART_RX, -- in
    UART_TX => SERIAL_UART_TX, -- out
    clk => clock, reset => reset_sync
    ); -- 

--  process (clock)
--  begin
--    if (clock'event and clock = '1') then
--	reset_sync_pre_buf <= reset2;
--	reset2 <= reset1;
--	reset1 <= reset;
--    end if;
--  end process;

  process (clock_mac)
  begin
    if (clock_mac'event and clock_mac = '1') then
	reset_sync_mac <= reset2_mac;
	reset2_mac <= reset1_mac;
	reset1_mac <= reset_sync;
    end if;
  end process;
-- BUFGs to help vivado out..
  --resetBufg: BUFG port map (I => reset_sync_pre_buf, O => reset_sync);
  --resetBufg_mac: BUFG port map (I => reset_sync_pre_buf_mac, O => reset_sync_mac);
end structure;

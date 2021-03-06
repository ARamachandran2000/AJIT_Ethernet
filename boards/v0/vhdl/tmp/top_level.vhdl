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

library ahir_system_global_packagelib;
use ahir_system_global_packagelib.ahir_system_global_package.all;


library UNISIM;
use UNISIM.vcomponents.all;

entity top_level is
port(
      CPU_RESET : in std_logic_vector(0 downto 0);
      DEBUG_MODE : in std_logic_vector(0 downto 0);
      SINGLE_STEP_MODE : in std_logic_vector(0 downto 0);
      CPU_MODE : out std_logic_vector(1 downto 0);
      DEBUG_UART_RX : in std_logic_vector(0 downto 0);
      DEBUG_UART_TX : out std_logic_vector(0 downto 0);
      SERIAL_UART_RX : in std_logic_vector(0 downto 0);
      SERIAL_UART_TX : out std_logic_vector(0 downto 0);
      -- TODO:
      -- SGMIII interface ports (mapped to PHY on the board)
      -- ENABLE FOR MAC+FIFO (mapped to a switch on the board)
      reset,reset_clk: in std_logic;
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
    mac_to_nic_data_pipe_write_data: in std_logic_vector(72 downto 0);
    mac_to_nic_data_pipe_write_req : in std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_data: out std_logic_vector(72 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  
  component mac_rx_interface is
	port(
		clk : in std_logic;
		reset : in std_logic;
		rx_axis_resetn : out std_logic;
		rx_axis_tdata : in std_logic_vector(63 downto 0);
		rx_axis_tkeep : in std_logic_vector(7 downto 0);
		rx_axis_tvalid : in std_logic;
		rx_axis_tuser : in std_logic;
		rx_axis_tlast : in std_logic;
               
		RX_FIFO_pipe_read_data : out std_logic_vector(72 downto 0);
		RX_FIFO_pipe_read_req : in std_logic;
		RX_FIFO_pipe_read_ack : out std_logic);
  end component;
  
  component mac_tx_interface is
	port(
		clk : in std_logic;
		reset : in std_logic;
		tx_axis_tready : in std_logic;
		tx_axis_resetn : out std_logic;
		tx_axis_tdata : out std_logic_vector(63 downto 0);
		tx_axis_tkeep : out std_logic_vector(7 downto 0);
		tx_axis_tvalid : out std_logic;
		tx_axis_tuser : out std_logic;
		tx_axis_tlast : out std_logic;
		TX_FIFO_pipe_write_data : in std_logic_vector(72 downto 0);
		TX_FIFO_pipe_write_req : out std_logic;
		TX_FIFO_pipe_write_ack : in std_logic);
  end component;

  component mac_engine is
  	port(
		clk : in std_logic;
		m_rx_axis_resetn : in std_logic;
		m_rx_axis_tdata : out std_logic_vector(63 downto 0);
		m_rx_axis_tkeep : out std_logic_vector(7 downto 0);
		m_rx_axis_tvalid : out std_logic;
		m_rx_axis_tuser : out std_logic;
		m_rx_axis_tlast : out std_logic;

		s_tx_axis_resetn : in std_logic;
		s_tx_axis_tdata : in std_logic_vector(63 downto 0);
		s_tx_axis_tkeep : in std_logic_vector(7 downto 0);
		s_tx_axis_tvalid : in std_logic;
		s_tx_axis_tuser : in std_logic;
		s_tx_axis_tlast : in std_logic;
		s_tx_axis_tready : out std_logic);
   end component;
  
  signal PROCESSOR_MODE: std_logic_vector(15 downto 0);


   
   -- to generate a 156 and 80  Mhz clock
   component clk_wiz_1
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
   
   signal TX_FIFO_pipe_write_data : std_logic_vector (72 downto 0);
   signal TX_FIFO_pipe_write_req : std_logic_vector (0 downto 0);
   signal TX_FIFO_pipe_write_ack : std_logic_vector (0 downto 0);
   
   -- mac side connections   
   signal rx_axis_resetn : std_logic;
   signal rx_axis_tdata : std_logic_vector (63 downto 0);
   signal rx_axis_tkeep : std_logic_vector (7 downto 0);
   signal rx_axis_tvalid : std_logic;
   signal rx_axis_tuser : std_logic;
   signal rx_axis_tlast : std_logic;
   
   signal tx_axis_resetn : std_logic;
   signal tx_axis_tdata : std_logic_vector (63 downto 0);
   signal tx_axis_tkeep : std_logic_vector (7 downto 0);
   signal tx_axis_tvalid : std_logic;
   signal tx_axis_tuser : std_logic;
   signal tx_axis_tlast : std_logic;
   signal tx_axis_tready : std_logic;
   
   -- ADDITIONAL SIGNALS FOR MAC + NIC + SWITCH 
begin


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
   clocking1 : clk_wiz_1
      port map ( 
        -- Clock out ports  
         clk_out1 => clock_mac,
	 clk_out2 => clock,
        -- Status and control signals                
         reset => reset_clk,
         locked => lock,
         -- Clock in ports
         clk_in1_p => clk_p,
         clk_in1_n => clk_n
       );
 
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
  
  
   mac_rx_instance : mac_rx_interface	-- done
	port map(
               clk => clock_mac, reset => reset_sync_mac,
               rx_axis_resetn => rx_axis_resetn, -- out
               rx_axis_tdata => rx_axis_tdata, -- in
               rx_axis_tkeep => rx_axis_tkeep, -- in
               rx_axis_tvalid => rx_axis_tvalid, -- in
               rx_axis_tuser => rx_axis_tuser, -- in
               rx_axis_tlast => rx_axis_tlast, -- in
               RX_FIFO_pipe_read_data => RX_FIFO_pipe_read_data, -- out
               RX_FIFO_pipe_read_req => RX_FIFO_pipe_read_req(0), -- in
               RX_FIFO_pipe_read_ack => RX_FIFO_pipe_read_ack(0) -- out
	);
   mac_tx_instance : mac_tx_interface -- done
	port map(
               clk => clock_mac, reset => reset_sync_mac,
               tx_axis_resetn => tx_axis_resetn, -- out
               tx_axis_tdata => tx_axis_tdata, -- out
               tx_axis_tkeep => tx_axis_tkeep, -- out
               tx_axis_tvalid => tx_axis_tvalid, -- out
               tx_axis_tuser => tx_axis_tuser, -- out
               tx_axis_tlast => tx_axis_tlast, -- out
               tx_axis_tready => tx_axis_tready, -- in
               TX_FIFO_pipe_write_data => TX_FIFO_pipe_write_data, -- in
               TX_FIFO_pipe_write_req => TX_FIFO_pipe_write_req(0), -- out
               TX_FIFO_pipe_write_ack => TX_FIFO_pipe_write_ack(0) -- in
	);
	
   mac_engine_instance : mac_engine  -- done
   	port map(
   		clk => clock_mac,
		m_rx_axis_resetn => rx_axis_resetn, --in
		m_rx_axis_tdata => rx_axis_tdata, -- out
		m_rx_axis_tkeep => rx_axis_tkeep, -- out
		m_rx_axis_tvalid => rx_axis_tvalid, -- out
		m_rx_axis_tuser => rx_axis_tuser, -- out
		m_rx_axis_tlast => rx_axis_tlast, -- out

		s_tx_axis_resetn => tx_axis_resetn, -- in
		s_tx_axis_tdata => tx_axis_tdata, -- in
		s_tx_axis_tkeep => tx_axis_tkeep, -- in
		s_tx_axis_tvalid => tx_axis_tvalid, -- in
		s_tx_axis_tuser => tx_axis_tuser, -- in
		s_tx_axis_tlast => tx_axis_tlast, -- in
		s_tx_axis_tready=> tx_axis_tready -- out
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
		    
		    reset => reset);	
	
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
		    
		    reset => reset);
	
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
		    
		    reset => reset);
	
	DualClockedQueue_AFB_resp_inst : DualClockedQueue_AFB_resp -- done
		port map( 
		    -- read
		    read_req_in => AFB_NIC_RESPONSE_DFIFO_pipe_write_req(0),
		    read_data_out => AFB_NIC_RESPONSE_DFIFO_pipe_write_data,
		    read_ack_out => AFB_NIC_RESPONSE_DFIFO_pipe_write_ack(0),
		    -- write 
		    write_req_out => AFB_NIC_RESPONSE_pipe_read_req(0),
		    write_data_in => AFB_NIC_RESPONSE_pipe_read_data,
		    write_ack_in => AFB_NIC_RESPONSE_pipe_read_ack(0),
		
		    read_clk => clock,
		    write_clk => clock_mac,
		    
		    reset => reset);
   
  
  nic_instance : ahir_system 			-- TODO : done
	port map( 
		clk => clock_mac, 
		reset => reset_sync_mac,
		AFB_NIC_REQUEST_pipe_write_data => AFB_NIC_REQUEST_DFIFO_pipe_write_data, -- in
		AFB_NIC_REQUEST_pipe_write_req => AFB_NIC_REQUEST_DFIFO_pipe_write_req, -- in
		AFB_NIC_REQUEST_pipe_write_ack => AFB_NIC_REQUEST_DFIFO_pipe_write_ack, -- out
		AFB_NIC_RESPONSE_pipe_read_data => AFB_NIC_RESPONSE_pipe_read_data, -- out
		AFB_NIC_RESPONSE_pipe_read_req => AFB_NIC_RESPONSE_pipe_read_req, -- in
		AFB_NIC_RESPONSE_pipe_read_ack  => AFB_NIC_RESPONSE_pipe_read_ack, -- out
		MEMORY_TO_NIC_RESPONSE_pipe_write_data => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_req => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_ack => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_data => NIC_TO_MEMORY_REQUEST_pipe_read_data, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_req => NIC_TO_MEMORY_REQUEST_pipe_read_req, -- in
		NIC_TO_MEMORY_REQUEST_pipe_read_ack => NIC_TO_MEMORY_REQUEST_pipe_read_ack, -- out
		mac_to_nic_data_pipe_write_data => RX_FIFO_pipe_read_data, -- in
		mac_to_nic_data_pipe_write_req => RX_FIFO_pipe_read_ack, -- in
		mac_to_nic_data_pipe_write_ack => RX_FIFO_pipe_read_req, -- out
		nic_to_mac_transmit_pipe_pipe_read_data => TX_FIFO_pipe_write_data, --out
		nic_to_mac_transmit_pipe_pipe_read_req => TX_FIFO_pipe_write_req, -- in
		nic_to_mac_transmit_pipe_pipe_read_ack => TX_FIFO_pipe_write_ack -- out
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

  process (clock)
  begin
    if (clock'event and clock = '1') then
	reset_sync_pre_buf <= reset2;
	reset2 <= reset1;
	reset1 <= reset;
    end if;
  end process;

  process (clock_mac)
  begin
    if (clock_mac'event and clock_mac = '1') then
	reset_sync_pre_buf_mac <= reset2_mac;
	reset2_mac <= reset1_mac;
	reset1_mac <= reset;
    end if;
  end process;
  -- BUFGs to help vivado out..
  resetBufg: BUFG port map (I => reset_sync_pre_buf, O => reset_sync);
  resetBufg_mac: BUFG port map (I => reset_sync_pre_buf_mac, O => reset_sync_mac);
end structure;

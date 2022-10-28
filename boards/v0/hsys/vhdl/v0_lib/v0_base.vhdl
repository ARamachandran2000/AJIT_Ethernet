library ieee;
use ieee.std_logic_1164.all;
package v0_base_Type_Package is -- 
  -- 
end package;
library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-->>>>>
library v0_lib;
use v0_lib.v0_base_Type_Package.all;
--<<<<<
-->>>>>
library myUartLib;
library memory_subsys_lib;
library nic_lib;
library ajit_processor_lib;
library myUartLib;
--<<<<<
entity v0_base is -- 
  port( -- 
    DEBUG_UART_RX : in std_logic_vector(0 downto 0);
    EXTERNAL_INTERRUPT : in std_logic_vector(0 downto 0);
    FIRST_TAP_MAX_PA : in std_logic_vector(35 downto 0);
    FIRST_TAP_MIN_PA : in std_logic_vector(35 downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_data : in std_logic_vector(29 downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_ack  : out std_logic_vector(0  downto 0);
    SERIAL_UART_RX : in std_logic_vector(0 downto 0);
    THREAD_RESET : in std_logic_vector(3 downto 0);
    mac_to_nic_data_pipe_write_data : in std_logic_vector(72 downto 0);
    mac_to_nic_data_pipe_write_req  : in std_logic_vector(0  downto 0);
    mac_to_nic_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
    DEBUG_UART_TX : out std_logic_vector(0 downto 0);
    PROCESSOR_MODE : out std_logic_vector(15 downto 0);
    SERIAL_UART_TX : out std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_data : out std_logic_vector(72 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
    nic_to_mac_transmit_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity v0_base;
architecture struct of v0_base is -- 
  signal CONSOLE_to_SERIAL_RX_pipe_write_data: std_logic_vector(7 downto 0);
  signal CONSOLE_to_SERIAL_RX_pipe_write_req : std_logic_vector(0  downto 0);
  signal CONSOLE_to_SERIAL_RX_pipe_write_ack : std_logic_vector(0  downto 0);
  signal CONSOLE_to_SERIAL_RX_pipe_read_data: std_logic_vector(7 downto 0);
  signal CONSOLE_to_SERIAL_RX_pipe_read_req : std_logic_vector(0  downto 0);
  signal CONSOLE_to_SERIAL_RX_pipe_read_ack : std_logic_vector(0  downto 0);
  signal MAIN_MEM_REQUEST_pipe_write_data: std_logic_vector(109 downto 0);
  signal MAIN_MEM_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal MAIN_MEM_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_data: std_logic_vector(109 downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_data: std_logic_vector(64 downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_read_data: std_logic_vector(64 downto 0);
  signal MAIN_MEM_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_data: std_logic_vector(64 downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_read_data: std_logic_vector(64 downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_write_data: std_logic_vector(109 downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_read_data: std_logic_vector(109 downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_write_data: std_logic_vector(7 downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_write_req : std_logic_vector(0  downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_read_data: std_logic_vector(7 downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_read_req : std_logic_vector(0  downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_write_data: std_logic_vector(7 downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_write_req : std_logic_vector(0  downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_write_ack : std_logic_vector(0  downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_read_data: std_logic_vector(7 downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_read_req : std_logic_vector(0  downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_read_ack : std_logic_vector(0  downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_write_data: std_logic_vector(7 downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_write_req : std_logic_vector(0  downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_write_ack : std_logic_vector(0  downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_read_data: std_logic_vector(7 downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_read_req : std_logic_vector(0  downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_read_ack : std_logic_vector(0  downto 0);
  component mySelfTuningUart is -- 
    port( -- 
      CONSOLE_to_SERIAL_RX_pipe_write_data : in std_logic_vector(7 downto 0);
      CONSOLE_to_SERIAL_RX_pipe_write_req  : in std_logic_vector(0  downto 0);
      CONSOLE_to_SERIAL_RX_pipe_write_ack  : out std_logic_vector(0  downto 0);
      UART_RX : in std_logic_vector(0 downto 0);
      SERIAL_TX_to_CONSOLE_pipe_read_data : out std_logic_vector(7 downto 0);
      SERIAL_TX_to_CONSOLE_pipe_read_req  : in std_logic_vector(0  downto 0);
      SERIAL_TX_to_CONSOLE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      UART_TX : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for debug_uart_inst :  mySelfTuningUart -- 
    use entity myUartLib.mySelfTuningUart; -- 
  --<<<<<
  component memory_subsys is -- 
    port( -- 
      FIRST_TAP_MAX_PA : in std_logic_vector(35 downto 0);
      FIRST_TAP_MIN_PA : in std_logic_vector(35 downto 0);
      NIC_MEM_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      NIC_MEM_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      NIC_MEM_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      NIC_SLAVE_MEM_RESPONSE_pipe_write_data : in std_logic_vector(32 downto 0);
      NIC_SLAVE_MEM_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      NIC_SLAVE_MEM_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      PROCESSOR_MEM_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      PROCESSOR_MEM_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      PROCESSOR_MEM_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MEM_NIC_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      MEM_NIC_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      MEM_NIC_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      MEM_NIC_SLAVE_REQUEST_pipe_read_data : out std_logic_vector(73 downto 0);
      MEM_NIC_SLAVE_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      MEM_NIC_SLAVE_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      MEM_PROCESSOR_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      MEM_PROCESSOR_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      MEM_PROCESSOR_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for memory_subsys_inst :  memory_subsys -- 
    use entity memory_subsys_lib.memory_subsys; -- 
  --<<<<<
  component nic is -- 
    port( -- 
      AFB_NIC_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_NIC_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_NIC_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      mac_to_nic_data_pipe_write_data : in std_logic_vector(72 downto 0);
      mac_to_nic_data_pipe_write_req  : in std_logic_vector(0  downto 0);
      mac_to_nic_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_NIC_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      AFB_NIC_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_NIC_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      nic_to_mac_transmit_pipe_pipe_read_data : out std_logic_vector(72 downto 0);
      nic_to_mac_transmit_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      nic_to_mac_transmit_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for nic_inst :  nic -- 
    use entity nic_lib.nic; -- 
  --<<<<<
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
  end component;
  -->>>>>
  for processor_instance :  processor_1x1x32 -- 
    use entity ajit_processor_lib.processor_1x1x32; -- 
  --<<<<<
  -->>>>>
  for serial_uart_inst :  mySelfTuningUart -- 
    use entity myUartLib.mySelfTuningUart; -- 
  --<<<<<
  -- 
begin -- 
  debug_uart_inst: mySelfTuningUart
  port map ( --
    CONSOLE_to_SERIAL_RX_pipe_write_data => SOC_DEBUG_to_MONITOR_pipe_read_data,
    CONSOLE_to_SERIAL_RX_pipe_write_req => SOC_DEBUG_to_MONITOR_pipe_read_ack,
    CONSOLE_to_SERIAL_RX_pipe_write_ack => SOC_DEBUG_to_MONITOR_pipe_read_req,
    SERIAL_TX_to_CONSOLE_pipe_read_data => SOC_MONITOR_to_DEBUG_pipe_write_data,
    SERIAL_TX_to_CONSOLE_pipe_read_req => SOC_MONITOR_to_DEBUG_pipe_write_ack,
    SERIAL_TX_to_CONSOLE_pipe_read_ack => SOC_MONITOR_to_DEBUG_pipe_write_req,
    UART_RX => DEBUG_UART_RX,
    UART_TX => DEBUG_UART_TX,
    clk => clk, reset => reset 
    ); -- 
  memory_subsys_inst: memory_subsys
  port map ( --
    FIRST_TAP_MAX_PA => FIRST_TAP_MAX_PA,
    FIRST_TAP_MIN_PA => FIRST_TAP_MIN_PA,
    MEM_NIC_RESPONSE_pipe_read_data => MEMORY_TO_NIC_RESPONSE_pipe_write_data,
    MEM_NIC_RESPONSE_pipe_read_req => MEMORY_TO_NIC_RESPONSE_pipe_write_ack,
    MEM_NIC_RESPONSE_pipe_read_ack => MEMORY_TO_NIC_RESPONSE_pipe_write_req,
    MEM_NIC_SLAVE_REQUEST_pipe_read_data => MEM_NIC_SLAVE_REQUEST_pipe_write_data,
    MEM_NIC_SLAVE_REQUEST_pipe_read_req => MEM_NIC_SLAVE_REQUEST_pipe_write_ack,
    MEM_NIC_SLAVE_REQUEST_pipe_read_ack => MEM_NIC_SLAVE_REQUEST_pipe_write_req,
    MEM_PROCESSOR_RESPONSE_pipe_read_data => MAIN_MEM_RESPONSE_pipe_write_data,
    MEM_PROCESSOR_RESPONSE_pipe_read_req => MAIN_MEM_RESPONSE_pipe_write_ack,
    MEM_PROCESSOR_RESPONSE_pipe_read_ack => MAIN_MEM_RESPONSE_pipe_write_req,
    NIC_MEM_REQUEST_pipe_write_data => NIC_TO_MEMORY_REQUEST_pipe_read_data,
    NIC_MEM_REQUEST_pipe_write_req => NIC_TO_MEMORY_REQUEST_pipe_read_ack,
    NIC_MEM_REQUEST_pipe_write_ack => NIC_TO_MEMORY_REQUEST_pipe_read_req,
    NIC_SLAVE_MEM_RESPONSE_pipe_write_data => NIC_SLAVE_MEM_RESPONSE_pipe_read_data,
    NIC_SLAVE_MEM_RESPONSE_pipe_write_req => NIC_SLAVE_MEM_RESPONSE_pipe_read_ack,
    NIC_SLAVE_MEM_RESPONSE_pipe_write_ack => NIC_SLAVE_MEM_RESPONSE_pipe_read_req,
    PROCESSOR_MEM_REQUEST_pipe_write_data => MAIN_MEM_REQUEST_pipe_read_data,
    PROCESSOR_MEM_REQUEST_pipe_write_req => MAIN_MEM_REQUEST_pipe_read_ack,
    PROCESSOR_MEM_REQUEST_pipe_write_ack => MAIN_MEM_REQUEST_pipe_read_req,
    clk => clk, reset => reset 
    ); -- 
  nic_inst: nic
  port map ( --
    AFB_NIC_REQUEST_pipe_write_data => MEM_NIC_SLAVE_REQUEST_pipe_read_data,
    AFB_NIC_REQUEST_pipe_write_req => MEM_NIC_SLAVE_REQUEST_pipe_read_ack,
    AFB_NIC_REQUEST_pipe_write_ack => MEM_NIC_SLAVE_REQUEST_pipe_read_req,
    AFB_NIC_RESPONSE_pipe_read_data => NIC_SLAVE_MEM_RESPONSE_pipe_write_data,
    AFB_NIC_RESPONSE_pipe_read_req => NIC_SLAVE_MEM_RESPONSE_pipe_write_ack,
    AFB_NIC_RESPONSE_pipe_read_ack => NIC_SLAVE_MEM_RESPONSE_pipe_write_req,
    MEMORY_TO_NIC_RESPONSE_pipe_write_data => MEMORY_TO_NIC_RESPONSE_pipe_read_data,
    MEMORY_TO_NIC_RESPONSE_pipe_write_req => MEMORY_TO_NIC_RESPONSE_pipe_read_ack,
    MEMORY_TO_NIC_RESPONSE_pipe_write_ack => MEMORY_TO_NIC_RESPONSE_pipe_read_req,
    NIC_TO_MEMORY_REQUEST_pipe_read_data => NIC_TO_MEMORY_REQUEST_pipe_write_data,
    NIC_TO_MEMORY_REQUEST_pipe_read_req => NIC_TO_MEMORY_REQUEST_pipe_write_ack,
    NIC_TO_MEMORY_REQUEST_pipe_read_ack => NIC_TO_MEMORY_REQUEST_pipe_write_req,
    mac_to_nic_data_pipe_write_data => mac_to_nic_data_pipe_write_data,
    mac_to_nic_data_pipe_write_req => mac_to_nic_data_pipe_write_req,
    mac_to_nic_data_pipe_write_ack => mac_to_nic_data_pipe_write_ack,
    nic_to_mac_transmit_pipe_pipe_read_data => nic_to_mac_transmit_pipe_pipe_read_data,
    nic_to_mac_transmit_pipe_pipe_read_req => nic_to_mac_transmit_pipe_pipe_read_req,
    nic_to_mac_transmit_pipe_pipe_read_ack => nic_to_mac_transmit_pipe_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  processor_instance: processor_1x1x32
  port map ( --
    CONSOLE_to_SERIAL_RX_pipe_write_data => CONSOLE_to_SERIAL_RX_pipe_read_data,
    CONSOLE_to_SERIAL_RX_pipe_write_req => CONSOLE_to_SERIAL_RX_pipe_read_ack,
    CONSOLE_to_SERIAL_RX_pipe_write_ack => CONSOLE_to_SERIAL_RX_pipe_read_req,
    EXTERNAL_INTERRUPT => EXTERNAL_INTERRUPT,
    MAIN_MEM_INVALIDATE_pipe_write_data => MAIN_MEM_INVALIDATE_pipe_write_data,
    MAIN_MEM_INVALIDATE_pipe_write_req => MAIN_MEM_INVALIDATE_pipe_write_req,
    MAIN_MEM_INVALIDATE_pipe_write_ack => MAIN_MEM_INVALIDATE_pipe_write_ack,
    MAIN_MEM_REQUEST_pipe_read_data => MAIN_MEM_REQUEST_pipe_write_data,
    MAIN_MEM_REQUEST_pipe_read_req => MAIN_MEM_REQUEST_pipe_write_ack,
    MAIN_MEM_REQUEST_pipe_read_ack => MAIN_MEM_REQUEST_pipe_write_req,
    MAIN_MEM_RESPONSE_pipe_write_data => MAIN_MEM_RESPONSE_pipe_read_data,
    MAIN_MEM_RESPONSE_pipe_write_req => MAIN_MEM_RESPONSE_pipe_read_ack,
    MAIN_MEM_RESPONSE_pipe_write_ack => MAIN_MEM_RESPONSE_pipe_read_req,
    PROCESSOR_MODE => PROCESSOR_MODE,
    SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_write_data,
    SERIAL_TX_to_CONSOLE_pipe_read_req => SERIAL_TX_to_CONSOLE_pipe_write_ack,
    SERIAL_TX_to_CONSOLE_pipe_read_ack => SERIAL_TX_to_CONSOLE_pipe_write_req,
    SOC_DEBUG_to_MONITOR_pipe_read_data => SOC_DEBUG_to_MONITOR_pipe_write_data,
    SOC_DEBUG_to_MONITOR_pipe_read_req => SOC_DEBUG_to_MONITOR_pipe_write_ack,
    SOC_DEBUG_to_MONITOR_pipe_read_ack => SOC_DEBUG_to_MONITOR_pipe_write_req,
    SOC_MONITOR_to_DEBUG_pipe_write_data => SOC_MONITOR_to_DEBUG_pipe_read_data,
    SOC_MONITOR_to_DEBUG_pipe_write_req => SOC_MONITOR_to_DEBUG_pipe_read_ack,
    SOC_MONITOR_to_DEBUG_pipe_write_ack => SOC_MONITOR_to_DEBUG_pipe_read_req,
    THREAD_RESET => THREAD_RESET,
    clk => clk, reset => reset 
    ); -- 
  serial_uart_inst: mySelfTuningUart
  port map ( --
    CONSOLE_to_SERIAL_RX_pipe_write_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
    CONSOLE_to_SERIAL_RX_pipe_write_req => SERIAL_TX_to_CONSOLE_pipe_read_ack,
    CONSOLE_to_SERIAL_RX_pipe_write_ack => SERIAL_TX_to_CONSOLE_pipe_read_req,
    SERIAL_TX_to_CONSOLE_pipe_read_data => CONSOLE_to_SERIAL_RX_pipe_write_data,
    SERIAL_TX_to_CONSOLE_pipe_read_req => CONSOLE_to_SERIAL_RX_pipe_write_ack,
    SERIAL_TX_to_CONSOLE_pipe_read_ack => CONSOLE_to_SERIAL_RX_pipe_write_req,
    UART_RX => SERIAL_UART_RX,
    UART_TX => SERIAL_UART_TX,
    clk => clk, reset => reset 
    ); -- 
  CONSOLE_to_SERIAL_RX_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe CONSOLE_to_SERIAL_RX",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => CONSOLE_to_SERIAL_RX_pipe_read_req,
      read_ack => CONSOLE_to_SERIAL_RX_pipe_read_ack,
      read_data => CONSOLE_to_SERIAL_RX_pipe_read_data,
      write_req => CONSOLE_to_SERIAL_RX_pipe_write_req,
      write_ack => CONSOLE_to_SERIAL_RX_pipe_write_ack,
      write_data => CONSOLE_to_SERIAL_RX_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  MAIN_MEM_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe MAIN_MEM_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => MAIN_MEM_REQUEST_pipe_read_req,
      read_ack => MAIN_MEM_REQUEST_pipe_read_ack,
      read_data => MAIN_MEM_REQUEST_pipe_read_data,
      write_req => MAIN_MEM_REQUEST_pipe_write_req,
      write_ack => MAIN_MEM_REQUEST_pipe_write_ack,
      write_data => MAIN_MEM_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  MAIN_MEM_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe MAIN_MEM_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => MAIN_MEM_RESPONSE_pipe_read_req,
      read_ack => MAIN_MEM_RESPONSE_pipe_read_ack,
      read_data => MAIN_MEM_RESPONSE_pipe_read_data,
      write_req => MAIN_MEM_RESPONSE_pipe_write_req,
      write_ack => MAIN_MEM_RESPONSE_pipe_write_ack,
      write_data => MAIN_MEM_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  MEMORY_TO_NIC_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe MEMORY_TO_NIC_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => MEMORY_TO_NIC_RESPONSE_pipe_read_req,
      read_ack => MEMORY_TO_NIC_RESPONSE_pipe_read_ack,
      read_data => MEMORY_TO_NIC_RESPONSE_pipe_read_data,
      write_req => MEMORY_TO_NIC_RESPONSE_pipe_write_req,
      write_ack => MEMORY_TO_NIC_RESPONSE_pipe_write_ack,
      write_data => MEMORY_TO_NIC_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  MEM_NIC_SLAVE_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe MEM_NIC_SLAVE_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => MEM_NIC_SLAVE_REQUEST_pipe_read_req,
      read_ack => MEM_NIC_SLAVE_REQUEST_pipe_read_ack,
      read_data => MEM_NIC_SLAVE_REQUEST_pipe_read_data,
      write_req => MEM_NIC_SLAVE_REQUEST_pipe_write_req,
      write_ack => MEM_NIC_SLAVE_REQUEST_pipe_write_ack,
      write_data => MEM_NIC_SLAVE_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  NIC_SLAVE_MEM_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe NIC_SLAVE_MEM_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => NIC_SLAVE_MEM_RESPONSE_pipe_read_req,
      read_ack => NIC_SLAVE_MEM_RESPONSE_pipe_read_ack,
      read_data => NIC_SLAVE_MEM_RESPONSE_pipe_read_data,
      write_req => NIC_SLAVE_MEM_RESPONSE_pipe_write_req,
      write_ack => NIC_SLAVE_MEM_RESPONSE_pipe_write_ack,
      write_data => NIC_SLAVE_MEM_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  NIC_TO_MEMORY_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe NIC_TO_MEMORY_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => NIC_TO_MEMORY_REQUEST_pipe_read_req,
      read_ack => NIC_TO_MEMORY_REQUEST_pipe_read_ack,
      read_data => NIC_TO_MEMORY_REQUEST_pipe_read_data,
      write_req => NIC_TO_MEMORY_REQUEST_pipe_write_req,
      write_ack => NIC_TO_MEMORY_REQUEST_pipe_write_ack,
      write_data => NIC_TO_MEMORY_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  SERIAL_TX_to_CONSOLE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe SERIAL_TX_to_CONSOLE",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => SERIAL_TX_to_CONSOLE_pipe_read_req,
      read_ack => SERIAL_TX_to_CONSOLE_pipe_read_ack,
      read_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
      write_req => SERIAL_TX_to_CONSOLE_pipe_write_req,
      write_ack => SERIAL_TX_to_CONSOLE_pipe_write_ack,
      write_data => SERIAL_TX_to_CONSOLE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  SOC_DEBUG_to_MONITOR_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe SOC_DEBUG_to_MONITOR",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => SOC_DEBUG_to_MONITOR_pipe_read_req,
      read_ack => SOC_DEBUG_to_MONITOR_pipe_read_ack,
      read_data => SOC_DEBUG_to_MONITOR_pipe_read_data,
      write_req => SOC_DEBUG_to_MONITOR_pipe_write_req,
      write_ack => SOC_DEBUG_to_MONITOR_pipe_write_ack,
      write_data => SOC_DEBUG_to_MONITOR_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  SOC_MONITOR_to_DEBUG_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe SOC_MONITOR_to_DEBUG",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => SOC_MONITOR_to_DEBUG_pipe_read_req,
      read_ack => SOC_MONITOR_to_DEBUG_pipe_read_ack,
      read_data => SOC_MONITOR_to_DEBUG_pipe_read_data,
      write_req => SOC_MONITOR_to_DEBUG_pipe_write_req,
      write_ack => SOC_MONITOR_to_DEBUG_pipe_write_ack,
      write_data => SOC_MONITOR_to_DEBUG_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;

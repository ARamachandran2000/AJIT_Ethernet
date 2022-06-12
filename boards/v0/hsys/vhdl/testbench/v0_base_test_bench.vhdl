library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
-->>>>>
library v0_lib;
--<<<<<
entity v0_base_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of v0_base_Test_Bench is -- 
  signal DEBUG_UART_RX_pipe_write_data : std_logic_vector(0 downto 0);
  signal DEBUG_UART_RX_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal DEBUG_UART_RX_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal DEBUG_UART_RX: std_logic_vector(0 downto 0);
  signal EXTERNAL_INTERRUPT_pipe_write_data : std_logic_vector(0 downto 0);
  signal EXTERNAL_INTERRUPT_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal EXTERNAL_INTERRUPT_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal EXTERNAL_INTERRUPT: std_logic_vector(0 downto 0);
  signal FIRST_TAP_MAX_PA_pipe_write_data : std_logic_vector(35 downto 0);
  signal FIRST_TAP_MAX_PA_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal FIRST_TAP_MAX_PA_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal FIRST_TAP_MAX_PA: std_logic_vector(35 downto 0);
  signal FIRST_TAP_MIN_PA_pipe_write_data : std_logic_vector(35 downto 0);
  signal FIRST_TAP_MIN_PA_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal FIRST_TAP_MIN_PA_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal FIRST_TAP_MIN_PA: std_logic_vector(35 downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_data : std_logic_vector(29 downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAIN_MEM_INVALIDATE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal SERIAL_UART_RX_pipe_write_data : std_logic_vector(0 downto 0);
  signal SERIAL_UART_RX_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal SERIAL_UART_RX_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal SERIAL_UART_RX: std_logic_vector(0 downto 0);
  signal THREAD_RESET_pipe_write_data : std_logic_vector(3 downto 0);
  signal THREAD_RESET_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal THREAD_RESET_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal THREAD_RESET: std_logic_vector(3 downto 0);
  signal mac_to_nic_data_pipe_write_data : std_logic_vector(72 downto 0);
  signal mac_to_nic_data_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal mac_to_nic_data_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal DEBUG_UART_TX_pipe_read_data : std_logic_vector(0 downto 0);
  signal DEBUG_UART_TX_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal DEBUG_UART_TX_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal DEBUG_UART_TX: std_logic_vector(0 downto 0) := (others => '0');
  signal PROCESSOR_MODE_pipe_read_data : std_logic_vector(15 downto 0);
  signal PROCESSOR_MODE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal PROCESSOR_MODE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal PROCESSOR_MODE: std_logic_vector(15 downto 0) := (others => '0');
  signal SERIAL_UART_TX_pipe_read_data : std_logic_vector(0 downto 0);
  signal SERIAL_UART_TX_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal SERIAL_UART_TX_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal SERIAL_UART_TX: std_logic_vector(0 downto 0) := (others => '0');
  signal nic_to_mac_transmit_pipe_pipe_read_data : std_logic_vector(72 downto 0);
  signal nic_to_mac_transmit_pipe_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal nic_to_mac_transmit_pipe_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component v0_base is -- 
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
  end component;
  -->>>>>
  for dut :  v0_base -- 
    use entity v0_lib.v0_base; -- 
  --<<<<<
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait for 5 ns;
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Vhpi_Listen;
      Vhpi_Send;
      --
    end loop;
    wait;
    --
  end process;
  DEBUG_UART_RX_pipe_write_ack(0) <= '1';
  TruncateOrPad(DEBUG_UART_RX_pipe_write_data,DEBUG_UART_RX);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("DEBUG_UART_RX req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      DEBUG_UART_RX_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("DEBUG_UART_RX 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      wait for 1 ns;
      if (DEBUG_UART_RX_pipe_write_req(0) = '1') then 
      -- 
        DEBUG_UART_RX_pipe_write_data <= Unpack_String(val_string,1);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("DEBUG_UART_RX ack");
      val_string := Pack_SLV_To_Vhpi_String(DEBUG_UART_RX_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  EXTERNAL_INTERRUPT_pipe_write_ack(0) <= '1';
  TruncateOrPad(EXTERNAL_INTERRUPT_pipe_write_data,EXTERNAL_INTERRUPT);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("EXTERNAL_INTERRUPT req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      EXTERNAL_INTERRUPT_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("EXTERNAL_INTERRUPT 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      wait for 1 ns;
      if (EXTERNAL_INTERRUPT_pipe_write_req(0) = '1') then 
      -- 
        EXTERNAL_INTERRUPT_pipe_write_data <= Unpack_String(val_string,1);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("EXTERNAL_INTERRUPT ack");
      val_string := Pack_SLV_To_Vhpi_String(EXTERNAL_INTERRUPT_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  FIRST_TAP_MAX_PA_pipe_write_ack(0) <= '1';
  TruncateOrPad(FIRST_TAP_MAX_PA_pipe_write_data,FIRST_TAP_MAX_PA);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("FIRST_TAP_MAX_PA req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      FIRST_TAP_MAX_PA_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("FIRST_TAP_MAX_PA 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,36);
      wait for 1 ns;
      if (FIRST_TAP_MAX_PA_pipe_write_req(0) = '1') then 
      -- 
        FIRST_TAP_MAX_PA_pipe_write_data <= Unpack_String(val_string,36);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("FIRST_TAP_MAX_PA ack");
      val_string := Pack_SLV_To_Vhpi_String(FIRST_TAP_MAX_PA_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  FIRST_TAP_MIN_PA_pipe_write_ack(0) <= '1';
  TruncateOrPad(FIRST_TAP_MIN_PA_pipe_write_data,FIRST_TAP_MIN_PA);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("FIRST_TAP_MIN_PA req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      FIRST_TAP_MIN_PA_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("FIRST_TAP_MIN_PA 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,36);
      wait for 1 ns;
      if (FIRST_TAP_MIN_PA_pipe_write_req(0) = '1') then 
      -- 
        FIRST_TAP_MIN_PA_pipe_write_data <= Unpack_String(val_string,36);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("FIRST_TAP_MIN_PA ack");
      val_string := Pack_SLV_To_Vhpi_String(FIRST_TAP_MIN_PA_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_INVALIDATE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAIN_MEM_INVALIDATE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_INVALIDATE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,30);
      MAIN_MEM_INVALIDATE_pipe_write_data <= Unpack_String(val_string,30);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_INVALIDATE ack");
      val_string := Pack_SLV_To_Vhpi_String(MAIN_MEM_INVALIDATE_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  SERIAL_UART_RX_pipe_write_ack(0) <= '1';
  TruncateOrPad(SERIAL_UART_RX_pipe_write_data,SERIAL_UART_RX);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_UART_RX req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      SERIAL_UART_RX_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_UART_RX 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      wait for 1 ns;
      if (SERIAL_UART_RX_pipe_write_req(0) = '1') then 
      -- 
        SERIAL_UART_RX_pipe_write_data <= Unpack_String(val_string,1);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_UART_RX ack");
      val_string := Pack_SLV_To_Vhpi_String(SERIAL_UART_RX_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  THREAD_RESET_pipe_write_ack(0) <= '1';
  TruncateOrPad(THREAD_RESET_pipe_write_data,THREAD_RESET);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("THREAD_RESET req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      THREAD_RESET_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("THREAD_RESET 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,4);
      wait for 1 ns;
      if (THREAD_RESET_pipe_write_req(0) = '1') then 
      -- 
        THREAD_RESET_pipe_write_data <= Unpack_String(val_string,4);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("THREAD_RESET ack");
      val_string := Pack_SLV_To_Vhpi_String(THREAD_RESET_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      mac_to_nic_data_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,73);
      mac_to_nic_data_pipe_write_data <= Unpack_String(val_string,73);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data ack");
      val_string := Pack_SLV_To_Vhpi_String(mac_to_nic_data_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  DEBUG_UART_TX_pipe_read_ack(0) <= '1';
  TruncateOrPad(DEBUG_UART_TX, DEBUG_UART_TX_pipe_read_data);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("DEBUG_UART_TX req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      DEBUG_UART_TX_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("DEBUG_UART_TX ack");
      val_string := Pack_SLV_To_Vhpi_String(DEBUG_UART_TX_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("DEBUG_UART_TX 0");
      val_string := Pack_SLV_To_Vhpi_String(DEBUG_UART_TX_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  PROCESSOR_MODE_pipe_read_ack(0) <= '1';
  TruncateOrPad(PROCESSOR_MODE, PROCESSOR_MODE_pipe_read_data);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MODE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      PROCESSOR_MODE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MODE ack");
      val_string := Pack_SLV_To_Vhpi_String(PROCESSOR_MODE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MODE 0");
      val_string := Pack_SLV_To_Vhpi_String(PROCESSOR_MODE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,16);
      -- 
    end loop;
    --
  end process;
  SERIAL_UART_TX_pipe_read_ack(0) <= '1';
  TruncateOrPad(SERIAL_UART_TX, SERIAL_UART_TX_pipe_read_data);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_UART_TX req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      SERIAL_UART_TX_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_UART_TX ack");
      val_string := Pack_SLV_To_Vhpi_String(SERIAL_UART_TX_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_UART_TX 0");
      val_string := Pack_SLV_To_Vhpi_String(SERIAL_UART_TX_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_transmit_pipe req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      nic_to_mac_transmit_pipe_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_transmit_pipe ack");
      val_string := Pack_SLV_To_Vhpi_String(nic_to_mac_transmit_pipe_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_transmit_pipe 0");
      val_string := Pack_SLV_To_Vhpi_String(nic_to_mac_transmit_pipe_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,73);
      -- 
    end loop;
    --
  end process;
  dut: v0_base
  port map ( --
    DEBUG_UART_RX => DEBUG_UART_RX,
    EXTERNAL_INTERRUPT => EXTERNAL_INTERRUPT,
    FIRST_TAP_MAX_PA => FIRST_TAP_MAX_PA,
    FIRST_TAP_MIN_PA => FIRST_TAP_MIN_PA,
    MAIN_MEM_INVALIDATE_pipe_write_data => MAIN_MEM_INVALIDATE_pipe_write_data,
    MAIN_MEM_INVALIDATE_pipe_write_req => MAIN_MEM_INVALIDATE_pipe_write_req,
    MAIN_MEM_INVALIDATE_pipe_write_ack => MAIN_MEM_INVALIDATE_pipe_write_ack,
    SERIAL_UART_RX => SERIAL_UART_RX,
    THREAD_RESET => THREAD_RESET,
    mac_to_nic_data_pipe_write_data => mac_to_nic_data_pipe_write_data,
    mac_to_nic_data_pipe_write_req => mac_to_nic_data_pipe_write_req,
    mac_to_nic_data_pipe_write_ack => mac_to_nic_data_pipe_write_ack,
    DEBUG_UART_TX => DEBUG_UART_TX,
    PROCESSOR_MODE => PROCESSOR_MODE,
    SERIAL_UART_TX => SERIAL_UART_TX,
    nic_to_mac_transmit_pipe_pipe_read_data => nic_to_mac_transmit_pipe_pipe_read_data,
    nic_to_mac_transmit_pipe_pipe_read_req => nic_to_mac_transmit_pipe_pipe_read_req,
    nic_to_mac_transmit_pipe_pipe_read_ack => nic_to_mac_transmit_pipe_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;

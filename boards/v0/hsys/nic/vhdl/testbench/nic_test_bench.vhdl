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
library nic_lib;
--<<<<<
entity nic_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of nic_Test_Bench is -- 
  signal AFB_NIC_REQUEST_pipe_write_data : std_logic_vector(73 downto 0);
  signal AFB_NIC_REQUEST_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_NIC_REQUEST_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_data : std_logic_vector(64 downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal mac_to_nic_data_pipe_write_data : std_logic_vector(72 downto 0);
  signal mac_to_nic_data_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal mac_to_nic_data_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal AFB_NIC_RESPONSE_pipe_read_data : std_logic_vector(32 downto 0);
  signal AFB_NIC_RESPONSE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_NIC_RESPONSE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_TO_MEMORY_REQUEST_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal nic_to_mac_transmit_pipe_pipe_read_data : std_logic_vector(72 downto 0);
  signal nic_to_mac_transmit_pipe_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal nic_to_mac_transmit_pipe_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
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
  for dut :  nic -- 
    use entity nic_lib.nic; -- 
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_NIC_REQUEST_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REQUEST 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,74);
      AFB_NIC_REQUEST_pipe_write_data <= Unpack_String(val_string,74);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_REQUEST_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("MEMORY_TO_NIC_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MEMORY_TO_NIC_RESPONSE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MEMORY_TO_NIC_RESPONSE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,65);
      MEMORY_TO_NIC_RESPONSE_pipe_write_data <= Unpack_String(val_string,65);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MEMORY_TO_NIC_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(MEMORY_TO_NIC_RESPONSE_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_NIC_RESPONSE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_RESPONSE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_RESPONSE 0");
      val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_RESPONSE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,33);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MEMORY_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_TO_MEMORY_REQUEST_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MEMORY_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MEMORY_REQUEST_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MEMORY_REQUEST 0");
      val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MEMORY_REQUEST_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,110);
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
  dut: nic
  port map ( --
    AFB_NIC_REQUEST_pipe_write_data => AFB_NIC_REQUEST_pipe_write_data,
    AFB_NIC_REQUEST_pipe_write_req => AFB_NIC_REQUEST_pipe_write_req,
    AFB_NIC_REQUEST_pipe_write_ack => AFB_NIC_REQUEST_pipe_write_ack,
    MEMORY_TO_NIC_RESPONSE_pipe_write_data => MEMORY_TO_NIC_RESPONSE_pipe_write_data,
    MEMORY_TO_NIC_RESPONSE_pipe_write_req => MEMORY_TO_NIC_RESPONSE_pipe_write_req,
    MEMORY_TO_NIC_RESPONSE_pipe_write_ack => MEMORY_TO_NIC_RESPONSE_pipe_write_ack,
    mac_to_nic_data_pipe_write_data => mac_to_nic_data_pipe_write_data,
    mac_to_nic_data_pipe_write_req => mac_to_nic_data_pipe_write_req,
    mac_to_nic_data_pipe_write_ack => mac_to_nic_data_pipe_write_ack,
    AFB_NIC_RESPONSE_pipe_read_data => AFB_NIC_RESPONSE_pipe_read_data,
    AFB_NIC_RESPONSE_pipe_read_req => AFB_NIC_RESPONSE_pipe_read_req,
    AFB_NIC_RESPONSE_pipe_read_ack => AFB_NIC_RESPONSE_pipe_read_ack,
    NIC_TO_MEMORY_REQUEST_pipe_read_data => NIC_TO_MEMORY_REQUEST_pipe_read_data,
    NIC_TO_MEMORY_REQUEST_pipe_read_req => NIC_TO_MEMORY_REQUEST_pipe_read_req,
    NIC_TO_MEMORY_REQUEST_pipe_read_ack => NIC_TO_MEMORY_REQUEST_pipe_read_ack,
    nic_to_mac_transmit_pipe_pipe_read_data => nic_to_mac_transmit_pipe_pipe_read_data,
    nic_to_mac_transmit_pipe_pipe_read_req => nic_to_mac_transmit_pipe_pipe_read_req,
    nic_to_mac_transmit_pipe_pipe_read_ack => nic_to_mac_transmit_pipe_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;

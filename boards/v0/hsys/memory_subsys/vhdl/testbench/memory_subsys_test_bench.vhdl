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
library memory_subsys_lib;
--<<<<<
entity memory_subsys_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of memory_subsys_Test_Bench is -- 
  signal FIRST_TAP_MAX_PA_pipe_write_data : std_logic_vector(35 downto 0);
  signal FIRST_TAP_MAX_PA_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal FIRST_TAP_MAX_PA_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal FIRST_TAP_MAX_PA: std_logic_vector(35 downto 0);
  signal FIRST_TAP_MIN_PA_pipe_write_data : std_logic_vector(35 downto 0);
  signal FIRST_TAP_MIN_PA_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal FIRST_TAP_MIN_PA_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal FIRST_TAP_MIN_PA: std_logic_vector(35 downto 0);
  signal NIC_MEM_REQUEST_pipe_write_data : std_logic_vector(109 downto 0);
  signal NIC_MEM_REQUEST_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_MEM_REQUEST_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_write_data : std_logic_vector(32 downto 0);
  signal NIC_SLAVE_MEM_RESPONSE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_SLAVE_MEM_RESPONSE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal PROCESSOR_MEM_REQUEST_pipe_write_data : std_logic_vector(109 downto 0);
  signal PROCESSOR_MEM_REQUEST_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal PROCESSOR_MEM_REQUEST_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MEM_NIC_RESPONSE_pipe_read_data : std_logic_vector(64 downto 0);
  signal MEM_NIC_RESPONSE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MEM_NIC_RESPONSE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_read_data : std_logic_vector(73 downto 0);
  signal MEM_NIC_SLAVE_REQUEST_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MEM_NIC_SLAVE_REQUEST_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal MEM_PROCESSOR_RESPONSE_pipe_read_data : std_logic_vector(64 downto 0);
  signal MEM_PROCESSOR_RESPONSE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MEM_PROCESSOR_RESPONSE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
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
  for dut :  memory_subsys -- 
    use entity memory_subsys_lib.memory_subsys; -- 
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_MEM_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_MEM_REQUEST_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_MEM_REQUEST 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,110);
      NIC_MEM_REQUEST_pipe_write_data <= Unpack_String(val_string,110);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_MEM_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_MEM_REQUEST_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_SLAVE_MEM_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_SLAVE_MEM_RESPONSE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_SLAVE_MEM_RESPONSE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,33);
      NIC_SLAVE_MEM_RESPONSE_pipe_write_data <= Unpack_String(val_string,33);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_SLAVE_MEM_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_SLAVE_MEM_RESPONSE_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MEM_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      PROCESSOR_MEM_REQUEST_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MEM_REQUEST 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,110);
      PROCESSOR_MEM_REQUEST_pipe_write_data <= Unpack_String(val_string,110);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MEM_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(PROCESSOR_MEM_REQUEST_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("MEM_NIC_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MEM_NIC_RESPONSE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MEM_NIC_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(MEM_NIC_RESPONSE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MEM_NIC_RESPONSE 0");
      val_string := Pack_SLV_To_Vhpi_String(MEM_NIC_RESPONSE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,65);
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
      obj_ref := Pack_String_To_Vhpi_String("MEM_NIC_SLAVE_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MEM_NIC_SLAVE_REQUEST_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MEM_NIC_SLAVE_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(MEM_NIC_SLAVE_REQUEST_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MEM_NIC_SLAVE_REQUEST 0");
      val_string := Pack_SLV_To_Vhpi_String(MEM_NIC_SLAVE_REQUEST_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,74);
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
      obj_ref := Pack_String_To_Vhpi_String("MEM_PROCESSOR_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MEM_PROCESSOR_RESPONSE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MEM_PROCESSOR_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(MEM_PROCESSOR_RESPONSE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MEM_PROCESSOR_RESPONSE 0");
      val_string := Pack_SLV_To_Vhpi_String(MEM_PROCESSOR_RESPONSE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,65);
      -- 
    end loop;
    --
  end process;
  dut: memory_subsys
  port map ( --
    FIRST_TAP_MAX_PA => FIRST_TAP_MAX_PA,
    FIRST_TAP_MIN_PA => FIRST_TAP_MIN_PA,
    NIC_MEM_REQUEST_pipe_write_data => NIC_MEM_REQUEST_pipe_write_data,
    NIC_MEM_REQUEST_pipe_write_req => NIC_MEM_REQUEST_pipe_write_req,
    NIC_MEM_REQUEST_pipe_write_ack => NIC_MEM_REQUEST_pipe_write_ack,
    NIC_SLAVE_MEM_RESPONSE_pipe_write_data => NIC_SLAVE_MEM_RESPONSE_pipe_write_data,
    NIC_SLAVE_MEM_RESPONSE_pipe_write_req => NIC_SLAVE_MEM_RESPONSE_pipe_write_req,
    NIC_SLAVE_MEM_RESPONSE_pipe_write_ack => NIC_SLAVE_MEM_RESPONSE_pipe_write_ack,
    PROCESSOR_MEM_REQUEST_pipe_write_data => PROCESSOR_MEM_REQUEST_pipe_write_data,
    PROCESSOR_MEM_REQUEST_pipe_write_req => PROCESSOR_MEM_REQUEST_pipe_write_req,
    PROCESSOR_MEM_REQUEST_pipe_write_ack => PROCESSOR_MEM_REQUEST_pipe_write_ack,
    MEM_NIC_RESPONSE_pipe_read_data => MEM_NIC_RESPONSE_pipe_read_data,
    MEM_NIC_RESPONSE_pipe_read_req => MEM_NIC_RESPONSE_pipe_read_req,
    MEM_NIC_RESPONSE_pipe_read_ack => MEM_NIC_RESPONSE_pipe_read_ack,
    MEM_NIC_SLAVE_REQUEST_pipe_read_data => MEM_NIC_SLAVE_REQUEST_pipe_read_data,
    MEM_NIC_SLAVE_REQUEST_pipe_read_req => MEM_NIC_SLAVE_REQUEST_pipe_read_req,
    MEM_NIC_SLAVE_REQUEST_pipe_read_ack => MEM_NIC_SLAVE_REQUEST_pipe_read_ack,
    MEM_PROCESSOR_RESPONSE_pipe_read_data => MEM_PROCESSOR_RESPONSE_pipe_read_data,
    MEM_PROCESSOR_RESPONSE_pipe_read_req => MEM_PROCESSOR_RESPONSE_pipe_read_req,
    MEM_PROCESSOR_RESPONSE_pipe_read_ack => MEM_PROCESSOR_RESPONSE_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;

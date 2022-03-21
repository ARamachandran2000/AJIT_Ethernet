library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
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
use ahir.functionLibraryComponents.all;
library GhdlLink;
use GhdlLink.LogUtilities.all;
library work;
use work.ahir_system_global_package.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
entity ahir_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of ahir_system_Test_Bench is -- 
  component ahir_system is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_data: in std_logic_vector(32 downto 0);
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_req : in std_logic_vector(0 downto 0);
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_ack : out std_logic_vector(0 downto 0);
      control_word_request_pipe_0_pipe_write_data: in std_logic_vector(31 downto 0);
      control_word_request_pipe_0_pipe_write_req : in std_logic_vector(0 downto 0);
      control_word_request_pipe_0_pipe_write_ack : out std_logic_vector(0 downto 0);
      control_word_request_pipe_1_pipe_write_data: in std_logic_vector(63 downto 0);
      control_word_request_pipe_1_pipe_write_req : in std_logic_vector(0 downto 0);
      control_word_request_pipe_1_pipe_write_ack : out std_logic_vector(0 downto 0);
      control_word_response_pipe_pipe_read_data: out std_logic_vector(63 downto 0);
      control_word_response_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
      control_word_response_pipe_pipe_read_ack : out std_logic_vector(0 downto 0);
      mac_to_nic_data_0_pipe_write_data: in std_logic_vector(63 downto 0);
      mac_to_nic_data_0_pipe_write_req : in std_logic_vector(0 downto 0);
      mac_to_nic_data_0_pipe_write_ack : out std_logic_vector(0 downto 0);
      mac_to_nic_data_1_pipe_write_data: in std_logic_vector(15 downto 0);
      mac_to_nic_data_1_pipe_write_req : in std_logic_vector(0 downto 0);
      mac_to_nic_data_1_pipe_write_ack : out std_logic_vector(0 downto 0);
      mem_req0_pipe0_pipe_read_data: out std_logic_vector(63 downto 0);
      mem_req0_pipe0_pipe_read_req : in std_logic_vector(0 downto 0);
      mem_req0_pipe0_pipe_read_ack : out std_logic_vector(0 downto 0);
      mem_req0_pipe1_pipe_read_data: out std_logic_vector(63 downto 0);
      mem_req0_pipe1_pipe_read_req : in std_logic_vector(0 downto 0);
      mem_req0_pipe1_pipe_read_ack : out std_logic_vector(0 downto 0);
      mem_resp0_pipe0_pipe_write_data: in std_logic_vector(63 downto 0);
      mem_resp0_pipe0_pipe_write_req : in std_logic_vector(0 downto 0);
      mem_resp0_pipe0_pipe_write_ack : out std_logic_vector(0 downto 0);
      mem_resp0_pipe1_pipe_write_data: in std_logic_vector(7 downto 0);
      mem_resp0_pipe1_pipe_write_req : in std_logic_vector(0 downto 0);
      mem_resp0_pipe1_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal NicRegisterAccessDaemon_tag_in: std_logic_vector(1 downto 0);
  signal NicRegisterAccessDaemon_tag_out: std_logic_vector(1 downto 0);
  signal NicRegisterAccessDaemon_start_req : std_logic := '0';
  signal NicRegisterAccessDaemon_start_ack : std_logic := '0';
  signal NicRegisterAccessDaemon_fin_req   : std_logic := '0';
  signal NicRegisterAccessDaemon_fin_ack   : std_logic := '0';
  signal ReceiveEngineDaemon_tag_in: std_logic_vector(1 downto 0);
  signal ReceiveEngineDaemon_tag_out: std_logic_vector(1 downto 0);
  signal ReceiveEngineDaemon_start_req : std_logic := '0';
  signal ReceiveEngineDaemon_start_ack : std_logic := '0';
  signal ReceiveEngineDaemon_fin_req   : std_logic := '0';
  signal ReceiveEngineDaemon_fin_ack   : std_logic := '0';
  signal SoftwareRegisterAccessDaemon_tag_in: std_logic_vector(1 downto 0);
  signal SoftwareRegisterAccessDaemon_tag_out: std_logic_vector(1 downto 0);
  signal SoftwareRegisterAccessDaemon_start_req : std_logic := '0';
  signal SoftwareRegisterAccessDaemon_start_ack : std_logic := '0';
  signal SoftwareRegisterAccessDaemon_fin_req   : std_logic := '0';
  signal SoftwareRegisterAccessDaemon_fin_ack   : std_logic := '0';
  signal macToNicInterface_tag_in: std_logic_vector(1 downto 0);
  signal macToNicInterface_tag_out: std_logic_vector(1 downto 0);
  signal macToNicInterface_start_req : std_logic := '0';
  signal macToNicInterface_start_ack : std_logic := '0';
  signal macToNicInterface_fin_req   : std_logic := '0';
  signal macToNicInterface_fin_ack   : std_logic := '0';
  signal memoryToNicInterface_tag_in: std_logic_vector(1 downto 0);
  signal memoryToNicInterface_tag_out: std_logic_vector(1 downto 0);
  signal memoryToNicInterface_start_req : std_logic := '0';
  signal memoryToNicInterface_start_ack : std_logic := '0';
  signal memoryToNicInterface_fin_req   : std_logic := '0';
  signal memoryToNicInterface_fin_ack   : std_logic := '0';
  signal nicRxFromMacDaemon_tag_in: std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_tag_out: std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_start_req : std_logic := '0';
  signal nicRxFromMacDaemon_start_ack : std_logic := '0';
  signal nicRxFromMacDaemon_fin_req   : std_logic := '0';
  signal nicRxFromMacDaemon_fin_ack   : std_logic := '0';
  signal nicToMacInterface_tag_in: std_logic_vector(1 downto 0);
  signal nicToMacInterface_tag_out: std_logic_vector(1 downto 0);
  signal nicToMacInterface_start_req : std_logic := '0';
  signal nicToMacInterface_start_ack : std_logic := '0';
  signal nicToMacInterface_fin_req   : std_logic := '0';
  signal nicToMacInterface_fin_ack   : std_logic := '0';
  signal nicToMemoryInterface_tag_in: std_logic_vector(1 downto 0);
  signal nicToMemoryInterface_tag_out: std_logic_vector(1 downto 0);
  signal nicToMemoryInterface_start_req : std_logic := '0';
  signal nicToMemoryInterface_start_ack : std_logic := '0';
  signal nicToMemoryInterface_fin_req   : std_logic := '0';
  signal nicToMemoryInterface_fin_ack   : std_logic := '0';
  signal nicToProcessorInterface_tag_in: std_logic_vector(1 downto 0);
  signal nicToProcessorInterface_tag_out: std_logic_vector(1 downto 0);
  signal nicToProcessorInterface_start_req : std_logic := '0';
  signal nicToProcessorInterface_start_ack : std_logic := '0';
  signal nicToProcessorInterface_fin_req   : std_logic := '0';
  signal nicToProcessorInterface_fin_ack   : std_logic := '0';
  signal processorToNicInterface_tag_in: std_logic_vector(1 downto 0);
  signal processorToNicInterface_tag_out: std_logic_vector(1 downto 0);
  signal processorToNicInterface_start_req : std_logic := '0';
  signal processorToNicInterface_start_ack : std_logic := '0';
  signal processorToNicInterface_fin_req   : std_logic := '0';
  signal processorToNicInterface_fin_ack   : std_logic := '0';
  signal transmitEngineDaemon_tag_in: std_logic_vector(1 downto 0);
  signal transmitEngineDaemon_tag_out: std_logic_vector(1 downto 0);
  signal transmitEngineDaemon_start_req : std_logic := '0';
  signal transmitEngineDaemon_start_ack : std_logic := '0';
  signal transmitEngineDaemon_fin_req   : std_logic := '0';
  signal transmitEngineDaemon_fin_ack   : std_logic := '0';
  -- write to pipe NIC_RESPONSE_REGISTER_ACCESS_PIPE
  signal NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_data: std_logic_vector(32 downto 0);
  signal NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe control_word_request_pipe_0
  signal control_word_request_pipe_0_pipe_write_data: std_logic_vector(31 downto 0);
  signal control_word_request_pipe_0_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal control_word_request_pipe_0_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe control_word_request_pipe_1
  signal control_word_request_pipe_1_pipe_write_data: std_logic_vector(63 downto 0);
  signal control_word_request_pipe_1_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal control_word_request_pipe_1_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe control_word_response_pipe
  signal control_word_response_pipe_pipe_read_data: std_logic_vector(63 downto 0);
  signal control_word_response_pipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal control_word_response_pipe_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe mac_to_nic_data_0
  signal mac_to_nic_data_0_pipe_write_data: std_logic_vector(63 downto 0);
  signal mac_to_nic_data_0_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mac_to_nic_data_0_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe mac_to_nic_data_1
  signal mac_to_nic_data_1_pipe_write_data: std_logic_vector(15 downto 0);
  signal mac_to_nic_data_1_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mac_to_nic_data_1_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe mem_req0_pipe0
  signal mem_req0_pipe0_pipe_read_data: std_logic_vector(63 downto 0);
  signal mem_req0_pipe0_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mem_req0_pipe0_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe mem_req0_pipe1
  signal mem_req0_pipe1_pipe_read_data: std_logic_vector(63 downto 0);
  signal mem_req0_pipe1_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mem_req0_pipe1_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe mem_resp0_pipe0
  signal mem_resp0_pipe0_pipe_write_data: std_logic_vector(63 downto 0);
  signal mem_resp0_pipe0_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mem_resp0_pipe0_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe mem_resp0_pipe1
  signal mem_resp0_pipe1_pipe_write_data: std_logic_vector(7 downto 0);
  signal mem_resp0_pipe1_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mem_resp0_pipe1_pipe_write_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  -- assert reset for four clocks.
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
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
  -- connect all the top-level modules to Vhpi
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_RESPONSE_REGISTER_ACCESS_PIPE req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_RESPONSE_REGISTER_ACCESS_PIPE 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,33);
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_data <= Unpack_String(port_val_string,33);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_RESPONSE_REGISTER_ACCESS_PIPE ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("control_word_request_pipe_0 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      control_word_request_pipe_0_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("control_word_request_pipe_0 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,32);
      control_word_request_pipe_0_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("control_word_request_pipe_0 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(control_word_request_pipe_0_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("control_word_request_pipe_1 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      control_word_request_pipe_1_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("control_word_request_pipe_1 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,64);
      control_word_request_pipe_1_pipe_write_data <= Unpack_String(port_val_string,64);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("control_word_request_pipe_1 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(control_word_request_pipe_1_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("control_word_response_pipe req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      control_word_response_pipe_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("control_word_response_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(control_word_response_pipe_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("control_word_response_pipe 0");
      port_val_string := Pack_SLV_To_Vhpi_String(control_word_response_pipe_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,64);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data_0 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mac_to_nic_data_0_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data_0 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,64);
      mac_to_nic_data_0_pipe_write_data <= Unpack_String(port_val_string,64);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data_0 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mac_to_nic_data_0_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data_1 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mac_to_nic_data_1_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data_1 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,16);
      mac_to_nic_data_1_pipe_write_data <= Unpack_String(port_val_string,16);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data_1 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mac_to_nic_data_1_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mem_req0_pipe0 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mem_req0_pipe0_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mem_req0_pipe0 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mem_req0_pipe0_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mem_req0_pipe0 0");
      port_val_string := Pack_SLV_To_Vhpi_String(mem_req0_pipe0_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,64);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mem_req0_pipe1 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mem_req0_pipe1_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mem_req0_pipe1 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mem_req0_pipe1_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mem_req0_pipe1 0");
      port_val_string := Pack_SLV_To_Vhpi_String(mem_req0_pipe1_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,64);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mem_resp0_pipe0 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mem_resp0_pipe0_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mem_resp0_pipe0 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,64);
      mem_resp0_pipe0_pipe_write_data <= Unpack_String(port_val_string,64);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mem_resp0_pipe0 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mem_resp0_pipe0_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mem_resp0_pipe1 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mem_resp0_pipe1_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mem_resp0_pipe1 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,8);
      mem_resp0_pipe1_pipe_write_data <= Unpack_String(port_val_string,8);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mem_resp0_pipe1 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mem_resp0_pipe1_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  ahir_system_instance: ahir_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_data  => NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_data, 
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_req  => NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_req, 
      NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_ack  => NIC_RESPONSE_REGISTER_ACCESS_PIPE_pipe_write_ack,
      control_word_request_pipe_0_pipe_write_data  => control_word_request_pipe_0_pipe_write_data, 
      control_word_request_pipe_0_pipe_write_req  => control_word_request_pipe_0_pipe_write_req, 
      control_word_request_pipe_0_pipe_write_ack  => control_word_request_pipe_0_pipe_write_ack,
      control_word_request_pipe_1_pipe_write_data  => control_word_request_pipe_1_pipe_write_data, 
      control_word_request_pipe_1_pipe_write_req  => control_word_request_pipe_1_pipe_write_req, 
      control_word_request_pipe_1_pipe_write_ack  => control_word_request_pipe_1_pipe_write_ack,
      control_word_response_pipe_pipe_read_data  => control_word_response_pipe_pipe_read_data, 
      control_word_response_pipe_pipe_read_req  => control_word_response_pipe_pipe_read_req, 
      control_word_response_pipe_pipe_read_ack  => control_word_response_pipe_pipe_read_ack ,
      mac_to_nic_data_0_pipe_write_data  => mac_to_nic_data_0_pipe_write_data, 
      mac_to_nic_data_0_pipe_write_req  => mac_to_nic_data_0_pipe_write_req, 
      mac_to_nic_data_0_pipe_write_ack  => mac_to_nic_data_0_pipe_write_ack,
      mac_to_nic_data_1_pipe_write_data  => mac_to_nic_data_1_pipe_write_data, 
      mac_to_nic_data_1_pipe_write_req  => mac_to_nic_data_1_pipe_write_req, 
      mac_to_nic_data_1_pipe_write_ack  => mac_to_nic_data_1_pipe_write_ack,
      mem_req0_pipe0_pipe_read_data  => mem_req0_pipe0_pipe_read_data, 
      mem_req0_pipe0_pipe_read_req  => mem_req0_pipe0_pipe_read_req, 
      mem_req0_pipe0_pipe_read_ack  => mem_req0_pipe0_pipe_read_ack ,
      mem_req0_pipe1_pipe_read_data  => mem_req0_pipe1_pipe_read_data, 
      mem_req0_pipe1_pipe_read_req  => mem_req0_pipe1_pipe_read_req, 
      mem_req0_pipe1_pipe_read_ack  => mem_req0_pipe1_pipe_read_ack ,
      mem_resp0_pipe0_pipe_write_data  => mem_resp0_pipe0_pipe_write_data, 
      mem_resp0_pipe0_pipe_write_req  => mem_resp0_pipe0_pipe_write_req, 
      mem_resp0_pipe0_pipe_write_ack  => mem_resp0_pipe0_pipe_write_ack,
      mem_resp0_pipe1_pipe_write_data  => mem_resp0_pipe1_pipe_write_data, 
      mem_resp0_pipe1_pipe_write_req  => mem_resp0_pipe1_pipe_write_req, 
      mem_resp0_pipe1_pipe_write_ack  => mem_resp0_pipe1_pipe_write_ack); -- 
  -- 
end VhpiLink;

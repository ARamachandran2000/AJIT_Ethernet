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
library work;
use work.ahir_system_global_package.all;
library ModelsimLink;
use ModelsimLink.Utility_Package.all;
use ModelsimLink.Modelsim_FLI_Foreign.all;
entity ahir_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of ahir_system_Test_Bench is -- 
  component ahir_system is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      tb_in_pipe_pipe_write_data: in std_logic_vector(63 downto 0);
      tb_in_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
      tb_in_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
      tb_out_packet_pipe_pipe_read_data: out std_logic_vector(63 downto 0);
      tb_out_packet_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
      tb_out_packet_pipe_pipe_read_ack : out std_logic_vector(0 downto 0);
      tb_out_pipe_pipe_read_data: out std_logic_vector(63 downto 0);
      tb_out_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
      tb_out_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal nicRxFromMacDaemon_tag_in: std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_tag_out: std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_start_req : std_logic := '0';
  signal nicRxFromMacDaemon_start_ack : std_logic := '0';
  signal nicRxFromMacDaemon_fin_req   : std_logic := '0';
  signal nicRxFromMacDaemon_fin_ack   : std_logic := '0';
  signal read_from_tb_tag_in: std_logic_vector(1 downto 0);
  signal read_from_tb_tag_out: std_logic_vector(1 downto 0);
  signal read_from_tb_start_req : std_logic := '0';
  signal read_from_tb_start_ack : std_logic := '0';
  signal read_from_tb_fin_req   : std_logic := '0';
  signal read_from_tb_fin_ack   : std_logic := '0';
  signal rx_fifo_reader_tag_in: std_logic_vector(1 downto 0);
  signal rx_fifo_reader_tag_out: std_logic_vector(1 downto 0);
  signal rx_fifo_reader_start_req : std_logic := '0';
  signal rx_fifo_reader_start_ack : std_logic := '0';
  signal rx_fifo_reader_fin_req   : std_logic := '0';
  signal rx_fifo_reader_fin_ack   : std_logic := '0';
  signal send_header_to_tb_tag_in: std_logic_vector(1 downto 0);
  signal send_header_to_tb_tag_out: std_logic_vector(1 downto 0);
  signal send_header_to_tb_start_req : std_logic := '0';
  signal send_header_to_tb_start_ack : std_logic := '0';
  signal send_header_to_tb_fin_req   : std_logic := '0';
  signal send_header_to_tb_fin_ack   : std_logic := '0';
  signal send_packet_to_tb_tag_in: std_logic_vector(1 downto 0);
  signal send_packet_to_tb_tag_out: std_logic_vector(1 downto 0);
  signal send_packet_to_tb_start_req : std_logic := '0';
  signal send_packet_to_tb_start_ack : std_logic := '0';
  signal send_packet_to_tb_fin_req   : std_logic := '0';
  signal send_packet_to_tb_fin_ack   : std_logic := '0';
  -- write to pipe tb_in_pipe
  signal tb_in_pipe_pipe_write_data: std_logic_vector(63 downto 0);
  signal tb_in_pipe_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal tb_in_pipe_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe tb_out_packet_pipe
  signal tb_out_packet_pipe_pipe_read_data: std_logic_vector(63 downto 0);
  signal tb_out_packet_pipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal tb_out_packet_pipe_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe tb_out_pipe
  signal tb_out_pipe_pipe_read_data: std_logic_vector(63 downto 0);
  signal tb_out_pipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal tb_out_pipe_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  -- assert reset for four clocks.
  process
  begin --
    Modelsim_FLI_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Modelsim_FLI_Listen;
      Modelsim_FLI_Send;
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
      obj_ref := Pack_String_To_Vhpi_String("tb_in_pipe req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      tb_in_pipe_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("tb_in_pipe 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,64);
      tb_in_pipe_pipe_write_data <= Unpack_String(port_val_string,64);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("tb_in_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(tb_in_pipe_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
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
      obj_ref := Pack_String_To_Vhpi_String("tb_out_packet_pipe req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      tb_out_packet_pipe_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("tb_out_packet_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(tb_out_packet_pipe_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("tb_out_packet_pipe 0");
      port_val_string := Pack_SLV_To_Vhpi_String(tb_out_packet_pipe_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,64);
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
      obj_ref := Pack_String_To_Vhpi_String("tb_out_pipe req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      tb_out_pipe_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("tb_out_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(tb_out_pipe_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("tb_out_pipe 0");
      port_val_string := Pack_SLV_To_Vhpi_String(tb_out_pipe_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,64);
      -- 
    end loop;
    --
  end process;
  ahir_system_instance: ahir_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      tb_in_pipe_pipe_write_data  => tb_in_pipe_pipe_write_data, 
      tb_in_pipe_pipe_write_req  => tb_in_pipe_pipe_write_req, 
      tb_in_pipe_pipe_write_ack  => tb_in_pipe_pipe_write_ack,
      tb_out_packet_pipe_pipe_read_data  => tb_out_packet_pipe_pipe_read_data, 
      tb_out_packet_pipe_pipe_read_req  => tb_out_packet_pipe_pipe_read_req, 
      tb_out_packet_pipe_pipe_read_ack  => tb_out_packet_pipe_pipe_read_ack ,
      tb_out_pipe_pipe_read_data  => tb_out_pipe_pipe_read_data, 
      tb_out_pipe_pipe_read_req  => tb_out_pipe_pipe_read_req, 
      tb_out_pipe_pipe_read_ack  => tb_out_pipe_pipe_read_ack ); -- 
  -- 
end VhpiLink;

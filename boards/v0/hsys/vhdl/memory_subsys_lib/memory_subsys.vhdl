library ieee;
use ieee.std_logic_1164.all;
package memory_subsys_Type_Package is -- 
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
library memory_subsys_lib;
use memory_subsys_lib.memory_subsys_Type_Package.all;
--<<<<<
-->>>>>
library GlueModules;
library GlueModules;
library memory_subsys;
library GlueModules;
--<<<<<
entity memory_subsys is -- 
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
end entity memory_subsys;
architecture struct of memory_subsys is -- 
  signal ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_MUX_TO_ACB_TAP_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_MUX_TO_ACB_TAP_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_MUX_TO_ACB_TAP_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_MUX_TO_ACB_TAP_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_MUX_TO_ACB_TAP_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_MUX_TO_ACB_TAP_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_MUX_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_TO_ACB_MUX_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_MUX_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_MUX_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_TO_ACB_MUX_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_TO_ACB_MUX_pipe_read_ack : std_logic_vector(0  downto 0);
  signal CORE_BUS_REQUEST_pipe_write_data: std_logic_vector(109 downto 0);
  signal CORE_BUS_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal CORE_BUS_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal CORE_BUS_REQUEST_pipe_read_data: std_logic_vector(109 downto 0);
  signal CORE_BUS_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal CORE_BUS_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal CORE_BUS_RESPONSE_pipe_write_data: std_logic_vector(64 downto 0);
  signal CORE_BUS_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal CORE_BUS_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal CORE_BUS_RESPONSE_pipe_read_data: std_logic_vector(64 downto 0);
  signal CORE_BUS_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal CORE_BUS_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  component acb_afb_bridge is -- 
    port( -- 
      AFB_BUS_RESPONSE_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_BUS_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_BUS_REQUEST_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_BUS_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_afb_bridge_inst :  acb_afb_bridge -- 
    use entity GlueModules.acb_afb_bridge; -- 
  --<<<<<
  component acb_fast_mux is -- 
    port( -- 
      CORE_BUS_REQUEST_HIGH_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_HIGH_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_HIGH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_LOW_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_LOW_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_LOW_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_HIGH_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_HIGH_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_HIGH_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_LOW_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_LOW_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_LOW_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_mux_inst :  acb_fast_mux -- 
    use entity GlueModules.acb_fast_mux; -- 
  --<<<<<
  component acb_sram_22 is -- 
    port( -- 
      CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_sram_inst :  acb_sram_22 -- 
    use entity memory_subsys.acb_sram_22; -- 
  --<<<<<
  component acb_fast_tap is -- 
    port( -- 
      CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_TAP_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_TAP_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_TAP_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_THROUGH_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_THROUGH_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_THROUGH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MAX_ADDR_TAP : in std_logic_vector(35 downto 0);
      MIN_ADDR_TAP : in std_logic_vector(35 downto 0);
      CORE_BUS_REQUEST_TAP_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_TAP_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_TAP_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_THROUGH_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_THROUGH_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_THROUGH_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for first_tap_inst :  acb_fast_tap -- 
    use entity GlueModules.acb_fast_tap; -- 
  --<<<<<
  -- 
begin -- 
  acb_afb_bridge_inst: acb_afb_bridge
  port map ( --
    AFB_BUS_REQUEST_pipe_read_data => MEM_NIC_SLAVE_REQUEST_pipe_read_data,
    AFB_BUS_REQUEST_pipe_read_req => MEM_NIC_SLAVE_REQUEST_pipe_read_req,
    AFB_BUS_REQUEST_pipe_read_ack => MEM_NIC_SLAVE_REQUEST_pipe_read_ack,
    AFB_BUS_RESPONSE_pipe_write_data => NIC_SLAVE_MEM_RESPONSE_pipe_write_data,
    AFB_BUS_RESPONSE_pipe_write_req => NIC_SLAVE_MEM_RESPONSE_pipe_write_req,
    AFB_BUS_RESPONSE_pipe_write_ack => NIC_SLAVE_MEM_RESPONSE_pipe_write_ack,
    CORE_BUS_REQUEST_pipe_write_data => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_data,
    CORE_BUS_REQUEST_pipe_write_req => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_ack,
    CORE_BUS_REQUEST_pipe_write_ack => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_data => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_read_req => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_read_ack => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  acb_mux_inst: acb_fast_mux
  port map ( --
    CORE_BUS_REQUEST_pipe_read_data => CORE_BUS_REQUEST_pipe_write_data,
    CORE_BUS_REQUEST_pipe_read_req => CORE_BUS_REQUEST_pipe_write_ack,
    CORE_BUS_REQUEST_pipe_read_ack => CORE_BUS_REQUEST_pipe_write_req,
    CORE_BUS_REQUEST_HIGH_pipe_write_data => ACB_TAP_TO_ACB_MUX_pipe_read_data,
    CORE_BUS_REQUEST_HIGH_pipe_write_req => ACB_TAP_TO_ACB_MUX_pipe_read_ack,
    CORE_BUS_REQUEST_HIGH_pipe_write_ack => ACB_TAP_TO_ACB_MUX_pipe_read_req,
    CORE_BUS_REQUEST_LOW_pipe_write_data => NIC_MEM_REQUEST_pipe_write_data,
    CORE_BUS_REQUEST_LOW_pipe_write_req => NIC_MEM_REQUEST_pipe_write_req,
    CORE_BUS_REQUEST_LOW_pipe_write_ack => NIC_MEM_REQUEST_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_write_data => CORE_BUS_RESPONSE_pipe_read_data,
    CORE_BUS_RESPONSE_pipe_write_req => CORE_BUS_RESPONSE_pipe_read_ack,
    CORE_BUS_RESPONSE_pipe_write_ack => CORE_BUS_RESPONSE_pipe_read_req,
    CORE_BUS_RESPONSE_HIGH_pipe_read_data => ACB_MUX_TO_ACB_TAP_pipe_write_data,
    CORE_BUS_RESPONSE_HIGH_pipe_read_req => ACB_MUX_TO_ACB_TAP_pipe_write_ack,
    CORE_BUS_RESPONSE_HIGH_pipe_read_ack => ACB_MUX_TO_ACB_TAP_pipe_write_req,
    CORE_BUS_RESPONSE_LOW_pipe_read_data => MEM_NIC_RESPONSE_pipe_read_data,
    CORE_BUS_RESPONSE_LOW_pipe_read_req => MEM_NIC_RESPONSE_pipe_read_req,
    CORE_BUS_RESPONSE_LOW_pipe_read_ack => MEM_NIC_RESPONSE_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  acb_sram_inst: acb_sram_22
  port map ( --
    CORE_BUS_REQUEST_pipe_write_data => CORE_BUS_REQUEST_pipe_read_data,
    CORE_BUS_REQUEST_pipe_write_req => CORE_BUS_REQUEST_pipe_read_ack,
    CORE_BUS_REQUEST_pipe_write_ack => CORE_BUS_REQUEST_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_data => CORE_BUS_RESPONSE_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_read_req => CORE_BUS_RESPONSE_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_read_ack => CORE_BUS_RESPONSE_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  first_tap_inst: acb_fast_tap
  port map ( --
    CORE_BUS_REQUEST_pipe_write_data => PROCESSOR_MEM_REQUEST_pipe_write_data,
    CORE_BUS_REQUEST_pipe_write_req => PROCESSOR_MEM_REQUEST_pipe_write_req,
    CORE_BUS_REQUEST_pipe_write_ack => PROCESSOR_MEM_REQUEST_pipe_write_ack,
    CORE_BUS_REQUEST_TAP_pipe_read_data => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_data,
    CORE_BUS_REQUEST_TAP_pipe_read_req => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_ack,
    CORE_BUS_REQUEST_TAP_pipe_read_ack => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_req,
    CORE_BUS_REQUEST_THROUGH_pipe_read_data => ACB_TAP_TO_ACB_MUX_pipe_write_data,
    CORE_BUS_REQUEST_THROUGH_pipe_read_req => ACB_TAP_TO_ACB_MUX_pipe_write_ack,
    CORE_BUS_REQUEST_THROUGH_pipe_read_ack => ACB_TAP_TO_ACB_MUX_pipe_write_req,
    CORE_BUS_RESPONSE_pipe_read_data => MEM_PROCESSOR_RESPONSE_pipe_read_data,
    CORE_BUS_RESPONSE_pipe_read_req => MEM_PROCESSOR_RESPONSE_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_ack => MEM_PROCESSOR_RESPONSE_pipe_read_ack,
    CORE_BUS_RESPONSE_TAP_pipe_write_data => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_data,
    CORE_BUS_RESPONSE_TAP_pipe_write_req => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_ack,
    CORE_BUS_RESPONSE_TAP_pipe_write_ack => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_req,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_data => ACB_MUX_TO_ACB_TAP_pipe_read_data,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_req => ACB_MUX_TO_ACB_TAP_pipe_read_ack,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_ack => ACB_MUX_TO_ACB_TAP_pipe_read_req,
    MAX_ADDR_TAP => FIRST_TAP_MAX_PA,
    MIN_ADDR_TAP => FIRST_TAP_MIN_PA,
    clk => clk, reset => reset 
    ); -- 
  ACB_AFB_BRIDGE_TO_ACB_TAP_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_AFB_BRIDGE_TO_ACB_TAP",
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
      read_req => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_req,
      read_ack => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_ack,
      read_data => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_read_data,
      write_req => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_req,
      write_ack => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_ack,
      write_data => ACB_AFB_BRIDGE_TO_ACB_TAP_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  ACB_MUX_TO_ACB_TAP_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_MUX_TO_ACB_TAP",
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
      read_req => ACB_MUX_TO_ACB_TAP_pipe_read_req,
      read_ack => ACB_MUX_TO_ACB_TAP_pipe_read_ack,
      read_data => ACB_MUX_TO_ACB_TAP_pipe_read_data,
      write_req => ACB_MUX_TO_ACB_TAP_pipe_write_req,
      write_ack => ACB_MUX_TO_ACB_TAP_pipe_write_ack,
      write_data => ACB_MUX_TO_ACB_TAP_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  ACB_TAP_TO_ACB_AFB_BRIDGE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_TAP_TO_ACB_AFB_BRIDGE",
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
      read_req => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_req,
      read_ack => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_ack,
      read_data => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_read_data,
      write_req => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_req,
      write_ack => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_ack,
      write_data => ACB_TAP_TO_ACB_AFB_BRIDGE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  ACB_TAP_TO_ACB_MUX_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_TAP_TO_ACB_MUX",
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
      read_req => ACB_TAP_TO_ACB_MUX_pipe_read_req,
      read_ack => ACB_TAP_TO_ACB_MUX_pipe_read_ack,
      read_data => ACB_TAP_TO_ACB_MUX_pipe_read_data,
      write_req => ACB_TAP_TO_ACB_MUX_pipe_write_req,
      write_ack => ACB_TAP_TO_ACB_MUX_pipe_write_ack,
      write_data => ACB_TAP_TO_ACB_MUX_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  CORE_BUS_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe CORE_BUS_REQUEST",
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
      read_req => CORE_BUS_REQUEST_pipe_read_req,
      read_ack => CORE_BUS_REQUEST_pipe_read_ack,
      read_data => CORE_BUS_REQUEST_pipe_read_data,
      write_req => CORE_BUS_REQUEST_pipe_write_req,
      write_ack => CORE_BUS_REQUEST_pipe_write_ack,
      write_data => CORE_BUS_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  CORE_BUS_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe CORE_BUS_RESPONSE",
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
      read_req => CORE_BUS_RESPONSE_pipe_read_req,
      read_ack => CORE_BUS_RESPONSE_pipe_read_ack,
      read_data => CORE_BUS_RESPONSE_pipe_read_data,
      write_req => CORE_BUS_RESPONSE_pipe_write_req,
      write_ack => CORE_BUS_RESPONSE_pipe_write_ack,
      write_data => CORE_BUS_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;

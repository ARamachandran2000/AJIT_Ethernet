library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;

library GenericCoreAddOnlib;
use GenericCoreAddOnLib.GenericCoreAddOnPackage.all;


entity acb_sram_22_stub is -- 
    port( -- 
      CORE_BUS_REQUEST_PIPE_WRITE_DATA : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      CORE_BUS_REQUEST_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_DATA : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;


architecture Mixed of acb_sram_22_stub is
begin 
	base: acb_sram_stub 
			generic map (address_width => 22)
			port map (	
      				CORE_BUS_REQUEST_PIPE_WRITE_DATA  => CORE_BUS_REQUEST_PIPE_WRITE_DATA ,
      				CORE_BUS_REQUEST_PIPE_WRITE_REQ  => CORE_BUS_REQUEST_PIPE_WRITE_REQ ,
      				CORE_BUS_REQUEST_PIPE_WRITE_ACK  => CORE_BUS_REQUEST_PIPE_WRITE_ACK ,
      				CORE_BUS_RESPONSE_PIPE_READ_DATA  => CORE_BUS_RESPONSE_PIPE_READ_DATA ,
      				CORE_BUS_RESPONSE_PIPE_READ_REQ  => CORE_BUS_RESPONSE_PIPE_READ_REQ ,
      				CORE_BUS_RESPONSE_PIPE_READ_ACK  => CORE_BUS_RESPONSE_PIPE_READ_ACK ,
      				clk => clk, reset => reset
				);
end Mixed;

-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package ahir_system_global_package is -- 
  constant B : std_logic_vector(2 downto 0) := "101";
  constant H : std_logic_vector(2 downto 0) := "100";
  constant S0 : std_logic_vector(2 downto 0) := "000";
  constant S1 : std_logic_vector(2 downto 0) := "001";
  constant S2 : std_logic_vector(2 downto 0) := "010";
  constant S3 : std_logic_vector(2 downto 0) := "011";
  constant buffer_1_base_address : std_logic_vector(9 downto 0) := "0000000000";
  constant buffer_2_base_address : std_logic_vector(9 downto 0) := "0000000000";
  constant packet_buffer_base_address : std_logic_vector(15 downto 0) := "0000000000000000";
  -- 
end package ahir_system_global_package;

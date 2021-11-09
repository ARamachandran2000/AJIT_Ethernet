-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
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
entity isWriteToHeader_Volatile is -- 
  port ( -- 
    LSTATE : in  std_logic_vector(2 downto 0);
    HLEN : in  std_logic_vector(3 downto 0);
    PLEN : in  std_logic_vector(15 downto 0);
    write_to_header : out  std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity isWriteToHeader_Volatile;
architecture isWriteToHeader_Volatile_arch of isWriteToHeader_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(23-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal LSTATE_buffer :  std_logic_vector(2 downto 0);
  signal HLEN_buffer :  std_logic_vector(3 downto 0);
  signal PLEN_buffer :  std_logic_vector(15 downto 0);
  -- output port buffer signals
  signal write_to_header_buffer :  std_logic_vector(0 downto 0);
  -- volatile/operator module components. 
  -- 
begin --  
  -- input handling ------------------------------------------------
  LSTATE_buffer <= LSTATE;
  HLEN_buffer <= HLEN;
  PLEN_buffer <= PLEN;
  -- output handling  -------------------------------------------------------
  write_to_header <= write_to_header_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal R_B_45_wire_constant : std_logic_vector(2 downto 0);
    signal header_not_available_47 : std_logic_vector(0 downto 0);
    signal type_cast_51_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_53_wire_constant : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    R_B_45_wire_constant <= "101";
    type_cast_51_wire_constant <= "0";
    type_cast_53_wire_constant <= "1";
    -- flow-through select operator MUX_54_inst
    write_to_header_buffer <= type_cast_51_wire_constant when (header_not_available_47(0) /=  '0') else type_cast_53_wire_constant;
    -- binary operator EQ_u3_u1_46_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_B_45_wire_constant, tmp_var);
      header_not_available_47 <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end isWriteToHeader_Volatile_arch;
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
entity load_buffer1 is -- 
  generic (tag_length : integer); 
  port ( -- 
    next_buf_ptr_out : out  std_logic_vector(9 downto 0);
    pckt_status : out  std_logic_vector(0 downto 0);
    memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
    memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_sr_addr : out  std_logic_vector(9 downto 0);
    memory_space_0_sr_data : out  std_logic_vector(36 downto 0);
    memory_space_0_sr_tag :  out  std_logic_vector(17 downto 0);
    memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
    memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_sc_tag :  in  std_logic_vector(0 downto 0);
    mac_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    mac_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mac_data_pipe_read_data : in   std_logic_vector(36 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity load_buffer1;
architecture load_buffer1_arch of load_buffer1 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 11)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal next_buf_ptr_out_buffer :  std_logic_vector(9 downto 0);
  signal next_buf_ptr_out_update_enable: Boolean;
  signal pckt_status_buffer :  std_logic_vector(0 downto 0);
  signal pckt_status_update_enable: Boolean;
  signal load_buffer1_CP_6_start: Boolean;
  signal load_buffer1_CP_6_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_62_branch_req_0 : boolean;
  signal phi_stmt_68_ack_0 : boolean;
  signal phi_stmt_64_req_1 : boolean;
  signal phi_stmt_64_req_0 : boolean;
  signal phi_stmt_64_ack_0 : boolean;
  signal RPIPE_mac_data_66_inst_req_0 : boolean;
  signal RPIPE_mac_data_66_inst_ack_0 : boolean;
  signal RPIPE_mac_data_66_inst_req_1 : boolean;
  signal RPIPE_mac_data_66_inst_ack_1 : boolean;
  signal RPIPE_mac_data_67_inst_req_0 : boolean;
  signal RPIPE_mac_data_67_inst_ack_0 : boolean;
  signal RPIPE_mac_data_67_inst_req_1 : boolean;
  signal RPIPE_mac_data_67_inst_ack_1 : boolean;
  signal phi_stmt_68_req_1 : boolean;
  signal phi_stmt_68_req_0 : boolean;
  signal next_buf_ptr_117_72_buf_req_0 : boolean;
  signal next_buf_ptr_117_72_buf_ack_0 : boolean;
  signal next_buf_ptr_117_72_buf_req_1 : boolean;
  signal next_buf_ptr_117_72_buf_ack_1 : boolean;
  signal array_obj_ref_110_store_0_req_0 : boolean;
  signal array_obj_ref_110_store_0_ack_0 : boolean;
  signal array_obj_ref_110_store_0_req_1 : boolean;
  signal array_obj_ref_110_store_0_ack_1 : boolean;
  signal do_while_stmt_62_branch_ack_0 : boolean;
  signal do_while_stmt_62_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "load_buffer1_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  load_buffer1_CP_6_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "load_buffer1_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 11) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(9 downto 0) <= next_buf_ptr_out_buffer;
  next_buf_ptr_out <= out_buffer_data_out(9 downto 0);
  out_buffer_data_in(10 downto 10) <= pckt_status_buffer;
  pckt_status <= out_buffer_data_out(10 downto 10);
  out_buffer_data_in(tag_length + 10 downto 11) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 10 downto 11);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= load_buffer1_CP_6_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= load_buffer1_CP_6_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= load_buffer1_CP_6_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  load_buffer1_CP_6: Block -- control-path 
    signal load_buffer1_CP_6_elements: BooleanArray(63 downto 0);
    -- 
  begin -- 
    load_buffer1_CP_6_elements(0) <= load_buffer1_CP_6_start;
    load_buffer1_CP_6_symbol <= load_buffer1_CP_6_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_61/$entry
      -- CP-element group 0: 	 branch_block_stmt_61/branch_block_stmt_61__entry__
      -- CP-element group 0: 	 branch_block_stmt_61/do_while_stmt_62__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	63 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (8) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_61/$exit
      -- CP-element group 1: 	 branch_block_stmt_61/branch_block_stmt_61__exit__
      -- CP-element group 1: 	 branch_block_stmt_61/do_while_stmt_62__exit__
      -- CP-element group 1: 	 branch_block_stmt_61/assign_stmt_124_to_assign_stmt_136__entry__
      -- CP-element group 1: 	 branch_block_stmt_61/assign_stmt_124_to_assign_stmt_136__exit__
      -- CP-element group 1: 	 branch_block_stmt_61/assign_stmt_124_to_assign_stmt_136/$entry
      -- CP-element group 1: 	 branch_block_stmt_61/assign_stmt_124_to_assign_stmt_136/$exit
      -- 
    load_buffer1_CP_6_elements(1) <= load_buffer1_CP_6_elements(63);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_61/do_while_stmt_62/$entry
      -- CP-element group 2: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62__entry__
      -- 
    load_buffer1_CP_6_elements(2) <= load_buffer1_CP_6_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	63 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62__exit__
      -- 
    -- Element group load_buffer1_CP_6_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_61/do_while_stmt_62/loop_back
      -- 
    -- Element group load_buffer1_CP_6_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	61 
    -- CP-element group 5: 	62 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_61/do_while_stmt_62/condition_done
      -- CP-element group 5: 	 branch_block_stmt_61/do_while_stmt_62/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_61/do_while_stmt_62/loop_taken/$entry
      -- 
    load_buffer1_CP_6_elements(5) <= load_buffer1_CP_6_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	60 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_61/do_while_stmt_62/loop_body_done
      -- 
    load_buffer1_CP_6_elements(6) <= load_buffer1_CP_6_elements(60);
    -- CP-element group 7:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	42 
    -- CP-element group 7: 	21 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/back_edge_to_loop_body
      -- 
    load_buffer1_CP_6_elements(7) <= load_buffer1_CP_6_elements(4);
    -- CP-element group 8:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	44 
    -- CP-element group 8: 	23 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/first_time_through_loop_body
      -- 
    load_buffer1_CP_6_elements(8) <= load_buffer1_CP_6_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	39 
    -- CP-element group 9: 	38 
    -- CP-element group 9: 	59 
    -- CP-element group 9: 	15 
    -- CP-element group 9: 	16 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/loop_body_start
      -- 
    -- Element group load_buffer1_CP_6_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	59 
    -- CP-element group 10: 	14 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/condition_evaluated
      -- 
    condition_evaluated_32_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_32_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(10), ack => do_while_stmt_62_branch_req_0); -- 
    load_buffer1_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(59) & load_buffer1_CP_6_elements(14);
      gj_load_buffer1_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	38 
    -- CP-element group 11: 	15 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	17 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_sample_start__ps
      -- 
    load_buffer1_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(38) & load_buffer1_CP_6_elements(15) & load_buffer1_CP_6_elements(14);
      gj_load_buffer1_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	40 
    -- CP-element group 12: 	18 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	60 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	38 
    -- CP-element group 12: 	15 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/aggregated_phi_sample_ack
      -- CP-element group 12: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_sample_completed_
      -- 
    load_buffer1_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(40) & load_buffer1_CP_6_elements(18);
      gj_load_buffer1_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	39 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	19 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_update_start__ps
      -- 
    load_buffer1_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(39) & load_buffer1_CP_6_elements(16);
      gj_load_buffer1_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	41 
    -- CP-element group 14: 	20 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/aggregated_phi_update_ack
      -- 
    load_buffer1_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(41) & load_buffer1_CP_6_elements(20);
      gj_load_buffer1_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	12 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_sample_start_
      -- 
    load_buffer1_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(9) & load_buffer1_CP_6_elements(12);
      gj_load_buffer1_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	9 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	57 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_update_start_
      -- 
    load_buffer1_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(9) & load_buffer1_CP_6_elements(57);
      gj_load_buffer1_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	11 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_sample_start__ps
      -- 
    load_buffer1_CP_6_elements(17) <= load_buffer1_CP_6_elements(11);
    -- CP-element group 18:  join  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	12 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_sample_completed__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(18) is bound as output of CP function.
    -- CP-element group 19:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	13 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (1) 
      -- CP-element group 19: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_update_start__ps
      -- 
    load_buffer1_CP_6_elements(19) <= load_buffer1_CP_6_elements(13);
    -- CP-element group 20:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	55 
    -- CP-element group 20: 	14 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_update_completed__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(20) is bound as output of CP function.
    -- CP-element group 21:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	7 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_loopback_trigger
      -- 
    load_buffer1_CP_6_elements(21) <= load_buffer1_CP_6_elements(7);
    -- CP-element group 22:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_loopback_sample_req
      -- CP-element group 22: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_loopback_sample_req_ps
      -- 
    phi_stmt_64_loopback_sample_req_47_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_64_loopback_sample_req_47_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(22), ack => phi_stmt_64_req_1); -- 
    -- Element group load_buffer1_CP_6_elements(22) is bound as output of CP function.
    -- CP-element group 23:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	8 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_entry_trigger
      -- 
    load_buffer1_CP_6_elements(23) <= load_buffer1_CP_6_elements(8);
    -- CP-element group 24:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_entry_sample_req
      -- CP-element group 24: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_entry_sample_req_ps
      -- 
    phi_stmt_64_entry_sample_req_50_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_64_entry_sample_req_50_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(24), ack => phi_stmt_64_req_0); -- 
    -- Element group load_buffer1_CP_6_elements(24) is bound as output of CP function.
    -- CP-element group 25:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_phi_mux_ack
      -- CP-element group 25: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_64_phi_mux_ack_ps
      -- 
    phi_stmt_64_phi_mux_ack_53_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 25_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_64_ack_0, ack => load_buffer1_CP_6_elements(25)); -- 
    -- CP-element group 26:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (1) 
      -- CP-element group 26: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_sample_start__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	29 
    -- CP-element group 27:  members (1) 
      -- CP-element group 27: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_update_start__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(27) is bound as output of CP function.
    -- CP-element group 28:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: marked-predecessors 
    -- CP-element group 28: 	31 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	30 
    -- CP-element group 28:  members (3) 
      -- CP-element group 28: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Sample/$entry
      -- CP-element group 28: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Sample/rr
      -- 
    rr_66_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_66_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(28), ack => RPIPE_mac_data_66_inst_req_0); -- 
    load_buffer1_cp_element_group_28: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_28"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(26) & load_buffer1_CP_6_elements(31);
      gj_load_buffer1_cp_element_group_28 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(28), clk => clk, reset => reset); --
    end block;
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	27 
    -- CP-element group 29: 	30 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	37 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_update_start_
      -- CP-element group 29: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Update/$entry
      -- CP-element group 29: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Update/cr
      -- 
    cr_71_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_71_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(29), ack => RPIPE_mac_data_66_inst_req_1); -- 
    load_buffer1_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(27) & load_buffer1_CP_6_elements(30) & load_buffer1_CP_6_elements(37);
      gj_load_buffer1_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	28 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	29 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_sample_completed__ps
      -- CP-element group 30: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_sample_completed_
      -- CP-element group 30: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Sample/$exit
      -- CP-element group 30: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Sample/ra
      -- 
    ra_67_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_66_inst_ack_0, ack => load_buffer1_CP_6_elements(30)); -- 
    -- CP-element group 31:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	34 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	28 
    -- CP-element group 31:  members (4) 
      -- CP-element group 31: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_update_completed__ps
      -- CP-element group 31: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_update_completed_
      -- CP-element group 31: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Update/$exit
      -- CP-element group 31: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_66_Update/ca
      -- 
    ca_72_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_66_inst_ack_1, ack => load_buffer1_CP_6_elements(31)); -- 
    -- CP-element group 32:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	34 
    -- CP-element group 32:  members (1) 
      -- CP-element group 32: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_sample_start__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(32) is bound as output of CP function.
    -- CP-element group 33:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (1) 
      -- CP-element group 33: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_update_start__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(33) is bound as output of CP function.
    -- CP-element group 34:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	31 
    -- CP-element group 34: 	32 
    -- CP-element group 34: marked-predecessors 
    -- CP-element group 34: 	37 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_sample_start_
      -- CP-element group 34: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Sample/$entry
      -- CP-element group 34: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Sample/rr
      -- 
    rr_84_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_84_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(34), ack => RPIPE_mac_data_67_inst_req_0); -- 
    load_buffer1_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(31) & load_buffer1_CP_6_elements(32) & load_buffer1_CP_6_elements(37);
      gj_load_buffer1_cp_element_group_34 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	36 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	37 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_update_start_
      -- CP-element group 35: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Update/$entry
      -- CP-element group 35: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Update/cr
      -- 
    cr_89_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_89_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(35), ack => RPIPE_mac_data_67_inst_req_1); -- 
    load_buffer1_cp_element_group_35: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_35"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(36) & load_buffer1_CP_6_elements(33);
      gj_load_buffer1_cp_element_group_35 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(35), clk => clk, reset => reset); --
    end block;
    -- CP-element group 36:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	35 
    -- CP-element group 36:  members (4) 
      -- CP-element group 36: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_sample_completed__ps
      -- CP-element group 36: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_sample_completed_
      -- CP-element group 36: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Sample/$exit
      -- CP-element group 36: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Sample/ra
      -- 
    ra_85_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 36_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_67_inst_ack_0, ack => load_buffer1_CP_6_elements(36)); -- 
    -- CP-element group 37:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	35 
    -- CP-element group 37: successors 
    -- CP-element group 37: marked-successors 
    -- CP-element group 37: 	34 
    -- CP-element group 37: 	29 
    -- CP-element group 37:  members (4) 
      -- CP-element group 37: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_update_completed__ps
      -- CP-element group 37: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_update_completed_
      -- CP-element group 37: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Update/$exit
      -- CP-element group 37: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/RPIPE_mac_data_67_Update/ca
      -- 
    ca_90_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 37_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_67_inst_ack_1, ack => load_buffer1_CP_6_elements(37)); -- 
    -- CP-element group 38:  join  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	9 
    -- CP-element group 38: marked-predecessors 
    -- CP-element group 38: 	12 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	11 
    -- CP-element group 38:  members (1) 
      -- CP-element group 38: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_sample_start_
      -- 
    load_buffer1_cp_element_group_38: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_38"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(9) & load_buffer1_CP_6_elements(12);
      gj_load_buffer1_cp_element_group_38 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(38), clk => clk, reset => reset); --
    end block;
    -- CP-element group 39:  join  transition  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	9 
    -- CP-element group 39: marked-predecessors 
    -- CP-element group 39: 	57 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	13 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_update_start_
      -- 
    load_buffer1_cp_element_group_39: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_39"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(9) & load_buffer1_CP_6_elements(57);
      gj_load_buffer1_cp_element_group_39 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(39), clk => clk, reset => reset); --
    end block;
    -- CP-element group 40:  join  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	12 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_sample_completed__ps
      -- 
    -- Element group load_buffer1_CP_6_elements(40) is bound as output of CP function.
    -- CP-element group 41:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	55 
    -- CP-element group 41: 	14 
    -- CP-element group 41:  members (28) 
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_update_completed_
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_update_completed__ps
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_word_address_calculated
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_root_address_calculated
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_offset_calculated
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_resized_0
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_scaled_0
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_computed_0
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_resize_0/$entry
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_resize_0/$exit
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_resize_0/index_resize_req
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_resize_0/index_resize_ack
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_scale_0/$entry
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_scale_0/$exit
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_scale_0/scale_rename_req
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_index_scale_0/scale_rename_ack
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_final_index_sum_regn/$entry
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_final_index_sum_regn/$exit
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_final_index_sum_regn/req
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_final_index_sum_regn/ack
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_base_plus_offset/$entry
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_base_plus_offset/$exit
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_base_plus_offset/sum_rename_req
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_base_plus_offset/sum_rename_ack
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_word_addrgen/$entry
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_word_addrgen/$exit
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_word_addrgen/root_register_req
      -- CP-element group 41: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_word_addrgen/root_register_ack
      -- 
    -- Element group load_buffer1_CP_6_elements(41) is bound as output of CP function.
    -- CP-element group 42:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	7 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (1) 
      -- CP-element group 42: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_loopback_trigger
      -- 
    load_buffer1_CP_6_elements(42) <= load_buffer1_CP_6_elements(7);
    -- CP-element group 43:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (2) 
      -- CP-element group 43: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_loopback_sample_req
      -- CP-element group 43: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_loopback_sample_req_ps
      -- 
    phi_stmt_68_loopback_sample_req_101_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_68_loopback_sample_req_101_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(43), ack => phi_stmt_68_req_1); -- 
    -- Element group load_buffer1_CP_6_elements(43) is bound as output of CP function.
    -- CP-element group 44:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	8 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_entry_trigger
      -- 
    load_buffer1_CP_6_elements(44) <= load_buffer1_CP_6_elements(8);
    -- CP-element group 45:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (2) 
      -- CP-element group 45: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_entry_sample_req
      -- CP-element group 45: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_entry_sample_req_ps
      -- 
    phi_stmt_68_entry_sample_req_104_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_68_entry_sample_req_104_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(45), ack => phi_stmt_68_req_0); -- 
    -- Element group load_buffer1_CP_6_elements(45) is bound as output of CP function.
    -- CP-element group 46:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_phi_mux_ack
      -- CP-element group 46: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/phi_stmt_68_phi_mux_ack_ps
      -- 
    phi_stmt_68_phi_mux_ack_107_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_68_ack_0, ack => load_buffer1_CP_6_elements(46)); -- 
    -- CP-element group 47:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: successors 
    -- CP-element group 47:  members (4) 
      -- CP-element group 47: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_sample_start__ps
      -- CP-element group 47: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_sample_completed__ps
      -- CP-element group 47: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_sample_start_
      -- CP-element group 47: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_sample_completed_
      -- 
    -- Element group load_buffer1_CP_6_elements(47) is bound as output of CP function.
    -- CP-element group 48:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	50 
    -- CP-element group 48:  members (2) 
      -- CP-element group 48: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_update_start__ps
      -- CP-element group 48: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_update_start_
      -- 
    -- Element group load_buffer1_CP_6_elements(48) is bound as output of CP function.
    -- CP-element group 49:  join  transition  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	50 
    -- CP-element group 49: successors 
    -- CP-element group 49:  members (1) 
      -- CP-element group 49: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_update_completed__ps
      -- 
    load_buffer1_CP_6_elements(49) <= load_buffer1_CP_6_elements(50);
    -- CP-element group 50:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	48 
    -- CP-element group 50: successors 
    -- CP-element group 50: 	49 
    -- CP-element group 50:  members (1) 
      -- CP-element group 50: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/type_cast_71_update_completed_
      -- 
    -- Element group load_buffer1_CP_6_elements(50) is a control-delay.
    cp_element_50_delay: control_delay_element  generic map(name => " 50_delay", delay_value => 1)  port map(req => load_buffer1_CP_6_elements(48), ack => load_buffer1_CP_6_elements(50), clk => clk, reset =>reset);
    -- CP-element group 51:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: successors 
    -- CP-element group 51: 	53 
    -- CP-element group 51:  members (4) 
      -- CP-element group 51: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_sample_start__ps
      -- CP-element group 51: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_sample_start_
      -- CP-element group 51: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Sample/$entry
      -- CP-element group 51: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Sample/req
      -- 
    req_128_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_128_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(51), ack => next_buf_ptr_117_72_buf_req_0); -- 
    -- Element group load_buffer1_CP_6_elements(51) is bound as output of CP function.
    -- CP-element group 52:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	54 
    -- CP-element group 52:  members (4) 
      -- CP-element group 52: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_update_start__ps
      -- CP-element group 52: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_update_start_
      -- CP-element group 52: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Update/$entry
      -- CP-element group 52: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Update/req
      -- 
    req_133_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_133_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(52), ack => next_buf_ptr_117_72_buf_req_1); -- 
    -- Element group load_buffer1_CP_6_elements(52) is bound as output of CP function.
    -- CP-element group 53:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	51 
    -- CP-element group 53: successors 
    -- CP-element group 53:  members (4) 
      -- CP-element group 53: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_sample_completed__ps
      -- CP-element group 53: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_sample_completed_
      -- CP-element group 53: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Sample/$exit
      -- CP-element group 53: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Sample/ack
      -- 
    ack_129_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 53_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_buf_ptr_117_72_buf_ack_0, ack => load_buffer1_CP_6_elements(53)); -- 
    -- CP-element group 54:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	52 
    -- CP-element group 54: successors 
    -- CP-element group 54:  members (4) 
      -- CP-element group 54: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_update_completed__ps
      -- CP-element group 54: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_update_completed_
      -- CP-element group 54: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Update/$exit
      -- CP-element group 54: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/R_next_buf_ptr_72_Update/ack
      -- 
    ack_134_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 54_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_buf_ptr_117_72_buf_ack_1, ack => load_buffer1_CP_6_elements(54)); -- 
    -- CP-element group 55:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	41 
    -- CP-element group 55: 	20 
    -- CP-element group 55: marked-predecessors 
    -- CP-element group 55: 	57 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	57 
    -- CP-element group 55:  members (9) 
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_sample_start_
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/$entry
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/array_obj_ref_110_Split/$entry
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/array_obj_ref_110_Split/$exit
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/array_obj_ref_110_Split/split_req
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/array_obj_ref_110_Split/split_ack
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/word_access_start/$entry
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/word_access_start/word_0/$entry
      -- CP-element group 55: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/word_access_start/word_0/rr
      -- 
    rr_185_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_185_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(55), ack => array_obj_ref_110_store_0_req_0); -- 
    load_buffer1_cp_element_group_55: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_55"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(41) & load_buffer1_CP_6_elements(20) & load_buffer1_CP_6_elements(57);
      gj_load_buffer1_cp_element_group_55 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(55), clk => clk, reset => reset); --
    end block;
    -- CP-element group 56:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: marked-predecessors 
    -- CP-element group 56: 	58 
    -- CP-element group 56: successors 
    -- CP-element group 56: 	58 
    -- CP-element group 56:  members (5) 
      -- CP-element group 56: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_update_start_
      -- CP-element group 56: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/$entry
      -- CP-element group 56: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/word_access_complete/$entry
      -- CP-element group 56: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/word_access_complete/word_0/$entry
      -- CP-element group 56: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/word_access_complete/word_0/cr
      -- 
    cr_196_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_196_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer1_CP_6_elements(56), ack => array_obj_ref_110_store_0_req_1); -- 
    load_buffer1_cp_element_group_56: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_56"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= load_buffer1_CP_6_elements(58);
      gj_load_buffer1_cp_element_group_56 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(56), clk => clk, reset => reset); --
    end block;
    -- CP-element group 57:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: 	55 
    -- CP-element group 57: successors 
    -- CP-element group 57: marked-successors 
    -- CP-element group 57: 	55 
    -- CP-element group 57: 	39 
    -- CP-element group 57: 	16 
    -- CP-element group 57:  members (5) 
      -- CP-element group 57: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_sample_completed_
      -- CP-element group 57: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/$exit
      -- CP-element group 57: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/word_access_start/$exit
      -- CP-element group 57: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/word_access_start/word_0/$exit
      -- CP-element group 57: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Sample/word_access_start/word_0/ra
      -- 
    ra_186_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 57_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_110_store_0_ack_0, ack => load_buffer1_CP_6_elements(57)); -- 
    -- CP-element group 58:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: 	56 
    -- CP-element group 58: successors 
    -- CP-element group 58: 	60 
    -- CP-element group 58: marked-successors 
    -- CP-element group 58: 	56 
    -- CP-element group 58:  members (5) 
      -- CP-element group 58: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_update_completed_
      -- CP-element group 58: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/$exit
      -- CP-element group 58: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/word_access_complete/$exit
      -- CP-element group 58: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/word_access_complete/word_0/$exit
      -- CP-element group 58: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/array_obj_ref_110_Update/word_access_complete/word_0/ca
      -- 
    ca_197_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 58_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_110_store_0_ack_1, ack => load_buffer1_CP_6_elements(58)); -- 
    -- CP-element group 59:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: 	9 
    -- CP-element group 59: successors 
    -- CP-element group 59: 	10 
    -- CP-element group 59:  members (1) 
      -- CP-element group 59: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group load_buffer1_CP_6_elements(59) is a control-delay.
    cp_element_59_delay: control_delay_element  generic map(name => " 59_delay", delay_value => 1)  port map(req => load_buffer1_CP_6_elements(9), ack => load_buffer1_CP_6_elements(59), clk => clk, reset =>reset);
    -- CP-element group 60:  join  transition  bypass  pipeline-parent 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: 	12 
    -- CP-element group 60: 	58 
    -- CP-element group 60: successors 
    -- CP-element group 60: 	6 
    -- CP-element group 60:  members (1) 
      -- CP-element group 60: 	 branch_block_stmt_61/do_while_stmt_62/do_while_stmt_62_loop_body/$exit
      -- 
    load_buffer1_cp_element_group_60: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer1_cp_element_group_60"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer1_CP_6_elements(12) & load_buffer1_CP_6_elements(58);
      gj_load_buffer1_cp_element_group_60 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer1_CP_6_elements(60), clk => clk, reset => reset); --
    end block;
    -- CP-element group 61:  transition  input  bypass  pipeline-parent 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: 	5 
    -- CP-element group 61: successors 
    -- CP-element group 61:  members (2) 
      -- CP-element group 61: 	 branch_block_stmt_61/do_while_stmt_62/loop_exit/$exit
      -- CP-element group 61: 	 branch_block_stmt_61/do_while_stmt_62/loop_exit/ack
      -- 
    ack_202_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 61_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_62_branch_ack_0, ack => load_buffer1_CP_6_elements(61)); -- 
    -- CP-element group 62:  transition  input  bypass  pipeline-parent 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: 	5 
    -- CP-element group 62: successors 
    -- CP-element group 62:  members (2) 
      -- CP-element group 62: 	 branch_block_stmt_61/do_while_stmt_62/loop_taken/$exit
      -- CP-element group 62: 	 branch_block_stmt_61/do_while_stmt_62/loop_taken/ack
      -- 
    ack_206_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 62_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_62_branch_ack_1, ack => load_buffer1_CP_6_elements(62)); -- 
    -- CP-element group 63:  transition  bypass  pipeline-parent 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: 	3 
    -- CP-element group 63: successors 
    -- CP-element group 63: 	1 
    -- CP-element group 63:  members (1) 
      -- CP-element group 63: 	 branch_block_stmt_61/do_while_stmt_62/$exit
      -- 
    load_buffer1_CP_6_elements(63) <= load_buffer1_CP_6_elements(3);
    load_buffer1_do_while_stmt_62_terminator_207: loop_terminator -- 
      generic map (name => " load_buffer1_do_while_stmt_62_terminator_207", max_iterations_in_flight =>7) 
      port map(loop_body_exit => load_buffer1_CP_6_elements(6),loop_continue => load_buffer1_CP_6_elements(62),loop_terminate => load_buffer1_CP_6_elements(61),loop_back => load_buffer1_CP_6_elements(4),loop_exit => load_buffer1_CP_6_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_64_phi_seq_91_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= load_buffer1_CP_6_elements(23);
      load_buffer1_CP_6_elements(26)<= src_sample_reqs(0);
      src_sample_acks(0)  <= load_buffer1_CP_6_elements(30);
      load_buffer1_CP_6_elements(27)<= src_update_reqs(0);
      src_update_acks(0)  <= load_buffer1_CP_6_elements(31);
      load_buffer1_CP_6_elements(24) <= phi_mux_reqs(0);
      triggers(1)  <= load_buffer1_CP_6_elements(21);
      load_buffer1_CP_6_elements(32)<= src_sample_reqs(1);
      src_sample_acks(1)  <= load_buffer1_CP_6_elements(36);
      load_buffer1_CP_6_elements(33)<= src_update_reqs(1);
      src_update_acks(1)  <= load_buffer1_CP_6_elements(37);
      load_buffer1_CP_6_elements(22) <= phi_mux_reqs(1);
      phi_stmt_64_phi_seq_91 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_64_phi_seq_91") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => load_buffer1_CP_6_elements(17), 
          phi_sample_ack => load_buffer1_CP_6_elements(18), 
          phi_update_req => load_buffer1_CP_6_elements(19), 
          phi_update_ack => load_buffer1_CP_6_elements(20), 
          phi_mux_ack => load_buffer1_CP_6_elements(25), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_68_phi_seq_135_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= load_buffer1_CP_6_elements(44);
      load_buffer1_CP_6_elements(47)<= src_sample_reqs(0);
      src_sample_acks(0)  <= load_buffer1_CP_6_elements(47);
      load_buffer1_CP_6_elements(48)<= src_update_reqs(0);
      src_update_acks(0)  <= load_buffer1_CP_6_elements(49);
      load_buffer1_CP_6_elements(45) <= phi_mux_reqs(0);
      triggers(1)  <= load_buffer1_CP_6_elements(42);
      load_buffer1_CP_6_elements(51)<= src_sample_reqs(1);
      src_sample_acks(1)  <= load_buffer1_CP_6_elements(53);
      load_buffer1_CP_6_elements(52)<= src_update_reqs(1);
      src_update_acks(1)  <= load_buffer1_CP_6_elements(54);
      load_buffer1_CP_6_elements(43) <= phi_mux_reqs(1);
      phi_stmt_68_phi_seq_135 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_68_phi_seq_135") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => load_buffer1_CP_6_elements(11), 
          phi_sample_ack => load_buffer1_CP_6_elements(40), 
          phi_update_req => load_buffer1_CP_6_elements(13), 
          phi_update_ack => load_buffer1_CP_6_elements(41), 
          phi_mux_ack => load_buffer1_CP_6_elements(46), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_33_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= load_buffer1_CP_6_elements(7);
        preds(1)  <= load_buffer1_CP_6_elements(8);
        entry_tmerge_33 : transition_merge -- 
          generic map(name => " entry_tmerge_33")
          port map (preds => preds, symbol_out => load_buffer1_CP_6_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal AND_u1_u1_94_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_103_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_121_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_90_wire : std_logic_vector(0 downto 0);
    signal EQ_u32_u1_93_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_97_wire : std_logic_vector(0 downto 0);
    signal MUX_134_wire : std_logic_vector(0 downto 0);
    signal NEQ_u4_u1_106_wire : std_logic_vector(0 downto 0);
    signal RPIPE_mac_data_66_wire : std_logic_vector(36 downto 0);
    signal RPIPE_mac_data_67_wire : std_logic_vector(36 downto 0);
    signal R_buf_ptr_109_resized : std_logic_vector(9 downto 0);
    signal R_buf_ptr_109_scaled : std_logic_vector(9 downto 0);
    signal array_obj_ref_110_data_0 : std_logic_vector(36 downto 0);
    signal array_obj_ref_110_final_offset : std_logic_vector(9 downto 0);
    signal array_obj_ref_110_offset_scale_factor_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_110_resized_base_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_110_root_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_110_word_address_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_110_word_offset_0 : std_logic_vector(9 downto 0);
    signal bad_packet_99 : std_logic_vector(0 downto 0);
    signal buf_ptr_68 : std_logic_vector(9 downto 0);
    signal good_packet_108 : std_logic_vector(0 downto 0);
    signal intm_data_64 : std_logic_vector(36 downto 0);
    signal konst_102_wire_constant : std_logic_vector(0 downto 0);
    signal konst_105_wire_constant : std_logic_vector(3 downto 0);
    signal konst_115_wire_constant : std_logic_vector(9 downto 0);
    signal konst_120_wire_constant : std_logic_vector(0 downto 0);
    signal konst_89_wire_constant : std_logic_vector(0 downto 0);
    signal konst_92_wire_constant : std_logic_vector(31 downto 0);
    signal konst_96_wire_constant : std_logic_vector(3 downto 0);
    signal next_buf_ptr_117 : std_logic_vector(9 downto 0);
    signal next_buf_ptr_117_72_buffered : std_logic_vector(9 downto 0);
    signal tdata_82 : std_logic_vector(31 downto 0);
    signal tkeep_86 : std_logic_vector(3 downto 0);
    signal tlast_77 : std_logic_vector(0 downto 0);
    signal type_cast_128_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_131_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_133_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_71_wire_constant : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    array_obj_ref_110_offset_scale_factor_0 <= "0000000001";
    array_obj_ref_110_resized_base_address <= "0000000000";
    array_obj_ref_110_word_offset_0 <= "0000000000";
    konst_102_wire_constant <= "1";
    konst_105_wire_constant <= "0000";
    konst_115_wire_constant <= "0000000001";
    konst_120_wire_constant <= "0";
    konst_89_wire_constant <= "1";
    konst_92_wire_constant <= "11111111111111111111111111111111";
    konst_96_wire_constant <= "0000";
    type_cast_128_wire_constant <= "1";
    type_cast_131_wire_constant <= "0";
    type_cast_133_wire_constant <= "0";
    type_cast_71_wire_constant <= "0000000000";
    phi_stmt_64: Block -- phi operator 
      signal idata: std_logic_vector(73 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= RPIPE_mac_data_66_wire & RPIPE_mac_data_67_wire;
      req <= phi_stmt_64_req_0 & phi_stmt_64_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_64",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 37) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_64_ack_0,
          idata => idata,
          odata => intm_data_64,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_64
    phi_stmt_68: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_71_wire_constant & next_buf_ptr_117_72_buffered;
      req <= phi_stmt_68_req_0 & phi_stmt_68_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_68",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_68_ack_0,
          idata => idata,
          odata => buf_ptr_68,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_68
    -- flow-through select operator MUX_134_inst
    MUX_134_wire <= type_cast_131_wire_constant when (bad_packet_99(0) /=  '0') else type_cast_133_wire_constant;
    -- flow-through select operator MUX_135_inst
    pckt_status_buffer <= type_cast_128_wire_constant when (good_packet_108(0) /=  '0') else MUX_134_wire;
    -- flow-through slice operator slice_76_inst
    tlast_77 <= intm_data_64(36 downto 36);
    -- flow-through slice operator slice_81_inst
    tdata_82 <= intm_data_64(35 downto 4);
    -- flow-through slice operator slice_85_inst
    tkeep_86 <= intm_data_64(3 downto 0);
    -- interlock W_next_buf_ptr_out_122_inst
    process(next_buf_ptr_117) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 9 downto 0) := next_buf_ptr_117(9 downto 0);
      next_buf_ptr_out_buffer <= tmp_var; -- 
    end process;
    next_buf_ptr_117_72_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= next_buf_ptr_117_72_buf_req_0;
      next_buf_ptr_117_72_buf_ack_0<= wack(0);
      rreq(0) <= next_buf_ptr_117_72_buf_req_1;
      next_buf_ptr_117_72_buf_ack_1<= rack(0);
      next_buf_ptr_117_72_buf : InterlockBuffer generic map ( -- 
        name => "next_buf_ptr_117_72_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 10,
        out_data_width => 10,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => next_buf_ptr_117,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => next_buf_ptr_117_72_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- equivalence array_obj_ref_110_addr_0
    process(array_obj_ref_110_root_address) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_110_root_address;
      ov(9 downto 0) := iv;
      array_obj_ref_110_word_address_0 <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_110_gather_scatter
    process(intm_data_64) --
      variable iv : std_logic_vector(36 downto 0);
      variable ov : std_logic_vector(36 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := intm_data_64;
      ov(36 downto 0) := iv;
      array_obj_ref_110_data_0 <= ov(36 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_110_index_0_rename
    process(R_buf_ptr_109_resized) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_buf_ptr_109_resized;
      ov(9 downto 0) := iv;
      R_buf_ptr_109_scaled <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_110_index_0_resize
    process(buf_ptr_68) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := buf_ptr_68;
      ov(9 downto 0) := iv;
      R_buf_ptr_109_resized <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_110_index_offset
    process(R_buf_ptr_109_scaled) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_buf_ptr_109_scaled;
      ov(9 downto 0) := iv;
      array_obj_ref_110_final_offset <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_110_root_address_inst
    process(array_obj_ref_110_final_offset) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_110_final_offset;
      ov(9 downto 0) := iv;
      array_obj_ref_110_root_address <= ov(9 downto 0);
      --
    end process;
    do_while_stmt_62_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= EQ_u1_u1_121_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_62_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_62_branch_req_0,
          ack0 => do_while_stmt_62_branch_ack_0,
          ack1 => do_while_stmt_62_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u10_u10_116_inst
    process(buf_ptr_68) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApIntAdd_proc(buf_ptr_68, konst_115_wire_constant, tmp_var);
      next_buf_ptr_117 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_107_inst
    process(EQ_u1_u1_103_wire, NEQ_u4_u1_106_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u1_u1_103_wire, NEQ_u4_u1_106_wire, tmp_var);
      good_packet_108 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_94_inst
    process(EQ_u1_u1_90_wire, EQ_u32_u1_93_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u1_u1_90_wire, EQ_u32_u1_93_wire, tmp_var);
      AND_u1_u1_94_wire <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_98_inst
    process(AND_u1_u1_94_wire, EQ_u4_u1_97_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(AND_u1_u1_94_wire, EQ_u4_u1_97_wire, tmp_var);
      bad_packet_99 <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_103_inst
    process(tlast_77) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tlast_77, konst_102_wire_constant, tmp_var);
      EQ_u1_u1_103_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_121_inst
    process(tlast_77) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tlast_77, konst_120_wire_constant, tmp_var);
      EQ_u1_u1_121_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_90_inst
    process(tlast_77) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tlast_77, konst_89_wire_constant, tmp_var);
      EQ_u1_u1_90_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u32_u1_93_inst
    process(tdata_82) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tdata_82, konst_92_wire_constant, tmp_var);
      EQ_u32_u1_93_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_97_inst
    process(tkeep_86) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tkeep_86, konst_96_wire_constant, tmp_var);
      EQ_u4_u1_97_wire <= tmp_var; --
    end process;
    -- binary operator NEQ_u4_u1_106_inst
    process(tkeep_86) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntNe_proc(tkeep_86, konst_105_wire_constant, tmp_var);
      NEQ_u4_u1_106_wire <= tmp_var; --
    end process;
    -- shared store operator group (0) : array_obj_ref_110_store_0 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(9 downto 0);
      signal data_in: std_logic_vector(36 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= array_obj_ref_110_store_0_req_0;
      array_obj_ref_110_store_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= array_obj_ref_110_store_0_req_1;
      array_obj_ref_110_store_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      StoreGroup0_gI: SplitGuardInterface generic map(name => "StoreGroup0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      addr_in <= array_obj_ref_110_word_address_0;
      data_in <= array_obj_ref_110_data_0;
      StoreReq: StoreReqSharedWithInputBuffers -- 
        generic map ( name => "StoreGroup0 Req ", addr_width => 10,
        data_width => 37,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 17,
        min_clock_period => false,
        input_buffering => inBUFs, 
        no_arbitration => false)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => memory_space_0_sr_req(0),
          mack => memory_space_0_sr_ack(0),
          maddr => memory_space_0_sr_addr(9 downto 0),
          mdata => memory_space_0_sr_data(36 downto 0),
          mtag => memory_space_0_sr_tag(17 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          name => "StoreGroup0 Complete ",
          num_reqs => 1,
          detailed_buffering_per_output => outBUFs,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => memory_space_0_sc_req(0),
          mack => memory_space_0_sc_ack(0),
          mtag => memory_space_0_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 0
    -- shared inport operator group (0) : RPIPE_mac_data_66_inst RPIPE_mac_data_67_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 1 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => false);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 2, 1 => 2);
      -- 
    begin -- 
      reqL_unguarded(1) <= RPIPE_mac_data_66_inst_req_0;
      reqL_unguarded(0) <= RPIPE_mac_data_67_inst_req_0;
      RPIPE_mac_data_66_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_mac_data_67_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= RPIPE_mac_data_66_inst_req_1;
      reqR_unguarded(0) <= RPIPE_mac_data_67_inst_req_1;
      RPIPE_mac_data_66_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_mac_data_67_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      RPIPE_mac_data_66_wire <= data_out(73 downto 37);
      RPIPE_mac_data_67_wire <= data_out(36 downto 0);
      mac_data_read_0_gI: SplitGuardInterface generic map(name => "mac_data_read_0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      mac_data_read_0: InputPortRevised -- 
        generic map ( name => "mac_data_read_0", data_width => 37,  num_reqs => 2,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => mac_data_pipe_read_req(0),
          oack => mac_data_pipe_read_ack(0),
          odata => mac_data_pipe_read_data(36 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- 
  end Block; -- data_path
  -- 
end load_buffer1_arch;
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
entity load_buffer2 is -- 
  generic (tag_length : integer); 
  port ( -- 
    next_buf_ptr_out : out  std_logic_vector(9 downto 0);
    pckt_status : out  std_logic_vector(0 downto 0);
    memory_space_1_sr_req : out  std_logic_vector(0 downto 0);
    memory_space_1_sr_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_sr_addr : out  std_logic_vector(9 downto 0);
    memory_space_1_sr_data : out  std_logic_vector(36 downto 0);
    memory_space_1_sr_tag :  out  std_logic_vector(17 downto 0);
    memory_space_1_sc_req : out  std_logic_vector(0 downto 0);
    memory_space_1_sc_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_sc_tag :  in  std_logic_vector(0 downto 0);
    mac_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    mac_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mac_data_pipe_read_data : in   std_logic_vector(36 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity load_buffer2;
architecture load_buffer2_arch of load_buffer2 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 11)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal next_buf_ptr_out_buffer :  std_logic_vector(9 downto 0);
  signal next_buf_ptr_out_update_enable: Boolean;
  signal pckt_status_buffer :  std_logic_vector(0 downto 0);
  signal pckt_status_update_enable: Boolean;
  signal load_buffer2_CP_211_start: Boolean;
  signal load_buffer2_CP_211_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_143_branch_ack_0 : boolean;
  signal do_while_stmt_143_branch_ack_1 : boolean;
  signal do_while_stmt_143_branch_req_0 : boolean;
  signal phi_stmt_145_req_1 : boolean;
  signal phi_stmt_145_req_0 : boolean;
  signal phi_stmt_145_ack_0 : boolean;
  signal RPIPE_mac_data_147_inst_req_0 : boolean;
  signal RPIPE_mac_data_147_inst_ack_0 : boolean;
  signal RPIPE_mac_data_147_inst_req_1 : boolean;
  signal RPIPE_mac_data_147_inst_ack_1 : boolean;
  signal RPIPE_mac_data_148_inst_req_0 : boolean;
  signal RPIPE_mac_data_148_inst_ack_0 : boolean;
  signal RPIPE_mac_data_148_inst_req_1 : boolean;
  signal RPIPE_mac_data_148_inst_ack_1 : boolean;
  signal phi_stmt_149_req_1 : boolean;
  signal phi_stmt_149_req_0 : boolean;
  signal phi_stmt_149_ack_0 : boolean;
  signal next_buf_ptr_197_153_buf_req_0 : boolean;
  signal next_buf_ptr_197_153_buf_ack_0 : boolean;
  signal next_buf_ptr_197_153_buf_req_1 : boolean;
  signal next_buf_ptr_197_153_buf_ack_1 : boolean;
  signal array_obj_ref_190_store_0_req_0 : boolean;
  signal array_obj_ref_190_store_0_ack_0 : boolean;
  signal array_obj_ref_190_store_0_req_1 : boolean;
  signal array_obj_ref_190_store_0_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "load_buffer2_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  load_buffer2_CP_211_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "load_buffer2_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 11) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(9 downto 0) <= next_buf_ptr_out_buffer;
  next_buf_ptr_out <= out_buffer_data_out(9 downto 0);
  out_buffer_data_in(10 downto 10) <= pckt_status_buffer;
  pckt_status <= out_buffer_data_out(10 downto 10);
  out_buffer_data_in(tag_length + 10 downto 11) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 10 downto 11);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= load_buffer2_CP_211_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= load_buffer2_CP_211_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= load_buffer2_CP_211_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  load_buffer2_CP_211: Block -- control-path 
    signal load_buffer2_CP_211_elements: BooleanArray(63 downto 0);
    -- 
  begin -- 
    load_buffer2_CP_211_elements(0) <= load_buffer2_CP_211_start;
    load_buffer2_CP_211_symbol <= load_buffer2_CP_211_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_142/$entry
      -- CP-element group 0: 	 branch_block_stmt_142/branch_block_stmt_142__entry__
      -- CP-element group 0: 	 branch_block_stmt_142/do_while_stmt_143__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	63 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (8) 
      -- CP-element group 1: 	 branch_block_stmt_142/assign_stmt_204_to_assign_stmt_216/$entry
      -- CP-element group 1: 	 branch_block_stmt_142/assign_stmt_204_to_assign_stmt_216/$exit
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_142/$exit
      -- CP-element group 1: 	 branch_block_stmt_142/branch_block_stmt_142__exit__
      -- CP-element group 1: 	 branch_block_stmt_142/do_while_stmt_143__exit__
      -- CP-element group 1: 	 branch_block_stmt_142/assign_stmt_204_to_assign_stmt_216__entry__
      -- CP-element group 1: 	 branch_block_stmt_142/assign_stmt_204_to_assign_stmt_216__exit__
      -- 
    load_buffer2_CP_211_elements(1) <= load_buffer2_CP_211_elements(63);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_142/do_while_stmt_143/$entry
      -- CP-element group 2: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143__entry__
      -- 
    load_buffer2_CP_211_elements(2) <= load_buffer2_CP_211_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	63 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143__exit__
      -- 
    -- Element group load_buffer2_CP_211_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_142/do_while_stmt_143/loop_back
      -- 
    -- Element group load_buffer2_CP_211_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	61 
    -- CP-element group 5: 	62 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_142/do_while_stmt_143/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_142/do_while_stmt_143/loop_taken/$entry
      -- CP-element group 5: 	 branch_block_stmt_142/do_while_stmt_143/condition_done
      -- 
    load_buffer2_CP_211_elements(5) <= load_buffer2_CP_211_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	60 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_142/do_while_stmt_143/loop_body_done
      -- 
    load_buffer2_CP_211_elements(6) <= load_buffer2_CP_211_elements(60);
    -- CP-element group 7:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	42 
    -- CP-element group 7: 	21 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/back_edge_to_loop_body
      -- 
    load_buffer2_CP_211_elements(7) <= load_buffer2_CP_211_elements(4);
    -- CP-element group 8:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	44 
    -- CP-element group 8: 	23 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/first_time_through_loop_body
      -- 
    load_buffer2_CP_211_elements(8) <= load_buffer2_CP_211_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	39 
    -- CP-element group 9: 	59 
    -- CP-element group 9: 	38 
    -- CP-element group 9: 	15 
    -- CP-element group 9: 	16 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/loop_body_start
      -- 
    -- Element group load_buffer2_CP_211_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	59 
    -- CP-element group 10: 	14 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/condition_evaluated
      -- 
    condition_evaluated_237_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_237_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(10), ack => do_while_stmt_143_branch_req_0); -- 
    load_buffer2_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(59) & load_buffer2_CP_211_elements(14);
      gj_load_buffer2_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	38 
    -- CP-element group 11: 	15 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	17 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_sample_start__ps
      -- 
    load_buffer2_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(38) & load_buffer2_CP_211_elements(15) & load_buffer2_CP_211_elements(14);
      gj_load_buffer2_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	40 
    -- CP-element group 12: 	18 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	60 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	38 
    -- CP-element group 12: 	15 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/aggregated_phi_sample_ack
      -- CP-element group 12: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_sample_completed_
      -- 
    load_buffer2_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(40) & load_buffer2_CP_211_elements(18);
      gj_load_buffer2_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	39 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	19 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_update_start__ps
      -- 
    load_buffer2_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(39) & load_buffer2_CP_211_elements(16);
      gj_load_buffer2_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	41 
    -- CP-element group 14: 	20 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/aggregated_phi_update_ack
      -- 
    load_buffer2_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(41) & load_buffer2_CP_211_elements(20);
      gj_load_buffer2_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	12 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_sample_start_
      -- 
    load_buffer2_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(9) & load_buffer2_CP_211_elements(12);
      gj_load_buffer2_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	9 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	57 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_update_start_
      -- 
    load_buffer2_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(9) & load_buffer2_CP_211_elements(57);
      gj_load_buffer2_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	11 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_sample_start__ps
      -- 
    load_buffer2_CP_211_elements(17) <= load_buffer2_CP_211_elements(11);
    -- CP-element group 18:  join  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	12 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_sample_completed__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(18) is bound as output of CP function.
    -- CP-element group 19:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	13 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (1) 
      -- CP-element group 19: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_update_start__ps
      -- 
    load_buffer2_CP_211_elements(19) <= load_buffer2_CP_211_elements(13);
    -- CP-element group 20:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	55 
    -- CP-element group 20: 	14 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_update_completed__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(20) is bound as output of CP function.
    -- CP-element group 21:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	7 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_loopback_trigger
      -- 
    load_buffer2_CP_211_elements(21) <= load_buffer2_CP_211_elements(7);
    -- CP-element group 22:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_loopback_sample_req
      -- CP-element group 22: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_loopback_sample_req_ps
      -- 
    phi_stmt_145_loopback_sample_req_252_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_145_loopback_sample_req_252_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(22), ack => phi_stmt_145_req_1); -- 
    -- Element group load_buffer2_CP_211_elements(22) is bound as output of CP function.
    -- CP-element group 23:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	8 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_entry_trigger
      -- 
    load_buffer2_CP_211_elements(23) <= load_buffer2_CP_211_elements(8);
    -- CP-element group 24:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_entry_sample_req
      -- CP-element group 24: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_entry_sample_req_ps
      -- 
    phi_stmt_145_entry_sample_req_255_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_145_entry_sample_req_255_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(24), ack => phi_stmt_145_req_0); -- 
    -- Element group load_buffer2_CP_211_elements(24) is bound as output of CP function.
    -- CP-element group 25:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_phi_mux_ack
      -- CP-element group 25: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_145_phi_mux_ack_ps
      -- 
    phi_stmt_145_phi_mux_ack_258_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 25_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_145_ack_0, ack => load_buffer2_CP_211_elements(25)); -- 
    -- CP-element group 26:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (1) 
      -- CP-element group 26: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_sample_start__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	29 
    -- CP-element group 27:  members (1) 
      -- CP-element group 27: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_update_start__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(27) is bound as output of CP function.
    -- CP-element group 28:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: marked-predecessors 
    -- CP-element group 28: 	31 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	30 
    -- CP-element group 28:  members (3) 
      -- CP-element group 28: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Sample/$entry
      -- CP-element group 28: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Sample/rr
      -- 
    rr_271_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_271_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(28), ack => RPIPE_mac_data_147_inst_req_0); -- 
    load_buffer2_cp_element_group_28: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_28"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(26) & load_buffer2_CP_211_elements(31);
      gj_load_buffer2_cp_element_group_28 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(28), clk => clk, reset => reset); --
    end block;
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	30 
    -- CP-element group 29: 	27 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	37 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_update_start_
      -- CP-element group 29: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Update/$entry
      -- CP-element group 29: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Update/cr
      -- 
    cr_276_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_276_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(29), ack => RPIPE_mac_data_147_inst_req_1); -- 
    load_buffer2_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(30) & load_buffer2_CP_211_elements(27) & load_buffer2_CP_211_elements(37);
      gj_load_buffer2_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	28 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	29 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_sample_completed__ps
      -- CP-element group 30: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_sample_completed_
      -- CP-element group 30: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Sample/$exit
      -- CP-element group 30: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Sample/ra
      -- 
    ra_272_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_147_inst_ack_0, ack => load_buffer2_CP_211_elements(30)); -- 
    -- CP-element group 31:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	34 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	28 
    -- CP-element group 31:  members (4) 
      -- CP-element group 31: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_update_completed__ps
      -- CP-element group 31: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_update_completed_
      -- CP-element group 31: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Update/$exit
      -- CP-element group 31: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_147_Update/ca
      -- 
    ca_277_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_147_inst_ack_1, ack => load_buffer2_CP_211_elements(31)); -- 
    -- CP-element group 32:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	34 
    -- CP-element group 32:  members (1) 
      -- CP-element group 32: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_sample_start__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(32) is bound as output of CP function.
    -- CP-element group 33:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (1) 
      -- CP-element group 33: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_update_start__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(33) is bound as output of CP function.
    -- CP-element group 34:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	31 
    -- CP-element group 34: 	32 
    -- CP-element group 34: marked-predecessors 
    -- CP-element group 34: 	37 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_sample_start_
      -- CP-element group 34: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Sample/$entry
      -- CP-element group 34: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Sample/rr
      -- 
    rr_289_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_289_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(34), ack => RPIPE_mac_data_148_inst_req_0); -- 
    load_buffer2_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(31) & load_buffer2_CP_211_elements(32) & load_buffer2_CP_211_elements(37);
      gj_load_buffer2_cp_element_group_34 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	36 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	37 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_update_start_
      -- CP-element group 35: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Update/$entry
      -- CP-element group 35: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Update/cr
      -- 
    cr_294_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_294_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(35), ack => RPIPE_mac_data_148_inst_req_1); -- 
    load_buffer2_cp_element_group_35: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_35"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(36) & load_buffer2_CP_211_elements(33);
      gj_load_buffer2_cp_element_group_35 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(35), clk => clk, reset => reset); --
    end block;
    -- CP-element group 36:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	35 
    -- CP-element group 36:  members (4) 
      -- CP-element group 36: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_sample_completed__ps
      -- CP-element group 36: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_sample_completed_
      -- CP-element group 36: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Sample/$exit
      -- CP-element group 36: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Sample/ra
      -- 
    ra_290_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 36_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_148_inst_ack_0, ack => load_buffer2_CP_211_elements(36)); -- 
    -- CP-element group 37:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	35 
    -- CP-element group 37: successors 
    -- CP-element group 37: marked-successors 
    -- CP-element group 37: 	34 
    -- CP-element group 37: 	29 
    -- CP-element group 37:  members (4) 
      -- CP-element group 37: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_update_completed__ps
      -- CP-element group 37: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_update_completed_
      -- CP-element group 37: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Update/$exit
      -- CP-element group 37: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/RPIPE_mac_data_148_Update/ca
      -- 
    ca_295_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 37_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_data_148_inst_ack_1, ack => load_buffer2_CP_211_elements(37)); -- 
    -- CP-element group 38:  join  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	9 
    -- CP-element group 38: marked-predecessors 
    -- CP-element group 38: 	12 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	11 
    -- CP-element group 38:  members (1) 
      -- CP-element group 38: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_sample_start_
      -- 
    load_buffer2_cp_element_group_38: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_38"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(9) & load_buffer2_CP_211_elements(12);
      gj_load_buffer2_cp_element_group_38 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(38), clk => clk, reset => reset); --
    end block;
    -- CP-element group 39:  join  transition  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	9 
    -- CP-element group 39: marked-predecessors 
    -- CP-element group 39: 	57 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	13 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_update_start_
      -- 
    load_buffer2_cp_element_group_39: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_39"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(9) & load_buffer2_CP_211_elements(57);
      gj_load_buffer2_cp_element_group_39 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(39), clk => clk, reset => reset); --
    end block;
    -- CP-element group 40:  join  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	12 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_sample_completed__ps
      -- 
    -- Element group load_buffer2_CP_211_elements(40) is bound as output of CP function.
    -- CP-element group 41:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	55 
    -- CP-element group 41: 	14 
    -- CP-element group 41:  members (28) 
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_update_completed_
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_update_completed__ps
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_word_address_calculated
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_root_address_calculated
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_offset_calculated
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_resized_0
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_scaled_0
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_computed_0
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_resize_0/$entry
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_resize_0/$exit
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_resize_0/index_resize_req
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_resize_0/index_resize_ack
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_scale_0/$entry
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_scale_0/$exit
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_scale_0/scale_rename_req
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_index_scale_0/scale_rename_ack
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_final_index_sum_regn/$entry
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_final_index_sum_regn/$exit
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_final_index_sum_regn/req
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_final_index_sum_regn/ack
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_base_plus_offset/$entry
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_base_plus_offset/$exit
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_base_plus_offset/sum_rename_req
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_base_plus_offset/sum_rename_ack
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_word_addrgen/$entry
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_word_addrgen/$exit
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_word_addrgen/root_register_req
      -- CP-element group 41: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_word_addrgen/root_register_ack
      -- 
    -- Element group load_buffer2_CP_211_elements(41) is bound as output of CP function.
    -- CP-element group 42:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	7 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (1) 
      -- CP-element group 42: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_loopback_trigger
      -- 
    load_buffer2_CP_211_elements(42) <= load_buffer2_CP_211_elements(7);
    -- CP-element group 43:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (2) 
      -- CP-element group 43: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_loopback_sample_req
      -- CP-element group 43: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_loopback_sample_req_ps
      -- 
    phi_stmt_149_loopback_sample_req_306_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_149_loopback_sample_req_306_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(43), ack => phi_stmt_149_req_1); -- 
    -- Element group load_buffer2_CP_211_elements(43) is bound as output of CP function.
    -- CP-element group 44:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	8 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_entry_trigger
      -- 
    load_buffer2_CP_211_elements(44) <= load_buffer2_CP_211_elements(8);
    -- CP-element group 45:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (2) 
      -- CP-element group 45: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_entry_sample_req
      -- CP-element group 45: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_entry_sample_req_ps
      -- 
    phi_stmt_149_entry_sample_req_309_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_149_entry_sample_req_309_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(45), ack => phi_stmt_149_req_0); -- 
    -- Element group load_buffer2_CP_211_elements(45) is bound as output of CP function.
    -- CP-element group 46:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_phi_mux_ack
      -- CP-element group 46: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/phi_stmt_149_phi_mux_ack_ps
      -- 
    phi_stmt_149_phi_mux_ack_312_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_149_ack_0, ack => load_buffer2_CP_211_elements(46)); -- 
    -- CP-element group 47:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: successors 
    -- CP-element group 47:  members (4) 
      -- CP-element group 47: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_sample_start__ps
      -- CP-element group 47: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_sample_completed__ps
      -- CP-element group 47: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_sample_start_
      -- CP-element group 47: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_sample_completed_
      -- 
    -- Element group load_buffer2_CP_211_elements(47) is bound as output of CP function.
    -- CP-element group 48:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	50 
    -- CP-element group 48:  members (2) 
      -- CP-element group 48: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_update_start__ps
      -- CP-element group 48: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_update_start_
      -- 
    -- Element group load_buffer2_CP_211_elements(48) is bound as output of CP function.
    -- CP-element group 49:  join  transition  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	50 
    -- CP-element group 49: successors 
    -- CP-element group 49:  members (1) 
      -- CP-element group 49: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_update_completed__ps
      -- 
    load_buffer2_CP_211_elements(49) <= load_buffer2_CP_211_elements(50);
    -- CP-element group 50:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	48 
    -- CP-element group 50: successors 
    -- CP-element group 50: 	49 
    -- CP-element group 50:  members (1) 
      -- CP-element group 50: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/type_cast_152_update_completed_
      -- 
    -- Element group load_buffer2_CP_211_elements(50) is a control-delay.
    cp_element_50_delay: control_delay_element  generic map(name => " 50_delay", delay_value => 1)  port map(req => load_buffer2_CP_211_elements(48), ack => load_buffer2_CP_211_elements(50), clk => clk, reset =>reset);
    -- CP-element group 51:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: successors 
    -- CP-element group 51: 	53 
    -- CP-element group 51:  members (4) 
      -- CP-element group 51: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_sample_start__ps
      -- CP-element group 51: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_sample_start_
      -- CP-element group 51: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Sample/$entry
      -- CP-element group 51: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Sample/req
      -- 
    req_333_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_333_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(51), ack => next_buf_ptr_197_153_buf_req_0); -- 
    -- Element group load_buffer2_CP_211_elements(51) is bound as output of CP function.
    -- CP-element group 52:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	54 
    -- CP-element group 52:  members (4) 
      -- CP-element group 52: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_update_start__ps
      -- CP-element group 52: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_update_start_
      -- CP-element group 52: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Update/$entry
      -- CP-element group 52: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Update/req
      -- 
    req_338_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_338_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(52), ack => next_buf_ptr_197_153_buf_req_1); -- 
    -- Element group load_buffer2_CP_211_elements(52) is bound as output of CP function.
    -- CP-element group 53:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	51 
    -- CP-element group 53: successors 
    -- CP-element group 53:  members (4) 
      -- CP-element group 53: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_sample_completed__ps
      -- CP-element group 53: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_sample_completed_
      -- CP-element group 53: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Sample/$exit
      -- CP-element group 53: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Sample/ack
      -- 
    ack_334_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 53_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_buf_ptr_197_153_buf_ack_0, ack => load_buffer2_CP_211_elements(53)); -- 
    -- CP-element group 54:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	52 
    -- CP-element group 54: successors 
    -- CP-element group 54:  members (4) 
      -- CP-element group 54: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_update_completed__ps
      -- CP-element group 54: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_update_completed_
      -- CP-element group 54: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Update/$exit
      -- CP-element group 54: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/R_next_buf_ptr_153_Update/ack
      -- 
    ack_339_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 54_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_buf_ptr_197_153_buf_ack_1, ack => load_buffer2_CP_211_elements(54)); -- 
    -- CP-element group 55:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	41 
    -- CP-element group 55: 	20 
    -- CP-element group 55: marked-predecessors 
    -- CP-element group 55: 	57 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	57 
    -- CP-element group 55:  members (9) 
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_sample_start_
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/$entry
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/array_obj_ref_190_Split/$entry
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/array_obj_ref_190_Split/$exit
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/array_obj_ref_190_Split/split_req
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/array_obj_ref_190_Split/split_ack
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/word_access_start/$entry
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/word_access_start/word_0/$entry
      -- CP-element group 55: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/word_access_start/word_0/rr
      -- 
    rr_390_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_390_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(55), ack => array_obj_ref_190_store_0_req_0); -- 
    load_buffer2_cp_element_group_55: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_55"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(41) & load_buffer2_CP_211_elements(20) & load_buffer2_CP_211_elements(57);
      gj_load_buffer2_cp_element_group_55 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(55), clk => clk, reset => reset); --
    end block;
    -- CP-element group 56:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: marked-predecessors 
    -- CP-element group 56: 	58 
    -- CP-element group 56: successors 
    -- CP-element group 56: 	58 
    -- CP-element group 56:  members (5) 
      -- CP-element group 56: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_update_start_
      -- CP-element group 56: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/$entry
      -- CP-element group 56: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/word_access_complete/$entry
      -- CP-element group 56: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/word_access_complete/word_0/$entry
      -- CP-element group 56: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/word_access_complete/word_0/cr
      -- 
    cr_401_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_401_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => load_buffer2_CP_211_elements(56), ack => array_obj_ref_190_store_0_req_1); -- 
    load_buffer2_cp_element_group_56: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_56"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= load_buffer2_CP_211_elements(58);
      gj_load_buffer2_cp_element_group_56 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(56), clk => clk, reset => reset); --
    end block;
    -- CP-element group 57:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: 	55 
    -- CP-element group 57: successors 
    -- CP-element group 57: marked-successors 
    -- CP-element group 57: 	39 
    -- CP-element group 57: 	55 
    -- CP-element group 57: 	16 
    -- CP-element group 57:  members (5) 
      -- CP-element group 57: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_sample_completed_
      -- CP-element group 57: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/$exit
      -- CP-element group 57: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/word_access_start/$exit
      -- CP-element group 57: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/word_access_start/word_0/$exit
      -- CP-element group 57: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Sample/word_access_start/word_0/ra
      -- 
    ra_391_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 57_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_190_store_0_ack_0, ack => load_buffer2_CP_211_elements(57)); -- 
    -- CP-element group 58:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: 	56 
    -- CP-element group 58: successors 
    -- CP-element group 58: 	60 
    -- CP-element group 58: marked-successors 
    -- CP-element group 58: 	56 
    -- CP-element group 58:  members (5) 
      -- CP-element group 58: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_update_completed_
      -- CP-element group 58: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/$exit
      -- CP-element group 58: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/word_access_complete/$exit
      -- CP-element group 58: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/word_access_complete/word_0/$exit
      -- CP-element group 58: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/array_obj_ref_190_Update/word_access_complete/word_0/ca
      -- 
    ca_402_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 58_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_190_store_0_ack_1, ack => load_buffer2_CP_211_elements(58)); -- 
    -- CP-element group 59:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: 	9 
    -- CP-element group 59: successors 
    -- CP-element group 59: 	10 
    -- CP-element group 59:  members (1) 
      -- CP-element group 59: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group load_buffer2_CP_211_elements(59) is a control-delay.
    cp_element_59_delay: control_delay_element  generic map(name => " 59_delay", delay_value => 1)  port map(req => load_buffer2_CP_211_elements(9), ack => load_buffer2_CP_211_elements(59), clk => clk, reset =>reset);
    -- CP-element group 60:  join  transition  bypass  pipeline-parent 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: 	12 
    -- CP-element group 60: 	58 
    -- CP-element group 60: successors 
    -- CP-element group 60: 	6 
    -- CP-element group 60:  members (1) 
      -- CP-element group 60: 	 branch_block_stmt_142/do_while_stmt_143/do_while_stmt_143_loop_body/$exit
      -- 
    load_buffer2_cp_element_group_60: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "load_buffer2_cp_element_group_60"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= load_buffer2_CP_211_elements(12) & load_buffer2_CP_211_elements(58);
      gj_load_buffer2_cp_element_group_60 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => load_buffer2_CP_211_elements(60), clk => clk, reset => reset); --
    end block;
    -- CP-element group 61:  transition  input  bypass  pipeline-parent 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: 	5 
    -- CP-element group 61: successors 
    -- CP-element group 61:  members (2) 
      -- CP-element group 61: 	 branch_block_stmt_142/do_while_stmt_143/loop_exit/$exit
      -- CP-element group 61: 	 branch_block_stmt_142/do_while_stmt_143/loop_exit/ack
      -- 
    ack_407_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 61_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_143_branch_ack_0, ack => load_buffer2_CP_211_elements(61)); -- 
    -- CP-element group 62:  transition  input  bypass  pipeline-parent 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: 	5 
    -- CP-element group 62: successors 
    -- CP-element group 62:  members (2) 
      -- CP-element group 62: 	 branch_block_stmt_142/do_while_stmt_143/loop_taken/$exit
      -- CP-element group 62: 	 branch_block_stmt_142/do_while_stmt_143/loop_taken/ack
      -- 
    ack_411_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 62_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_143_branch_ack_1, ack => load_buffer2_CP_211_elements(62)); -- 
    -- CP-element group 63:  transition  bypass  pipeline-parent 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: 	3 
    -- CP-element group 63: successors 
    -- CP-element group 63: 	1 
    -- CP-element group 63:  members (1) 
      -- CP-element group 63: 	 branch_block_stmt_142/do_while_stmt_143/$exit
      -- 
    load_buffer2_CP_211_elements(63) <= load_buffer2_CP_211_elements(3);
    load_buffer2_do_while_stmt_143_terminator_412: loop_terminator -- 
      generic map (name => " load_buffer2_do_while_stmt_143_terminator_412", max_iterations_in_flight =>7) 
      port map(loop_body_exit => load_buffer2_CP_211_elements(6),loop_continue => load_buffer2_CP_211_elements(62),loop_terminate => load_buffer2_CP_211_elements(61),loop_back => load_buffer2_CP_211_elements(4),loop_exit => load_buffer2_CP_211_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_145_phi_seq_296_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= load_buffer2_CP_211_elements(23);
      load_buffer2_CP_211_elements(26)<= src_sample_reqs(0);
      src_sample_acks(0)  <= load_buffer2_CP_211_elements(30);
      load_buffer2_CP_211_elements(27)<= src_update_reqs(0);
      src_update_acks(0)  <= load_buffer2_CP_211_elements(31);
      load_buffer2_CP_211_elements(24) <= phi_mux_reqs(0);
      triggers(1)  <= load_buffer2_CP_211_elements(21);
      load_buffer2_CP_211_elements(32)<= src_sample_reqs(1);
      src_sample_acks(1)  <= load_buffer2_CP_211_elements(36);
      load_buffer2_CP_211_elements(33)<= src_update_reqs(1);
      src_update_acks(1)  <= load_buffer2_CP_211_elements(37);
      load_buffer2_CP_211_elements(22) <= phi_mux_reqs(1);
      phi_stmt_145_phi_seq_296 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_145_phi_seq_296") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => load_buffer2_CP_211_elements(17), 
          phi_sample_ack => load_buffer2_CP_211_elements(18), 
          phi_update_req => load_buffer2_CP_211_elements(19), 
          phi_update_ack => load_buffer2_CP_211_elements(20), 
          phi_mux_ack => load_buffer2_CP_211_elements(25), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_149_phi_seq_340_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= load_buffer2_CP_211_elements(44);
      load_buffer2_CP_211_elements(47)<= src_sample_reqs(0);
      src_sample_acks(0)  <= load_buffer2_CP_211_elements(47);
      load_buffer2_CP_211_elements(48)<= src_update_reqs(0);
      src_update_acks(0)  <= load_buffer2_CP_211_elements(49);
      load_buffer2_CP_211_elements(45) <= phi_mux_reqs(0);
      triggers(1)  <= load_buffer2_CP_211_elements(42);
      load_buffer2_CP_211_elements(51)<= src_sample_reqs(1);
      src_sample_acks(1)  <= load_buffer2_CP_211_elements(53);
      load_buffer2_CP_211_elements(52)<= src_update_reqs(1);
      src_update_acks(1)  <= load_buffer2_CP_211_elements(54);
      load_buffer2_CP_211_elements(43) <= phi_mux_reqs(1);
      phi_stmt_149_phi_seq_340 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_149_phi_seq_340") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => load_buffer2_CP_211_elements(11), 
          phi_sample_ack => load_buffer2_CP_211_elements(40), 
          phi_update_req => load_buffer2_CP_211_elements(13), 
          phi_update_ack => load_buffer2_CP_211_elements(41), 
          phi_mux_ack => load_buffer2_CP_211_elements(46), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_238_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= load_buffer2_CP_211_elements(7);
        preds(1)  <= load_buffer2_CP_211_elements(8);
        entry_tmerge_238 : transition_merge -- 
          generic map(name => " entry_tmerge_238")
          port map (preds => preds, symbol_out => load_buffer2_CP_211_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal AND_u1_u1_174_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_170_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_183_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_201_wire : std_logic_vector(0 downto 0);
    signal EQ_u32_u1_173_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_177_wire : std_logic_vector(0 downto 0);
    signal MUX_214_wire : std_logic_vector(0 downto 0);
    signal NEQ_u4_u1_186_wire : std_logic_vector(0 downto 0);
    signal RPIPE_mac_data_147_wire : std_logic_vector(36 downto 0);
    signal RPIPE_mac_data_148_wire : std_logic_vector(36 downto 0);
    signal R_buf_ptr_189_resized : std_logic_vector(9 downto 0);
    signal R_buf_ptr_189_scaled : std_logic_vector(9 downto 0);
    signal array_obj_ref_190_data_0 : std_logic_vector(36 downto 0);
    signal array_obj_ref_190_final_offset : std_logic_vector(9 downto 0);
    signal array_obj_ref_190_offset_scale_factor_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_190_resized_base_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_190_root_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_190_word_address_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_190_word_offset_0 : std_logic_vector(9 downto 0);
    signal bad_packet_179 : std_logic_vector(0 downto 0);
    signal buf_ptr_149 : std_logic_vector(9 downto 0);
    signal good_packet_188 : std_logic_vector(0 downto 0);
    signal intm_data_145 : std_logic_vector(36 downto 0);
    signal konst_169_wire_constant : std_logic_vector(0 downto 0);
    signal konst_172_wire_constant : std_logic_vector(31 downto 0);
    signal konst_176_wire_constant : std_logic_vector(3 downto 0);
    signal konst_182_wire_constant : std_logic_vector(0 downto 0);
    signal konst_185_wire_constant : std_logic_vector(3 downto 0);
    signal konst_195_wire_constant : std_logic_vector(9 downto 0);
    signal konst_200_wire_constant : std_logic_vector(0 downto 0);
    signal next_buf_ptr_197 : std_logic_vector(9 downto 0);
    signal next_buf_ptr_197_153_buffered : std_logic_vector(9 downto 0);
    signal tdata_162 : std_logic_vector(31 downto 0);
    signal tkeep_166 : std_logic_vector(3 downto 0);
    signal tlast_158 : std_logic_vector(0 downto 0);
    signal type_cast_152_wire_constant : std_logic_vector(9 downto 0);
    signal type_cast_208_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_211_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_213_wire_constant : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    array_obj_ref_190_offset_scale_factor_0 <= "0000000001";
    array_obj_ref_190_resized_base_address <= "0000000000";
    array_obj_ref_190_word_offset_0 <= "0000000000";
    konst_169_wire_constant <= "1";
    konst_172_wire_constant <= "11111111111111111111111111111111";
    konst_176_wire_constant <= "0000";
    konst_182_wire_constant <= "1";
    konst_185_wire_constant <= "0000";
    konst_195_wire_constant <= "0000000001";
    konst_200_wire_constant <= "0";
    type_cast_152_wire_constant <= "0000000000";
    type_cast_208_wire_constant <= "1";
    type_cast_211_wire_constant <= "0";
    type_cast_213_wire_constant <= "0";
    phi_stmt_145: Block -- phi operator 
      signal idata: std_logic_vector(73 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= RPIPE_mac_data_147_wire & RPIPE_mac_data_148_wire;
      req <= phi_stmt_145_req_0 & phi_stmt_145_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_145",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 37) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_145_ack_0,
          idata => idata,
          odata => intm_data_145,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_145
    phi_stmt_149: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_152_wire_constant & next_buf_ptr_197_153_buffered;
      req <= phi_stmt_149_req_0 & phi_stmt_149_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_149",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_149_ack_0,
          idata => idata,
          odata => buf_ptr_149,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_149
    -- flow-through select operator MUX_214_inst
    MUX_214_wire <= type_cast_211_wire_constant when (bad_packet_179(0) /=  '0') else type_cast_213_wire_constant;
    -- flow-through select operator MUX_215_inst
    pckt_status_buffer <= type_cast_208_wire_constant when (good_packet_188(0) /=  '0') else MUX_214_wire;
    -- flow-through slice operator slice_157_inst
    tlast_158 <= intm_data_145(36 downto 36);
    -- flow-through slice operator slice_161_inst
    tdata_162 <= intm_data_145(35 downto 4);
    -- flow-through slice operator slice_165_inst
    tkeep_166 <= intm_data_145(3 downto 0);
    -- interlock W_next_buf_ptr_out_202_inst
    process(next_buf_ptr_197) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 9 downto 0) := next_buf_ptr_197(9 downto 0);
      next_buf_ptr_out_buffer <= tmp_var; -- 
    end process;
    next_buf_ptr_197_153_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= next_buf_ptr_197_153_buf_req_0;
      next_buf_ptr_197_153_buf_ack_0<= wack(0);
      rreq(0) <= next_buf_ptr_197_153_buf_req_1;
      next_buf_ptr_197_153_buf_ack_1<= rack(0);
      next_buf_ptr_197_153_buf : InterlockBuffer generic map ( -- 
        name => "next_buf_ptr_197_153_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 10,
        out_data_width => 10,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => next_buf_ptr_197,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => next_buf_ptr_197_153_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- equivalence array_obj_ref_190_addr_0
    process(array_obj_ref_190_root_address) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_190_root_address;
      ov(9 downto 0) := iv;
      array_obj_ref_190_word_address_0 <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_190_gather_scatter
    process(intm_data_145) --
      variable iv : std_logic_vector(36 downto 0);
      variable ov : std_logic_vector(36 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := intm_data_145;
      ov(36 downto 0) := iv;
      array_obj_ref_190_data_0 <= ov(36 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_190_index_0_rename
    process(R_buf_ptr_189_resized) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_buf_ptr_189_resized;
      ov(9 downto 0) := iv;
      R_buf_ptr_189_scaled <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_190_index_0_resize
    process(buf_ptr_149) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := buf_ptr_149;
      ov(9 downto 0) := iv;
      R_buf_ptr_189_resized <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_190_index_offset
    process(R_buf_ptr_189_scaled) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_buf_ptr_189_scaled;
      ov(9 downto 0) := iv;
      array_obj_ref_190_final_offset <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_190_root_address_inst
    process(array_obj_ref_190_final_offset) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_190_final_offset;
      ov(9 downto 0) := iv;
      array_obj_ref_190_root_address <= ov(9 downto 0);
      --
    end process;
    do_while_stmt_143_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= EQ_u1_u1_201_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_143_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_143_branch_req_0,
          ack0 => do_while_stmt_143_branch_ack_0,
          ack1 => do_while_stmt_143_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u10_u10_196_inst
    process(buf_ptr_149) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApIntAdd_proc(buf_ptr_149, konst_195_wire_constant, tmp_var);
      next_buf_ptr_197 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_174_inst
    process(EQ_u1_u1_170_wire, EQ_u32_u1_173_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u1_u1_170_wire, EQ_u32_u1_173_wire, tmp_var);
      AND_u1_u1_174_wire <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_178_inst
    process(AND_u1_u1_174_wire, EQ_u4_u1_177_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(AND_u1_u1_174_wire, EQ_u4_u1_177_wire, tmp_var);
      bad_packet_179 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_187_inst
    process(EQ_u1_u1_183_wire, NEQ_u4_u1_186_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u1_u1_183_wire, NEQ_u4_u1_186_wire, tmp_var);
      good_packet_188 <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_170_inst
    process(tlast_158) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tlast_158, konst_169_wire_constant, tmp_var);
      EQ_u1_u1_170_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_183_inst
    process(tlast_158) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tlast_158, konst_182_wire_constant, tmp_var);
      EQ_u1_u1_183_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_201_inst
    process(tlast_158) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tlast_158, konst_200_wire_constant, tmp_var);
      EQ_u1_u1_201_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u32_u1_173_inst
    process(tdata_162) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tdata_162, konst_172_wire_constant, tmp_var);
      EQ_u32_u1_173_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_177_inst
    process(tkeep_166) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(tkeep_166, konst_176_wire_constant, tmp_var);
      EQ_u4_u1_177_wire <= tmp_var; --
    end process;
    -- binary operator NEQ_u4_u1_186_inst
    process(tkeep_166) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntNe_proc(tkeep_166, konst_185_wire_constant, tmp_var);
      NEQ_u4_u1_186_wire <= tmp_var; --
    end process;
    -- shared store operator group (0) : array_obj_ref_190_store_0 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(9 downto 0);
      signal data_in: std_logic_vector(36 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= array_obj_ref_190_store_0_req_0;
      array_obj_ref_190_store_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= array_obj_ref_190_store_0_req_1;
      array_obj_ref_190_store_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      StoreGroup0_gI: SplitGuardInterface generic map(name => "StoreGroup0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      addr_in <= array_obj_ref_190_word_address_0;
      data_in <= array_obj_ref_190_data_0;
      StoreReq: StoreReqSharedWithInputBuffers -- 
        generic map ( name => "StoreGroup0 Req ", addr_width => 10,
        data_width => 37,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 17,
        min_clock_period => false,
        input_buffering => inBUFs, 
        no_arbitration => false)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => memory_space_1_sr_req(0),
          mack => memory_space_1_sr_ack(0),
          maddr => memory_space_1_sr_addr(9 downto 0),
          mdata => memory_space_1_sr_data(36 downto 0),
          mtag => memory_space_1_sr_tag(17 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          name => "StoreGroup0 Complete ",
          num_reqs => 1,
          detailed_buffering_per_output => outBUFs,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => memory_space_1_sc_req(0),
          mack => memory_space_1_sc_ack(0),
          mtag => memory_space_1_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 0
    -- shared inport operator group (0) : RPIPE_mac_data_147_inst RPIPE_mac_data_148_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 1 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => false);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 2, 1 => 2);
      -- 
    begin -- 
      reqL_unguarded(1) <= RPIPE_mac_data_147_inst_req_0;
      reqL_unguarded(0) <= RPIPE_mac_data_148_inst_req_0;
      RPIPE_mac_data_147_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_mac_data_148_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= RPIPE_mac_data_147_inst_req_1;
      reqR_unguarded(0) <= RPIPE_mac_data_148_inst_req_1;
      RPIPE_mac_data_147_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_mac_data_148_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      RPIPE_mac_data_147_wire <= data_out(73 downto 37);
      RPIPE_mac_data_148_wire <= data_out(36 downto 0);
      mac_data_read_0_gI: SplitGuardInterface generic map(name => "mac_data_read_0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      mac_data_read_0: InputPortRevised -- 
        generic map ( name => "mac_data_read_0", data_width => 37,  num_reqs => 2,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => mac_data_pipe_read_req(0),
          oack => mac_data_pipe_read_ack(0),
          odata => mac_data_pipe_read_data(36 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- 
  end Block; -- data_path
  -- 
end load_buffer2_arch;
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
entity nextDESTMAC_Volatile is -- 
  port ( -- 
    LSTATE : in  std_logic_vector(2 downto 0);
    DESTMAC : in  std_logic_vector(47 downto 0);
    RX : in  std_logic_vector(36 downto 0);
    nDESTMAC : out  std_logic_vector(47 downto 0)-- 
  );
  -- 
end entity nextDESTMAC_Volatile;
architecture nextDESTMAC_Volatile_arch of nextDESTMAC_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(88-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal LSTATE_buffer :  std_logic_vector(2 downto 0);
  signal DESTMAC_buffer :  std_logic_vector(47 downto 0);
  signal RX_buffer :  std_logic_vector(36 downto 0);
  -- output port buffer signals
  signal nDESTMAC_buffer :  std_logic_vector(47 downto 0);
  -- volatile/operator module components. 
  -- 
begin --  
  -- input handling ------------------------------------------------
  LSTATE_buffer <= LSTATE;
  DESTMAC_buffer <= DESTMAC;
  RX_buffer <= RX;
  -- output handling  -------------------------------------------------------
  nDESTMAC <= nDESTMAC_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u16_u48_254_wire : std_logic_vector(47 downto 0);
    signal MUX_248_wire : std_logic_vector(47 downto 0);
    signal MUX_256_wire : std_logic_vector(47 downto 0);
    signal MUX_261_wire : std_logic_vector(47 downto 0);
    signal NOT_u1_u1_237_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_239_wire : std_logic_vector(0 downto 0);
    signal OR_u48_u48_257_wire : std_logic_vector(47 downto 0);
    signal R_S0_227_wire_constant : std_logic_vector(2 downto 0);
    signal R_S1_232_wire_constant : std_logic_vector(2 downto 0);
    signal S0_state_229 : std_logic_vector(0 downto 0);
    signal S1_state_234 : std_logic_vector(0 downto 0);
    signal konst_247_wire_constant : std_logic_vector(47 downto 0);
    signal konst_255_wire_constant : std_logic_vector(47 downto 0);
    signal konst_260_wire_constant : std_logic_vector(47 downto 0);
    signal not_both_241 : std_logic_vector(0 downto 0);
    signal slice_245_wire : std_logic_vector(31 downto 0);
    signal slice_251_wire : std_logic_vector(15 downto 0);
    signal slice_253_wire : std_logic_vector(31 downto 0);
    signal type_cast_246_wire : std_logic_vector(47 downto 0);
    -- 
  begin -- 
    R_S0_227_wire_constant <= "000";
    R_S1_232_wire_constant <= "001";
    konst_247_wire_constant <= "000000000000000000000000000000000000000000000000";
    konst_255_wire_constant <= "000000000000000000000000000000000000000000000000";
    konst_260_wire_constant <= "000000000000000000000000000000000000000000000000";
    -- flow-through select operator MUX_248_inst
    MUX_248_wire <= type_cast_246_wire when (S0_state_229(0) /=  '0') else konst_247_wire_constant;
    -- flow-through select operator MUX_256_inst
    MUX_256_wire <= CONCAT_u16_u48_254_wire when (S1_state_234(0) /=  '0') else konst_255_wire_constant;
    -- flow-through select operator MUX_261_inst
    MUX_261_wire <= DESTMAC_buffer when (not_both_241(0) /=  '0') else konst_260_wire_constant;
    -- flow-through slice operator slice_245_inst
    slice_245_wire <= RX_buffer(35 downto 4);
    -- flow-through slice operator slice_251_inst
    slice_251_wire <= RX_buffer(19 downto 4);
    -- flow-through slice operator slice_253_inst
    slice_253_wire <= DESTMAC_buffer(31 downto 0);
    -- interlock type_cast_246_inst
    process(slice_245_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := slice_245_wire(31 downto 0);
      type_cast_246_wire <= tmp_var; -- 
    end process;
    -- binary operator AND_u1_u1_240_inst
    process(NOT_u1_u1_237_wire, NOT_u1_u1_239_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NOT_u1_u1_237_wire, NOT_u1_u1_239_wire, tmp_var);
      not_both_241 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u16_u48_254_inst
    process(slice_251_wire, slice_253_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      ApConcat_proc(slice_251_wire, slice_253_wire, tmp_var);
      CONCAT_u16_u48_254_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_228_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S0_227_wire_constant, tmp_var);
      S0_state_229 <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_233_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S1_232_wire_constant, tmp_var);
      S1_state_234 <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_237_inst
    process(S0_state_229) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", S0_state_229, tmp_var);
      NOT_u1_u1_237_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_239_inst
    process(S1_state_234) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", S1_state_234, tmp_var);
      NOT_u1_u1_239_wire <= tmp_var; -- 
    end process;
    -- binary operator OR_u48_u48_257_inst
    process(MUX_248_wire, MUX_256_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_248_wire, MUX_256_wire, tmp_var);
      OR_u48_u48_257_wire <= tmp_var; --
    end process;
    -- binary operator OR_u48_u48_262_inst
    process(OR_u48_u48_257_wire, MUX_261_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u48_u48_257_wire, MUX_261_wire, tmp_var);
      nDESTMAC_buffer <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end nextDESTMAC_Volatile_arch;
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
entity nextLSTATE_Volatile is -- 
  port ( -- 
    RX : in  std_logic_vector(36 downto 0);
    LSTATE : in  std_logic_vector(2 downto 0);
    HLEN : in  std_logic_vector(3 downto 0);
    PLEN : in  std_logic_vector(15 downto 0);
    nLSTATE : out  std_logic_vector(2 downto 0);
    nHLEN : out  std_logic_vector(3 downto 0);
    nPLEN : out  std_logic_vector(15 downto 0)-- 
  );
  -- 
end entity nextLSTATE_Volatile;
architecture nextLSTATE_Volatile_arch of nextLSTATE_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(60-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal RX_buffer :  std_logic_vector(36 downto 0);
  signal LSTATE_buffer :  std_logic_vector(2 downto 0);
  signal HLEN_buffer :  std_logic_vector(3 downto 0);
  signal PLEN_buffer :  std_logic_vector(15 downto 0);
  -- output port buffer signals
  signal nLSTATE_buffer :  std_logic_vector(2 downto 0);
  signal nHLEN_buffer :  std_logic_vector(3 downto 0);
  signal nPLEN_buffer :  std_logic_vector(15 downto 0);
  -- volatile/operator module components. 
  -- 
begin --  
  -- input handling ------------------------------------------------
  RX_buffer <= RX;
  LSTATE_buffer <= LSTATE;
  HLEN_buffer <= HLEN;
  PLEN_buffer <= PLEN;
  -- output handling  -------------------------------------------------------
  nLSTATE <= nLSTATE_buffer;
  nHLEN <= nHLEN_buffer;
  nPLEN <= nPLEN_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal B_state_361 : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_276_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_289_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_298_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_304_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_311_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_318_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_347_wire : std_logic_vector(0 downto 0);
    signal EQ_u3_u1_368_wire : std_logic_vector(0 downto 0);
    signal H_state_342 : std_logic_vector(0 downto 0);
    signal MUX_301_wire : std_logic_vector(2 downto 0);
    signal MUX_307_wire : std_logic_vector(2 downto 0);
    signal MUX_314_wire : std_logic_vector(2 downto 0);
    signal MUX_325_wire : std_logic_vector(2 downto 0);
    signal MUX_329_wire : std_logic_vector(2 downto 0);
    signal MUX_334_wire : std_logic_vector(2 downto 0);
    signal MUX_353_wire : std_logic_vector(3 downto 0);
    signal MUX_374_wire : std_logic_vector(15 downto 0);
    signal OR_u1_u1_280_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_322_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_365_wire : std_logic_vector(0 downto 0);
    signal OR_u3_u3_308_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_315_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_330_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_335_wire : std_logic_vector(2 downto 0);
    signal R_B_288_wire_constant : std_logic_vector(2 downto 0);
    signal R_B_327_wire_constant : std_logic_vector(2 downto 0);
    signal R_B_359_wire_constant : std_logic_vector(2 downto 0);
    signal R_H_275_wire_constant : std_logic_vector(2 downto 0);
    signal R_H_323_wire_constant : std_logic_vector(2 downto 0);
    signal R_H_340_wire_constant : std_logic_vector(2 downto 0);
    signal R_S0_297_wire_constant : std_logic_vector(2 downto 0);
    signal R_S0_332_wire_constant : std_logic_vector(2 downto 0);
    signal R_S1_299_wire_constant : std_logic_vector(2 downto 0);
    signal R_S1_303_wire_constant : std_logic_vector(2 downto 0);
    signal R_S2_305_wire_constant : std_logic_vector(2 downto 0);
    signal R_S2_310_wire_constant : std_logic_vector(2 downto 0);
    signal R_S3_312_wire_constant : std_logic_vector(2 downto 0);
    signal R_S3_317_wire_constant : std_logic_vector(2 downto 0);
    signal R_S3_346_wire_constant : std_logic_vector(2 downto 0);
    signal R_S3_367_wire_constant : std_logic_vector(2 downto 0);
    signal SUB_u16_u16_373_wire : std_logic_vector(15 downto 0);
    signal SUB_u4_u4_352_wire : std_logic_vector(3 downto 0);
    signal UGT_u16_u1_279_wire : std_logic_vector(0 downto 0);
    signal UGT_u4_u1_321_wire : std_logic_vector(0 downto 0);
    signal ULE_u16_u1_292_wire : std_logic_vector(0 downto 0);
    signal ULE_u4_u1_283_wire : std_logic_vector(0 downto 0);
    signal konst_278_wire_constant : std_logic_vector(15 downto 0);
    signal konst_282_wire_constant : std_logic_vector(3 downto 0);
    signal konst_291_wire_constant : std_logic_vector(15 downto 0);
    signal konst_300_wire_constant : std_logic_vector(2 downto 0);
    signal konst_306_wire_constant : std_logic_vector(2 downto 0);
    signal konst_313_wire_constant : std_logic_vector(2 downto 0);
    signal konst_320_wire_constant : std_logic_vector(3 downto 0);
    signal konst_324_wire_constant : std_logic_vector(2 downto 0);
    signal konst_328_wire_constant : std_logic_vector(2 downto 0);
    signal konst_333_wire_constant : std_logic_vector(2 downto 0);
    signal konst_351_wire_constant : std_logic_vector(3 downto 0);
    signal konst_372_wire_constant : std_logic_vector(15 downto 0);
    signal n_state_is_B_285 : std_logic_vector(0 downto 0);
    signal n_state_is_S0_294 : std_logic_vector(0 downto 0);
    signal slice_349_wire : std_logic_vector(3 downto 0);
    signal slice_370_wire : std_logic_vector(15 downto 0);
    -- 
  begin -- 
    R_B_288_wire_constant <= "101";
    R_B_327_wire_constant <= "101";
    R_B_359_wire_constant <= "101";
    R_H_275_wire_constant <= "100";
    R_H_323_wire_constant <= "100";
    R_H_340_wire_constant <= "100";
    R_S0_297_wire_constant <= "000";
    R_S0_332_wire_constant <= "000";
    R_S1_299_wire_constant <= "001";
    R_S1_303_wire_constant <= "001";
    R_S2_305_wire_constant <= "010";
    R_S2_310_wire_constant <= "010";
    R_S3_312_wire_constant <= "011";
    R_S3_317_wire_constant <= "011";
    R_S3_346_wire_constant <= "011";
    R_S3_367_wire_constant <= "011";
    konst_278_wire_constant <= "0000000000000010";
    konst_282_wire_constant <= "0001";
    konst_291_wire_constant <= "0000000000000010";
    konst_300_wire_constant <= "000";
    konst_306_wire_constant <= "000";
    konst_313_wire_constant <= "000";
    konst_320_wire_constant <= "0001";
    konst_324_wire_constant <= "000";
    konst_328_wire_constant <= "000";
    konst_333_wire_constant <= "000";
    konst_351_wire_constant <= "0001";
    konst_372_wire_constant <= "0000000000000100";
    -- flow-through select operator MUX_301_inst
    MUX_301_wire <= R_S1_299_wire_constant when (EQ_u3_u1_298_wire(0) /=  '0') else konst_300_wire_constant;
    -- flow-through select operator MUX_307_inst
    MUX_307_wire <= R_S2_305_wire_constant when (EQ_u3_u1_304_wire(0) /=  '0') else konst_306_wire_constant;
    -- flow-through select operator MUX_314_inst
    MUX_314_wire <= R_S3_312_wire_constant when (EQ_u3_u1_311_wire(0) /=  '0') else konst_313_wire_constant;
    -- flow-through select operator MUX_325_inst
    MUX_325_wire <= R_H_323_wire_constant when (OR_u1_u1_322_wire(0) /=  '0') else konst_324_wire_constant;
    -- flow-through select operator MUX_329_inst
    MUX_329_wire <= R_B_327_wire_constant when (n_state_is_B_285(0) /=  '0') else konst_328_wire_constant;
    -- flow-through select operator MUX_334_inst
    MUX_334_wire <= R_S0_332_wire_constant when (n_state_is_S0_294(0) /=  '0') else konst_333_wire_constant;
    -- flow-through select operator MUX_353_inst
    MUX_353_wire <= slice_349_wire when (EQ_u3_u1_347_wire(0) /=  '0') else SUB_u4_u4_352_wire;
    -- flow-through select operator MUX_355_inst
    nHLEN_buffer <= MUX_353_wire when (H_state_342(0) /=  '0') else HLEN_buffer;
    -- flow-through select operator MUX_374_inst
    MUX_374_wire <= slice_370_wire when (EQ_u3_u1_368_wire(0) /=  '0') else SUB_u16_u16_373_wire;
    -- flow-through select operator MUX_376_inst
    nPLEN_buffer <= MUX_374_wire when (OR_u1_u1_365_wire(0) /=  '0') else PLEN_buffer;
    -- flow-through slice operator slice_349_inst
    slice_349_wire <= RX_buffer(27 downto 24);
    -- flow-through slice operator slice_370_inst
    slice_370_wire <= RX_buffer(19 downto 4);
    -- binary operator AND_u1_u1_284_inst
    process(OR_u1_u1_280_wire, ULE_u4_u1_283_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(OR_u1_u1_280_wire, ULE_u4_u1_283_wire, tmp_var);
      n_state_is_B_285 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_293_inst
    process(EQ_u3_u1_289_wire, ULE_u16_u1_292_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u3_u1_289_wire, ULE_u16_u1_292_wire, tmp_var);
      n_state_is_S0_294 <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_276_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_H_275_wire_constant, tmp_var);
      EQ_u3_u1_276_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_289_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_B_288_wire_constant, tmp_var);
      EQ_u3_u1_289_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_298_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S0_297_wire_constant, tmp_var);
      EQ_u3_u1_298_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_304_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S1_303_wire_constant, tmp_var);
      EQ_u3_u1_304_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_311_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S2_310_wire_constant, tmp_var);
      EQ_u3_u1_311_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_318_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S3_317_wire_constant, tmp_var);
      EQ_u3_u1_318_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_341_inst
    process(nLSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(nLSTATE_buffer, R_H_340_wire_constant, tmp_var);
      H_state_342 <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_347_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S3_346_wire_constant, tmp_var);
      EQ_u3_u1_347_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_360_inst
    process(nLSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(nLSTATE_buffer, R_B_359_wire_constant, tmp_var);
      B_state_361 <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_368_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S3_367_wire_constant, tmp_var);
      EQ_u3_u1_368_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_280_inst
    process(EQ_u3_u1_276_wire, UGT_u16_u1_279_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u3_u1_276_wire, UGT_u16_u1_279_wire, tmp_var);
      OR_u1_u1_280_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_322_inst
    process(EQ_u3_u1_318_wire, UGT_u4_u1_321_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u3_u1_318_wire, UGT_u4_u1_321_wire, tmp_var);
      OR_u1_u1_322_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_365_inst
    process(B_state_361, H_state_342) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(B_state_361, H_state_342, tmp_var);
      OR_u1_u1_365_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_308_inst
    process(MUX_301_wire, MUX_307_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_301_wire, MUX_307_wire, tmp_var);
      OR_u3_u3_308_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_315_inst
    process(OR_u3_u3_308_wire, MUX_314_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u3_u3_308_wire, MUX_314_wire, tmp_var);
      OR_u3_u3_315_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_330_inst
    process(MUX_325_wire, MUX_329_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_325_wire, MUX_329_wire, tmp_var);
      OR_u3_u3_330_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_335_inst
    process(OR_u3_u3_330_wire, MUX_334_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u3_u3_330_wire, MUX_334_wire, tmp_var);
      OR_u3_u3_335_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_336_inst
    process(OR_u3_u3_315_wire, OR_u3_u3_335_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u3_u3_315_wire, OR_u3_u3_335_wire, tmp_var);
      nLSTATE_buffer <= tmp_var; --
    end process;
    -- binary operator SUB_u16_u16_373_inst
    process(PLEN_buffer) -- 
      variable tmp_var : std_logic_vector(15 downto 0); -- 
    begin -- 
      ApIntSub_proc(PLEN_buffer, konst_372_wire_constant, tmp_var);
      SUB_u16_u16_373_wire <= tmp_var; --
    end process;
    -- binary operator SUB_u4_u4_352_inst
    process(HLEN_buffer) -- 
      variable tmp_var : std_logic_vector(3 downto 0); -- 
    begin -- 
      ApIntSub_proc(HLEN_buffer, konst_351_wire_constant, tmp_var);
      SUB_u4_u4_352_wire <= tmp_var; --
    end process;
    -- binary operator UGT_u16_u1_279_inst
    process(PLEN_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUgt_proc(PLEN_buffer, konst_278_wire_constant, tmp_var);
      UGT_u16_u1_279_wire <= tmp_var; --
    end process;
    -- binary operator UGT_u4_u1_321_inst
    process(HLEN_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUgt_proc(HLEN_buffer, konst_320_wire_constant, tmp_var);
      UGT_u4_u1_321_wire <= tmp_var; --
    end process;
    -- binary operator ULE_u16_u1_292_inst
    process(PLEN_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUle_proc(PLEN_buffer, konst_291_wire_constant, tmp_var);
      ULE_u16_u1_292_wire <= tmp_var; --
    end process;
    -- binary operator ULE_u4_u1_283_inst
    process(HLEN_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUle_proc(HLEN_buffer, konst_282_wire_constant, tmp_var);
      ULE_u4_u1_283_wire <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end nextLSTATE_Volatile_arch;
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
entity nextSRCMAC_Volatile is -- 
  port ( -- 
    LSTATE : in  std_logic_vector(2 downto 0);
    SRCMAC : in  std_logic_vector(47 downto 0);
    RX : in  std_logic_vector(36 downto 0);
    nSRCMAC : out  std_logic_vector(47 downto 0)-- 
  );
  -- 
end entity nextSRCMAC_Volatile;
architecture nextSRCMAC_Volatile_arch of nextSRCMAC_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(88-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal LSTATE_buffer :  std_logic_vector(2 downto 0);
  signal SRCMAC_buffer :  std_logic_vector(47 downto 0);
  signal RX_buffer :  std_logic_vector(36 downto 0);
  -- output port buffer signals
  signal nSRCMAC_buffer :  std_logic_vector(47 downto 0);
  -- volatile/operator module components. 
  -- 
begin --  
  -- input handling ------------------------------------------------
  LSTATE_buffer <= LSTATE;
  SRCMAC_buffer <= SRCMAC;
  RX_buffer <= RX;
  -- output handling  -------------------------------------------------------
  nSRCMAC <= nSRCMAC_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u32_u48_413_wire : std_logic_vector(47 downto 0);
    signal MUX_407_wire : std_logic_vector(47 downto 0);
    signal MUX_415_wire : std_logic_vector(47 downto 0);
    signal MUX_420_wire : std_logic_vector(47 downto 0);
    signal NOT_u1_u1_396_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_398_wire : std_logic_vector(0 downto 0);
    signal OR_u48_u48_416_wire : std_logic_vector(47 downto 0);
    signal R_S1_386_wire_constant : std_logic_vector(2 downto 0);
    signal R_S2_391_wire_constant : std_logic_vector(2 downto 0);
    signal S1_state_388 : std_logic_vector(0 downto 0);
    signal S2_state_393 : std_logic_vector(0 downto 0);
    signal konst_406_wire_constant : std_logic_vector(47 downto 0);
    signal konst_414_wire_constant : std_logic_vector(47 downto 0);
    signal konst_419_wire_constant : std_logic_vector(47 downto 0);
    signal not_both_400 : std_logic_vector(0 downto 0);
    signal slice_404_wire : std_logic_vector(15 downto 0);
    signal slice_410_wire : std_logic_vector(31 downto 0);
    signal slice_412_wire : std_logic_vector(15 downto 0);
    signal type_cast_405_wire : std_logic_vector(47 downto 0);
    -- 
  begin -- 
    R_S1_386_wire_constant <= "001";
    R_S2_391_wire_constant <= "010";
    konst_406_wire_constant <= "000000000000000000000000000000000000000000000000";
    konst_414_wire_constant <= "000000000000000000000000000000000000000000000000";
    konst_419_wire_constant <= "000000000000000000000000000000000000000000000000";
    -- flow-through select operator MUX_407_inst
    MUX_407_wire <= type_cast_405_wire when (S1_state_388(0) /=  '0') else konst_406_wire_constant;
    -- flow-through select operator MUX_415_inst
    MUX_415_wire <= CONCAT_u32_u48_413_wire when (S2_state_393(0) /=  '0') else konst_414_wire_constant;
    -- flow-through select operator MUX_420_inst
    MUX_420_wire <= SRCMAC_buffer when (not_both_400(0) /=  '0') else konst_419_wire_constant;
    -- flow-through slice operator slice_404_inst
    slice_404_wire <= RX_buffer(35 downto 20);
    -- flow-through slice operator slice_410_inst
    slice_410_wire <= RX_buffer(35 downto 4);
    -- flow-through slice operator slice_412_inst
    slice_412_wire <= SRCMAC_buffer(15 downto 0);
    -- interlock type_cast_405_inst
    process(slice_404_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 15 downto 0) := slice_404_wire(15 downto 0);
      type_cast_405_wire <= tmp_var; -- 
    end process;
    -- binary operator AND_u1_u1_399_inst
    process(NOT_u1_u1_396_wire, NOT_u1_u1_398_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NOT_u1_u1_396_wire, NOT_u1_u1_398_wire, tmp_var);
      not_both_400 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u32_u48_413_inst
    process(slice_410_wire, slice_412_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      ApConcat_proc(slice_410_wire, slice_412_wire, tmp_var);
      CONCAT_u32_u48_413_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_387_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S1_386_wire_constant, tmp_var);
      S1_state_388 <= tmp_var; --
    end process;
    -- binary operator EQ_u3_u1_392_inst
    process(LSTATE_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(LSTATE_buffer, R_S2_391_wire_constant, tmp_var);
      S2_state_393 <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_396_inst
    process(S2_state_393) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", S2_state_393, tmp_var);
      NOT_u1_u1_396_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_398_inst
    process(S2_state_393) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", S2_state_393, tmp_var);
      NOT_u1_u1_398_wire <= tmp_var; -- 
    end process;
    -- binary operator OR_u48_u48_416_inst
    process(MUX_407_wire, MUX_415_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_407_wire, MUX_415_wire, tmp_var);
      OR_u48_u48_416_wire <= tmp_var; --
    end process;
    -- binary operator OR_u48_u48_421_inst
    process(OR_u48_u48_416_wire, MUX_420_wire) -- 
      variable tmp_var : std_logic_vector(47 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u48_u48_416_wire, MUX_420_wire, tmp_var);
      nSRCMAC_buffer <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end nextSRCMAC_Volatile_arch;
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
entity nicRxFromMacDaemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    mac_to_nic_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_read_data : in   std_logic_vector(36 downto 0);
    nic_rx_to_header_pipe_write_req : out  std_logic_vector(0 downto 0);
    nic_rx_to_header_pipe_write_ack : in   std_logic_vector(0 downto 0);
    nic_rx_to_header_pipe_write_data : out  std_logic_vector(36 downto 0);
    nic_rx_to_packet_pipe_write_req : out  std_logic_vector(0 downto 0);
    nic_rx_to_packet_pipe_write_ack : in   std_logic_vector(0 downto 0);
    nic_rx_to_packet_pipe_write_data : out  std_logic_vector(36 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity nicRxFromMacDaemon;
architecture nicRxFromMacDaemon_arch of nicRxFromMacDaemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal nicRxFromMacDaemon_CP_425_start: Boolean;
  signal nicRxFromMacDaemon_CP_425_symbol: Boolean;
  -- volatile/operator module components. 
  component isWriteToHeader_Volatile is -- 
    port ( -- 
      LSTATE : in  std_logic_vector(2 downto 0);
      HLEN : in  std_logic_vector(3 downto 0);
      PLEN : in  std_logic_vector(15 downto 0);
      write_to_header : out  std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component; 
  component nextSRCMAC_Volatile is -- 
    port ( -- 
      LSTATE : in  std_logic_vector(2 downto 0);
      SRCMAC : in  std_logic_vector(47 downto 0);
      RX : in  std_logic_vector(36 downto 0);
      nSRCMAC : out  std_logic_vector(47 downto 0)-- 
    );
    -- 
  end component; 
  component nextLSTATE_Volatile is -- 
    port ( -- 
      RX : in  std_logic_vector(36 downto 0);
      LSTATE : in  std_logic_vector(2 downto 0);
      HLEN : in  std_logic_vector(3 downto 0);
      PLEN : in  std_logic_vector(15 downto 0);
      nLSTATE : out  std_logic_vector(2 downto 0);
      nHLEN : out  std_logic_vector(3 downto 0);
      nPLEN : out  std_logic_vector(15 downto 0)-- 
    );
    -- 
  end component; 
  component nextDESTMAC_Volatile is -- 
    port ( -- 
      LSTATE : in  std_logic_vector(2 downto 0);
      DESTMAC : in  std_logic_vector(47 downto 0);
      RX : in  std_logic_vector(36 downto 0);
      nDESTMAC : out  std_logic_vector(47 downto 0)-- 
    );
    -- 
  end component; 
  -- links between control-path and data-path
  signal nTOTAL_STATE_508_433_buf_req_0 : boolean;
  signal nTOTAL_STATE_508_433_buf_ack_0 : boolean;
  signal phi_stmt_428_ack_0 : boolean;
  signal phi_stmt_428_req_1 : boolean;
  signal do_while_stmt_426_branch_req_0 : boolean;
  signal RPIPE_mac_to_nic_data_436_inst_req_0 : boolean;
  signal RPIPE_mac_to_nic_data_436_inst_ack_0 : boolean;
  signal nTOTAL_STATE_508_433_buf_req_1 : boolean;
  signal nTOTAL_STATE_508_433_buf_ack_1 : boolean;
  signal RPIPE_mac_to_nic_data_436_inst_req_1 : boolean;
  signal RPIPE_mac_to_nic_data_436_inst_ack_1 : boolean;
  signal WPIPE_nic_rx_to_header_490_inst_req_0 : boolean;
  signal WPIPE_nic_rx_to_header_490_inst_ack_0 : boolean;
  signal WPIPE_nic_rx_to_header_490_inst_req_1 : boolean;
  signal WPIPE_nic_rx_to_header_490_inst_ack_1 : boolean;
  signal phi_stmt_428_req_0 : boolean;
  signal WPIPE_nic_rx_to_packet_493_inst_req_0 : boolean;
  signal WPIPE_nic_rx_to_packet_493_inst_ack_0 : boolean;
  signal WPIPE_nic_rx_to_packet_493_inst_req_1 : boolean;
  signal WPIPE_nic_rx_to_packet_493_inst_ack_1 : boolean;
  signal do_while_stmt_426_branch_ack_0 : boolean;
  signal do_while_stmt_426_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "nicRxFromMacDaemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  nicRxFromMacDaemon_CP_425_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "nicRxFromMacDaemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= nicRxFromMacDaemon_CP_425_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= nicRxFromMacDaemon_CP_425_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= nicRxFromMacDaemon_CP_425_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  nicRxFromMacDaemon_CP_425: Block -- control-path 
    signal nicRxFromMacDaemon_CP_425_elements: BooleanArray(47 downto 0);
    -- 
  begin -- 
    nicRxFromMacDaemon_CP_425_elements(0) <= nicRxFromMacDaemon_CP_425_start;
    nicRxFromMacDaemon_CP_425_symbol <= nicRxFromMacDaemon_CP_425_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_425/branch_block_stmt_425__entry__
      -- CP-element group 0: 	 branch_block_stmt_425/do_while_stmt_426__entry__
      -- CP-element group 0: 	 branch_block_stmt_425/$entry
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	47 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_425/branch_block_stmt_425__exit__
      -- CP-element group 1: 	 branch_block_stmt_425/$exit
      -- CP-element group 1: 	 branch_block_stmt_425/do_while_stmt_426__exit__
      -- 
    nicRxFromMacDaemon_CP_425_elements(1) <= nicRxFromMacDaemon_CP_425_elements(47);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426__entry__
      -- CP-element group 2: 	 branch_block_stmt_425/do_while_stmt_426/$entry
      -- 
    nicRxFromMacDaemon_CP_425_elements(2) <= nicRxFromMacDaemon_CP_425_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	47 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426__exit__
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_425/do_while_stmt_426/loop_back
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	45 
    -- CP-element group 5: 	46 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_425/do_while_stmt_426/condition_done
      -- CP-element group 5: 	 branch_block_stmt_425/do_while_stmt_426/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_425/do_while_stmt_426/loop_taken/$entry
      -- 
    nicRxFromMacDaemon_CP_425_elements(5) <= nicRxFromMacDaemon_CP_425_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	44 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_425/do_while_stmt_426/loop_body_done
      -- 
    nicRxFromMacDaemon_CP_425_elements(6) <= nicRxFromMacDaemon_CP_425_elements(44);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	19 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/back_edge_to_loop_body
      -- 
    nicRxFromMacDaemon_CP_425_elements(7) <= nicRxFromMacDaemon_CP_425_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	21 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/first_time_through_loop_body
      -- 
    nicRxFromMacDaemon_CP_425_elements(8) <= nicRxFromMacDaemon_CP_425_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	15 
    -- CP-element group 9: 	16 
    -- CP-element group 9: 	32 
    -- CP-element group 9: 	43 
    -- CP-element group 9: 	11 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_434_sample_start_
      -- CP-element group 9: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/loop_body_start
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	14 
    -- CP-element group 10: 	43 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/condition_evaluated
      -- 
    condition_evaluated_449_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_449_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(10), ack => do_while_stmt_426_branch_req_0); -- 
    nicRxFromMacDaemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(14) & nicRxFromMacDaemon_CP_425_elements(43);
      gj_nicRxFromMacDaemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	15 
    -- CP-element group 11: 	9 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	33 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_sample_start__ps
      -- CP-element group 11: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/aggregated_phi_sample_req
      -- 
    nicRxFromMacDaemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(15) & nicRxFromMacDaemon_CP_425_elements(9) & nicRxFromMacDaemon_CP_425_elements(14);
      gj_nicRxFromMacDaemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	17 
    -- CP-element group 12: 	35 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	44 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	15 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_434_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/aggregated_phi_sample_ack
      -- 
    nicRxFromMacDaemon_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(17) & nicRxFromMacDaemon_CP_425_elements(35);
      gj_nicRxFromMacDaemon_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	16 
    -- CP-element group 13: 	32 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	34 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_update_start__ps
      -- CP-element group 13: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/aggregated_phi_update_req
      -- 
    nicRxFromMacDaemon_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(16) & nicRxFromMacDaemon_CP_425_elements(32);
      gj_nicRxFromMacDaemon_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	18 
    -- CP-element group 14: 	36 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/aggregated_phi_update_ack
      -- 
    nicRxFromMacDaemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(18) & nicRxFromMacDaemon_CP_425_elements(36);
      gj_nicRxFromMacDaemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	12 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_sample_start_
      -- 
    nicRxFromMacDaemon_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(9) & nicRxFromMacDaemon_CP_425_elements(12);
      gj_nicRxFromMacDaemon_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	9 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	38 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_update_start_
      -- 
    nicRxFromMacDaemon_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(9) & nicRxFromMacDaemon_CP_425_elements(38);
      gj_nicRxFromMacDaemon_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  join  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	12 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_sample_completed__ps
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(17) is bound as output of CP function.
    -- CP-element group 18:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	14 
    -- CP-element group 18: 	37 
    -- CP-element group 18:  members (2) 
      -- CP-element group 18: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_update_completed__ps
      -- CP-element group 18: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_update_completed_
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(18) is bound as output of CP function.
    -- CP-element group 19:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	7 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (1) 
      -- CP-element group 19: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_loopback_trigger
      -- 
    nicRxFromMacDaemon_CP_425_elements(19) <= nicRxFromMacDaemon_CP_425_elements(7);
    -- CP-element group 20:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_loopback_sample_req
      -- CP-element group 20: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_loopback_sample_req_ps
      -- 
    phi_stmt_428_loopback_sample_req_464_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_428_loopback_sample_req_464_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(20), ack => phi_stmt_428_req_1); -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(20) is bound as output of CP function.
    -- CP-element group 21:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	8 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_entry_trigger
      -- 
    nicRxFromMacDaemon_CP_425_elements(21) <= nicRxFromMacDaemon_CP_425_elements(8);
    -- CP-element group 22:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_entry_sample_req_ps
      -- CP-element group 22: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_entry_sample_req
      -- 
    phi_stmt_428_entry_sample_req_467_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_428_entry_sample_req_467_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(22), ack => phi_stmt_428_req_0); -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(22) is bound as output of CP function.
    -- CP-element group 23:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (2) 
      -- CP-element group 23: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_phi_mux_ack
      -- CP-element group 23: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_428_phi_mux_ack_ps
      -- 
    phi_stmt_428_phi_mux_ack_470_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_428_ack_0, ack => nicRxFromMacDaemon_CP_425_elements(23)); -- 
    -- CP-element group 24:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (4) 
      -- CP-element group 24: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_sample_completed_
      -- CP-element group 24: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_sample_start_
      -- CP-element group 24: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_sample_completed__ps
      -- CP-element group 24: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_sample_start__ps
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(24) is bound as output of CP function.
    -- CP-element group 25:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	27 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_update_start_
      -- CP-element group 25: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_update_start__ps
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(25) is bound as output of CP function.
    -- CP-element group 26:  join  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	27 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (1) 
      -- CP-element group 26: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_update_completed__ps
      -- 
    nicRxFromMacDaemon_CP_425_elements(26) <= nicRxFromMacDaemon_CP_425_elements(27);
    -- CP-element group 27:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	25 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	26 
    -- CP-element group 27:  members (1) 
      -- CP-element group 27: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/type_cast_432_update_completed_
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(27) is a control-delay.
    cp_element_27_delay: control_delay_element  generic map(name => " 27_delay", delay_value => 1)  port map(req => nicRxFromMacDaemon_CP_425_elements(25), ack => nicRxFromMacDaemon_CP_425_elements(27), clk => clk, reset =>reset);
    -- CP-element group 28:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	30 
    -- CP-element group 28:  members (4) 
      -- CP-element group 28: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Sample/req
      -- CP-element group 28: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Sample/$entry
      -- CP-element group 28: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_sample_start__ps
      -- 
    req_491_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_491_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(28), ack => nTOTAL_STATE_508_433_buf_req_0); -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(28) is bound as output of CP function.
    -- CP-element group 29:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (4) 
      -- CP-element group 29: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_update_start_
      -- CP-element group 29: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Update/$entry
      -- CP-element group 29: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_update_start__ps
      -- CP-element group 29: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Update/req
      -- 
    req_496_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_496_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(29), ack => nTOTAL_STATE_508_433_buf_req_1); -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(29) is bound as output of CP function.
    -- CP-element group 30:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	28 
    -- CP-element group 30: successors 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Sample/ack
      -- CP-element group 30: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Sample/$exit
      -- CP-element group 30: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_sample_completed__ps
      -- CP-element group 30: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_sample_completed_
      -- 
    ack_492_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nTOTAL_STATE_508_433_buf_ack_0, ack => nicRxFromMacDaemon_CP_425_elements(30)); -- 
    -- CP-element group 31:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31:  members (4) 
      -- CP-element group 31: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_update_completed_
      -- CP-element group 31: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Update/$exit
      -- CP-element group 31: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_update_completed__ps
      -- CP-element group 31: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/R_nTOTAL_STATE_433_Update/ack
      -- 
    ack_497_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nTOTAL_STATE_508_433_buf_ack_1, ack => nicRxFromMacDaemon_CP_425_elements(31)); -- 
    -- CP-element group 32:  join  transition  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	9 
    -- CP-element group 32: marked-predecessors 
    -- CP-element group 32: 	38 
    -- CP-element group 32: 	41 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	13 
    -- CP-element group 32:  members (1) 
      -- CP-element group 32: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_434_update_start_
      -- 
    nicRxFromMacDaemon_cp_element_group_32: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_32"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(9) & nicRxFromMacDaemon_CP_425_elements(38) & nicRxFromMacDaemon_CP_425_elements(41);
      gj_nicRxFromMacDaemon_cp_element_group_32 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(32), clk => clk, reset => reset); --
    end block;
    -- CP-element group 33:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	11 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	36 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Sample/rr
      -- CP-element group 33: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Sample/$entry
      -- CP-element group 33: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_sample_start_
      -- 
    rr_510_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_510_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(33), ack => RPIPE_mac_to_nic_data_436_inst_req_0); -- 
    nicRxFromMacDaemon_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(11) & nicRxFromMacDaemon_CP_425_elements(36);
      gj_nicRxFromMacDaemon_cp_element_group_33 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	35 
    -- CP-element group 34: 	13 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_update_start_
      -- CP-element group 34: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Update/$entry
      -- CP-element group 34: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Update/cr
      -- 
    cr_515_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_515_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(34), ack => RPIPE_mac_to_nic_data_436_inst_req_1); -- 
    nicRxFromMacDaemon_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(35) & nicRxFromMacDaemon_CP_425_elements(13);
      gj_nicRxFromMacDaemon_cp_element_group_34 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	34 
    -- CP-element group 35: 	12 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Sample/ra
      -- CP-element group 35: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Sample/$exit
      -- CP-element group 35: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_sample_completed_
      -- 
    ra_511_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 35_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_to_nic_data_436_inst_ack_0, ack => nicRxFromMacDaemon_CP_425_elements(35)); -- 
    -- CP-element group 36:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	14 
    -- CP-element group 36: 	37 
    -- CP-element group 36: 	40 
    -- CP-element group 36: marked-successors 
    -- CP-element group 36: 	33 
    -- CP-element group 36:  members (4) 
      -- CP-element group 36: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_update_completed_
      -- CP-element group 36: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Update/$exit
      -- CP-element group 36: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/RPIPE_mac_to_nic_data_436_Update/ca
      -- CP-element group 36: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/phi_stmt_434_update_completed_
      -- 
    ca_516_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 36_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_to_nic_data_436_inst_ack_1, ack => nicRxFromMacDaemon_CP_425_elements(36)); -- 
    -- CP-element group 37:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	18 
    -- CP-element group 37: 	36 
    -- CP-element group 37: marked-predecessors 
    -- CP-element group 37: 	39 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	38 
    -- CP-element group 37:  members (3) 
      -- CP-element group 37: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_sample_start_
      -- CP-element group 37: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Sample/$entry
      -- CP-element group 37: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Sample/req
      -- 
    req_524_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_524_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(37), ack => WPIPE_nic_rx_to_header_490_inst_req_0); -- 
    nicRxFromMacDaemon_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(18) & nicRxFromMacDaemon_CP_425_elements(36) & nicRxFromMacDaemon_CP_425_elements(39);
      gj_nicRxFromMacDaemon_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	37 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	39 
    -- CP-element group 38: marked-successors 
    -- CP-element group 38: 	16 
    -- CP-element group 38: 	32 
    -- CP-element group 38:  members (6) 
      -- CP-element group 38: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_sample_completed_
      -- CP-element group 38: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_update_start_
      -- CP-element group 38: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Sample/$exit
      -- CP-element group 38: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Sample/ack
      -- CP-element group 38: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Update/$entry
      -- CP-element group 38: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Update/req
      -- 
    ack_525_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 38_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_nic_rx_to_header_490_inst_ack_0, ack => nicRxFromMacDaemon_CP_425_elements(38)); -- 
    req_529_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_529_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(38), ack => WPIPE_nic_rx_to_header_490_inst_req_1); -- 
    -- CP-element group 39:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	38 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	44 
    -- CP-element group 39: marked-successors 
    -- CP-element group 39: 	37 
    -- CP-element group 39:  members (3) 
      -- CP-element group 39: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_update_completed_
      -- CP-element group 39: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Update/$exit
      -- CP-element group 39: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_header_490_Update/ack
      -- 
    ack_530_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 39_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_nic_rx_to_header_490_inst_ack_1, ack => nicRxFromMacDaemon_CP_425_elements(39)); -- 
    -- CP-element group 40:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	36 
    -- CP-element group 40: marked-predecessors 
    -- CP-element group 40: 	42 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	41 
    -- CP-element group 40:  members (3) 
      -- CP-element group 40: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_sample_start_
      -- CP-element group 40: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Sample/$entry
      -- CP-element group 40: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Sample/req
      -- 
    req_538_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_538_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(40), ack => WPIPE_nic_rx_to_packet_493_inst_req_0); -- 
    nicRxFromMacDaemon_cp_element_group_40: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_40"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(36) & nicRxFromMacDaemon_CP_425_elements(42);
      gj_nicRxFromMacDaemon_cp_element_group_40 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(40), clk => clk, reset => reset); --
    end block;
    -- CP-element group 41:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: 	40 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	42 
    -- CP-element group 41: marked-successors 
    -- CP-element group 41: 	32 
    -- CP-element group 41:  members (6) 
      -- CP-element group 41: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_sample_completed_
      -- CP-element group 41: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_update_start_
      -- CP-element group 41: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Sample/$exit
      -- CP-element group 41: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Sample/ack
      -- CP-element group 41: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Update/$entry
      -- CP-element group 41: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Update/req
      -- 
    ack_539_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 41_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_nic_rx_to_packet_493_inst_ack_0, ack => nicRxFromMacDaemon_CP_425_elements(41)); -- 
    req_543_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_543_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nicRxFromMacDaemon_CP_425_elements(41), ack => WPIPE_nic_rx_to_packet_493_inst_req_1); -- 
    -- CP-element group 42:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	41 
    -- CP-element group 42: successors 
    -- CP-element group 42: 	44 
    -- CP-element group 42: marked-successors 
    -- CP-element group 42: 	40 
    -- CP-element group 42:  members (3) 
      -- CP-element group 42: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_update_completed_
      -- CP-element group 42: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Update/$exit
      -- CP-element group 42: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/WPIPE_nic_rx_to_packet_493_Update/ack
      -- 
    ack_544_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 42_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_nic_rx_to_packet_493_inst_ack_1, ack => nicRxFromMacDaemon_CP_425_elements(42)); -- 
    -- CP-element group 43:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: 	9 
    -- CP-element group 43: successors 
    -- CP-element group 43: 	10 
    -- CP-element group 43:  members (1) 
      -- CP-element group 43: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group nicRxFromMacDaemon_CP_425_elements(43) is a control-delay.
    cp_element_43_delay: control_delay_element  generic map(name => " 43_delay", delay_value => 1)  port map(req => nicRxFromMacDaemon_CP_425_elements(9), ack => nicRxFromMacDaemon_CP_425_elements(43), clk => clk, reset =>reset);
    -- CP-element group 44:  join  transition  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	39 
    -- CP-element group 44: 	42 
    -- CP-element group 44: 	12 
    -- CP-element group 44: successors 
    -- CP-element group 44: 	6 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 branch_block_stmt_425/do_while_stmt_426/do_while_stmt_426_loop_body/$exit
      -- 
    nicRxFromMacDaemon_cp_element_group_44: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 7);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 38) := "nicRxFromMacDaemon_cp_element_group_44"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= nicRxFromMacDaemon_CP_425_elements(39) & nicRxFromMacDaemon_CP_425_elements(42) & nicRxFromMacDaemon_CP_425_elements(12);
      gj_nicRxFromMacDaemon_cp_element_group_44 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(44), clk => clk, reset => reset); --
    end block;
    -- CP-element group 45:  transition  input  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: 	5 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (2) 
      -- CP-element group 45: 	 branch_block_stmt_425/do_while_stmt_426/loop_exit/$exit
      -- CP-element group 45: 	 branch_block_stmt_425/do_while_stmt_426/loop_exit/ack
      -- 
    ack_549_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 45_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_426_branch_ack_0, ack => nicRxFromMacDaemon_CP_425_elements(45)); -- 
    -- CP-element group 46:  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	5 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_425/do_while_stmt_426/loop_taken/$exit
      -- CP-element group 46: 	 branch_block_stmt_425/do_while_stmt_426/loop_taken/ack
      -- 
    ack_553_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_426_branch_ack_1, ack => nicRxFromMacDaemon_CP_425_elements(46)); -- 
    -- CP-element group 47:  transition  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: 	3 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	1 
    -- CP-element group 47:  members (1) 
      -- CP-element group 47: 	 branch_block_stmt_425/do_while_stmt_426/$exit
      -- 
    nicRxFromMacDaemon_CP_425_elements(47) <= nicRxFromMacDaemon_CP_425_elements(3);
    nicRxFromMacDaemon_do_while_stmt_426_terminator_554: loop_terminator -- 
      generic map (name => " nicRxFromMacDaemon_do_while_stmt_426_terminator_554", max_iterations_in_flight =>7) 
      port map(loop_body_exit => nicRxFromMacDaemon_CP_425_elements(6),loop_continue => nicRxFromMacDaemon_CP_425_elements(46),loop_terminate => nicRxFromMacDaemon_CP_425_elements(45),loop_back => nicRxFromMacDaemon_CP_425_elements(4),loop_exit => nicRxFromMacDaemon_CP_425_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_428_phi_seq_498_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= nicRxFromMacDaemon_CP_425_elements(21);
      nicRxFromMacDaemon_CP_425_elements(24)<= src_sample_reqs(0);
      src_sample_acks(0)  <= nicRxFromMacDaemon_CP_425_elements(24);
      nicRxFromMacDaemon_CP_425_elements(25)<= src_update_reqs(0);
      src_update_acks(0)  <= nicRxFromMacDaemon_CP_425_elements(26);
      nicRxFromMacDaemon_CP_425_elements(22) <= phi_mux_reqs(0);
      triggers(1)  <= nicRxFromMacDaemon_CP_425_elements(19);
      nicRxFromMacDaemon_CP_425_elements(28)<= src_sample_reqs(1);
      src_sample_acks(1)  <= nicRxFromMacDaemon_CP_425_elements(30);
      nicRxFromMacDaemon_CP_425_elements(29)<= src_update_reqs(1);
      src_update_acks(1)  <= nicRxFromMacDaemon_CP_425_elements(31);
      nicRxFromMacDaemon_CP_425_elements(20) <= phi_mux_reqs(1);
      phi_stmt_428_phi_seq_498 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_428_phi_seq_498") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => nicRxFromMacDaemon_CP_425_elements(11), 
          phi_sample_ack => nicRxFromMacDaemon_CP_425_elements(17), 
          phi_update_req => nicRxFromMacDaemon_CP_425_elements(13), 
          phi_update_ack => nicRxFromMacDaemon_CP_425_elements(18), 
          phi_mux_ack => nicRxFromMacDaemon_CP_425_elements(23), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_450_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= nicRxFromMacDaemon_CP_425_elements(7);
        preds(1)  <= nicRxFromMacDaemon_CP_425_elements(8);
        entry_tmerge_450 : transition_merge -- 
          generic map(name => " entry_tmerge_450")
          port map (preds => preds, symbol_out => nicRxFromMacDaemon_CP_425_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u3_u51_501_wire : std_logic_vector(50 downto 0);
    signal CONCAT_u4_u20_506_wire : std_logic_vector(19 downto 0);
    signal CONCAT_u51_u99_503_wire : std_logic_vector(98 downto 0);
    signal DESTMAC_449 : std_logic_vector(47 downto 0);
    signal HLEN_453 : std_logic_vector(3 downto 0);
    signal LSTATE_441 : std_logic_vector(2 downto 0);
    signal PLEN_457 : std_logic_vector(15 downto 0);
    signal RPIPE_mac_to_nic_data_436_wire : std_logic_vector(36 downto 0);
    signal RX_434 : std_logic_vector(36 downto 0);
    signal SRCMAC_445 : std_logic_vector(47 downto 0);
    signal TOTAL_STATE_428 : std_logic_vector(118 downto 0);
    signal konst_517_wire_constant : std_logic_vector(0 downto 0);
    signal nDESTMAC_483 : std_logic_vector(47 downto 0);
    signal nHLEN_473 : std_logic_vector(3 downto 0);
    signal nLSTATE_473 : std_logic_vector(2 downto 0);
    signal nPLEN_473 : std_logic_vector(15 downto 0);
    signal nSRCMAC_478 : std_logic_vector(47 downto 0);
    signal nTOTAL_STATE_508 : std_logic_vector(118 downto 0);
    signal nTOTAL_STATE_508_433_buffered : std_logic_vector(118 downto 0);
    signal type_cast_432_wire_constant : std_logic_vector(118 downto 0);
    signal write_to_header_488 : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    konst_517_wire_constant <= "1";
    type_cast_432_wire_constant <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    phi_stmt_428: Block -- phi operator 
      signal idata: std_logic_vector(237 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_432_wire_constant & nTOTAL_STATE_508_433_buffered;
      req <= phi_stmt_428_req_0 & phi_stmt_428_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_428",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 119) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_428_ack_0,
          idata => idata,
          odata => TOTAL_STATE_428,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_428
    -- flow-through slice operator slice_440_inst
    LSTATE_441 <= TOTAL_STATE_428(118 downto 116);
    -- flow-through slice operator slice_444_inst
    SRCMAC_445 <= TOTAL_STATE_428(115 downto 68);
    -- flow-through slice operator slice_448_inst
    DESTMAC_449 <= TOTAL_STATE_428(67 downto 20);
    -- flow-through slice operator slice_452_inst
    HLEN_453 <= TOTAL_STATE_428(19 downto 16);
    -- flow-through slice operator slice_456_inst
    PLEN_457 <= TOTAL_STATE_428(15 downto 0);
    nTOTAL_STATE_508_433_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= nTOTAL_STATE_508_433_buf_req_0;
      nTOTAL_STATE_508_433_buf_ack_0<= wack(0);
      rreq(0) <= nTOTAL_STATE_508_433_buf_req_1;
      nTOTAL_STATE_508_433_buf_ack_1<= rack(0);
      nTOTAL_STATE_508_433_buf : InterlockBuffer generic map ( -- 
        name => "nTOTAL_STATE_508_433_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 119,
        out_data_width => 119,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => nTOTAL_STATE_508,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => nTOTAL_STATE_508_433_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock ssrc_phi_stmt_434
    process(RPIPE_mac_to_nic_data_436_wire) -- 
      variable tmp_var : std_logic_vector(36 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 36 downto 0) := RPIPE_mac_to_nic_data_436_wire(36 downto 0);
      RX_434 <= tmp_var; -- 
    end process;
    do_while_stmt_426_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_517_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_426_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_426_branch_req_0,
          ack0 => do_while_stmt_426_branch_ack_0,
          ack1 => do_while_stmt_426_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator CONCAT_u3_u51_501_inst
    process(nLSTATE_473, nSRCMAC_478) -- 
      variable tmp_var : std_logic_vector(50 downto 0); -- 
    begin -- 
      ApConcat_proc(nLSTATE_473, nSRCMAC_478, tmp_var);
      CONCAT_u3_u51_501_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u4_u20_506_inst
    process(nHLEN_473, nPLEN_473) -- 
      variable tmp_var : std_logic_vector(19 downto 0); -- 
    begin -- 
      ApConcat_proc(nHLEN_473, nPLEN_473, tmp_var);
      CONCAT_u4_u20_506_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u51_u99_503_inst
    process(CONCAT_u3_u51_501_wire, nDESTMAC_483) -- 
      variable tmp_var : std_logic_vector(98 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u3_u51_501_wire, nDESTMAC_483, tmp_var);
      CONCAT_u51_u99_503_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u99_u119_507_inst
    process(CONCAT_u51_u99_503_wire, CONCAT_u4_u20_506_wire) -- 
      variable tmp_var : std_logic_vector(118 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u51_u99_503_wire, CONCAT_u4_u20_506_wire, tmp_var);
      nTOTAL_STATE_508 <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_mac_to_nic_data_436_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(36 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_mac_to_nic_data_436_inst_req_0;
      RPIPE_mac_to_nic_data_436_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_mac_to_nic_data_436_inst_req_1;
      RPIPE_mac_to_nic_data_436_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_mac_to_nic_data_436_wire <= data_out(36 downto 0);
      mac_to_nic_data_read_0_gI: SplitGuardInterface generic map(name => "mac_to_nic_data_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      mac_to_nic_data_read_0: InputPortRevised -- 
        generic map ( name => "mac_to_nic_data_read_0", data_width => 37,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => mac_to_nic_data_pipe_read_req(0),
          oack => mac_to_nic_data_pipe_read_ack(0),
          odata => mac_to_nic_data_pipe_read_data(36 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_nic_rx_to_header_490_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(36 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_nic_rx_to_header_490_inst_req_0;
      WPIPE_nic_rx_to_header_490_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_nic_rx_to_header_490_inst_req_1;
      WPIPE_nic_rx_to_header_490_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= write_to_header_488(0);
      data_in <= RX_434;
      nic_rx_to_header_write_0_gI: SplitGuardInterface generic map(name => "nic_rx_to_header_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      nic_rx_to_header_write_0: OutputPortRevised -- 
        generic map ( name => "nic_rx_to_header", data_width => 37, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => nic_rx_to_header_pipe_write_req(0),
          oack => nic_rx_to_header_pipe_write_ack(0),
          odata => nic_rx_to_header_pipe_write_data(36 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_nic_rx_to_packet_493_inst 
    OutportGroup_1: Block -- 
      signal data_in: std_logic_vector(36 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_nic_rx_to_packet_493_inst_req_0;
      WPIPE_nic_rx_to_packet_493_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_nic_rx_to_packet_493_inst_req_1;
      WPIPE_nic_rx_to_packet_493_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= RX_434;
      nic_rx_to_packet_write_1_gI: SplitGuardInterface generic map(name => "nic_rx_to_packet_write_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      nic_rx_to_packet_write_1: OutputPortRevised -- 
        generic map ( name => "nic_rx_to_packet", data_width => 37, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => nic_rx_to_packet_pipe_write_req(0),
          oack => nic_rx_to_packet_pipe_write_ack(0),
          odata => nic_rx_to_packet_pipe_write_data(36 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    volatile_operator_nextLSTATE_1052: nextLSTATE_Volatile port map(RX => RX_434, LSTATE => LSTATE_441, HLEN => HLEN_453, PLEN => PLEN_457, nLSTATE => nLSTATE_473, nHLEN => nHLEN_473, nPLEN => nPLEN_473); 
    volatile_operator_nextSRCMAC_1053: nextSRCMAC_Volatile port map(LSTATE => LSTATE_441, SRCMAC => SRCMAC_445, RX => RX_434, nSRCMAC => nSRCMAC_478); 
    volatile_operator_nextDESTMAC_1054: nextDESTMAC_Volatile port map(LSTATE => LSTATE_441, DESTMAC => DESTMAC_449, RX => RX_434, nDESTMAC => nDESTMAC_483); 
    volatile_operator_isWriteToHeader_1055: isWriteToHeader_Volatile port map(LSTATE => LSTATE_441, HLEN => HLEN_453, PLEN => PLEN_457, write_to_header => write_to_header_488); 
    -- 
  end Block; -- data_path
  -- 
end nicRxFromMacDaemon_arch;
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
entity read_from_tb is -- 
  generic (tag_length : integer); 
  port ( -- 
    tb_in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    tb_in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    tb_in_pipe_pipe_read_data : in   std_logic_vector(63 downto 0);
    mac_data_pipe_write_req : out  std_logic_vector(0 downto 0);
    mac_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
    mac_data_pipe_write_data : out  std_logic_vector(36 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity read_from_tb;
architecture read_from_tb_arch of read_from_tb is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal read_from_tb_CP_555_start: Boolean;
  signal read_from_tb_CP_555_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_522_branch_req_0 : boolean;
  signal RPIPE_tb_in_pipe_526_inst_req_0 : boolean;
  signal RPIPE_tb_in_pipe_526_inst_ack_0 : boolean;
  signal RPIPE_tb_in_pipe_526_inst_req_1 : boolean;
  signal RPIPE_tb_in_pipe_526_inst_ack_1 : boolean;
  signal slice_530_inst_req_0 : boolean;
  signal slice_530_inst_ack_0 : boolean;
  signal slice_530_inst_req_1 : boolean;
  signal slice_530_inst_ack_1 : boolean;
  signal WPIPE_mac_data_532_inst_req_0 : boolean;
  signal WPIPE_mac_data_532_inst_ack_0 : boolean;
  signal WPIPE_mac_data_532_inst_req_1 : boolean;
  signal WPIPE_mac_data_532_inst_ack_1 : boolean;
  signal do_while_stmt_522_branch_ack_0 : boolean;
  signal do_while_stmt_522_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "read_from_tb_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  read_from_tb_CP_555_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "read_from_tb_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= read_from_tb_CP_555_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= read_from_tb_CP_555_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= read_from_tb_CP_555_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  read_from_tb_CP_555: Block -- control-path 
    signal read_from_tb_CP_555_elements: BooleanArray(28 downto 0);
    -- 
  begin -- 
    read_from_tb_CP_555_elements(0) <= read_from_tb_CP_555_start;
    read_from_tb_CP_555_symbol <= read_from_tb_CP_555_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_521/$entry
      -- CP-element group 0: 	 branch_block_stmt_521/branch_block_stmt_521__entry__
      -- CP-element group 0: 	 branch_block_stmt_521/do_while_stmt_522__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	28 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_521/$exit
      -- CP-element group 1: 	 branch_block_stmt_521/branch_block_stmt_521__exit__
      -- CP-element group 1: 	 branch_block_stmt_521/do_while_stmt_522__exit__
      -- 
    read_from_tb_CP_555_elements(1) <= read_from_tb_CP_555_elements(28);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_521/do_while_stmt_522/$entry
      -- CP-element group 2: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522__entry__
      -- 
    read_from_tb_CP_555_elements(2) <= read_from_tb_CP_555_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	28 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522__exit__
      -- 
    -- Element group read_from_tb_CP_555_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_521/do_while_stmt_522/loop_back
      -- 
    -- Element group read_from_tb_CP_555_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	26 
    -- CP-element group 5: 	27 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_521/do_while_stmt_522/condition_done
      -- CP-element group 5: 	 branch_block_stmt_521/do_while_stmt_522/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_521/do_while_stmt_522/loop_taken/$entry
      -- 
    read_from_tb_CP_555_elements(5) <= read_from_tb_CP_555_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	25 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_521/do_while_stmt_522/loop_body_done
      -- 
    read_from_tb_CP_555_elements(6) <= read_from_tb_CP_555_elements(25);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/back_edge_to_loop_body
      -- 
    read_from_tb_CP_555_elements(7) <= read_from_tb_CP_555_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/first_time_through_loop_body
      -- 
    read_from_tb_CP_555_elements(8) <= read_from_tb_CP_555_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	11 
    -- CP-element group 9: 	12 
    -- CP-element group 9: 	24 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/loop_body_start
      -- CP-element group 9: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/phi_stmt_524_sample_start_
      -- 
    -- Element group read_from_tb_CP_555_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	16 
    -- CP-element group 10: 	24 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/condition_evaluated
      -- 
    condition_evaluated_579_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_579_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(10), ack => do_while_stmt_522_branch_req_0); -- 
    read_from_tb_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(16) & read_from_tb_CP_555_elements(24);
      gj_read_from_tb_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	9 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/aggregated_phi_sample_req
      -- 
    read_from_tb_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(9) & read_from_tb_CP_555_elements(16);
      gj_read_from_tb_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	19 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	14 
    -- CP-element group 12:  members (2) 
      -- CP-element group 12: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/aggregated_phi_update_req
      -- CP-element group 12: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/phi_stmt_524_update_start_
      -- 
    read_from_tb_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(9) & read_from_tb_CP_555_elements(19);
      gj_read_from_tb_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	15 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_sample_start_
      -- CP-element group 13: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Sample/$entry
      -- CP-element group 13: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Sample/rr
      -- 
    rr_596_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_596_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(13), ack => RPIPE_tb_in_pipe_526_inst_req_0); -- 
    read_from_tb_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(11) & read_from_tb_CP_555_elements(16);
      gj_read_from_tb_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	15 
    -- CP-element group 14: 	12 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	16 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_update_start_
      -- CP-element group 14: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Update/$entry
      -- CP-element group 14: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Update/cr
      -- 
    cr_601_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_601_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(14), ack => RPIPE_tb_in_pipe_526_inst_req_1); -- 
    read_from_tb_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(15) & read_from_tb_CP_555_elements(12);
      gj_read_from_tb_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	13 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: 	25 
    -- CP-element group 15:  members (5) 
      -- CP-element group 15: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/aggregated_phi_sample_ack
      -- CP-element group 15: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/phi_stmt_524_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Sample/ra
      -- 
    ra_597_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_tb_in_pipe_526_inst_ack_0, ack => read_from_tb_CP_555_elements(15)); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	10 
    -- CP-element group 16: 	17 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	11 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (5) 
      -- CP-element group 16: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/aggregated_phi_update_ack
      -- CP-element group 16: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/phi_stmt_524_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/RPIPE_tb_in_pipe_526_Update/ca
      -- 
    ca_602_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_tb_in_pipe_526_inst_ack_1, ack => read_from_tb_CP_555_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	16 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	19 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_sample_start_
      -- CP-element group 17: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Sample/$entry
      -- CP-element group 17: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Sample/rr
      -- 
    rr_610_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_610_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(17), ack => slice_530_inst_req_0); -- 
    read_from_tb_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(16) & read_from_tb_CP_555_elements(19);
      gj_read_from_tb_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	22 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_update_start_
      -- CP-element group 18: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Update/cr
      -- 
    cr_615_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_615_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(18), ack => slice_530_inst_req_1); -- 
    read_from_tb_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= read_from_tb_CP_555_elements(22);
      gj_read_from_tb_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: 	12 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Sample/ra
      -- 
    ra_611_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_530_inst_ack_0, ack => read_from_tb_CP_555_elements(19)); -- 
    -- CP-element group 20:  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	21 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/slice_530_Update/ca
      -- 
    ca_616_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_530_inst_ack_1, ack => read_from_tb_CP_555_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	20 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	23 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	22 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Sample/req
      -- 
    req_624_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_624_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(21), ack => WPIPE_mac_data_532_inst_req_0); -- 
    read_from_tb_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(20) & read_from_tb_CP_555_elements(23);
      gj_read_from_tb_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	18 
    -- CP-element group 22:  members (6) 
      -- CP-element group 22: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_sample_completed_
      -- CP-element group 22: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_update_start_
      -- CP-element group 22: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Sample/$exit
      -- CP-element group 22: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Sample/ack
      -- CP-element group 22: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Update/req
      -- 
    ack_625_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mac_data_532_inst_ack_0, ack => read_from_tb_CP_555_elements(22)); -- 
    req_629_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_629_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => read_from_tb_CP_555_elements(22), ack => WPIPE_mac_data_532_inst_req_1); -- 
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	22 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	21 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Update/$exit
      -- CP-element group 23: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/WPIPE_mac_data_532_Update/ack
      -- 
    ack_630_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mac_data_532_inst_ack_1, ack => read_from_tb_CP_555_elements(23)); -- 
    -- CP-element group 24:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	10 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group read_from_tb_CP_555_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => read_from_tb_CP_555_elements(9), ack => read_from_tb_CP_555_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	15 
    -- CP-element group 25: 	23 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	6 
    -- CP-element group 25:  members (1) 
      -- CP-element group 25: 	 branch_block_stmt_521/do_while_stmt_522/do_while_stmt_522_loop_body/$exit
      -- 
    read_from_tb_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "read_from_tb_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= read_from_tb_CP_555_elements(15) & read_from_tb_CP_555_elements(23);
      gj_read_from_tb_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => read_from_tb_CP_555_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	5 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_521/do_while_stmt_522/loop_exit/$exit
      -- CP-element group 26: 	 branch_block_stmt_521/do_while_stmt_522/loop_exit/ack
      -- 
    ack_635_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_522_branch_ack_0, ack => read_from_tb_CP_555_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	5 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_521/do_while_stmt_522/loop_taken/$exit
      -- CP-element group 27: 	 branch_block_stmt_521/do_while_stmt_522/loop_taken/ack
      -- 
    ack_639_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_522_branch_ack_1, ack => read_from_tb_CP_555_elements(27)); -- 
    -- CP-element group 28:  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	3 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	1 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_521/do_while_stmt_522/$exit
      -- 
    read_from_tb_CP_555_elements(28) <= read_from_tb_CP_555_elements(3);
    read_from_tb_do_while_stmt_522_terminator_640: loop_terminator -- 
      generic map (name => " read_from_tb_do_while_stmt_522_terminator_640", max_iterations_in_flight =>7) 
      port map(loop_body_exit => read_from_tb_CP_555_elements(6),loop_continue => read_from_tb_CP_555_elements(27),loop_terminate => read_from_tb_CP_555_elements(26),loop_back => read_from_tb_CP_555_elements(4),loop_exit => read_from_tb_CP_555_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_580_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= read_from_tb_CP_555_elements(7);
        preds(1)  <= read_from_tb_CP_555_elements(8);
        entry_tmerge_580 : transition_merge -- 
          generic map(name => " entry_tmerge_580")
          port map (preds => preds, symbol_out => read_from_tb_CP_555_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal RPIPE_tb_in_pipe_526_wire : std_logic_vector(63 downto 0);
    signal idata_524 : std_logic_vector(63 downto 0);
    signal konst_536_wire_constant : std_logic_vector(0 downto 0);
    signal send_data_531 : std_logic_vector(36 downto 0);
    -- 
  begin -- 
    konst_536_wire_constant <= "1";
    slice_530_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_530_inst_req_0;
      slice_530_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_530_inst_req_1;
      slice_530_inst_ack_1<= update_ack(0);
      slice_530_inst: SliceSplitProtocol generic map(name => "slice_530_inst", in_data_width => 64, high_index => 36, low_index => 0, buffering => 1, flow_through => false,  full_rate => true) -- 
        port map( din => idata_524, dout => send_data_531, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    -- interlock ssrc_phi_stmt_524
    process(RPIPE_tb_in_pipe_526_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 63 downto 0) := RPIPE_tb_in_pipe_526_wire(63 downto 0);
      idata_524 <= tmp_var; -- 
    end process;
    do_while_stmt_522_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_536_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_522_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_522_branch_req_0,
          ack0 => do_while_stmt_522_branch_ack_0,
          ack1 => do_while_stmt_522_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared inport operator group (0) : RPIPE_tb_in_pipe_526_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(63 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_tb_in_pipe_526_inst_req_0;
      RPIPE_tb_in_pipe_526_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_tb_in_pipe_526_inst_req_1;
      RPIPE_tb_in_pipe_526_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_tb_in_pipe_526_wire <= data_out(63 downto 0);
      tb_in_pipe_read_0_gI: SplitGuardInterface generic map(name => "tb_in_pipe_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      tb_in_pipe_read_0: InputPortRevised -- 
        generic map ( name => "tb_in_pipe_read_0", data_width => 64,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => tb_in_pipe_pipe_read_req(0),
          oack => tb_in_pipe_pipe_read_ack(0),
          odata => tb_in_pipe_pipe_read_data(63 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_mac_data_532_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(36 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_mac_data_532_inst_req_0;
      WPIPE_mac_data_532_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_mac_data_532_inst_req_1;
      WPIPE_mac_data_532_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= send_data_531;
      mac_data_write_0_gI: SplitGuardInterface generic map(name => "mac_data_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      mac_data_write_0: OutputPortRevised -- 
        generic map ( name => "mac_data", data_width => 37, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => mac_data_pipe_write_req(0),
          oack => mac_data_pipe_write_ack(0),
          odata => mac_data_pipe_write_data(36 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end read_from_tb_arch;
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
entity rx_fifo_reader is -- 
  generic (tag_length : integer); 
  port ( -- 
    load_buffer1_call_reqs : out  std_logic_vector(0 downto 0);
    load_buffer1_call_acks : in   std_logic_vector(0 downto 0);
    load_buffer1_call_tag  :  out  std_logic_vector(0 downto 0);
    load_buffer1_return_reqs : out  std_logic_vector(0 downto 0);
    load_buffer1_return_acks : in   std_logic_vector(0 downto 0);
    load_buffer1_return_data : in   std_logic_vector(10 downto 0);
    load_buffer1_return_tag :  in   std_logic_vector(0 downto 0);
    load_buffer2_call_reqs : out  std_logic_vector(0 downto 0);
    load_buffer2_call_acks : in   std_logic_vector(0 downto 0);
    load_buffer2_call_tag  :  out  std_logic_vector(0 downto 0);
    load_buffer2_return_reqs : out  std_logic_vector(0 downto 0);
    load_buffer2_return_acks : in   std_logic_vector(0 downto 0);
    load_buffer2_return_data : in   std_logic_vector(10 downto 0);
    load_buffer2_return_tag :  in   std_logic_vector(0 downto 0);
    send_to_nic2_call_reqs : out  std_logic_vector(0 downto 0);
    send_to_nic2_call_acks : in   std_logic_vector(0 downto 0);
    send_to_nic2_call_data : out  std_logic_vector(9 downto 0);
    send_to_nic2_call_tag  :  out  std_logic_vector(0 downto 0);
    send_to_nic2_return_reqs : out  std_logic_vector(0 downto 0);
    send_to_nic2_return_acks : in   std_logic_vector(0 downto 0);
    send_to_nic2_return_tag :  in   std_logic_vector(0 downto 0);
    send_to_nic1_call_reqs : out  std_logic_vector(0 downto 0);
    send_to_nic1_call_acks : in   std_logic_vector(0 downto 0);
    send_to_nic1_call_data : out  std_logic_vector(9 downto 0);
    send_to_nic1_call_tag  :  out  std_logic_vector(0 downto 0);
    send_to_nic1_return_reqs : out  std_logic_vector(0 downto 0);
    send_to_nic1_return_acks : in   std_logic_vector(0 downto 0);
    send_to_nic1_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity rx_fifo_reader;
architecture rx_fifo_reader_arch of rx_fifo_reader is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal rx_fifo_reader_CP_963_start: Boolean;
  signal rx_fifo_reader_CP_963_symbol: Boolean;
  -- volatile/operator module components. 
  component load_buffer1 is -- 
    generic (tag_length : integer); 
    port ( -- 
      next_buf_ptr_out : out  std_logic_vector(9 downto 0);
      pckt_status : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sr_addr : out  std_logic_vector(9 downto 0);
      memory_space_0_sr_data : out  std_logic_vector(36 downto 0);
      memory_space_0_sr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sc_tag :  in  std_logic_vector(0 downto 0);
      mac_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      mac_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mac_data_pipe_read_data : in   std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component load_buffer2 is -- 
    generic (tag_length : integer); 
    port ( -- 
      next_buf_ptr_out : out  std_logic_vector(9 downto 0);
      pckt_status : out  std_logic_vector(0 downto 0);
      memory_space_1_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_1_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_sr_addr : out  std_logic_vector(9 downto 0);
      memory_space_1_sr_data : out  std_logic_vector(36 downto 0);
      memory_space_1_sr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_1_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_1_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_sc_tag :  in  std_logic_vector(0 downto 0);
      mac_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      mac_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mac_data_pipe_read_data : in   std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component send_to_nic2 is -- 
    generic (tag_length : integer); 
    port ( -- 
      buf_ptr : in  std_logic_vector(9 downto 0);
      memory_space_1_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_1_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_lr_addr : out  std_logic_vector(9 downto 0);
      memory_space_1_lr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_1_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_1_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_lc_data : in   std_logic_vector(36 downto 0);
      memory_space_1_lc_tag :  in  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_data : out  std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component send_to_nic1 is -- 
    generic (tag_length : integer); 
    port ( -- 
      buf_ptr : in  std_logic_vector(9 downto 0);
      memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lr_addr : out  std_logic_vector(9 downto 0);
      memory_space_0_lr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lc_data : in   std_logic_vector(36 downto 0);
      memory_space_0_lc_tag :  in  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_data : out  std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- links between control-path and data-path
  signal call_stmt_596_call_req_0 : boolean;
  signal call_stmt_596_call_ack_0 : boolean;
  signal call_stmt_596_call_req_1 : boolean;
  signal call_stmt_596_call_ack_1 : boolean;
  signal call_stmt_599_call_req_0 : boolean;
  signal call_stmt_599_call_ack_0 : boolean;
  signal call_stmt_599_call_req_1 : boolean;
  signal call_stmt_599_call_ack_1 : boolean;
  signal call_stmt_602_call_req_0 : boolean;
  signal call_stmt_602_call_ack_0 : boolean;
  signal call_stmt_602_call_req_1 : boolean;
  signal call_stmt_602_call_ack_1 : boolean;
  signal call_stmt_605_call_req_0 : boolean;
  signal call_stmt_605_call_ack_0 : boolean;
  signal call_stmt_605_call_req_1 : boolean;
  signal call_stmt_605_call_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "rx_fifo_reader_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  rx_fifo_reader_CP_963_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "rx_fifo_reader_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= rx_fifo_reader_CP_963_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= rx_fifo_reader_CP_963_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= rx_fifo_reader_CP_963_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  rx_fifo_reader_CP_963: Block -- control-path 
    signal rx_fifo_reader_CP_963_elements: BooleanArray(13 downto 0);
    -- 
  begin -- 
    rx_fifo_reader_CP_963_elements(0) <= rx_fifo_reader_CP_963_start;
    rx_fifo_reader_CP_963_symbol <= rx_fifo_reader_CP_963_elements(1);
    -- CP-element group 0:  branch  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	13 
    -- CP-element group 0:  members (7) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_592/$entry
      -- CP-element group 0: 	 branch_block_stmt_592/branch_block_stmt_592__entry__
      -- CP-element group 0: 	 branch_block_stmt_592/merge_stmt_593__entry__
      -- CP-element group 0: 	 branch_block_stmt_592/merge_stmt_593_dead_link/$entry
      -- CP-element group 0: 	 branch_block_stmt_592/merge_stmt_593__entry___PhiReq/$entry
      -- CP-element group 0: 	 branch_block_stmt_592/merge_stmt_593__entry___PhiReq/$exit
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_592/$exit
      -- CP-element group 1: 	 branch_block_stmt_592/branch_block_stmt_592__exit__
      -- 
    rx_fifo_reader_CP_963_elements(1) <= false; 
    -- CP-element group 2:  transition  input  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	13 
    -- CP-element group 2: successors 
    -- CP-element group 2:  members (3) 
      -- CP-element group 2: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_sample_completed_
      -- CP-element group 2: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Sample/$exit
      -- CP-element group 2: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Sample/cra
      -- 
    cra_987_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_596_call_ack_0, ack => rx_fifo_reader_CP_963_elements(2)); -- 
    -- CP-element group 3:  fork  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	13 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	6 
    -- CP-element group 3: 	12 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_update_completed_
      -- CP-element group 3: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Update/$exit
      -- CP-element group 3: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Update/cca
      -- CP-element group 3: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_sample_start_
      -- CP-element group 3: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Sample/$entry
      -- CP-element group 3: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Sample/crr
      -- 
    cca_992_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_596_call_ack_1, ack => rx_fifo_reader_CP_963_elements(3)); -- 
    crr_1014_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_1014_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(3), ack => call_stmt_602_call_req_0); -- 
    -- CP-element group 4:  transition  input  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	12 
    -- CP-element group 4: successors 
    -- CP-element group 4:  members (3) 
      -- CP-element group 4: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_sample_completed_
      -- CP-element group 4: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Sample/$exit
      -- CP-element group 4: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Sample/cra
      -- 
    cra_1001_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_599_call_ack_0, ack => rx_fifo_reader_CP_963_elements(4)); -- 
    -- CP-element group 5:  transition  input  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	13 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	8 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_update_completed_
      -- CP-element group 5: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Update/$exit
      -- CP-element group 5: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Update/cca
      -- 
    cca_1006_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_599_call_ack_1, ack => rx_fifo_reader_CP_963_elements(5)); -- 
    -- CP-element group 6:  transition  input  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	3 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (3) 
      -- CP-element group 6: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_sample_completed_
      -- CP-element group 6: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Sample/$exit
      -- CP-element group 6: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Sample/cra
      -- 
    cra_1015_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_602_call_ack_0, ack => rx_fifo_reader_CP_963_elements(6)); -- 
    -- CP-element group 7:  transition  input  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	13 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	11 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_update_completed_
      -- CP-element group 7: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Update/$exit
      -- CP-element group 7: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Update/cca
      -- 
    cca_1020_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 7_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_602_call_ack_1, ack => rx_fifo_reader_CP_963_elements(7)); -- 
    -- CP-element group 8:  join  transition  output  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	5 
    -- CP-element group 8: 	11 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	9 
    -- CP-element group 8:  members (3) 
      -- CP-element group 8: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_sample_start_
      -- CP-element group 8: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Sample/$entry
      -- CP-element group 8: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Sample/crr
      -- 
    crr_1028_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_1028_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(8), ack => call_stmt_605_call_req_0); -- 
    rx_fifo_reader_cp_element_group_8: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 33) := "rx_fifo_reader_cp_element_group_8"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_fifo_reader_CP_963_elements(5) & rx_fifo_reader_CP_963_elements(11);
      gj_rx_fifo_reader_cp_element_group_8 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_fifo_reader_CP_963_elements(8), clk => clk, reset => reset); --
    end block;
    -- CP-element group 9:  transition  input  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	8 
    -- CP-element group 9: successors 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_sample_completed_
      -- CP-element group 9: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Sample/$exit
      -- CP-element group 9: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Sample/cra
      -- 
    cra_1029_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_605_call_ack_0, ack => rx_fifo_reader_CP_963_elements(9)); -- 
    -- CP-element group 10:  transition  place  input  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	13 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	13 
    -- CP-element group 10:  members (8) 
      -- CP-element group 10: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605__exit__
      -- CP-element group 10: 	 branch_block_stmt_592/loopback
      -- CP-element group 10: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/$exit
      -- CP-element group 10: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_update_completed_
      -- CP-element group 10: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Update/$exit
      -- CP-element group 10: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Update/cca
      -- CP-element group 10: 	 branch_block_stmt_592/loopback_PhiReq/$entry
      -- CP-element group 10: 	 branch_block_stmt_592/loopback_PhiReq/$exit
      -- 
    cca_1034_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_605_call_ack_1, ack => rx_fifo_reader_CP_963_elements(10)); -- 
    -- CP-element group 11:  transition  delay-element  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	7 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	8 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_call_stmt_605_delay
      -- 
    -- Element group rx_fifo_reader_CP_963_elements(11) is a control-delay.
    cp_element_11_delay: control_delay_element  generic map(name => " 11_delay", delay_value => 1)  port map(req => rx_fifo_reader_CP_963_elements(7), ack => rx_fifo_reader_CP_963_elements(11), clk => clk, reset =>reset);
    -- CP-element group 12:  transition  output  delay-element  bypass 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	3 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	4 
    -- CP-element group 12:  members (4) 
      -- CP-element group 12: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_sample_start_
      -- CP-element group 12: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Sample/$entry
      -- CP-element group 12: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Sample/crr
      -- CP-element group 12: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_call_stmt_599_delay
      -- 
    crr_1000_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_1000_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(12), ack => call_stmt_599_call_req_0); -- 
    -- Element group rx_fifo_reader_CP_963_elements(12) is a control-delay.
    cp_element_12_delay: control_delay_element  generic map(name => " 12_delay", delay_value => 1)  port map(req => rx_fifo_reader_CP_963_elements(3), ack => rx_fifo_reader_CP_963_elements(12), clk => clk, reset =>reset);
    -- CP-element group 13:  merge  fork  transition  place  output  bypass 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	10 
    -- CP-element group 13: 	0 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	5 
    -- CP-element group 13: 	7 
    -- CP-element group 13: 	10 
    -- CP-element group 13: 	2 
    -- CP-element group 13: 	3 
    -- CP-element group 13:  members (22) 
      -- CP-element group 13: 	 branch_block_stmt_592/merge_stmt_593__exit__
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605__entry__
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_sample_start_
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_update_start_
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Sample/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Sample/crr
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Update/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_596_Update/ccr
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_update_start_
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Update/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_599_Update/ccr
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_update_start_
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Update/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_602_Update/ccr
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_update_start_
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Update/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/call_stmt_596_to_call_stmt_605/call_stmt_605_Update/ccr
      -- CP-element group 13: 	 branch_block_stmt_592/merge_stmt_593_PhiReqMerge
      -- CP-element group 13: 	 branch_block_stmt_592/merge_stmt_593_PhiAck/$entry
      -- CP-element group 13: 	 branch_block_stmt_592/merge_stmt_593_PhiAck/$exit
      -- CP-element group 13: 	 branch_block_stmt_592/merge_stmt_593_PhiAck/dummy
      -- 
    crr_986_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_986_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(13), ack => call_stmt_596_call_req_0); -- 
    ccr_991_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_991_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(13), ack => call_stmt_596_call_req_1); -- 
    ccr_1005_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_1005_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(13), ack => call_stmt_599_call_req_1); -- 
    ccr_1019_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_1019_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(13), ack => call_stmt_602_call_req_1); -- 
    ccr_1033_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_1033_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_fifo_reader_CP_963_elements(13), ack => call_stmt_605_call_req_1); -- 
    rx_fifo_reader_CP_963_elements(13) <= OrReduce(rx_fifo_reader_CP_963_elements(10) & rx_fifo_reader_CP_963_elements(0));
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal last_written_pointer_1_596 : std_logic_vector(9 downto 0);
    signal last_written_pointer_2_602 : std_logic_vector(9 downto 0);
    signal packet_status_1_596 : std_logic_vector(0 downto 0);
    signal packet_status_2_602 : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    -- shared call operator group (0) : call_stmt_596_call 
    load_buffer1_call_group_0: Block -- 
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_596_call_req_0;
      call_stmt_596_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_596_call_req_1;
      call_stmt_596_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      load_buffer1_call_group_0_gI: SplitGuardInterface generic map(name => "load_buffer1_call_group_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      last_written_pointer_1_596 <= data_out(10 downto 1);
      packet_status_1_596 <= data_out(0 downto 0);
      CallReq: InputMuxBaseNoData -- 
        generic map (name => "InputMuxBaseNoData",
        twidth => 1,
        nreqs => 1,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          reqR => load_buffer1_call_reqs(0),
          ackR => load_buffer1_call_acks(0),
          tagR => load_buffer1_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 11,
          owidth => 11,
          detailed_buffering_per_output => outBUFs, 
          full_rate => false, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => load_buffer1_return_acks(0), -- cross-over
          ackL => load_buffer1_return_reqs(0), -- cross-over
          dataL => load_buffer1_return_data(10 downto 0),
          tagL => load_buffer1_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- shared call operator group (1) : call_stmt_599_call 
    send_to_nic1_call_group_1: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs: IntegerArray(0 downto 0) := (others => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_599_call_req_0;
      call_stmt_599_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_599_call_req_1;
      call_stmt_599_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= packet_status_1_596(0);
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      send_to_nic1_call_group_1_gI: SplitGuardInterface generic map(name => "send_to_nic1_call_group_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= last_written_pointer_1_596;
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 10,
        owidth => 10,
        buffering => inBUFs,
        full_rate =>  false,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => send_to_nic1_call_reqs(0),
          ackR => send_to_nic1_call_acks(0),
          dataR => send_to_nic1_call_data(9 downto 0),
          tagR => send_to_nic1_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseNoData -- 
        generic map ( -- 
          detailed_buffering_per_output => outBUFs, 
          twidth => 1,
          name => "OutputDemuxBaseNoData",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          reqL => send_to_nic1_return_acks(0), -- cross-over
          ackL => send_to_nic1_return_reqs(0), -- cross-over
          tagL => send_to_nic1_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 1
    -- shared call operator group (2) : call_stmt_602_call 
    load_buffer2_call_group_2: Block -- 
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_602_call_req_0;
      call_stmt_602_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_602_call_req_1;
      call_stmt_602_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      load_buffer2_call_group_2_gI: SplitGuardInterface generic map(name => "load_buffer2_call_group_2_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      last_written_pointer_2_602 <= data_out(10 downto 1);
      packet_status_2_602 <= data_out(0 downto 0);
      CallReq: InputMuxBaseNoData -- 
        generic map (name => "InputMuxBaseNoData",
        twidth => 1,
        nreqs => 1,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          reqR => load_buffer2_call_reqs(0),
          ackR => load_buffer2_call_acks(0),
          tagR => load_buffer2_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 11,
          owidth => 11,
          detailed_buffering_per_output => outBUFs, 
          full_rate => false, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => load_buffer2_return_acks(0), -- cross-over
          ackL => load_buffer2_return_reqs(0), -- cross-over
          dataL => load_buffer2_return_data(10 downto 0),
          tagL => load_buffer2_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 2
    -- shared call operator group (3) : call_stmt_605_call 
    send_to_nic2_call_group_3: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs: IntegerArray(0 downto 0) := (others => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_605_call_req_0;
      call_stmt_605_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_605_call_req_1;
      call_stmt_605_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= packet_status_2_602(0);
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      send_to_nic2_call_group_3_gI: SplitGuardInterface generic map(name => "send_to_nic2_call_group_3_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= last_written_pointer_2_602;
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 10,
        owidth => 10,
        buffering => inBUFs,
        full_rate =>  false,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => send_to_nic2_call_reqs(0),
          ackR => send_to_nic2_call_acks(0),
          dataR => send_to_nic2_call_data(9 downto 0),
          tagR => send_to_nic2_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseNoData -- 
        generic map ( -- 
          detailed_buffering_per_output => outBUFs, 
          twidth => 1,
          name => "OutputDemuxBaseNoData",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          reqL => send_to_nic2_return_acks(0), -- cross-over
          ackL => send_to_nic2_return_reqs(0), -- cross-over
          tagL => send_to_nic2_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 3
    -- 
  end Block; -- data_path
  -- 
end rx_fifo_reader_arch;
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
entity send_header_to_tb is -- 
  generic (tag_length : integer); 
  port ( -- 
    nic_rx_to_header_pipe_read_req : out  std_logic_vector(0 downto 0);
    nic_rx_to_header_pipe_read_ack : in   std_logic_vector(0 downto 0);
    nic_rx_to_header_pipe_read_data : in   std_logic_vector(36 downto 0);
    tb_out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    tb_out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    tb_out_pipe_pipe_write_data : out  std_logic_vector(63 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity send_header_to_tb;
architecture send_header_to_tb_arch of send_header_to_tb is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal send_header_to_tb_CP_1052_start: Boolean;
  signal send_header_to_tb_CP_1052_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_611_branch_req_0 : boolean;
  signal RPIPE_nic_rx_to_header_615_inst_req_0 : boolean;
  signal RPIPE_nic_rx_to_header_615_inst_ack_0 : boolean;
  signal RPIPE_nic_rx_to_header_615_inst_req_1 : boolean;
  signal RPIPE_nic_rx_to_header_615_inst_ack_1 : boolean;
  signal type_cast_619_inst_req_0 : boolean;
  signal type_cast_619_inst_ack_0 : boolean;
  signal type_cast_619_inst_req_1 : boolean;
  signal type_cast_619_inst_ack_1 : boolean;
  signal WPIPE_tb_out_pipe_617_inst_req_0 : boolean;
  signal WPIPE_tb_out_pipe_617_inst_ack_0 : boolean;
  signal WPIPE_tb_out_pipe_617_inst_req_1 : boolean;
  signal WPIPE_tb_out_pipe_617_inst_ack_1 : boolean;
  signal do_while_stmt_611_branch_ack_0 : boolean;
  signal do_while_stmt_611_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "send_header_to_tb_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  send_header_to_tb_CP_1052_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "send_header_to_tb_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_header_to_tb_CP_1052_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= send_header_to_tb_CP_1052_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_header_to_tb_CP_1052_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  send_header_to_tb_CP_1052: Block -- control-path 
    signal send_header_to_tb_CP_1052_elements: BooleanArray(28 downto 0);
    -- 
  begin -- 
    send_header_to_tb_CP_1052_elements(0) <= send_header_to_tb_CP_1052_start;
    send_header_to_tb_CP_1052_symbol <= send_header_to_tb_CP_1052_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_610/$entry
      -- CP-element group 0: 	 branch_block_stmt_610/branch_block_stmt_610__entry__
      -- CP-element group 0: 	 branch_block_stmt_610/do_while_stmt_611__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	28 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_610/$exit
      -- CP-element group 1: 	 branch_block_stmt_610/branch_block_stmt_610__exit__
      -- CP-element group 1: 	 branch_block_stmt_610/do_while_stmt_611__exit__
      -- 
    send_header_to_tb_CP_1052_elements(1) <= send_header_to_tb_CP_1052_elements(28);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_610/do_while_stmt_611/$entry
      -- CP-element group 2: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611__entry__
      -- 
    send_header_to_tb_CP_1052_elements(2) <= send_header_to_tb_CP_1052_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	28 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611__exit__
      -- 
    -- Element group send_header_to_tb_CP_1052_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_610/do_while_stmt_611/loop_back
      -- 
    -- Element group send_header_to_tb_CP_1052_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	26 
    -- CP-element group 5: 	27 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_610/do_while_stmt_611/condition_done
      -- CP-element group 5: 	 branch_block_stmt_610/do_while_stmt_611/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_610/do_while_stmt_611/loop_taken/$entry
      -- 
    send_header_to_tb_CP_1052_elements(5) <= send_header_to_tb_CP_1052_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	25 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_610/do_while_stmt_611/loop_body_done
      -- 
    send_header_to_tb_CP_1052_elements(6) <= send_header_to_tb_CP_1052_elements(25);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/back_edge_to_loop_body
      -- 
    send_header_to_tb_CP_1052_elements(7) <= send_header_to_tb_CP_1052_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/first_time_through_loop_body
      -- 
    send_header_to_tb_CP_1052_elements(8) <= send_header_to_tb_CP_1052_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	11 
    -- CP-element group 9: 	12 
    -- CP-element group 9: 	24 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/loop_body_start
      -- CP-element group 9: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/phi_stmt_613_sample_start_
      -- 
    -- Element group send_header_to_tb_CP_1052_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	16 
    -- CP-element group 10: 	24 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/condition_evaluated
      -- 
    condition_evaluated_1076_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_1076_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(10), ack => do_while_stmt_611_branch_req_0); -- 
    send_header_to_tb_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(16) & send_header_to_tb_CP_1052_elements(24);
      gj_send_header_to_tb_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	9 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/aggregated_phi_sample_req
      -- 
    send_header_to_tb_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(9) & send_header_to_tb_CP_1052_elements(16);
      gj_send_header_to_tb_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	19 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	14 
    -- CP-element group 12:  members (2) 
      -- CP-element group 12: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/aggregated_phi_update_req
      -- CP-element group 12: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/phi_stmt_613_update_start_
      -- 
    send_header_to_tb_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(9) & send_header_to_tb_CP_1052_elements(19);
      gj_send_header_to_tb_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	15 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_sample_start_
      -- CP-element group 13: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Sample/$entry
      -- CP-element group 13: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Sample/rr
      -- 
    rr_1093_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1093_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(13), ack => RPIPE_nic_rx_to_header_615_inst_req_0); -- 
    send_header_to_tb_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(11) & send_header_to_tb_CP_1052_elements(16);
      gj_send_header_to_tb_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	12 
    -- CP-element group 14: 	15 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	16 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_update_start_
      -- CP-element group 14: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Update/$entry
      -- CP-element group 14: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Update/cr
      -- 
    cr_1098_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1098_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(14), ack => RPIPE_nic_rx_to_header_615_inst_req_1); -- 
    send_header_to_tb_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(12) & send_header_to_tb_CP_1052_elements(15);
      gj_send_header_to_tb_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	13 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: 	25 
    -- CP-element group 15:  members (5) 
      -- CP-element group 15: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/aggregated_phi_sample_ack
      -- CP-element group 15: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/phi_stmt_613_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Sample/ra
      -- 
    ra_1094_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_nic_rx_to_header_615_inst_ack_0, ack => send_header_to_tb_CP_1052_elements(15)); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	10 
    -- CP-element group 16: 	17 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	11 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (5) 
      -- CP-element group 16: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/aggregated_phi_update_ack
      -- CP-element group 16: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/phi_stmt_613_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/RPIPE_nic_rx_to_header_615_Update/ca
      -- 
    ca_1099_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_nic_rx_to_header_615_inst_ack_1, ack => send_header_to_tb_CP_1052_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	16 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	19 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_sample_start_
      -- CP-element group 17: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Sample/$entry
      -- CP-element group 17: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Sample/rr
      -- 
    rr_1107_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1107_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(17), ack => type_cast_619_inst_req_0); -- 
    send_header_to_tb_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(16) & send_header_to_tb_CP_1052_elements(19);
      gj_send_header_to_tb_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	22 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_update_start_
      -- CP-element group 18: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Update/cr
      -- 
    cr_1112_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1112_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(18), ack => type_cast_619_inst_req_1); -- 
    send_header_to_tb_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= send_header_to_tb_CP_1052_elements(22);
      gj_send_header_to_tb_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	12 
    -- CP-element group 19: 	17 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Sample/ra
      -- 
    ra_1108_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_619_inst_ack_0, ack => send_header_to_tb_CP_1052_elements(19)); -- 
    -- CP-element group 20:  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	21 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/type_cast_619_Update/ca
      -- 
    ca_1113_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_619_inst_ack_1, ack => send_header_to_tb_CP_1052_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	20 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	23 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	22 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Sample/req
      -- 
    req_1121_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1121_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(21), ack => WPIPE_tb_out_pipe_617_inst_req_0); -- 
    send_header_to_tb_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(20) & send_header_to_tb_CP_1052_elements(23);
      gj_send_header_to_tb_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	18 
    -- CP-element group 22:  members (6) 
      -- CP-element group 22: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_sample_completed_
      -- CP-element group 22: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_update_start_
      -- CP-element group 22: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Sample/$exit
      -- CP-element group 22: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Sample/ack
      -- CP-element group 22: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Update/req
      -- 
    ack_1122_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_tb_out_pipe_617_inst_ack_0, ack => send_header_to_tb_CP_1052_elements(22)); -- 
    req_1126_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1126_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_header_to_tb_CP_1052_elements(22), ack => WPIPE_tb_out_pipe_617_inst_req_1); -- 
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	22 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	21 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Update/$exit
      -- CP-element group 23: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/WPIPE_tb_out_pipe_617_Update/ack
      -- 
    ack_1127_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_tb_out_pipe_617_inst_ack_1, ack => send_header_to_tb_CP_1052_elements(23)); -- 
    -- CP-element group 24:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	10 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group send_header_to_tb_CP_1052_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => send_header_to_tb_CP_1052_elements(9), ack => send_header_to_tb_CP_1052_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	15 
    -- CP-element group 25: 	23 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	6 
    -- CP-element group 25:  members (1) 
      -- CP-element group 25: 	 branch_block_stmt_610/do_while_stmt_611/do_while_stmt_611_loop_body/$exit
      -- 
    send_header_to_tb_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_header_to_tb_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_header_to_tb_CP_1052_elements(15) & send_header_to_tb_CP_1052_elements(23);
      gj_send_header_to_tb_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	5 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_610/do_while_stmt_611/loop_exit/$exit
      -- CP-element group 26: 	 branch_block_stmt_610/do_while_stmt_611/loop_exit/ack
      -- 
    ack_1132_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_611_branch_ack_0, ack => send_header_to_tb_CP_1052_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	5 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_610/do_while_stmt_611/loop_taken/$exit
      -- CP-element group 27: 	 branch_block_stmt_610/do_while_stmt_611/loop_taken/ack
      -- 
    ack_1136_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_611_branch_ack_1, ack => send_header_to_tb_CP_1052_elements(27)); -- 
    -- CP-element group 28:  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	3 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	1 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_610/do_while_stmt_611/$exit
      -- 
    send_header_to_tb_CP_1052_elements(28) <= send_header_to_tb_CP_1052_elements(3);
    send_header_to_tb_do_while_stmt_611_terminator_1137: loop_terminator -- 
      generic map (name => " send_header_to_tb_do_while_stmt_611_terminator_1137", max_iterations_in_flight =>7) 
      port map(loop_body_exit => send_header_to_tb_CP_1052_elements(6),loop_continue => send_header_to_tb_CP_1052_elements(27),loop_terminate => send_header_to_tb_CP_1052_elements(26),loop_back => send_header_to_tb_CP_1052_elements(4),loop_exit => send_header_to_tb_CP_1052_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_1077_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= send_header_to_tb_CP_1052_elements(7);
        preds(1)  <= send_header_to_tb_CP_1052_elements(8);
        entry_tmerge_1077 : transition_merge -- 
          generic map(name => " entry_tmerge_1077")
          port map (preds => preds, symbol_out => send_header_to_tb_CP_1052_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal RPIPE_nic_rx_to_header_615_wire : std_logic_vector(36 downto 0);
    signal konst_622_wire_constant : std_logic_vector(0 downto 0);
    signal rhdata_613 : std_logic_vector(36 downto 0);
    signal type_cast_619_wire : std_logic_vector(63 downto 0);
    -- 
  begin -- 
    konst_622_wire_constant <= "1";
    -- interlock ssrc_phi_stmt_613
    process(RPIPE_nic_rx_to_header_615_wire) -- 
      variable tmp_var : std_logic_vector(36 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 36 downto 0) := RPIPE_nic_rx_to_header_615_wire(36 downto 0);
      rhdata_613 <= tmp_var; -- 
    end process;
    type_cast_619_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_619_inst_req_0;
      type_cast_619_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_619_inst_req_1;
      type_cast_619_inst_ack_1<= rack(0);
      type_cast_619_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_619_inst",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 37,
        out_data_width => 64,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rhdata_613,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_619_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_611_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_622_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_611_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_611_branch_req_0,
          ack0 => do_while_stmt_611_branch_ack_0,
          ack1 => do_while_stmt_611_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared inport operator group (0) : RPIPE_nic_rx_to_header_615_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(36 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_nic_rx_to_header_615_inst_req_0;
      RPIPE_nic_rx_to_header_615_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_nic_rx_to_header_615_inst_req_1;
      RPIPE_nic_rx_to_header_615_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_nic_rx_to_header_615_wire <= data_out(36 downto 0);
      nic_rx_to_header_read_0_gI: SplitGuardInterface generic map(name => "nic_rx_to_header_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      nic_rx_to_header_read_0: InputPortRevised -- 
        generic map ( name => "nic_rx_to_header_read_0", data_width => 37,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => nic_rx_to_header_pipe_read_req(0),
          oack => nic_rx_to_header_pipe_read_ack(0),
          odata => nic_rx_to_header_pipe_read_data(36 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_tb_out_pipe_617_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_tb_out_pipe_617_inst_req_0;
      WPIPE_tb_out_pipe_617_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_tb_out_pipe_617_inst_req_1;
      WPIPE_tb_out_pipe_617_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= type_cast_619_wire;
      tb_out_pipe_write_0_gI: SplitGuardInterface generic map(name => "tb_out_pipe_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      tb_out_pipe_write_0: OutputPortRevised -- 
        generic map ( name => "tb_out_pipe", data_width => 64, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => tb_out_pipe_pipe_write_req(0),
          oack => tb_out_pipe_pipe_write_ack(0),
          odata => tb_out_pipe_pipe_write_data(63 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end send_header_to_tb_arch;
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
entity send_packet_to_tb is -- 
  generic (tag_length : integer); 
  port ( -- 
    nic_rx_to_packet_pipe_read_req : out  std_logic_vector(0 downto 0);
    nic_rx_to_packet_pipe_read_ack : in   std_logic_vector(0 downto 0);
    nic_rx_to_packet_pipe_read_data : in   std_logic_vector(36 downto 0);
    tb_out_packet_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    tb_out_packet_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    tb_out_packet_pipe_pipe_write_data : out  std_logic_vector(63 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity send_packet_to_tb;
architecture send_packet_to_tb_arch of send_packet_to_tb is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal send_packet_to_tb_CP_1138_start: Boolean;
  signal send_packet_to_tb_CP_1138_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_627_branch_ack_0 : boolean;
  signal RPIPE_nic_rx_to_packet_631_inst_ack_1 : boolean;
  signal WPIPE_tb_out_packet_pipe_633_inst_req_1 : boolean;
  signal WPIPE_tb_out_packet_pipe_633_inst_ack_0 : boolean;
  signal RPIPE_nic_rx_to_packet_631_inst_req_0 : boolean;
  signal RPIPE_nic_rx_to_packet_631_inst_ack_0 : boolean;
  signal WPIPE_tb_out_packet_pipe_633_inst_req_0 : boolean;
  signal RPIPE_nic_rx_to_packet_631_inst_req_1 : boolean;
  signal do_while_stmt_627_branch_req_0 : boolean;
  signal do_while_stmt_627_branch_ack_1 : boolean;
  signal WPIPE_tb_out_packet_pipe_633_inst_ack_1 : boolean;
  signal type_cast_635_inst_ack_1 : boolean;
  signal type_cast_635_inst_req_1 : boolean;
  signal type_cast_635_inst_ack_0 : boolean;
  signal type_cast_635_inst_req_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "send_packet_to_tb_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  send_packet_to_tb_CP_1138_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "send_packet_to_tb_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_packet_to_tb_CP_1138_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= send_packet_to_tb_CP_1138_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_packet_to_tb_CP_1138_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  send_packet_to_tb_CP_1138: Block -- control-path 
    signal send_packet_to_tb_CP_1138_elements: BooleanArray(28 downto 0);
    -- 
  begin -- 
    send_packet_to_tb_CP_1138_elements(0) <= send_packet_to_tb_CP_1138_start;
    send_packet_to_tb_CP_1138_symbol <= send_packet_to_tb_CP_1138_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 branch_block_stmt_626/do_while_stmt_627__entry__
      -- CP-element group 0: 	 branch_block_stmt_626/$entry
      -- CP-element group 0: 	 branch_block_stmt_626/branch_block_stmt_626__entry__
      -- CP-element group 0: 	 $entry
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	28 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 branch_block_stmt_626/$exit
      -- CP-element group 1: 	 branch_block_stmt_626/do_while_stmt_627__exit__
      -- CP-element group 1: 	 branch_block_stmt_626/branch_block_stmt_626__exit__
      -- CP-element group 1: 	 $exit
      -- 
    send_packet_to_tb_CP_1138_elements(1) <= send_packet_to_tb_CP_1138_elements(28);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_626/do_while_stmt_627/$entry
      -- CP-element group 2: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627__entry__
      -- 
    send_packet_to_tb_CP_1138_elements(2) <= send_packet_to_tb_CP_1138_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	28 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627__exit__
      -- 
    -- Element group send_packet_to_tb_CP_1138_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_626/do_while_stmt_627/loop_back
      -- 
    -- Element group send_packet_to_tb_CP_1138_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	26 
    -- CP-element group 5: 	27 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_626/do_while_stmt_627/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_626/do_while_stmt_627/loop_taken/$entry
      -- CP-element group 5: 	 branch_block_stmt_626/do_while_stmt_627/condition_done
      -- 
    send_packet_to_tb_CP_1138_elements(5) <= send_packet_to_tb_CP_1138_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	25 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_626/do_while_stmt_627/loop_body_done
      -- 
    send_packet_to_tb_CP_1138_elements(6) <= send_packet_to_tb_CP_1138_elements(25);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/back_edge_to_loop_body
      -- 
    send_packet_to_tb_CP_1138_elements(7) <= send_packet_to_tb_CP_1138_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/first_time_through_loop_body
      -- 
    send_packet_to_tb_CP_1138_elements(8) <= send_packet_to_tb_CP_1138_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	11 
    -- CP-element group 9: 	12 
    -- CP-element group 9: 	24 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/loop_body_start
      -- CP-element group 9: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/phi_stmt_629_sample_start_
      -- 
    -- Element group send_packet_to_tb_CP_1138_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	16 
    -- CP-element group 10: 	24 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/condition_evaluated
      -- 
    condition_evaluated_1162_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_1162_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(10), ack => do_while_stmt_627_branch_req_0); -- 
    send_packet_to_tb_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(16) & send_packet_to_tb_CP_1138_elements(24);
      gj_send_packet_to_tb_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	9 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/aggregated_phi_sample_req
      -- 
    send_packet_to_tb_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(9) & send_packet_to_tb_CP_1138_elements(16);
      gj_send_packet_to_tb_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	19 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	14 
    -- CP-element group 12:  members (2) 
      -- CP-element group 12: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/phi_stmt_629_update_start_
      -- CP-element group 12: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/aggregated_phi_update_req
      -- 
    send_packet_to_tb_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(9) & send_packet_to_tb_CP_1138_elements(19);
      gj_send_packet_to_tb_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	15 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Sample/rr
      -- CP-element group 13: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Sample/$entry
      -- CP-element group 13: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_sample_start_
      -- 
    rr_1179_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1179_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(13), ack => RPIPE_nic_rx_to_packet_631_inst_req_0); -- 
    send_packet_to_tb_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(11) & send_packet_to_tb_CP_1138_elements(16);
      gj_send_packet_to_tb_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	12 
    -- CP-element group 14: 	15 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	16 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Update/$entry
      -- CP-element group 14: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Update/cr
      -- CP-element group 14: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_update_start_
      -- 
    cr_1184_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1184_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(14), ack => RPIPE_nic_rx_to_packet_631_inst_req_1); -- 
    send_packet_to_tb_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(12) & send_packet_to_tb_CP_1138_elements(15);
      gj_send_packet_to_tb_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	13 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: 	25 
    -- CP-element group 15:  members (5) 
      -- CP-element group 15: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/aggregated_phi_sample_ack
      -- CP-element group 15: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Sample/ra
      -- CP-element group 15: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/phi_stmt_629_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_sample_completed_
      -- 
    ra_1180_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_nic_rx_to_packet_631_inst_ack_0, ack => send_packet_to_tb_CP_1138_elements(15)); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	10 
    -- CP-element group 16: 	17 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	11 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (5) 
      -- CP-element group 16: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Update/ca
      -- CP-element group 16: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/aggregated_phi_update_ack
      -- CP-element group 16: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/RPIPE_nic_rx_to_packet_631_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/phi_stmt_629_update_completed_
      -- 
    ca_1185_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_nic_rx_to_packet_631_inst_ack_1, ack => send_packet_to_tb_CP_1138_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	16 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	19 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_sample_start_
      -- CP-element group 17: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Sample/rr
      -- CP-element group 17: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Sample/$entry
      -- 
    rr_1193_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1193_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(17), ack => type_cast_635_inst_req_0); -- 
    send_packet_to_tb_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(16) & send_packet_to_tb_CP_1138_elements(19);
      gj_send_packet_to_tb_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	22 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Update/cr
      -- CP-element group 18: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_update_start_
      -- 
    cr_1198_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1198_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(18), ack => type_cast_635_inst_req_1); -- 
    send_packet_to_tb_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= send_packet_to_tb_CP_1138_elements(22);
      gj_send_packet_to_tb_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	12 
    -- CP-element group 19: 	17 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Sample/ra
      -- CP-element group 19: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_sample_completed_
      -- 
    ra_1194_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_635_inst_ack_0, ack => send_packet_to_tb_CP_1138_elements(19)); -- 
    -- CP-element group 20:  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	21 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Update/ca
      -- CP-element group 20: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/type_cast_635_update_completed_
      -- 
    ca_1199_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_635_inst_ack_1, ack => send_packet_to_tb_CP_1138_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	20 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	23 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	22 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Sample/req
      -- CP-element group 21: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_sample_start_
      -- 
    req_1207_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1207_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(21), ack => WPIPE_tb_out_packet_pipe_633_inst_req_0); -- 
    send_packet_to_tb_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(20) & send_packet_to_tb_CP_1138_elements(23);
      gj_send_packet_to_tb_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	18 
    -- CP-element group 22:  members (6) 
      -- CP-element group 22: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Update/req
      -- CP-element group 22: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Sample/ack
      -- CP-element group 22: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Sample/$exit
      -- CP-element group 22: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_sample_completed_
      -- CP-element group 22: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_update_start_
      -- 
    ack_1208_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_tb_out_packet_pipe_633_inst_ack_0, ack => send_packet_to_tb_CP_1138_elements(22)); -- 
    req_1212_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1212_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_packet_to_tb_CP_1138_elements(22), ack => WPIPE_tb_out_packet_pipe_633_inst_req_1); -- 
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	22 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	21 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Update/$exit
      -- CP-element group 23: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/WPIPE_tb_out_packet_pipe_633_Update/ack
      -- 
    ack_1213_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_tb_out_packet_pipe_633_inst_ack_1, ack => send_packet_to_tb_CP_1138_elements(23)); -- 
    -- CP-element group 24:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	10 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group send_packet_to_tb_CP_1138_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => send_packet_to_tb_CP_1138_elements(9), ack => send_packet_to_tb_CP_1138_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	15 
    -- CP-element group 25: 	23 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	6 
    -- CP-element group 25:  members (1) 
      -- CP-element group 25: 	 branch_block_stmt_626/do_while_stmt_627/do_while_stmt_627_loop_body/$exit
      -- 
    send_packet_to_tb_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "send_packet_to_tb_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_packet_to_tb_CP_1138_elements(15) & send_packet_to_tb_CP_1138_elements(23);
      gj_send_packet_to_tb_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	5 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_626/do_while_stmt_627/loop_exit/ack
      -- CP-element group 26: 	 branch_block_stmt_626/do_while_stmt_627/loop_exit/$exit
      -- 
    ack_1218_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_627_branch_ack_0, ack => send_packet_to_tb_CP_1138_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	5 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_626/do_while_stmt_627/loop_taken/$exit
      -- CP-element group 27: 	 branch_block_stmt_626/do_while_stmt_627/loop_taken/ack
      -- 
    ack_1222_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_627_branch_ack_1, ack => send_packet_to_tb_CP_1138_elements(27)); -- 
    -- CP-element group 28:  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	3 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	1 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_626/do_while_stmt_627/$exit
      -- 
    send_packet_to_tb_CP_1138_elements(28) <= send_packet_to_tb_CP_1138_elements(3);
    send_packet_to_tb_do_while_stmt_627_terminator_1223: loop_terminator -- 
      generic map (name => " send_packet_to_tb_do_while_stmt_627_terminator_1223", max_iterations_in_flight =>7) 
      port map(loop_body_exit => send_packet_to_tb_CP_1138_elements(6),loop_continue => send_packet_to_tb_CP_1138_elements(27),loop_terminate => send_packet_to_tb_CP_1138_elements(26),loop_back => send_packet_to_tb_CP_1138_elements(4),loop_exit => send_packet_to_tb_CP_1138_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_1163_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= send_packet_to_tb_CP_1138_elements(7);
        preds(1)  <= send_packet_to_tb_CP_1138_elements(8);
        entry_tmerge_1163 : transition_merge -- 
          generic map(name => " entry_tmerge_1163")
          port map (preds => preds, symbol_out => send_packet_to_tb_CP_1138_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal RPIPE_nic_rx_to_packet_631_wire : std_logic_vector(36 downto 0);
    signal konst_638_wire_constant : std_logic_vector(0 downto 0);
    signal rpdata_629 : std_logic_vector(36 downto 0);
    signal type_cast_635_wire : std_logic_vector(63 downto 0);
    -- 
  begin -- 
    konst_638_wire_constant <= "1";
    -- interlock ssrc_phi_stmt_629
    process(RPIPE_nic_rx_to_packet_631_wire) -- 
      variable tmp_var : std_logic_vector(36 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 36 downto 0) := RPIPE_nic_rx_to_packet_631_wire(36 downto 0);
      rpdata_629 <= tmp_var; -- 
    end process;
    type_cast_635_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_635_inst_req_0;
      type_cast_635_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_635_inst_req_1;
      type_cast_635_inst_ack_1<= rack(0);
      type_cast_635_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_635_inst",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 37,
        out_data_width => 64,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rpdata_629,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_635_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_627_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_638_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_627_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_627_branch_req_0,
          ack0 => do_while_stmt_627_branch_ack_0,
          ack1 => do_while_stmt_627_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared inport operator group (0) : RPIPE_nic_rx_to_packet_631_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(36 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_nic_rx_to_packet_631_inst_req_0;
      RPIPE_nic_rx_to_packet_631_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_nic_rx_to_packet_631_inst_req_1;
      RPIPE_nic_rx_to_packet_631_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_nic_rx_to_packet_631_wire <= data_out(36 downto 0);
      nic_rx_to_packet_read_0_gI: SplitGuardInterface generic map(name => "nic_rx_to_packet_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      nic_rx_to_packet_read_0: InputPortRevised -- 
        generic map ( name => "nic_rx_to_packet_read_0", data_width => 37,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => nic_rx_to_packet_pipe_read_req(0),
          oack => nic_rx_to_packet_pipe_read_ack(0),
          odata => nic_rx_to_packet_pipe_read_data(36 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_tb_out_packet_pipe_633_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_tb_out_packet_pipe_633_inst_req_0;
      WPIPE_tb_out_packet_pipe_633_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_tb_out_packet_pipe_633_inst_req_1;
      WPIPE_tb_out_packet_pipe_633_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= type_cast_635_wire;
      tb_out_packet_pipe_write_0_gI: SplitGuardInterface generic map(name => "tb_out_packet_pipe_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      tb_out_packet_pipe_write_0: OutputPortRevised -- 
        generic map ( name => "tb_out_packet_pipe", data_width => 64, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => tb_out_packet_pipe_pipe_write_req(0),
          oack => tb_out_packet_pipe_pipe_write_ack(0),
          odata => tb_out_packet_pipe_pipe_write_data(63 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end send_packet_to_tb_arch;
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
entity send_to_nic1 is -- 
  generic (tag_length : integer); 
  port ( -- 
    buf_ptr : in  std_logic_vector(9 downto 0);
    memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
    memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_lr_addr : out  std_logic_vector(9 downto 0);
    memory_space_0_lr_tag :  out  std_logic_vector(17 downto 0);
    memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
    memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_lc_data : in   std_logic_vector(36 downto 0);
    memory_space_0_lc_tag :  in  std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_req : out  std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_data : out  std_logic_vector(36 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity send_to_nic1;
architecture send_to_nic1_arch of send_to_nic1 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 10)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal buf_ptr_buffer :  std_logic_vector(9 downto 0);
  signal buf_ptr_update_enable: Boolean;
  -- output port buffer signals
  signal send_to_nic1_CP_641_start: Boolean;
  signal send_to_nic1_CP_641_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal WPIPE_mac_to_nic_data_550_inst_ack_0 : boolean;
  signal array_obj_ref_552_load_0_req_0 : boolean;
  signal do_while_stmt_542_branch_req_0 : boolean;
  signal num_558_548_buf_req_1 : boolean;
  signal WPIPE_mac_to_nic_data_550_inst_req_1 : boolean;
  signal WPIPE_mac_to_nic_data_550_inst_ack_1 : boolean;
  signal array_obj_ref_552_load_0_ack_0 : boolean;
  signal num_558_548_buf_ack_0 : boolean;
  signal num_558_548_buf_req_0 : boolean;
  signal phi_stmt_544_ack_0 : boolean;
  signal array_obj_ref_552_load_0_ack_1 : boolean;
  signal array_obj_ref_552_load_0_req_1 : boolean;
  signal WPIPE_mac_to_nic_data_550_inst_req_0 : boolean;
  signal do_while_stmt_542_branch_ack_0 : boolean;
  signal do_while_stmt_542_branch_ack_1 : boolean;
  signal num_558_548_buf_ack_1 : boolean;
  signal phi_stmt_544_req_1 : boolean;
  signal phi_stmt_544_req_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "send_to_nic1_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 10) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(9 downto 0) <= buf_ptr;
  buf_ptr_buffer <= in_buffer_data_out(9 downto 0);
  in_buffer_data_in(tag_length + 9 downto 10) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 9 downto 10);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  send_to_nic1_CP_641_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "send_to_nic1_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_to_nic1_CP_641_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= send_to_nic1_CP_641_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_to_nic1_CP_641_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  send_to_nic1_CP_641: Block -- control-path 
    signal send_to_nic1_CP_641_elements: BooleanArray(40 downto 0);
    -- 
  begin -- 
    send_to_nic1_CP_641_elements(0) <= send_to_nic1_CP_641_start;
    send_to_nic1_CP_641_symbol <= send_to_nic1_CP_641_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 branch_block_stmt_541/do_while_stmt_542__entry__
      -- CP-element group 0: 	 branch_block_stmt_541/$entry
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_541/branch_block_stmt_541__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	40 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_541/branch_block_stmt_541__exit__
      -- CP-element group 1: 	 branch_block_stmt_541/$exit
      -- CP-element group 1: 	 branch_block_stmt_541/do_while_stmt_542__exit__
      -- 
    send_to_nic1_CP_641_elements(1) <= send_to_nic1_CP_641_elements(40);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542__entry__
      -- CP-element group 2: 	 branch_block_stmt_541/do_while_stmt_542/$entry
      -- 
    send_to_nic1_CP_641_elements(2) <= send_to_nic1_CP_641_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	40 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542__exit__
      -- 
    -- Element group send_to_nic1_CP_641_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_541/do_while_stmt_542/loop_back
      -- 
    -- Element group send_to_nic1_CP_641_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	38 
    -- CP-element group 5: 	39 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_541/do_while_stmt_542/condition_done
      -- CP-element group 5: 	 branch_block_stmt_541/do_while_stmt_542/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_541/do_while_stmt_542/loop_taken/$entry
      -- 
    send_to_nic1_CP_641_elements(5) <= send_to_nic1_CP_641_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	37 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_541/do_while_stmt_542/loop_body_done
      -- 
    send_to_nic1_CP_641_elements(6) <= send_to_nic1_CP_641_elements(37);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	16 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/back_edge_to_loop_body
      -- 
    send_to_nic1_CP_641_elements(7) <= send_to_nic1_CP_641_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	18 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/first_time_through_loop_body
      -- 
    send_to_nic1_CP_641_elements(8) <= send_to_nic1_CP_641_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	12 
    -- CP-element group 9: 	13 
    -- CP-element group 9: 	36 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/loop_body_start
      -- 
    -- Element group send_to_nic1_CP_641_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	15 
    -- CP-element group 10: 	36 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/condition_evaluated
      -- 
    condition_evaluated_665_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_665_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(10), ack => do_while_stmt_542_branch_req_0); -- 
    send_to_nic1_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 5);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(15) & send_to_nic1_CP_641_elements(36);
      gj_send_to_nic1_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	15 
    -- CP-element group 11: successors 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_sample_start__ps
      -- CP-element group 11: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/aggregated_phi_sample_req
      -- 
    send_to_nic1_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(12) & send_to_nic1_CP_641_elements(15);
      gj_send_to_nic1_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	14 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (1) 
      -- CP-element group 12: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_sample_start_
      -- 
    send_to_nic1_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(9) & send_to_nic1_CP_641_elements(14);
      gj_send_to_nic1_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	9 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	31 
    -- CP-element group 13: successors 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_update_start__ps
      -- CP-element group 13: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_update_start_
      -- CP-element group 13: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/aggregated_phi_update_req
      -- 
    send_to_nic1_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(9) & send_to_nic1_CP_641_elements(31);
      gj_send_to_nic1_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	37 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	12 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_sample_completed__ps
      -- CP-element group 14: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/aggregated_phi_sample_ack
      -- CP-element group 14: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_sample_completed_
      -- 
    -- Element group send_to_nic1_CP_641_elements(14) is bound as output of CP function.
    -- CP-element group 15:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	10 
    -- CP-element group 15: 	29 
    -- CP-element group 15: marked-successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (29) 
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_update_completed_
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_resize_0/index_resize_ack
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_offset_calculated
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_scale_0/$entry
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_word_addrgen/root_register_req
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_root_address_calculated
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_word_addrgen/$entry
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_word_addrgen/root_register_ack
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_scale_0/$exit
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_word_addrgen/$exit
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_update_completed__ps
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_scale_0/scale_rename_req
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_base_plus_offset/sum_rename_ack
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_scale_0/scale_rename_ack
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_final_index_sum_regn/$entry
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_word_address_calculated
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_scaled_0
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_computed_0
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/aggregated_phi_update_ack
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_final_index_sum_regn/$exit
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_final_index_sum_regn/req
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_resize_0/$entry
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_resized_0
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_resize_0/$exit
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_index_resize_0/index_resize_req
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_final_index_sum_regn/ack
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_base_plus_offset/$entry
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_base_plus_offset/$exit
      -- CP-element group 15: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_base_plus_offset/sum_rename_req
      -- 
    -- Element group send_to_nic1_CP_641_elements(15) is bound as output of CP function.
    -- CP-element group 16:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	7 
    -- CP-element group 16: successors 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_loopback_trigger
      -- 
    send_to_nic1_CP_641_elements(16) <= send_to_nic1_CP_641_elements(7);
    -- CP-element group 17:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (2) 
      -- CP-element group 17: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_loopback_sample_req
      -- CP-element group 17: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_loopback_sample_req_ps
      -- 
    phi_stmt_544_loopback_sample_req_680_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_544_loopback_sample_req_680_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(17), ack => phi_stmt_544_req_1); -- 
    -- Element group send_to_nic1_CP_641_elements(17) is bound as output of CP function.
    -- CP-element group 18:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	8 
    -- CP-element group 18: successors 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_entry_trigger
      -- 
    send_to_nic1_CP_641_elements(18) <= send_to_nic1_CP_641_elements(8);
    -- CP-element group 19:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (2) 
      -- CP-element group 19: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_entry_sample_req_ps
      -- CP-element group 19: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_entry_sample_req
      -- 
    phi_stmt_544_entry_sample_req_683_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_544_entry_sample_req_683_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(19), ack => phi_stmt_544_req_0); -- 
    -- Element group send_to_nic1_CP_641_elements(19) is bound as output of CP function.
    -- CP-element group 20:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_phi_mux_ack_ps
      -- CP-element group 20: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/phi_stmt_544_phi_mux_ack
      -- 
    phi_stmt_544_phi_mux_ack_686_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_544_ack_0, ack => send_to_nic1_CP_641_elements(20)); -- 
    -- CP-element group 21:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (4) 
      -- CP-element group 21: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_sample_start__ps
      -- CP-element group 21: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_sample_completed__ps
      -- CP-element group 21: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_sample_completed_
      -- 
    -- Element group send_to_nic1_CP_641_elements(21) is bound as output of CP function.
    -- CP-element group 22:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	24 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_update_start__ps
      -- CP-element group 22: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_update_start_
      -- 
    -- Element group send_to_nic1_CP_641_elements(22) is bound as output of CP function.
    -- CP-element group 23:  join  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	24 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_update_completed__ps
      -- 
    send_to_nic1_CP_641_elements(23) <= send_to_nic1_CP_641_elements(24);
    -- CP-element group 24:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	22 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	23 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/type_cast_547_update_completed_
      -- 
    -- Element group send_to_nic1_CP_641_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => send_to_nic1_CP_641_elements(22), ack => send_to_nic1_CP_641_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	27 
    -- CP-element group 25:  members (4) 
      -- CP-element group 25: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Sample/req
      -- CP-element group 25: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Sample/$entry
      -- CP-element group 25: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_sample_start__ps
      -- CP-element group 25: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_sample_start_
      -- 
    req_707_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_707_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(25), ack => num_558_548_buf_req_0); -- 
    -- Element group send_to_nic1_CP_641_elements(25) is bound as output of CP function.
    -- CP-element group 26:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (4) 
      -- CP-element group 26: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Update/$entry
      -- CP-element group 26: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Update/req
      -- CP-element group 26: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_update_start_
      -- CP-element group 26: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_update_start__ps
      -- 
    req_712_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_712_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(26), ack => num_558_548_buf_req_1); -- 
    -- Element group send_to_nic1_CP_641_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	25 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (4) 
      -- CP-element group 27: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Sample/ack
      -- CP-element group 27: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Sample/$exit
      -- CP-element group 27: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_sample_completed_
      -- CP-element group 27: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_sample_completed__ps
      -- 
    ack_708_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => num_558_548_buf_ack_0, ack => send_to_nic1_CP_641_elements(27)); -- 
    -- CP-element group 28:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: successors 
    -- CP-element group 28:  members (4) 
      -- CP-element group 28: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Update/$exit
      -- CP-element group 28: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_Update/ack
      -- CP-element group 28: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_update_completed_
      -- CP-element group 28: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/R_num_548_update_completed__ps
      -- 
    ack_713_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 28_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => num_558_548_buf_ack_1, ack => send_to_nic1_CP_641_elements(28)); -- 
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	15 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	31 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (5) 
      -- CP-element group 29: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/word_access_start/word_0/rr
      -- CP-element group 29: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/$entry
      -- CP-element group 29: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/word_access_start/$entry
      -- CP-element group 29: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_sample_start_
      -- CP-element group 29: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/word_access_start/word_0/$entry
      -- 
    rr_760_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_760_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(29), ack => array_obj_ref_552_load_0_req_0); -- 
    send_to_nic1_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(15) & send_to_nic1_CP_641_elements(31);
      gj_send_to_nic1_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: marked-predecessors 
    -- CP-element group 30: 	34 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (5) 
      -- CP-element group 30: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_update_start_
      -- CP-element group 30: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/word_access_complete/word_0/$entry
      -- CP-element group 30: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/word_access_complete/word_0/cr
      -- CP-element group 30: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/word_access_complete/$entry
      -- CP-element group 30: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/$entry
      -- 
    cr_771_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_771_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(30), ack => array_obj_ref_552_load_0_req_1); -- 
    send_to_nic1_cp_element_group_30: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_30"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= send_to_nic1_CP_641_elements(34);
      gj_send_to_nic1_cp_element_group_30 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(30), clk => clk, reset => reset); --
    end block;
    -- CP-element group 31:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	13 
    -- CP-element group 31: 	29 
    -- CP-element group 31:  members (5) 
      -- CP-element group 31: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_sample_completed_
      -- CP-element group 31: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/word_access_start/word_0/ra
      -- CP-element group 31: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/$exit
      -- CP-element group 31: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/word_access_start/word_0/$exit
      -- CP-element group 31: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Sample/word_access_start/$exit
      -- 
    ra_761_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_552_load_0_ack_0, ack => send_to_nic1_CP_641_elements(31)); -- 
    -- CP-element group 32:  transition  input  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	33 
    -- CP-element group 32:  members (9) 
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/word_access_complete/word_0/$exit
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_update_completed_
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/array_obj_ref_552_Merge/$exit
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/array_obj_ref_552_Merge/merge_req
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/array_obj_ref_552_Merge/merge_ack
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/array_obj_ref_552_Merge/$entry
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/word_access_complete/word_0/ca
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/word_access_complete/$exit
      -- CP-element group 32: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/array_obj_ref_552_Update/$exit
      -- 
    ca_772_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 32_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_552_load_0_ack_1, ack => send_to_nic1_CP_641_elements(32)); -- 
    -- CP-element group 33:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	32 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	35 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	34 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_sample_start_
      -- CP-element group 33: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Sample/req
      -- CP-element group 33: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Sample/$entry
      -- 
    req_785_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_785_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(33), ack => WPIPE_mac_to_nic_data_550_inst_req_0); -- 
    send_to_nic1_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(32) & send_to_nic1_CP_641_elements(35);
      gj_send_to_nic1_cp_element_group_33 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	33 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	35 
    -- CP-element group 34: marked-successors 
    -- CP-element group 34: 	30 
    -- CP-element group 34:  members (6) 
      -- CP-element group 34: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Sample/ack
      -- CP-element group 34: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Update/$entry
      -- CP-element group 34: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Sample/$exit
      -- CP-element group 34: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Update/req
      -- CP-element group 34: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_update_start_
      -- CP-element group 34: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_sample_completed_
      -- 
    ack_786_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 34_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mac_to_nic_data_550_inst_ack_0, ack => send_to_nic1_CP_641_elements(34)); -- 
    req_790_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_790_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic1_CP_641_elements(34), ack => WPIPE_mac_to_nic_data_550_inst_req_1); -- 
    -- CP-element group 35:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	34 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	37 
    -- CP-element group 35: marked-successors 
    -- CP-element group 35: 	33 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Update/$exit
      -- CP-element group 35: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_Update/ack
      -- CP-element group 35: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/WPIPE_mac_to_nic_data_550_update_completed_
      -- 
    ack_791_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 35_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mac_to_nic_data_550_inst_ack_1, ack => send_to_nic1_CP_641_elements(35)); -- 
    -- CP-element group 36:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	9 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	10 
    -- CP-element group 36:  members (1) 
      -- CP-element group 36: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group send_to_nic1_CP_641_elements(36) is a control-delay.
    cp_element_36_delay: control_delay_element  generic map(name => " 36_delay", delay_value => 1)  port map(req => send_to_nic1_CP_641_elements(9), ack => send_to_nic1_CP_641_elements(36), clk => clk, reset =>reset);
    -- CP-element group 37:  join  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	14 
    -- CP-element group 37: 	35 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	6 
    -- CP-element group 37:  members (1) 
      -- CP-element group 37: 	 branch_block_stmt_541/do_while_stmt_542/do_while_stmt_542_loop_body/$exit
      -- 
    send_to_nic1_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 5);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic1_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic1_CP_641_elements(14) & send_to_nic1_CP_641_elements(35);
      gj_send_to_nic1_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic1_CP_641_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  transition  input  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	5 
    -- CP-element group 38: successors 
    -- CP-element group 38:  members (2) 
      -- CP-element group 38: 	 branch_block_stmt_541/do_while_stmt_542/loop_exit/$exit
      -- CP-element group 38: 	 branch_block_stmt_541/do_while_stmt_542/loop_exit/ack
      -- 
    ack_796_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 38_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_542_branch_ack_0, ack => send_to_nic1_CP_641_elements(38)); -- 
    -- CP-element group 39:  transition  input  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	5 
    -- CP-element group 39: successors 
    -- CP-element group 39:  members (2) 
      -- CP-element group 39: 	 branch_block_stmt_541/do_while_stmt_542/loop_taken/$exit
      -- CP-element group 39: 	 branch_block_stmt_541/do_while_stmt_542/loop_taken/ack
      -- 
    ack_800_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 39_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_542_branch_ack_1, ack => send_to_nic1_CP_641_elements(39)); -- 
    -- CP-element group 40:  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	3 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	1 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_541/do_while_stmt_542/$exit
      -- 
    send_to_nic1_CP_641_elements(40) <= send_to_nic1_CP_641_elements(3);
    send_to_nic1_do_while_stmt_542_terminator_801: loop_terminator -- 
      generic map (name => " send_to_nic1_do_while_stmt_542_terminator_801", max_iterations_in_flight =>5) 
      port map(loop_body_exit => send_to_nic1_CP_641_elements(6),loop_continue => send_to_nic1_CP_641_elements(39),loop_terminate => send_to_nic1_CP_641_elements(38),loop_back => send_to_nic1_CP_641_elements(4),loop_exit => send_to_nic1_CP_641_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_544_phi_seq_714_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= send_to_nic1_CP_641_elements(18);
      send_to_nic1_CP_641_elements(21)<= src_sample_reqs(0);
      src_sample_acks(0)  <= send_to_nic1_CP_641_elements(21);
      send_to_nic1_CP_641_elements(22)<= src_update_reqs(0);
      src_update_acks(0)  <= send_to_nic1_CP_641_elements(23);
      send_to_nic1_CP_641_elements(19) <= phi_mux_reqs(0);
      triggers(1)  <= send_to_nic1_CP_641_elements(16);
      send_to_nic1_CP_641_elements(25)<= src_sample_reqs(1);
      src_sample_acks(1)  <= send_to_nic1_CP_641_elements(27);
      send_to_nic1_CP_641_elements(26)<= src_update_reqs(1);
      src_update_acks(1)  <= send_to_nic1_CP_641_elements(28);
      send_to_nic1_CP_641_elements(17) <= phi_mux_reqs(1);
      phi_stmt_544_phi_seq_714 : phi_sequencer_v2-- 
        generic map (place_capacity => 5, ntriggers => 2, name => "phi_stmt_544_phi_seq_714") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => send_to_nic1_CP_641_elements(11), 
          phi_sample_ack => send_to_nic1_CP_641_elements(14), 
          phi_update_req => send_to_nic1_CP_641_elements(13), 
          phi_update_ack => send_to_nic1_CP_641_elements(15), 
          phi_mux_ack => send_to_nic1_CP_641_elements(20), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_666_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= send_to_nic1_CP_641_elements(7);
        preds(1)  <= send_to_nic1_CP_641_elements(8);
        entry_tmerge_666 : transition_merge -- 
          generic map(name => " entry_tmerge_666")
          port map (preds => preds, symbol_out => send_to_nic1_CP_641_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal I_544 : std_logic_vector(9 downto 0);
    signal R_I_551_resized : std_logic_vector(9 downto 0);
    signal R_I_551_scaled : std_logic_vector(9 downto 0);
    signal ULT_u10_u1_562_wire : std_logic_vector(0 downto 0);
    signal array_obj_ref_552_data_0 : std_logic_vector(36 downto 0);
    signal array_obj_ref_552_final_offset : std_logic_vector(9 downto 0);
    signal array_obj_ref_552_offset_scale_factor_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_552_resized_base_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_552_root_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_552_wire : std_logic_vector(36 downto 0);
    signal array_obj_ref_552_word_address_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_552_word_offset_0 : std_logic_vector(9 downto 0);
    signal konst_556_wire_constant : std_logic_vector(9 downto 0);
    signal num_558 : std_logic_vector(9 downto 0);
    signal num_558_548_buffered : std_logic_vector(9 downto 0);
    signal type_cast_547_wire_constant : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    array_obj_ref_552_offset_scale_factor_0 <= "0000000001";
    array_obj_ref_552_resized_base_address <= "0000000000";
    array_obj_ref_552_word_offset_0 <= "0000000000";
    konst_556_wire_constant <= "0000000001";
    type_cast_547_wire_constant <= "0000000000";
    phi_stmt_544: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_547_wire_constant & num_558_548_buffered;
      req <= phi_stmt_544_req_0 & phi_stmt_544_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_544",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_544_ack_0,
          idata => idata,
          odata => I_544,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_544
    num_558_548_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= num_558_548_buf_req_0;
      num_558_548_buf_ack_0<= wack(0);
      rreq(0) <= num_558_548_buf_req_1;
      num_558_548_buf_ack_1<= rack(0);
      num_558_548_buf : InterlockBuffer generic map ( -- 
        name => "num_558_548_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 10,
        out_data_width => 10,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => num_558,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => num_558_548_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- equivalence array_obj_ref_552_addr_0
    process(array_obj_ref_552_root_address) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_552_root_address;
      ov(9 downto 0) := iv;
      array_obj_ref_552_word_address_0 <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_552_gather_scatter
    process(array_obj_ref_552_data_0) --
      variable iv : std_logic_vector(36 downto 0);
      variable ov : std_logic_vector(36 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_552_data_0;
      ov(36 downto 0) := iv;
      array_obj_ref_552_wire <= ov(36 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_552_index_0_rename
    process(R_I_551_resized) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_I_551_resized;
      ov(9 downto 0) := iv;
      R_I_551_scaled <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_552_index_0_resize
    process(I_544) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := I_544;
      ov(9 downto 0) := iv;
      R_I_551_resized <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_552_index_offset
    process(R_I_551_scaled) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_I_551_scaled;
      ov(9 downto 0) := iv;
      array_obj_ref_552_final_offset <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_552_root_address_inst
    process(array_obj_ref_552_final_offset) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_552_final_offset;
      ov(9 downto 0) := iv;
      array_obj_ref_552_root_address <= ov(9 downto 0);
      --
    end process;
    do_while_stmt_542_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= ULT_u10_u1_562_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_542_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_542_branch_req_0,
          ack0 => do_while_stmt_542_branch_ack_0,
          ack1 => do_while_stmt_542_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u10_u10_557_inst
    process(I_544) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApIntAdd_proc(I_544, konst_556_wire_constant, tmp_var);
      num_558 <= tmp_var; --
    end process;
    -- binary operator ULT_u10_u1_562_inst
    process(num_558, buf_ptr_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUlt_proc(num_558, buf_ptr_buffer, tmp_var);
      ULT_u10_u1_562_wire <= tmp_var; --
    end process;
    -- shared load operator group (0) : array_obj_ref_552_load_0 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(36 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated: BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= array_obj_ref_552_load_0_req_0;
      array_obj_ref_552_load_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= array_obj_ref_552_load_0_req_1;
      array_obj_ref_552_load_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      LoadGroup0_gI: SplitGuardInterface generic map(name => "LoadGroup0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= array_obj_ref_552_word_address_0;
      array_obj_ref_552_data_0 <= data_out(36 downto 0);
      LoadReq: LoadReqSharedWithInputBuffers -- 
        generic map ( name => "LoadGroup0", addr_width => 10,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 17,
        min_clock_period => false,
        input_buffering => inBUFs, 
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => memory_space_0_lr_req(0),
          mack => memory_space_0_lr_ack(0),
          maddr => memory_space_0_lr_addr(9 downto 0),
          mtag => memory_space_0_lr_tag(17 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( name => "LoadGroup0 load-complete ",
        data_width => 37,
        num_reqs => 1,
        tag_length => 1,
        detailed_buffering_per_output => outBUFs, 
        no_arbitration => false)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => memory_space_0_lc_req(0),
          mack => memory_space_0_lc_ack(0),
          mdata => memory_space_0_lc_data(36 downto 0),
          mtag => memory_space_0_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    -- shared outport operator group (0) : WPIPE_mac_to_nic_data_550_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(36 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_mac_to_nic_data_550_inst_req_0;
      WPIPE_mac_to_nic_data_550_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_mac_to_nic_data_550_inst_req_1;
      WPIPE_mac_to_nic_data_550_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= array_obj_ref_552_wire;
      mac_to_nic_data_write_0_gI: SplitGuardInterface generic map(name => "mac_to_nic_data_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      mac_to_nic_data_write_0: OutputPortRevised -- 
        generic map ( name => "mac_to_nic_data", data_width => 37, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => mac_to_nic_data_pipe_write_req(0),
          oack => mac_to_nic_data_pipe_write_ack(0),
          odata => mac_to_nic_data_pipe_write_data(36 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end send_to_nic1_arch;
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
entity send_to_nic2 is -- 
  generic (tag_length : integer); 
  port ( -- 
    buf_ptr : in  std_logic_vector(9 downto 0);
    memory_space_1_lr_req : out  std_logic_vector(0 downto 0);
    memory_space_1_lr_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_lr_addr : out  std_logic_vector(9 downto 0);
    memory_space_1_lr_tag :  out  std_logic_vector(17 downto 0);
    memory_space_1_lc_req : out  std_logic_vector(0 downto 0);
    memory_space_1_lc_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_lc_data : in   std_logic_vector(36 downto 0);
    memory_space_1_lc_tag :  in  std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_req : out  std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_data : out  std_logic_vector(36 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity send_to_nic2;
architecture send_to_nic2_arch of send_to_nic2 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 10)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal buf_ptr_buffer :  std_logic_vector(9 downto 0);
  signal buf_ptr_update_enable: Boolean;
  -- output port buffer signals
  signal send_to_nic2_CP_802_start: Boolean;
  signal send_to_nic2_CP_802_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal num_584_574_buf_req_0 : boolean;
  signal num_584_574_buf_ack_0 : boolean;
  signal phi_stmt_570_ack_0 : boolean;
  signal phi_stmt_570_req_1 : boolean;
  signal num_584_574_buf_ack_1 : boolean;
  signal array_obj_ref_578_load_0_ack_1 : boolean;
  signal array_obj_ref_578_load_0_ack_0 : boolean;
  signal array_obj_ref_578_load_0_req_1 : boolean;
  signal do_while_stmt_568_branch_ack_0 : boolean;
  signal array_obj_ref_578_load_0_req_0 : boolean;
  signal do_while_stmt_568_branch_ack_1 : boolean;
  signal WPIPE_mac_to_nic_data_576_inst_req_1 : boolean;
  signal WPIPE_mac_to_nic_data_576_inst_req_0 : boolean;
  signal WPIPE_mac_to_nic_data_576_inst_ack_0 : boolean;
  signal WPIPE_mac_to_nic_data_576_inst_ack_1 : boolean;
  signal phi_stmt_570_req_0 : boolean;
  signal do_while_stmt_568_branch_req_0 : boolean;
  signal num_584_574_buf_req_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "send_to_nic2_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 10) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(9 downto 0) <= buf_ptr;
  buf_ptr_buffer <= in_buffer_data_out(9 downto 0);
  in_buffer_data_in(tag_length + 9 downto 10) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 9 downto 10);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  send_to_nic2_CP_802_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "send_to_nic2_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_to_nic2_CP_802_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= send_to_nic2_CP_802_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_to_nic2_CP_802_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  send_to_nic2_CP_802: Block -- control-path 
    signal send_to_nic2_CP_802_elements: BooleanArray(40 downto 0);
    -- 
  begin -- 
    send_to_nic2_CP_802_elements(0) <= send_to_nic2_CP_802_start;
    send_to_nic2_CP_802_symbol <= send_to_nic2_CP_802_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 branch_block_stmt_567/$entry
      -- CP-element group 0: 	 branch_block_stmt_567/branch_block_stmt_567__entry__
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_567/do_while_stmt_568__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	40 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_567/branch_block_stmt_567__exit__
      -- CP-element group 1: 	 branch_block_stmt_567/$exit
      -- CP-element group 1: 	 branch_block_stmt_567/do_while_stmt_568__exit__
      -- 
    send_to_nic2_CP_802_elements(1) <= send_to_nic2_CP_802_elements(40);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568__entry__
      -- CP-element group 2: 	 branch_block_stmt_567/do_while_stmt_568/$entry
      -- 
    send_to_nic2_CP_802_elements(2) <= send_to_nic2_CP_802_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	40 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568__exit__
      -- 
    -- Element group send_to_nic2_CP_802_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_567/do_while_stmt_568/loop_back
      -- 
    -- Element group send_to_nic2_CP_802_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	38 
    -- CP-element group 5: 	39 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_567/do_while_stmt_568/condition_done
      -- CP-element group 5: 	 branch_block_stmt_567/do_while_stmt_568/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_567/do_while_stmt_568/loop_taken/$entry
      -- 
    send_to_nic2_CP_802_elements(5) <= send_to_nic2_CP_802_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	37 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_567/do_while_stmt_568/loop_body_done
      -- 
    send_to_nic2_CP_802_elements(6) <= send_to_nic2_CP_802_elements(37);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	16 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/back_edge_to_loop_body
      -- 
    send_to_nic2_CP_802_elements(7) <= send_to_nic2_CP_802_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	18 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/first_time_through_loop_body
      -- 
    send_to_nic2_CP_802_elements(8) <= send_to_nic2_CP_802_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	12 
    -- CP-element group 9: 	13 
    -- CP-element group 9: 	36 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/loop_body_start
      -- 
    -- Element group send_to_nic2_CP_802_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	15 
    -- CP-element group 10: 	36 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/condition_evaluated
      -- 
    condition_evaluated_826_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_826_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(10), ack => do_while_stmt_568_branch_req_0); -- 
    send_to_nic2_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 5);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(15) & send_to_nic2_CP_802_elements(36);
      gj_send_to_nic2_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	15 
    -- CP-element group 11: successors 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_sample_start__ps
      -- 
    send_to_nic2_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(12) & send_to_nic2_CP_802_elements(15);
      gj_send_to_nic2_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	14 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (1) 
      -- CP-element group 12: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_sample_start_
      -- 
    send_to_nic2_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(9) & send_to_nic2_CP_802_elements(14);
      gj_send_to_nic2_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	9 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	31 
    -- CP-element group 13: successors 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_update_start__ps
      -- CP-element group 13: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_update_start_
      -- 
    send_to_nic2_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(9) & send_to_nic2_CP_802_elements(31);
      gj_send_to_nic2_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	37 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	12 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_sample_completed_
      -- CP-element group 14: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/aggregated_phi_sample_ack
      -- CP-element group 14: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_sample_completed__ps
      -- 
    -- Element group send_to_nic2_CP_802_elements(14) is bound as output of CP function.
    -- CP-element group 15:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	10 
    -- CP-element group 15: 	29 
    -- CP-element group 15: marked-successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (29) 
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_update_completed__ps
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_root_address_calculated
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_resize_0/$entry
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_word_address_calculated
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_resize_0/index_resize_req
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/aggregated_phi_update_ack
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_offset_calculated
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_final_index_sum_regn/$entry
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_final_index_sum_regn/$exit
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_final_index_sum_regn/req
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_final_index_sum_regn/ack
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_base_plus_offset/$entry
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_base_plus_offset/$exit
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_base_plus_offset/sum_rename_req
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_resized_0
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_word_addrgen/root_register_req
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_base_plus_offset/sum_rename_ack
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_resize_0/$exit
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_scale_0/scale_rename_ack
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_scale_0/scale_rename_req
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_word_addrgen/root_register_ack
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_computed_0
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_resize_0/index_resize_ack
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_update_completed_
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_scaled_0
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_scale_0/$entry
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_index_scale_0/$exit
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_word_addrgen/$entry
      -- CP-element group 15: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_word_addrgen/$exit
      -- 
    -- Element group send_to_nic2_CP_802_elements(15) is bound as output of CP function.
    -- CP-element group 16:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	7 
    -- CP-element group 16: successors 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_loopback_trigger
      -- 
    send_to_nic2_CP_802_elements(16) <= send_to_nic2_CP_802_elements(7);
    -- CP-element group 17:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (2) 
      -- CP-element group 17: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_loopback_sample_req
      -- CP-element group 17: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_loopback_sample_req_ps
      -- 
    phi_stmt_570_loopback_sample_req_841_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_570_loopback_sample_req_841_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(17), ack => phi_stmt_570_req_1); -- 
    -- Element group send_to_nic2_CP_802_elements(17) is bound as output of CP function.
    -- CP-element group 18:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	8 
    -- CP-element group 18: successors 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_entry_trigger
      -- 
    send_to_nic2_CP_802_elements(18) <= send_to_nic2_CP_802_elements(8);
    -- CP-element group 19:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (2) 
      -- CP-element group 19: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_entry_sample_req_ps
      -- CP-element group 19: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_entry_sample_req
      -- 
    phi_stmt_570_entry_sample_req_844_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_570_entry_sample_req_844_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(19), ack => phi_stmt_570_req_0); -- 
    -- Element group send_to_nic2_CP_802_elements(19) is bound as output of CP function.
    -- CP-element group 20:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_phi_mux_ack
      -- CP-element group 20: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/phi_stmt_570_phi_mux_ack_ps
      -- 
    phi_stmt_570_phi_mux_ack_847_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_570_ack_0, ack => send_to_nic2_CP_802_elements(20)); -- 
    -- CP-element group 21:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (4) 
      -- CP-element group 21: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_sample_start__ps
      -- CP-element group 21: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_sample_completed__ps
      -- CP-element group 21: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_sample_completed_
      -- 
    -- Element group send_to_nic2_CP_802_elements(21) is bound as output of CP function.
    -- CP-element group 22:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	24 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_update_start__ps
      -- CP-element group 22: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_update_start_
      -- 
    -- Element group send_to_nic2_CP_802_elements(22) is bound as output of CP function.
    -- CP-element group 23:  join  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	24 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_update_completed__ps
      -- 
    send_to_nic2_CP_802_elements(23) <= send_to_nic2_CP_802_elements(24);
    -- CP-element group 24:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	22 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	23 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/type_cast_573_update_completed_
      -- 
    -- Element group send_to_nic2_CP_802_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => send_to_nic2_CP_802_elements(22), ack => send_to_nic2_CP_802_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	27 
    -- CP-element group 25:  members (4) 
      -- CP-element group 25: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Sample/req
      -- CP-element group 25: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Sample/$entry
      -- CP-element group 25: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_sample_start__ps
      -- CP-element group 25: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_sample_start_
      -- 
    req_868_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_868_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(25), ack => num_584_574_buf_req_0); -- 
    -- Element group send_to_nic2_CP_802_elements(25) is bound as output of CP function.
    -- CP-element group 26:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (4) 
      -- CP-element group 26: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_update_start__ps
      -- CP-element group 26: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Update/$entry
      -- CP-element group 26: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_update_start_
      -- CP-element group 26: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Update/req
      -- 
    req_873_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_873_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(26), ack => num_584_574_buf_req_1); -- 
    -- Element group send_to_nic2_CP_802_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	25 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (4) 
      -- CP-element group 27: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_sample_completed__ps
      -- CP-element group 27: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Sample/ack
      -- CP-element group 27: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Sample/$exit
      -- CP-element group 27: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_sample_completed_
      -- 
    ack_869_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => num_584_574_buf_ack_0, ack => send_to_nic2_CP_802_elements(27)); -- 
    -- CP-element group 28:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: successors 
    -- CP-element group 28:  members (4) 
      -- CP-element group 28: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Update/$exit
      -- CP-element group 28: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_update_completed__ps
      -- CP-element group 28: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_Update/ack
      -- CP-element group 28: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/R_num_574_update_completed_
      -- 
    ack_874_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 28_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => num_584_574_buf_ack_1, ack => send_to_nic2_CP_802_elements(28)); -- 
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	15 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	31 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (5) 
      -- CP-element group 29: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/word_access_start/word_0/rr
      -- CP-element group 29: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/word_access_start/word_0/$entry
      -- CP-element group 29: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/word_access_start/$entry
      -- CP-element group 29: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/$entry
      -- CP-element group 29: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_sample_start_
      -- 
    rr_921_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_921_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(29), ack => array_obj_ref_578_load_0_req_0); -- 
    send_to_nic2_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(15) & send_to_nic2_CP_802_elements(31);
      gj_send_to_nic2_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: marked-predecessors 
    -- CP-element group 30: 	34 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (5) 
      -- CP-element group 30: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_update_start_
      -- CP-element group 30: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/$entry
      -- CP-element group 30: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/word_access_complete/word_0/cr
      -- CP-element group 30: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/word_access_complete/$entry
      -- CP-element group 30: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/word_access_complete/word_0/$entry
      -- 
    cr_932_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_932_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(30), ack => array_obj_ref_578_load_0_req_1); -- 
    send_to_nic2_cp_element_group_30: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_30"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= send_to_nic2_CP_802_elements(34);
      gj_send_to_nic2_cp_element_group_30 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(30), clk => clk, reset => reset); --
    end block;
    -- CP-element group 31:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	13 
    -- CP-element group 31: 	29 
    -- CP-element group 31:  members (5) 
      -- CP-element group 31: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/word_access_start/word_0/ra
      -- CP-element group 31: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_sample_completed_
      -- CP-element group 31: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/word_access_start/word_0/$exit
      -- CP-element group 31: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/word_access_start/$exit
      -- CP-element group 31: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Sample/$exit
      -- 
    ra_922_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_578_load_0_ack_0, ack => send_to_nic2_CP_802_elements(31)); -- 
    -- CP-element group 32:  transition  input  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	33 
    -- CP-element group 32:  members (9) 
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/word_access_complete/word_0/ca
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/word_access_complete/word_0/$exit
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/$exit
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/array_obj_ref_578_Merge/merge_req
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/array_obj_ref_578_Merge/$entry
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/array_obj_ref_578_Merge/merge_ack
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/word_access_complete/$exit
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_update_completed_
      -- CP-element group 32: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/array_obj_ref_578_Update/array_obj_ref_578_Merge/$exit
      -- 
    ca_933_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 32_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_578_load_0_ack_1, ack => send_to_nic2_CP_802_elements(32)); -- 
    -- CP-element group 33:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	32 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	35 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	34 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_sample_start_
      -- CP-element group 33: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Sample/$entry
      -- CP-element group 33: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Sample/req
      -- 
    req_946_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_946_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(33), ack => WPIPE_mac_to_nic_data_576_inst_req_0); -- 
    send_to_nic2_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(32) & send_to_nic2_CP_802_elements(35);
      gj_send_to_nic2_cp_element_group_33 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	33 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	35 
    -- CP-element group 34: marked-successors 
    -- CP-element group 34: 	30 
    -- CP-element group 34:  members (6) 
      -- CP-element group 34: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_sample_completed_
      -- CP-element group 34: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_update_start_
      -- CP-element group 34: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Update/req
      -- CP-element group 34: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Sample/$exit
      -- CP-element group 34: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Sample/ack
      -- CP-element group 34: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Update/$entry
      -- 
    ack_947_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 34_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mac_to_nic_data_576_inst_ack_0, ack => send_to_nic2_CP_802_elements(34)); -- 
    req_951_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_951_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_nic2_CP_802_elements(34), ack => WPIPE_mac_to_nic_data_576_inst_req_1); -- 
    -- CP-element group 35:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	34 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	37 
    -- CP-element group 35: marked-successors 
    -- CP-element group 35: 	33 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_update_completed_
      -- CP-element group 35: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Update/ack
      -- CP-element group 35: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/WPIPE_mac_to_nic_data_576_Update/$exit
      -- 
    ack_952_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 35_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mac_to_nic_data_576_inst_ack_1, ack => send_to_nic2_CP_802_elements(35)); -- 
    -- CP-element group 36:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	9 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	10 
    -- CP-element group 36:  members (1) 
      -- CP-element group 36: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group send_to_nic2_CP_802_elements(36) is a control-delay.
    cp_element_36_delay: control_delay_element  generic map(name => " 36_delay", delay_value => 1)  port map(req => send_to_nic2_CP_802_elements(9), ack => send_to_nic2_CP_802_elements(36), clk => clk, reset =>reset);
    -- CP-element group 37:  join  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	14 
    -- CP-element group 37: 	35 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	6 
    -- CP-element group 37:  members (1) 
      -- CP-element group 37: 	 branch_block_stmt_567/do_while_stmt_568/do_while_stmt_568_loop_body/$exit
      -- 
    send_to_nic2_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 5,1 => 5);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_nic2_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_nic2_CP_802_elements(14) & send_to_nic2_CP_802_elements(35);
      gj_send_to_nic2_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_nic2_CP_802_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  transition  input  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	5 
    -- CP-element group 38: successors 
    -- CP-element group 38:  members (2) 
      -- CP-element group 38: 	 branch_block_stmt_567/do_while_stmt_568/loop_exit/ack
      -- CP-element group 38: 	 branch_block_stmt_567/do_while_stmt_568/loop_exit/$exit
      -- 
    ack_957_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 38_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_568_branch_ack_0, ack => send_to_nic2_CP_802_elements(38)); -- 
    -- CP-element group 39:  transition  input  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	5 
    -- CP-element group 39: successors 
    -- CP-element group 39:  members (2) 
      -- CP-element group 39: 	 branch_block_stmt_567/do_while_stmt_568/loop_taken/$exit
      -- CP-element group 39: 	 branch_block_stmt_567/do_while_stmt_568/loop_taken/ack
      -- 
    ack_961_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 39_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_568_branch_ack_1, ack => send_to_nic2_CP_802_elements(39)); -- 
    -- CP-element group 40:  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	3 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	1 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_567/do_while_stmt_568/$exit
      -- 
    send_to_nic2_CP_802_elements(40) <= send_to_nic2_CP_802_elements(3);
    send_to_nic2_do_while_stmt_568_terminator_962: loop_terminator -- 
      generic map (name => " send_to_nic2_do_while_stmt_568_terminator_962", max_iterations_in_flight =>5) 
      port map(loop_body_exit => send_to_nic2_CP_802_elements(6),loop_continue => send_to_nic2_CP_802_elements(39),loop_terminate => send_to_nic2_CP_802_elements(38),loop_back => send_to_nic2_CP_802_elements(4),loop_exit => send_to_nic2_CP_802_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_570_phi_seq_875_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= send_to_nic2_CP_802_elements(18);
      send_to_nic2_CP_802_elements(21)<= src_sample_reqs(0);
      src_sample_acks(0)  <= send_to_nic2_CP_802_elements(21);
      send_to_nic2_CP_802_elements(22)<= src_update_reqs(0);
      src_update_acks(0)  <= send_to_nic2_CP_802_elements(23);
      send_to_nic2_CP_802_elements(19) <= phi_mux_reqs(0);
      triggers(1)  <= send_to_nic2_CP_802_elements(16);
      send_to_nic2_CP_802_elements(25)<= src_sample_reqs(1);
      src_sample_acks(1)  <= send_to_nic2_CP_802_elements(27);
      send_to_nic2_CP_802_elements(26)<= src_update_reqs(1);
      src_update_acks(1)  <= send_to_nic2_CP_802_elements(28);
      send_to_nic2_CP_802_elements(17) <= phi_mux_reqs(1);
      phi_stmt_570_phi_seq_875 : phi_sequencer_v2-- 
        generic map (place_capacity => 5, ntriggers => 2, name => "phi_stmt_570_phi_seq_875") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => send_to_nic2_CP_802_elements(11), 
          phi_sample_ack => send_to_nic2_CP_802_elements(14), 
          phi_update_req => send_to_nic2_CP_802_elements(13), 
          phi_update_ack => send_to_nic2_CP_802_elements(15), 
          phi_mux_ack => send_to_nic2_CP_802_elements(20), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_827_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= send_to_nic2_CP_802_elements(7);
        preds(1)  <= send_to_nic2_CP_802_elements(8);
        entry_tmerge_827 : transition_merge -- 
          generic map(name => " entry_tmerge_827")
          port map (preds => preds, symbol_out => send_to_nic2_CP_802_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal I_570 : std_logic_vector(9 downto 0);
    signal R_I_577_resized : std_logic_vector(9 downto 0);
    signal R_I_577_scaled : std_logic_vector(9 downto 0);
    signal ULT_u10_u1_588_wire : std_logic_vector(0 downto 0);
    signal array_obj_ref_578_data_0 : std_logic_vector(36 downto 0);
    signal array_obj_ref_578_final_offset : std_logic_vector(9 downto 0);
    signal array_obj_ref_578_offset_scale_factor_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_578_resized_base_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_578_root_address : std_logic_vector(9 downto 0);
    signal array_obj_ref_578_wire : std_logic_vector(36 downto 0);
    signal array_obj_ref_578_word_address_0 : std_logic_vector(9 downto 0);
    signal array_obj_ref_578_word_offset_0 : std_logic_vector(9 downto 0);
    signal konst_582_wire_constant : std_logic_vector(9 downto 0);
    signal num_584 : std_logic_vector(9 downto 0);
    signal num_584_574_buffered : std_logic_vector(9 downto 0);
    signal type_cast_573_wire_constant : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    array_obj_ref_578_offset_scale_factor_0 <= "0000000001";
    array_obj_ref_578_resized_base_address <= "0000000000";
    array_obj_ref_578_word_offset_0 <= "0000000000";
    konst_582_wire_constant <= "0000000001";
    type_cast_573_wire_constant <= "0000000000";
    phi_stmt_570: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_573_wire_constant & num_584_574_buffered;
      req <= phi_stmt_570_req_0 & phi_stmt_570_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_570",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_570_ack_0,
          idata => idata,
          odata => I_570,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_570
    num_584_574_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= num_584_574_buf_req_0;
      num_584_574_buf_ack_0<= wack(0);
      rreq(0) <= num_584_574_buf_req_1;
      num_584_574_buf_ack_1<= rack(0);
      num_584_574_buf : InterlockBuffer generic map ( -- 
        name => "num_584_574_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 10,
        out_data_width => 10,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => num_584,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => num_584_574_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- equivalence array_obj_ref_578_addr_0
    process(array_obj_ref_578_root_address) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_578_root_address;
      ov(9 downto 0) := iv;
      array_obj_ref_578_word_address_0 <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_578_gather_scatter
    process(array_obj_ref_578_data_0) --
      variable iv : std_logic_vector(36 downto 0);
      variable ov : std_logic_vector(36 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_578_data_0;
      ov(36 downto 0) := iv;
      array_obj_ref_578_wire <= ov(36 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_578_index_0_rename
    process(R_I_577_resized) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_I_577_resized;
      ov(9 downto 0) := iv;
      R_I_577_scaled <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_578_index_0_resize
    process(I_570) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := I_570;
      ov(9 downto 0) := iv;
      R_I_577_resized <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_578_index_offset
    process(R_I_577_scaled) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_I_577_scaled;
      ov(9 downto 0) := iv;
      array_obj_ref_578_final_offset <= ov(9 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_578_root_address_inst
    process(array_obj_ref_578_final_offset) --
      variable iv : std_logic_vector(9 downto 0);
      variable ov : std_logic_vector(9 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_578_final_offset;
      ov(9 downto 0) := iv;
      array_obj_ref_578_root_address <= ov(9 downto 0);
      --
    end process;
    do_while_stmt_568_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= ULT_u10_u1_588_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_568_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_568_branch_req_0,
          ack0 => do_while_stmt_568_branch_ack_0,
          ack1 => do_while_stmt_568_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u10_u10_583_inst
    process(I_570) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApIntAdd_proc(I_570, konst_582_wire_constant, tmp_var);
      num_584 <= tmp_var; --
    end process;
    -- binary operator ULT_u10_u1_588_inst
    process(num_584, buf_ptr_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUlt_proc(num_584, buf_ptr_buffer, tmp_var);
      ULT_u10_u1_588_wire <= tmp_var; --
    end process;
    -- shared load operator group (0) : array_obj_ref_578_load_0 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(36 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated: BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= array_obj_ref_578_load_0_req_0;
      array_obj_ref_578_load_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= array_obj_ref_578_load_0_req_1;
      array_obj_ref_578_load_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      LoadGroup0_gI: SplitGuardInterface generic map(name => "LoadGroup0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= array_obj_ref_578_word_address_0;
      array_obj_ref_578_data_0 <= data_out(36 downto 0);
      LoadReq: LoadReqSharedWithInputBuffers -- 
        generic map ( name => "LoadGroup0", addr_width => 10,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 17,
        min_clock_period => false,
        input_buffering => inBUFs, 
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => memory_space_1_lr_req(0),
          mack => memory_space_1_lr_ack(0),
          maddr => memory_space_1_lr_addr(9 downto 0),
          mtag => memory_space_1_lr_tag(17 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( name => "LoadGroup0 load-complete ",
        data_width => 37,
        num_reqs => 1,
        tag_length => 1,
        detailed_buffering_per_output => outBUFs, 
        no_arbitration => false)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => memory_space_1_lc_req(0),
          mack => memory_space_1_lc_ack(0),
          mdata => memory_space_1_lc_data(36 downto 0),
          mtag => memory_space_1_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    -- shared outport operator group (0) : WPIPE_mac_to_nic_data_576_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(36 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_mac_to_nic_data_576_inst_req_0;
      WPIPE_mac_to_nic_data_576_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_mac_to_nic_data_576_inst_req_1;
      WPIPE_mac_to_nic_data_576_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= array_obj_ref_578_wire;
      mac_to_nic_data_write_0_gI: SplitGuardInterface generic map(name => "mac_to_nic_data_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      mac_to_nic_data_write_0: OutputPortRevised -- 
        generic map ( name => "mac_to_nic_data", data_width => 37, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => mac_to_nic_data_pipe_write_req(0),
          oack => mac_to_nic_data_pipe_write_ack(0),
          odata => mac_to_nic_data_pipe_write_data(36 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end send_to_nic2_arch;
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
entity ahir_system is  -- system 
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
end entity; 
architecture ahir_system_arch  of ahir_system is -- system-architecture 
  -- interface signals to connect to memory space memory_space_0
  signal memory_space_0_lr_req :  std_logic_vector(0 downto 0);
  signal memory_space_0_lr_ack : std_logic_vector(0 downto 0);
  signal memory_space_0_lr_addr : std_logic_vector(9 downto 0);
  signal memory_space_0_lr_tag : std_logic_vector(17 downto 0);
  signal memory_space_0_lc_req : std_logic_vector(0 downto 0);
  signal memory_space_0_lc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_0_lc_data : std_logic_vector(36 downto 0);
  signal memory_space_0_lc_tag :  std_logic_vector(0 downto 0);
  signal memory_space_0_sr_req :  std_logic_vector(0 downto 0);
  signal memory_space_0_sr_ack : std_logic_vector(0 downto 0);
  signal memory_space_0_sr_addr : std_logic_vector(9 downto 0);
  signal memory_space_0_sr_data : std_logic_vector(36 downto 0);
  signal memory_space_0_sr_tag : std_logic_vector(17 downto 0);
  signal memory_space_0_sc_req : std_logic_vector(0 downto 0);
  signal memory_space_0_sc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_0_sc_tag :  std_logic_vector(0 downto 0);
  -- interface signals to connect to memory space memory_space_1
  signal memory_space_1_lr_req :  std_logic_vector(0 downto 0);
  signal memory_space_1_lr_ack : std_logic_vector(0 downto 0);
  signal memory_space_1_lr_addr : std_logic_vector(9 downto 0);
  signal memory_space_1_lr_tag : std_logic_vector(17 downto 0);
  signal memory_space_1_lc_req : std_logic_vector(0 downto 0);
  signal memory_space_1_lc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_1_lc_data : std_logic_vector(36 downto 0);
  signal memory_space_1_lc_tag :  std_logic_vector(0 downto 0);
  signal memory_space_1_sr_req :  std_logic_vector(0 downto 0);
  signal memory_space_1_sr_ack : std_logic_vector(0 downto 0);
  signal memory_space_1_sr_addr : std_logic_vector(9 downto 0);
  signal memory_space_1_sr_data : std_logic_vector(36 downto 0);
  signal memory_space_1_sr_tag : std_logic_vector(17 downto 0);
  signal memory_space_1_sc_req : std_logic_vector(0 downto 0);
  signal memory_space_1_sc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_1_sc_tag :  std_logic_vector(0 downto 0);
  -- declarations related to module isWriteToHeader
  -- declarations related to module load_buffer1
  component load_buffer1 is -- 
    generic (tag_length : integer); 
    port ( -- 
      next_buf_ptr_out : out  std_logic_vector(9 downto 0);
      pckt_status : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sr_addr : out  std_logic_vector(9 downto 0);
      memory_space_0_sr_data : out  std_logic_vector(36 downto 0);
      memory_space_0_sr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sc_tag :  in  std_logic_vector(0 downto 0);
      mac_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      mac_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mac_data_pipe_read_data : in   std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module load_buffer1
  signal load_buffer1_next_buf_ptr_out :  std_logic_vector(9 downto 0);
  signal load_buffer1_pckt_status :  std_logic_vector(0 downto 0);
  signal load_buffer1_out_args   : std_logic_vector(10 downto 0);
  signal load_buffer1_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal load_buffer1_tag_out   : std_logic_vector(1 downto 0);
  signal load_buffer1_start_req : std_logic;
  signal load_buffer1_start_ack : std_logic;
  signal load_buffer1_fin_req   : std_logic;
  signal load_buffer1_fin_ack : std_logic;
  -- caller side aggregated signals for module load_buffer1
  signal load_buffer1_call_reqs: std_logic_vector(0 downto 0);
  signal load_buffer1_call_acks: std_logic_vector(0 downto 0);
  signal load_buffer1_return_reqs: std_logic_vector(0 downto 0);
  signal load_buffer1_return_acks: std_logic_vector(0 downto 0);
  signal load_buffer1_call_tag: std_logic_vector(0 downto 0);
  signal load_buffer1_return_data: std_logic_vector(10 downto 0);
  signal load_buffer1_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module load_buffer2
  component load_buffer2 is -- 
    generic (tag_length : integer); 
    port ( -- 
      next_buf_ptr_out : out  std_logic_vector(9 downto 0);
      pckt_status : out  std_logic_vector(0 downto 0);
      memory_space_1_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_1_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_sr_addr : out  std_logic_vector(9 downto 0);
      memory_space_1_sr_data : out  std_logic_vector(36 downto 0);
      memory_space_1_sr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_1_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_1_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_sc_tag :  in  std_logic_vector(0 downto 0);
      mac_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      mac_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mac_data_pipe_read_data : in   std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module load_buffer2
  signal load_buffer2_next_buf_ptr_out :  std_logic_vector(9 downto 0);
  signal load_buffer2_pckt_status :  std_logic_vector(0 downto 0);
  signal load_buffer2_out_args   : std_logic_vector(10 downto 0);
  signal load_buffer2_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal load_buffer2_tag_out   : std_logic_vector(1 downto 0);
  signal load_buffer2_start_req : std_logic;
  signal load_buffer2_start_ack : std_logic;
  signal load_buffer2_fin_req   : std_logic;
  signal load_buffer2_fin_ack : std_logic;
  -- caller side aggregated signals for module load_buffer2
  signal load_buffer2_call_reqs: std_logic_vector(0 downto 0);
  signal load_buffer2_call_acks: std_logic_vector(0 downto 0);
  signal load_buffer2_return_reqs: std_logic_vector(0 downto 0);
  signal load_buffer2_return_acks: std_logic_vector(0 downto 0);
  signal load_buffer2_call_tag: std_logic_vector(0 downto 0);
  signal load_buffer2_return_data: std_logic_vector(10 downto 0);
  signal load_buffer2_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module nextDESTMAC
  -- declarations related to module nextLSTATE
  -- declarations related to module nextSRCMAC
  -- declarations related to module nicRxFromMacDaemon
  component nicRxFromMacDaemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      mac_to_nic_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_read_data : in   std_logic_vector(36 downto 0);
      nic_rx_to_header_pipe_write_req : out  std_logic_vector(0 downto 0);
      nic_rx_to_header_pipe_write_ack : in   std_logic_vector(0 downto 0);
      nic_rx_to_header_pipe_write_data : out  std_logic_vector(36 downto 0);
      nic_rx_to_packet_pipe_write_req : out  std_logic_vector(0 downto 0);
      nic_rx_to_packet_pipe_write_ack : in   std_logic_vector(0 downto 0);
      nic_rx_to_packet_pipe_write_data : out  std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module nicRxFromMacDaemon
  signal nicRxFromMacDaemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal nicRxFromMacDaemon_tag_out   : std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_start_req : std_logic;
  signal nicRxFromMacDaemon_start_ack : std_logic;
  signal nicRxFromMacDaemon_fin_req   : std_logic;
  signal nicRxFromMacDaemon_fin_ack : std_logic;
  -- declarations related to module read_from_tb
  component read_from_tb is -- 
    generic (tag_length : integer); 
    port ( -- 
      tb_in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      tb_in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      tb_in_pipe_pipe_read_data : in   std_logic_vector(63 downto 0);
      mac_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      mac_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      mac_data_pipe_write_data : out  std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module read_from_tb
  signal read_from_tb_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal read_from_tb_tag_out   : std_logic_vector(1 downto 0);
  signal read_from_tb_start_req : std_logic;
  signal read_from_tb_start_ack : std_logic;
  signal read_from_tb_fin_req   : std_logic;
  signal read_from_tb_fin_ack : std_logic;
  -- declarations related to module rx_fifo_reader
  component rx_fifo_reader is -- 
    generic (tag_length : integer); 
    port ( -- 
      load_buffer1_call_reqs : out  std_logic_vector(0 downto 0);
      load_buffer1_call_acks : in   std_logic_vector(0 downto 0);
      load_buffer1_call_tag  :  out  std_logic_vector(0 downto 0);
      load_buffer1_return_reqs : out  std_logic_vector(0 downto 0);
      load_buffer1_return_acks : in   std_logic_vector(0 downto 0);
      load_buffer1_return_data : in   std_logic_vector(10 downto 0);
      load_buffer1_return_tag :  in   std_logic_vector(0 downto 0);
      load_buffer2_call_reqs : out  std_logic_vector(0 downto 0);
      load_buffer2_call_acks : in   std_logic_vector(0 downto 0);
      load_buffer2_call_tag  :  out  std_logic_vector(0 downto 0);
      load_buffer2_return_reqs : out  std_logic_vector(0 downto 0);
      load_buffer2_return_acks : in   std_logic_vector(0 downto 0);
      load_buffer2_return_data : in   std_logic_vector(10 downto 0);
      load_buffer2_return_tag :  in   std_logic_vector(0 downto 0);
      send_to_nic2_call_reqs : out  std_logic_vector(0 downto 0);
      send_to_nic2_call_acks : in   std_logic_vector(0 downto 0);
      send_to_nic2_call_data : out  std_logic_vector(9 downto 0);
      send_to_nic2_call_tag  :  out  std_logic_vector(0 downto 0);
      send_to_nic2_return_reqs : out  std_logic_vector(0 downto 0);
      send_to_nic2_return_acks : in   std_logic_vector(0 downto 0);
      send_to_nic2_return_tag :  in   std_logic_vector(0 downto 0);
      send_to_nic1_call_reqs : out  std_logic_vector(0 downto 0);
      send_to_nic1_call_acks : in   std_logic_vector(0 downto 0);
      send_to_nic1_call_data : out  std_logic_vector(9 downto 0);
      send_to_nic1_call_tag  :  out  std_logic_vector(0 downto 0);
      send_to_nic1_return_reqs : out  std_logic_vector(0 downto 0);
      send_to_nic1_return_acks : in   std_logic_vector(0 downto 0);
      send_to_nic1_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module rx_fifo_reader
  signal rx_fifo_reader_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal rx_fifo_reader_tag_out   : std_logic_vector(1 downto 0);
  signal rx_fifo_reader_start_req : std_logic;
  signal rx_fifo_reader_start_ack : std_logic;
  signal rx_fifo_reader_fin_req   : std_logic;
  signal rx_fifo_reader_fin_ack : std_logic;
  -- declarations related to module send_header_to_tb
  component send_header_to_tb is -- 
    generic (tag_length : integer); 
    port ( -- 
      nic_rx_to_header_pipe_read_req : out  std_logic_vector(0 downto 0);
      nic_rx_to_header_pipe_read_ack : in   std_logic_vector(0 downto 0);
      nic_rx_to_header_pipe_read_data : in   std_logic_vector(36 downto 0);
      tb_out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      tb_out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      tb_out_pipe_pipe_write_data : out  std_logic_vector(63 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module send_header_to_tb
  signal send_header_to_tb_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal send_header_to_tb_tag_out   : std_logic_vector(1 downto 0);
  signal send_header_to_tb_start_req : std_logic;
  signal send_header_to_tb_start_ack : std_logic;
  signal send_header_to_tb_fin_req   : std_logic;
  signal send_header_to_tb_fin_ack : std_logic;
  -- declarations related to module send_packet_to_tb
  component send_packet_to_tb is -- 
    generic (tag_length : integer); 
    port ( -- 
      nic_rx_to_packet_pipe_read_req : out  std_logic_vector(0 downto 0);
      nic_rx_to_packet_pipe_read_ack : in   std_logic_vector(0 downto 0);
      nic_rx_to_packet_pipe_read_data : in   std_logic_vector(36 downto 0);
      tb_out_packet_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      tb_out_packet_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      tb_out_packet_pipe_pipe_write_data : out  std_logic_vector(63 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module send_packet_to_tb
  signal send_packet_to_tb_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal send_packet_to_tb_tag_out   : std_logic_vector(1 downto 0);
  signal send_packet_to_tb_start_req : std_logic;
  signal send_packet_to_tb_start_ack : std_logic;
  signal send_packet_to_tb_fin_req   : std_logic;
  signal send_packet_to_tb_fin_ack : std_logic;
  -- declarations related to module send_to_nic1
  component send_to_nic1 is -- 
    generic (tag_length : integer); 
    port ( -- 
      buf_ptr : in  std_logic_vector(9 downto 0);
      memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lr_addr : out  std_logic_vector(9 downto 0);
      memory_space_0_lr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lc_data : in   std_logic_vector(36 downto 0);
      memory_space_0_lc_tag :  in  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_data : out  std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module send_to_nic1
  signal send_to_nic1_buf_ptr :  std_logic_vector(9 downto 0);
  signal send_to_nic1_in_args    : std_logic_vector(9 downto 0);
  signal send_to_nic1_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal send_to_nic1_tag_out   : std_logic_vector(1 downto 0);
  signal send_to_nic1_start_req : std_logic;
  signal send_to_nic1_start_ack : std_logic;
  signal send_to_nic1_fin_req   : std_logic;
  signal send_to_nic1_fin_ack : std_logic;
  -- caller side aggregated signals for module send_to_nic1
  signal send_to_nic1_call_reqs: std_logic_vector(0 downto 0);
  signal send_to_nic1_call_acks: std_logic_vector(0 downto 0);
  signal send_to_nic1_return_reqs: std_logic_vector(0 downto 0);
  signal send_to_nic1_return_acks: std_logic_vector(0 downto 0);
  signal send_to_nic1_call_data: std_logic_vector(9 downto 0);
  signal send_to_nic1_call_tag: std_logic_vector(0 downto 0);
  signal send_to_nic1_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module send_to_nic2
  component send_to_nic2 is -- 
    generic (tag_length : integer); 
    port ( -- 
      buf_ptr : in  std_logic_vector(9 downto 0);
      memory_space_1_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_1_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_lr_addr : out  std_logic_vector(9 downto 0);
      memory_space_1_lr_tag :  out  std_logic_vector(17 downto 0);
      memory_space_1_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_1_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_lc_data : in   std_logic_vector(36 downto 0);
      memory_space_1_lc_tag :  in  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_data : out  std_logic_vector(36 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module send_to_nic2
  signal send_to_nic2_buf_ptr :  std_logic_vector(9 downto 0);
  signal send_to_nic2_in_args    : std_logic_vector(9 downto 0);
  signal send_to_nic2_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal send_to_nic2_tag_out   : std_logic_vector(1 downto 0);
  signal send_to_nic2_start_req : std_logic;
  signal send_to_nic2_start_ack : std_logic;
  signal send_to_nic2_fin_req   : std_logic;
  signal send_to_nic2_fin_ack : std_logic;
  -- caller side aggregated signals for module send_to_nic2
  signal send_to_nic2_call_reqs: std_logic_vector(0 downto 0);
  signal send_to_nic2_call_acks: std_logic_vector(0 downto 0);
  signal send_to_nic2_return_reqs: std_logic_vector(0 downto 0);
  signal send_to_nic2_return_acks: std_logic_vector(0 downto 0);
  signal send_to_nic2_call_data: std_logic_vector(9 downto 0);
  signal send_to_nic2_call_tag: std_logic_vector(0 downto 0);
  signal send_to_nic2_return_tag: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe mac_data
  signal mac_data_pipe_write_data: std_logic_vector(36 downto 0);
  signal mac_data_pipe_write_req: std_logic_vector(0 downto 0);
  signal mac_data_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe mac_data
  signal mac_data_pipe_read_data: std_logic_vector(73 downto 0);
  signal mac_data_pipe_read_req: std_logic_vector(1 downto 0);
  signal mac_data_pipe_read_ack: std_logic_vector(1 downto 0);
  -- aggregate signals for write to pipe mac_to_nic_data
  signal mac_to_nic_data_pipe_write_data: std_logic_vector(73 downto 0);
  signal mac_to_nic_data_pipe_write_req: std_logic_vector(1 downto 0);
  signal mac_to_nic_data_pipe_write_ack: std_logic_vector(1 downto 0);
  -- aggregate signals for read from pipe mac_to_nic_data
  signal mac_to_nic_data_pipe_read_data: std_logic_vector(36 downto 0);
  signal mac_to_nic_data_pipe_read_req: std_logic_vector(0 downto 0);
  signal mac_to_nic_data_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe nic_rx_to_header
  signal nic_rx_to_header_pipe_write_data: std_logic_vector(36 downto 0);
  signal nic_rx_to_header_pipe_write_req: std_logic_vector(0 downto 0);
  signal nic_rx_to_header_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe nic_rx_to_header
  signal nic_rx_to_header_pipe_read_data: std_logic_vector(36 downto 0);
  signal nic_rx_to_header_pipe_read_req: std_logic_vector(0 downto 0);
  signal nic_rx_to_header_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe nic_rx_to_packet
  signal nic_rx_to_packet_pipe_write_data: std_logic_vector(36 downto 0);
  signal nic_rx_to_packet_pipe_write_req: std_logic_vector(0 downto 0);
  signal nic_rx_to_packet_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe nic_rx_to_packet
  signal nic_rx_to_packet_pipe_read_data: std_logic_vector(36 downto 0);
  signal nic_rx_to_packet_pipe_read_req: std_logic_vector(0 downto 0);
  signal nic_rx_to_packet_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe tb_in_pipe
  signal tb_in_pipe_pipe_read_data: std_logic_vector(63 downto 0);
  signal tb_in_pipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal tb_in_pipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe tb_out_packet_pipe
  signal tb_out_packet_pipe_pipe_write_data: std_logic_vector(63 downto 0);
  signal tb_out_packet_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal tb_out_packet_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe tb_out_pipe
  signal tb_out_pipe_pipe_write_data: std_logic_vector(63 downto 0);
  signal tb_out_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal tb_out_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module load_buffer1
  load_buffer1_out_args <= load_buffer1_next_buf_ptr_out & load_buffer1_pckt_status ;
  -- call arbiter for module load_buffer1
  load_buffer1_arbiter: SplitCallArbiterNoInargs -- 
    generic map( --
      name => "SplitCallArbiterNoInargs", num_reqs => 1,
      return_data_width => 11,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => load_buffer1_call_reqs,
      call_acks => load_buffer1_call_acks,
      return_reqs => load_buffer1_return_reqs,
      return_acks => load_buffer1_return_acks,
      call_tag  => load_buffer1_call_tag,
      return_tag  => load_buffer1_return_tag,
      call_mtag => load_buffer1_tag_in,
      return_mtag => load_buffer1_tag_out,
      return_data =>load_buffer1_return_data,
      call_mreq => load_buffer1_start_req,
      call_mack => load_buffer1_start_ack,
      return_mreq => load_buffer1_fin_req,
      return_mack => load_buffer1_fin_ack,
      return_mdata => load_buffer1_out_args,
      clk => clk, 
      reset => reset --
    ); --
  load_buffer1_instance:load_buffer1-- 
    generic map(tag_length => 2)
    port map(-- 
      next_buf_ptr_out => load_buffer1_next_buf_ptr_out,
      pckt_status => load_buffer1_pckt_status,
      start_req => load_buffer1_start_req,
      start_ack => load_buffer1_start_ack,
      fin_req => load_buffer1_fin_req,
      fin_ack => load_buffer1_fin_ack,
      clk => clk,
      reset => reset,
      memory_space_0_sr_req => memory_space_0_sr_req(0 downto 0),
      memory_space_0_sr_ack => memory_space_0_sr_ack(0 downto 0),
      memory_space_0_sr_addr => memory_space_0_sr_addr(9 downto 0),
      memory_space_0_sr_data => memory_space_0_sr_data(36 downto 0),
      memory_space_0_sr_tag => memory_space_0_sr_tag(17 downto 0),
      memory_space_0_sc_req => memory_space_0_sc_req(0 downto 0),
      memory_space_0_sc_ack => memory_space_0_sc_ack(0 downto 0),
      memory_space_0_sc_tag => memory_space_0_sc_tag(0 downto 0),
      mac_data_pipe_read_req => mac_data_pipe_read_req(1 downto 1),
      mac_data_pipe_read_ack => mac_data_pipe_read_ack(1 downto 1),
      mac_data_pipe_read_data => mac_data_pipe_read_data(73 downto 37),
      tag_in => load_buffer1_tag_in,
      tag_out => load_buffer1_tag_out-- 
    ); -- 
  -- module load_buffer2
  load_buffer2_out_args <= load_buffer2_next_buf_ptr_out & load_buffer2_pckt_status ;
  -- call arbiter for module load_buffer2
  load_buffer2_arbiter: SplitCallArbiterNoInargs -- 
    generic map( --
      name => "SplitCallArbiterNoInargs", num_reqs => 1,
      return_data_width => 11,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => load_buffer2_call_reqs,
      call_acks => load_buffer2_call_acks,
      return_reqs => load_buffer2_return_reqs,
      return_acks => load_buffer2_return_acks,
      call_tag  => load_buffer2_call_tag,
      return_tag  => load_buffer2_return_tag,
      call_mtag => load_buffer2_tag_in,
      return_mtag => load_buffer2_tag_out,
      return_data =>load_buffer2_return_data,
      call_mreq => load_buffer2_start_req,
      call_mack => load_buffer2_start_ack,
      return_mreq => load_buffer2_fin_req,
      return_mack => load_buffer2_fin_ack,
      return_mdata => load_buffer2_out_args,
      clk => clk, 
      reset => reset --
    ); --
  load_buffer2_instance:load_buffer2-- 
    generic map(tag_length => 2)
    port map(-- 
      next_buf_ptr_out => load_buffer2_next_buf_ptr_out,
      pckt_status => load_buffer2_pckt_status,
      start_req => load_buffer2_start_req,
      start_ack => load_buffer2_start_ack,
      fin_req => load_buffer2_fin_req,
      fin_ack => load_buffer2_fin_ack,
      clk => clk,
      reset => reset,
      memory_space_1_sr_req => memory_space_1_sr_req(0 downto 0),
      memory_space_1_sr_ack => memory_space_1_sr_ack(0 downto 0),
      memory_space_1_sr_addr => memory_space_1_sr_addr(9 downto 0),
      memory_space_1_sr_data => memory_space_1_sr_data(36 downto 0),
      memory_space_1_sr_tag => memory_space_1_sr_tag(17 downto 0),
      memory_space_1_sc_req => memory_space_1_sc_req(0 downto 0),
      memory_space_1_sc_ack => memory_space_1_sc_ack(0 downto 0),
      memory_space_1_sc_tag => memory_space_1_sc_tag(0 downto 0),
      mac_data_pipe_read_req => mac_data_pipe_read_req(0 downto 0),
      mac_data_pipe_read_ack => mac_data_pipe_read_ack(0 downto 0),
      mac_data_pipe_read_data => mac_data_pipe_read_data(36 downto 0),
      tag_in => load_buffer2_tag_in,
      tag_out => load_buffer2_tag_out-- 
    ); -- 
  -- module nicRxFromMacDaemon
  nicRxFromMacDaemon_instance:nicRxFromMacDaemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => nicRxFromMacDaemon_start_req,
      start_ack => nicRxFromMacDaemon_start_ack,
      fin_req => nicRxFromMacDaemon_fin_req,
      fin_ack => nicRxFromMacDaemon_fin_ack,
      clk => clk,
      reset => reset,
      mac_to_nic_data_pipe_read_req => mac_to_nic_data_pipe_read_req(0 downto 0),
      mac_to_nic_data_pipe_read_ack => mac_to_nic_data_pipe_read_ack(0 downto 0),
      mac_to_nic_data_pipe_read_data => mac_to_nic_data_pipe_read_data(36 downto 0),
      nic_rx_to_header_pipe_write_req => nic_rx_to_header_pipe_write_req(0 downto 0),
      nic_rx_to_header_pipe_write_ack => nic_rx_to_header_pipe_write_ack(0 downto 0),
      nic_rx_to_header_pipe_write_data => nic_rx_to_header_pipe_write_data(36 downto 0),
      nic_rx_to_packet_pipe_write_req => nic_rx_to_packet_pipe_write_req(0 downto 0),
      nic_rx_to_packet_pipe_write_ack => nic_rx_to_packet_pipe_write_ack(0 downto 0),
      nic_rx_to_packet_pipe_write_data => nic_rx_to_packet_pipe_write_data(36 downto 0),
      tag_in => nicRxFromMacDaemon_tag_in,
      tag_out => nicRxFromMacDaemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  nicRxFromMacDaemon_tag_in <= (others => '0');
  nicRxFromMacDaemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => nicRxFromMacDaemon_start_req, start_ack => nicRxFromMacDaemon_start_ack,  fin_req => nicRxFromMacDaemon_fin_req,  fin_ack => nicRxFromMacDaemon_fin_ack);
  -- module read_from_tb
  read_from_tb_instance:read_from_tb-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => read_from_tb_start_req,
      start_ack => read_from_tb_start_ack,
      fin_req => read_from_tb_fin_req,
      fin_ack => read_from_tb_fin_ack,
      clk => clk,
      reset => reset,
      tb_in_pipe_pipe_read_req => tb_in_pipe_pipe_read_req(0 downto 0),
      tb_in_pipe_pipe_read_ack => tb_in_pipe_pipe_read_ack(0 downto 0),
      tb_in_pipe_pipe_read_data => tb_in_pipe_pipe_read_data(63 downto 0),
      mac_data_pipe_write_req => mac_data_pipe_write_req(0 downto 0),
      mac_data_pipe_write_ack => mac_data_pipe_write_ack(0 downto 0),
      mac_data_pipe_write_data => mac_data_pipe_write_data(36 downto 0),
      tag_in => read_from_tb_tag_in,
      tag_out => read_from_tb_tag_out-- 
    ); -- 
  -- module will be run forever 
  read_from_tb_tag_in <= (others => '0');
  read_from_tb_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => read_from_tb_start_req, start_ack => read_from_tb_start_ack,  fin_req => read_from_tb_fin_req,  fin_ack => read_from_tb_fin_ack);
  -- module rx_fifo_reader
  rx_fifo_reader_instance:rx_fifo_reader-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => rx_fifo_reader_start_req,
      start_ack => rx_fifo_reader_start_ack,
      fin_req => rx_fifo_reader_fin_req,
      fin_ack => rx_fifo_reader_fin_ack,
      clk => clk,
      reset => reset,
      load_buffer1_call_reqs => load_buffer1_call_reqs(0 downto 0),
      load_buffer1_call_acks => load_buffer1_call_acks(0 downto 0),
      load_buffer1_call_tag => load_buffer1_call_tag(0 downto 0),
      load_buffer1_return_reqs => load_buffer1_return_reqs(0 downto 0),
      load_buffer1_return_acks => load_buffer1_return_acks(0 downto 0),
      load_buffer1_return_data => load_buffer1_return_data(10 downto 0),
      load_buffer1_return_tag => load_buffer1_return_tag(0 downto 0),
      load_buffer2_call_reqs => load_buffer2_call_reqs(0 downto 0),
      load_buffer2_call_acks => load_buffer2_call_acks(0 downto 0),
      load_buffer2_call_tag => load_buffer2_call_tag(0 downto 0),
      load_buffer2_return_reqs => load_buffer2_return_reqs(0 downto 0),
      load_buffer2_return_acks => load_buffer2_return_acks(0 downto 0),
      load_buffer2_return_data => load_buffer2_return_data(10 downto 0),
      load_buffer2_return_tag => load_buffer2_return_tag(0 downto 0),
      send_to_nic1_call_reqs => send_to_nic1_call_reqs(0 downto 0),
      send_to_nic1_call_acks => send_to_nic1_call_acks(0 downto 0),
      send_to_nic1_call_data => send_to_nic1_call_data(9 downto 0),
      send_to_nic1_call_tag => send_to_nic1_call_tag(0 downto 0),
      send_to_nic1_return_reqs => send_to_nic1_return_reqs(0 downto 0),
      send_to_nic1_return_acks => send_to_nic1_return_acks(0 downto 0),
      send_to_nic1_return_tag => send_to_nic1_return_tag(0 downto 0),
      send_to_nic2_call_reqs => send_to_nic2_call_reqs(0 downto 0),
      send_to_nic2_call_acks => send_to_nic2_call_acks(0 downto 0),
      send_to_nic2_call_data => send_to_nic2_call_data(9 downto 0),
      send_to_nic2_call_tag => send_to_nic2_call_tag(0 downto 0),
      send_to_nic2_return_reqs => send_to_nic2_return_reqs(0 downto 0),
      send_to_nic2_return_acks => send_to_nic2_return_acks(0 downto 0),
      send_to_nic2_return_tag => send_to_nic2_return_tag(0 downto 0),
      tag_in => rx_fifo_reader_tag_in,
      tag_out => rx_fifo_reader_tag_out-- 
    ); -- 
  -- module will be run forever 
  rx_fifo_reader_tag_in <= (others => '0');
  rx_fifo_reader_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => rx_fifo_reader_start_req, start_ack => rx_fifo_reader_start_ack,  fin_req => rx_fifo_reader_fin_req,  fin_ack => rx_fifo_reader_fin_ack);
  -- module send_header_to_tb
  send_header_to_tb_instance:send_header_to_tb-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => send_header_to_tb_start_req,
      start_ack => send_header_to_tb_start_ack,
      fin_req => send_header_to_tb_fin_req,
      fin_ack => send_header_to_tb_fin_ack,
      clk => clk,
      reset => reset,
      nic_rx_to_header_pipe_read_req => nic_rx_to_header_pipe_read_req(0 downto 0),
      nic_rx_to_header_pipe_read_ack => nic_rx_to_header_pipe_read_ack(0 downto 0),
      nic_rx_to_header_pipe_read_data => nic_rx_to_header_pipe_read_data(36 downto 0),
      tb_out_pipe_pipe_write_req => tb_out_pipe_pipe_write_req(0 downto 0),
      tb_out_pipe_pipe_write_ack => tb_out_pipe_pipe_write_ack(0 downto 0),
      tb_out_pipe_pipe_write_data => tb_out_pipe_pipe_write_data(63 downto 0),
      tag_in => send_header_to_tb_tag_in,
      tag_out => send_header_to_tb_tag_out-- 
    ); -- 
  -- module will be run forever 
  send_header_to_tb_tag_in <= (others => '0');
  send_header_to_tb_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => send_header_to_tb_start_req, start_ack => send_header_to_tb_start_ack,  fin_req => send_header_to_tb_fin_req,  fin_ack => send_header_to_tb_fin_ack);
  -- module send_packet_to_tb
  send_packet_to_tb_instance:send_packet_to_tb-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => send_packet_to_tb_start_req,
      start_ack => send_packet_to_tb_start_ack,
      fin_req => send_packet_to_tb_fin_req,
      fin_ack => send_packet_to_tb_fin_ack,
      clk => clk,
      reset => reset,
      nic_rx_to_packet_pipe_read_req => nic_rx_to_packet_pipe_read_req(0 downto 0),
      nic_rx_to_packet_pipe_read_ack => nic_rx_to_packet_pipe_read_ack(0 downto 0),
      nic_rx_to_packet_pipe_read_data => nic_rx_to_packet_pipe_read_data(36 downto 0),
      tb_out_packet_pipe_pipe_write_req => tb_out_packet_pipe_pipe_write_req(0 downto 0),
      tb_out_packet_pipe_pipe_write_ack => tb_out_packet_pipe_pipe_write_ack(0 downto 0),
      tb_out_packet_pipe_pipe_write_data => tb_out_packet_pipe_pipe_write_data(63 downto 0),
      tag_in => send_packet_to_tb_tag_in,
      tag_out => send_packet_to_tb_tag_out-- 
    ); -- 
  -- module will be run forever 
  send_packet_to_tb_tag_in <= (others => '0');
  send_packet_to_tb_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => send_packet_to_tb_start_req, start_ack => send_packet_to_tb_start_ack,  fin_req => send_packet_to_tb_fin_req,  fin_ack => send_packet_to_tb_fin_ack);
  -- module send_to_nic1
  send_to_nic1_buf_ptr <= send_to_nic1_in_args(9 downto 0);
  -- call arbiter for module send_to_nic1
  send_to_nic1_arbiter: SplitCallArbiterNoOutargs -- 
    generic map( --
      name => "SplitCallArbiterNoOutargs", num_reqs => 1,
      call_data_width => 10,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => send_to_nic1_call_reqs,
      call_acks => send_to_nic1_call_acks,
      return_reqs => send_to_nic1_return_reqs,
      return_acks => send_to_nic1_return_acks,
      call_data  => send_to_nic1_call_data,
      call_tag  => send_to_nic1_call_tag,
      return_tag  => send_to_nic1_return_tag,
      call_mtag => send_to_nic1_tag_in,
      return_mtag => send_to_nic1_tag_out,
      call_mreq => send_to_nic1_start_req,
      call_mack => send_to_nic1_start_ack,
      return_mreq => send_to_nic1_fin_req,
      return_mack => send_to_nic1_fin_ack,
      call_mdata => send_to_nic1_in_args,
      clk => clk, 
      reset => reset --
    ); --
  send_to_nic1_instance:send_to_nic1-- 
    generic map(tag_length => 2)
    port map(-- 
      buf_ptr => send_to_nic1_buf_ptr,
      start_req => send_to_nic1_start_req,
      start_ack => send_to_nic1_start_ack,
      fin_req => send_to_nic1_fin_req,
      fin_ack => send_to_nic1_fin_ack,
      clk => clk,
      reset => reset,
      memory_space_0_lr_req => memory_space_0_lr_req(0 downto 0),
      memory_space_0_lr_ack => memory_space_0_lr_ack(0 downto 0),
      memory_space_0_lr_addr => memory_space_0_lr_addr(9 downto 0),
      memory_space_0_lr_tag => memory_space_0_lr_tag(17 downto 0),
      memory_space_0_lc_req => memory_space_0_lc_req(0 downto 0),
      memory_space_0_lc_ack => memory_space_0_lc_ack(0 downto 0),
      memory_space_0_lc_data => memory_space_0_lc_data(36 downto 0),
      memory_space_0_lc_tag => memory_space_0_lc_tag(0 downto 0),
      mac_to_nic_data_pipe_write_req => mac_to_nic_data_pipe_write_req(0 downto 0),
      mac_to_nic_data_pipe_write_ack => mac_to_nic_data_pipe_write_ack(0 downto 0),
      mac_to_nic_data_pipe_write_data => mac_to_nic_data_pipe_write_data(36 downto 0),
      tag_in => send_to_nic1_tag_in,
      tag_out => send_to_nic1_tag_out-- 
    ); -- 
  -- module send_to_nic2
  send_to_nic2_buf_ptr <= send_to_nic2_in_args(9 downto 0);
  -- call arbiter for module send_to_nic2
  send_to_nic2_arbiter: SplitCallArbiterNoOutargs -- 
    generic map( --
      name => "SplitCallArbiterNoOutargs", num_reqs => 1,
      call_data_width => 10,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => send_to_nic2_call_reqs,
      call_acks => send_to_nic2_call_acks,
      return_reqs => send_to_nic2_return_reqs,
      return_acks => send_to_nic2_return_acks,
      call_data  => send_to_nic2_call_data,
      call_tag  => send_to_nic2_call_tag,
      return_tag  => send_to_nic2_return_tag,
      call_mtag => send_to_nic2_tag_in,
      return_mtag => send_to_nic2_tag_out,
      call_mreq => send_to_nic2_start_req,
      call_mack => send_to_nic2_start_ack,
      return_mreq => send_to_nic2_fin_req,
      return_mack => send_to_nic2_fin_ack,
      call_mdata => send_to_nic2_in_args,
      clk => clk, 
      reset => reset --
    ); --
  send_to_nic2_instance:send_to_nic2-- 
    generic map(tag_length => 2)
    port map(-- 
      buf_ptr => send_to_nic2_buf_ptr,
      start_req => send_to_nic2_start_req,
      start_ack => send_to_nic2_start_ack,
      fin_req => send_to_nic2_fin_req,
      fin_ack => send_to_nic2_fin_ack,
      clk => clk,
      reset => reset,
      memory_space_1_lr_req => memory_space_1_lr_req(0 downto 0),
      memory_space_1_lr_ack => memory_space_1_lr_ack(0 downto 0),
      memory_space_1_lr_addr => memory_space_1_lr_addr(9 downto 0),
      memory_space_1_lr_tag => memory_space_1_lr_tag(17 downto 0),
      memory_space_1_lc_req => memory_space_1_lc_req(0 downto 0),
      memory_space_1_lc_ack => memory_space_1_lc_ack(0 downto 0),
      memory_space_1_lc_data => memory_space_1_lc_data(36 downto 0),
      memory_space_1_lc_tag => memory_space_1_lc_tag(0 downto 0),
      mac_to_nic_data_pipe_write_req => mac_to_nic_data_pipe_write_req(1 downto 1),
      mac_to_nic_data_pipe_write_ack => mac_to_nic_data_pipe_write_ack(1 downto 1),
      mac_to_nic_data_pipe_write_data => mac_to_nic_data_pipe_write_data(73 downto 37),
      tag_in => send_to_nic2_tag_in,
      tag_out => send_to_nic2_tag_out-- 
    ); -- 
  mac_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe mac_data",
      num_reads => 2,
      num_writes => 1,
      data_width => 37,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1024 --
    )
    port map( -- 
      read_req => mac_data_pipe_read_req,
      read_ack => mac_data_pipe_read_ack,
      read_data => mac_data_pipe_read_data,
      write_req => mac_data_pipe_write_req,
      write_ack => mac_data_pipe_write_ack,
      write_data => mac_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  mac_to_nic_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe mac_to_nic_data",
      num_reads => 1,
      num_writes => 2,
      data_width => 37,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1024 --
    )
    port map( -- 
      read_req => mac_to_nic_data_pipe_read_req,
      read_ack => mac_to_nic_data_pipe_read_ack,
      read_data => mac_to_nic_data_pipe_read_data,
      write_req => mac_to_nic_data_pipe_write_req,
      write_ack => mac_to_nic_data_pipe_write_ack,
      write_data => mac_to_nic_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  nic_rx_to_header_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe nic_rx_to_header",
      num_reads => 1,
      num_writes => 1,
      data_width => 37,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1024 --
    )
    port map( -- 
      read_req => nic_rx_to_header_pipe_read_req,
      read_ack => nic_rx_to_header_pipe_read_ack,
      read_data => nic_rx_to_header_pipe_read_data,
      write_req => nic_rx_to_header_pipe_write_req,
      write_ack => nic_rx_to_header_pipe_write_ack,
      write_data => nic_rx_to_header_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  nic_rx_to_packet_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe nic_rx_to_packet",
      num_reads => 1,
      num_writes => 1,
      data_width => 37,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1024 --
    )
    port map( -- 
      read_req => nic_rx_to_packet_pipe_read_req,
      read_ack => nic_rx_to_packet_pipe_read_ack,
      read_data => nic_rx_to_packet_pipe_read_data,
      write_req => nic_rx_to_packet_pipe_write_req,
      write_ack => nic_rx_to_packet_pipe_write_ack,
      write_data => nic_rx_to_packet_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  tb_in_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe tb_in_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 64,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => tb_in_pipe_pipe_read_req,
      read_ack => tb_in_pipe_pipe_read_ack,
      read_data => tb_in_pipe_pipe_read_data,
      write_req => tb_in_pipe_pipe_write_req,
      write_ack => tb_in_pipe_pipe_write_ack,
      write_data => tb_in_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  tb_out_packet_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe tb_out_packet_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 64,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => tb_out_packet_pipe_pipe_read_req,
      read_ack => tb_out_packet_pipe_pipe_read_ack,
      read_data => tb_out_packet_pipe_pipe_read_data,
      write_req => tb_out_packet_pipe_pipe_write_req,
      write_ack => tb_out_packet_pipe_pipe_write_ack,
      write_data => tb_out_packet_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  tb_out_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe tb_out_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 64,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => tb_out_pipe_pipe_read_req,
      read_ack => tb_out_pipe_pipe_read_ack,
      read_data => tb_out_pipe_pipe_read_data,
      write_req => tb_out_pipe_pipe_write_req,
      write_ack => tb_out_pipe_pipe_write_ack,
      write_data => tb_out_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  MemorySpace_memory_space_0: ordered_memory_subsystem -- 
    generic map(-- 
      name => "memory_space_0",
      num_loads => 1,
      num_stores => 1,
      addr_width => 10,
      data_width => 37,
      tag_width => 1,
      time_stamp_width => 17,
      number_of_banks => 1,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 10,
      base_bank_data_width => 37
      ) -- 
    port map(-- 
      lr_addr_in => memory_space_0_lr_addr,
      lr_req_in => memory_space_0_lr_req,
      lr_ack_out => memory_space_0_lr_ack,
      lr_tag_in => memory_space_0_lr_tag,
      lc_req_in => memory_space_0_lc_req,
      lc_ack_out => memory_space_0_lc_ack,
      lc_data_out => memory_space_0_lc_data,
      lc_tag_out => memory_space_0_lc_tag,
      sr_addr_in => memory_space_0_sr_addr,
      sr_data_in => memory_space_0_sr_data,
      sr_req_in => memory_space_0_sr_req,
      sr_ack_out => memory_space_0_sr_ack,
      sr_tag_in => memory_space_0_sr_tag,
      sc_req_in=> memory_space_0_sc_req,
      sc_ack_out => memory_space_0_sc_ack,
      sc_tag_out => memory_space_0_sc_tag,
      clock => clk,
      reset => reset); -- 
  MemorySpace_memory_space_1: ordered_memory_subsystem -- 
    generic map(-- 
      name => "memory_space_1",
      num_loads => 1,
      num_stores => 1,
      addr_width => 10,
      data_width => 37,
      tag_width => 1,
      time_stamp_width => 17,
      number_of_banks => 1,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 10,
      base_bank_data_width => 37
      ) -- 
    port map(-- 
      lr_addr_in => memory_space_1_lr_addr,
      lr_req_in => memory_space_1_lr_req,
      lr_ack_out => memory_space_1_lr_ack,
      lr_tag_in => memory_space_1_lr_tag,
      lc_req_in => memory_space_1_lc_req,
      lc_ack_out => memory_space_1_lc_ack,
      lc_data_out => memory_space_1_lc_data,
      lc_tag_out => memory_space_1_lc_tag,
      sr_addr_in => memory_space_1_sr_addr,
      sr_data_in => memory_space_1_sr_data,
      sr_req_in => memory_space_1_sr_req,
      sr_ack_out => memory_space_1_sr_ack,
      sr_tag_in => memory_space_1_sr_tag,
      sc_req_in=> memory_space_1_sc_req,
      sc_ack_out => memory_space_1_sc_ack,
      sc_tag_out => memory_space_1_sc_tag,
      clock => clk,
      reset => reset); -- 
  -- 
end ahir_system_arch;

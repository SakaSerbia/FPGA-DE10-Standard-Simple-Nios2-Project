library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debounce_inv is
  port(
		clk, reset_n  : in std_logic;
		button_n : in std_logic;
		pressed  : out std_logic
	  );
end debounce_inv;

architecture behavioral of debounce_inv is

	type state_type is (steady_zero, steady_one, potential_zero, potential_one);

	signal state, next_state : state_type;
	
	constant BOUNCING_LIMIT : natural := 100;
	signal debounce_counter : natural range 0 to BOUNCING_LIMIT;
	
begin

	debounce_fsm_state_transition : process(clk, reset_n)
	begin
		if (reset_n = '0') then
			state <= steady_zero;
		elsif (rising_edge(clk)) then
			state <= next_state;
		end if;
	
	end process;

	debounce_fsm_next_state: process (state, button_n, debounce_counter)
	begin
		--if reset_n = '0' then
		
				--state <= steady_zero;
				
		--elsif (rising_edge(clk)) then
			case state is
			
				when steady_zero =>
					if button_n = '0' then
						next_state <= potential_one;
					else
						next_state <= steady_zero;
					end if;
					
				when potential_one =>
					if button_n = '1' then
						next_state <= steady_zero;
					elsif debounce_counter >= BOUNCING_LIMIT then
						next_state <= steady_one;
					else
						next_state <= potential_one;
					end if;
					
				when steady_one =>
					if button_n = '1' then
						next_state <= potential_zero;
					else
						next_state <= steady_one;
					end if;
					
				when potential_zero =>
					if button_n = '0' then
						next_state <= steady_one;
					elsif debounce_counter >= BOUNCING_LIMIT then
						next_state <= steady_zero;
					else
						next_state <= potential_zero;
					end if;
					
				when others =>
					next_state <= steady_zero;				
			end case;
		--end if;
	end process;

	
	debounce_fsm_output: process (clk)
	begin
       if (rising_edge(clk)) then
			case state is
			
				when steady_zero =>					
					pressed <= '0';					
				   debounce_counter <= 0;

				when potential_one =>					
					pressed <= '0';					
					debounce_counter <= debounce_counter + 1;
					
				when steady_one =>					
					pressed <= '1';				
				   debounce_counter <= 0;
					
				when potential_zero =>
					pressed <= '1';
               debounce_counter <= debounce_counter + 1;
					
				when others =>
				   debounce_counter <= 0;
					pressed <= '0';			
			end case;
		end if;
	end process;
	
end behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm_generator is
  port(
		clk, reset_n  : in std_logic;
		pwm_in : in std_logic_vector(7 downto 0);
		pwm_out : out std_logic
	  );
end pwm_generator;

architecture behavioral of pwm_generator is

signal pwm_counter : std_logic_vector(7 downto 0);

begin
	process (clk, reset_n, pwm_counter)
	begin
		if (reset_n = '0') then
			pwm_counter <= (others => '0');
			pwm_out <= '0';
		elsif (rising_edge(clk)) then
			pwm_counter <= pwm_counter + 1;
			if (pwm_counter < pwm_in) then
				pwm_out <= '1';
			else
				pwm_out <= '0';
			end if;
		end if;
	end process;
end behavioral;
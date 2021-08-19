--- Digit driver module
---
--- Converts 4-bit digit into signal for 7-segment LED display

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_digit_driver is
port (
	enable:       IN  std_logic;
	binary_digit: IN  std_logic_vector(3 downto 0);
	led_digit:    OUT std_logic_vector(6 downto 0)
);
end led_digit_driver;

architecture synth of led_digit_driver is

begin
	digit_lut: process(enable, binary_digit)
	begin
		if (enable = '1') then
			case binary_digit is
				when "0000" => led_digit <= "1000000";
				when "0001" => led_digit <= "1111001";
				when "0010" => led_digit <= "0100100";
				when "0011" => led_digit <= "0110000";
				when "0100" => led_digit <= "0011001";
				when "0101" => led_digit <= "0010010";
				when "0110" => led_digit <= "0000010";
				when "0111" => led_digit <= "1111000";
				when "1000" => led_digit <= "0000000";
				when "1001" => led_digit <= "0010000";
				when "1010" => led_digit <= "0001000";
				when "1011" => led_digit <= "0000011";
				when "1100" => led_digit <= "1000110";
				when "1101" => led_digit <= "0100001";
				when "1110" => led_digit <= "0000110";
				when "1111" => led_digit <= "0001110";
				when others => led_digit <= "0000110";
			end case;
		else
			led_digit <= (others => '1');
		end if;
	end process;
end synth;
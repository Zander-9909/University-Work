library ieee;
use ieee.std_logic_1164.all;

entity and2bit is
	port(
	a,b : in STD_LOGIC;
	y   : out STD_LOGIC);
end and2bit;

architecture basic of and2bit is
begin
	ANDProcess : process(a,b) is
	begin
		y <= a AND b after 2 ns;
	end process ANDProcess;
end architecture basic;
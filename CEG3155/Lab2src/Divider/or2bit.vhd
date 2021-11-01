library ieee;
use ieee.std_logic_1164.all;

entity or2bit is
	port(
	a,b : in STD_LOGIC;
	y   : out STD_LOGIC);
end or2bit;

architecture basic of or2bit is
begin
	ORProcess : process(a,b) is
	begin
		y <= a OR b after 2 ns;
	end process ORProcess;
end architecture basic;
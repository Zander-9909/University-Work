library ieee;
use ieee.std_logic_1164.all;

entity xnor2bit is
	port(
	a,b : in STD_LOGIC;
	y   : out STD_LOGIC);
end xnor2bit;

architecture basic of xnor2bit is
begin
	XNORProcess : process(a,b) is
	begin 
		y <= a xnor b after 2 ns;
	end process XNORProcess;
end architecture basic;
library ieee;
use ieee.std_logic_1164.all;

entity xor2bit is
	port(
	a,b : in STD_LOGIC;
	y   : out STD_LOGIC);
end xor2bit;

architecture basic of xor2bit is
begin
	XORProcess : process(a,b) is
	begin 
		y <= a xor b after 2 ns;
	end process XORProcess;
end architecture basic;
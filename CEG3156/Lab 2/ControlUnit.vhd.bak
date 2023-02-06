library ieee;
use ieee.std_logic_1164.all;
--2x1 Mux

entity MUX2_1bit is
	port(s     : in std_logic; --Selection bit
		  d0,d1 : in std_logic; --Data bits
		  y     : out std_logic); --Out bit
end MUX2_1bit;

architecture rtl of MUX2_1bit is
signal notS : std_logic;

begin
   notS <= not s;
	y <= (notS and d0) or (s and d1);
end rtl;
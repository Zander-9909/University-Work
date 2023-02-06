library ieee;
use ieee.std_logic_1164.all;
--8x1 Mux

entity MUX2_5bit is
	port(s : in std_logic; --Selection bit
		  d1,d0 : in std_logic_vector(4 downto 0); --Data bits
		  y : out std_logic_vector(4 downto 0)); --Out bit
end MUX2_5bit;

architecture rtl of MUX2_5bit is
component MUX2_1bit is
	port(s     : in std_logic; --Selection bit
		  d0,d1 : in std_logic; --Data bits
		  y     : out std_logic); --Out bit
end component;

begin
mux0:MUX2_1bit
	port map(
		s => s,
		d1 => d1(0),
		d0 => d0(0),
		y => y(0));

mux1:MUX2_1bit
	port map(
		s => s,
		d1 => d1(1),
		d0 => d0(1),
		y => y(1));
		
mux2:MUX2_1bit
	port map(
		s => s,
		d1 => d1(2),
		d0 => d0(2),
		y => y(2));

mux3:MUX2_1bit
	port map(
		s => s,
		d1 => d1(3),
		d0 => d0(3),
		y => y(3));
		
mux4:MUX2_1bit
	port map(
		s => s,
		d1 => d1(4),
		d0 => d0(4),
		y => y(4));
end rtl;
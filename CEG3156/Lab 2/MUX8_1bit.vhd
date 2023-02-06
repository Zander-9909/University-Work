library ieee;
use ieee.std_logic_1164.all;
--8x1 Mux

entity MUX8_1bit is
	port(s2,s1,s0 : in std_logic; --Selection bit
		  d : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic); --Out bit
end MUX8_1bit;

architecture rtl of MUX8_1bit is
SIGNAL muxOuts:STD_logic_vector(1 downto 0);

component MUX4_1bit is
	port(s1,s0 : in std_logic; --Selection bit
		  d : in std_logic_vector(3 downto 0); --Data bits
		  y : out std_logic); --Out bit
end component;

component MUX2_1bit is
	port(s     : in std_logic; --Selection bit
		  d0,d1 : in std_logic; --Data bits
		  y     : out std_logic); --Out bit
end component;
begin
mux03:MUX4_1bit
	port map(
		s0 => s0,
		s1 => s1,
		d => d(3 downto 0),
		y => muxOuts(0));

mux47:MUX4_1bit
	port map(
		s0 => s0,
		s1 => s1,
		d => d(7 downto 4),
		y => muxOuts(1));

muxtop:MUX2_1bit
	port map(
		s => s2,
		d0 => muxOuts(0),
		d1 => muxOuts(1),
		y => y);
end rtl;
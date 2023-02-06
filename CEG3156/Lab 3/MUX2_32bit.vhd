library ieee;
use ieee.std_logic_1164.all;
--8x1 Mux

entity MUX2_32bit is
	port(s : in std_logic; --Selection bit
		  d1,d0 : in std_logic_vector(31 downto 0); --Data bits
		  y : out std_logic_vector(31 downto 0)); --Out bit
end MUX2_32bit;

architecture rtl of MUX2_32bit is
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

mux5:MUX2_1bit
	port map(
		s => s,
		d1 => d1(5),
		d0 => d0(5),
		y => y(5));
		
mux6:MUX2_1bit
	port map(
		s => s,
		d1 => d1(6),
		d0 => d0(6),
		y => y(6));

mux7:MUX2_1bit
	port map(
		s => s,
		d1 => d1(7),
		d0 => d0(7),
		y => y(7));
		
mux8:MUX2_1bit
	port map(
		s => s,
		d1 => d1(8),
		d0 => d0(8),
		y => y(8));

mux9:MUX2_1bit
	port map(
		s => s,
		d1 => d1(9),
		d0 => d0(9),
		y => y(9));
		
mux10:MUX2_1bit
	port map(
		s => s,
		d1 => d1(10),
		d0 => d0(10),
		y => y(10));

mux11:MUX2_1bit
	port map(
		s => s,
		d1 => d1(11),
		d0 => d0(11),
		y => y(11));
		
mux12:MUX2_1bit
	port map(
		s => s,
		d1 => d1(12),
		d0 => d0(12),
		y => y(12));

mux13:MUX2_1bit
	port map(
		s => s,
		d1 => d1(13),
		d0 => d0(13),
		y => y(13));
		
mux14:MUX2_1bit
	port map(
		s => s,
		d1 => d1(14),
		d0 => d0(14),
		y => y(14));

mux15:MUX2_1bit
	port map(
		s => s,
		d1 => d1(15),
		d0 => d0(15),
		y => y(15));

mux16:MUX2_1bit
	port map(
		s => s,
		d1 => d1(16),
		d0 => d0(16),
		y => y(16));

mux17:MUX2_1bit
	port map(
		s => s,
		d1 => d1(17),
		d0 => d0(17),
		y => y(17));
		
mux18:MUX2_1bit
	port map(
		s => s,
		d1 => d1(18),
		d0 => d0(18),
		y => y(18));

mux19:MUX2_1bit
	port map(
		s => s,
		d1 => d1(19),
		d0 => d0(19),
		y => y(19));
		
mux20:MUX2_1bit
	port map(
		s => s,
		d1 => d1(20),
		d0 => d0(20),
		y => y(20));

mux21:MUX2_1bit
	port map(
		s => s,
		d1 => d1(21),
		d0 => d0(21),
		y => y(21));
		
mux22:MUX2_1bit
	port map(
		s => s,
		d1 => d1(22),
		d0 => d0(22),
		y => y(22));

mux23:MUX2_1bit
	port map(
		s => s,
		d1 => d1(23),
		d0 => d0(23),
		y => y(23));
		
mux24:MUX2_1bit
	port map(
		s => s,
		d1 => d1(24),
		d0 => d0(24),
		y => y(24));

mux25:MUX2_1bit
	port map(
		s => s,
		d1 => d1(25),
		d0 => d0(25),
		y => y(25));
		
mux26:MUX2_1bit
	port map(
		s => s,
		d1 => d1(26),
		d0 => d0(26),
		y => y(26));

mux27:MUX2_1bit
	port map(
		s => s,
		d1 => d1(27),
		d0 => d0(27),
		y => y(27));
		
mux28:MUX2_1bit
	port map(
		s => s,
		d1 => d1(28),
		d0 => d0(28),
		y => y(28));

mux29:MUX2_1bit
	port map(
		s => s,
		d1 => d1(29),
		d0 => d0(29),
		y => y(29));
		
mux30:MUX2_1bit
	port map(
		s => s,
		d1 => d1(30),
		d0 => d0(30),
		y => y(30));

mux31:MUX2_1bit
	port map(
		s => s,
		d1 => d1(31),
		d0 => d0(31),
		y => y(31));
end rtl;
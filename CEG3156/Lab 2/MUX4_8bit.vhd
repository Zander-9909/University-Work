library ieee;
use ieee.std_logic_1164.all;
--4x1 Mux

entity MUX4_8bit is
	port(s  : in std_logic_vector(1 downto 0); --Selection bit
		  d0,d1,d2,d3 : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic_vector(7 downto 0)); --Out bit
end MUX4_8bit;

architecture rtl of MUX4_8bit is
Signal mux0,mux1,mux2,mux3,mux4,mux5,mux6,mux7:std_logic_vector(3 downto 0);
component MUX4_1bit is
	port(s1,s0 : in std_logic; --Selection bit
		  d : in std_logic_vector(3 downto 0); --Data bits
		  y : out std_logic); --Out bit
end component;
begin
mux0 <=d3(0)&d2(0)&d1(0)&d0(0);
mux1 <=d3(1)&d2(1)&d1(1)&d0(1);
mux2 <=d3(2)&d2(2)&d1(2)&d0(2);
mux3 <=d3(3)&d2(3)&d1(3)&d0(3);
mux4 <=d3(4)&d2(4)&d1(4)&d0(4);
mux5 <=d3(5)&d2(5)&d1(5)&d0(5);
mux6 <=d3(6)&d2(6)&d1(6)&d0(6);
mux7 <=d3(7)&d2(7)&d1(7)&d0(7);

m0:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux0,
		y => y(0));

m1:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux1,
		y => y(1));

m2:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux2,
		y => y(2));

m3:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux3,
		y => y(3));
		
m4:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux4,
		y => y(4));
		
m5:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux5,
		y => y(5));

m6:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux6,
		y => y(6));
		
m7:MUX4_1bit
port map(
		s1 => s(1),
		s0 => s(0),
		d => mux7,
		y => y(7));

end rtl;
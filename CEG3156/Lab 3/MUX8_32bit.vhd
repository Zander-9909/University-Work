library ieee;
use ieee.std_logic_1164.all;
--8x1 Mux

entity MUX8_32bit is
	port(s : in std_logic_vector(2 downto 0); --Selection bit
		  d0,d1,d2,d3 : in std_logic_vector(31 downto 0); --Data bits
		  d4,d5,d6,d7 : in std_logic_vector(31 downto 0); --Data bits
		  y : out std_logic_vector(31 downto 0)); --Out bit
end MUX8_32bit;

architecture rtl of MUX8_32bit is
SIGNAL MUX01Out,MUX23Out,MUX45Out,MUX67Out, MUX03Out, MUX47Out:STD_logic_vector(31 downto 0);

component MUX2_32bit is
	port(s     : in std_logic; --Selection bit
		  d0,d1 : in std_logic_vector(31 downto 0); --Data bits
		  y     : out std_logic_vector(31 downto 0)); --Out bit
end component;

begin
mux01:MUX2_32bit
	port map(
		s => s(0),
		d0 => d0(31 downto 0),
		d1 => d1(31 downto 0),
		y => MUX01Out);

mux23:MUX2_32bit
	port map(
		s => s(0),
		d0 => d2(31 downto 0),
		d1 => d3(31 downto 0),
		y => MUX23Out);

mux45:MUX2_32bit
	port map(
		s => s(0),
		d0 => d4(31 downto 0),
		d1 => d5(31 downto 0),
		y => MUX45Out);
		
mux67:MUX2_32bit
	port map(
		s => s(0),
		d0 => d6(31 downto 0),
		d1 => d7(31 downto 0),
		y => MUX67Out);

mux03:MUX2_32bit
	port map(
		s => s(1),
		d0 => MUX01Out,
		d1 => MUX23Out,
		y => MUX03Out);

mux47:MUX2_32bit
	port map(
		s => s(1),
		d0 => MUX45Out,
		d1 => MUX67Out,
		y => MUX47Out);
		

muxTop:MUX2_32bit
	port map(
		s => s(2),
		d0 => MUX03Out,
		d1 => MUX47Out,
		y => y);
end rtl;
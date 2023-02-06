library ieee;
use ieee.std_logic_1164.all;
--4x1 Mux

entity MUX32_8bit is
	port(s  : in std_logic_vector(4 downto 0); --Selection bit
		  d0,d1,d2,d3,d4,d5,d6,d7 : in std_logic_vector(7 downto 0); --Data bits
		  d8,d9,d10,d11,d12,d13,d14,d15 : in std_logic_vector(7 downto 0); --Data bits
		  d16,d17,d18,d19,d20,d21,d22,d23 : in std_logic_vector(7 downto 0); --Data bits
		  d24,d25,d26,d27,d28,d29,d30,d31 : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic_vector(7 downto 0)); --Out bit
end MUX32_8bit;

architecture rtl of MUX32_8bit is
Signal Mux0,Mux1,Mux2,Mux3 : std_logic_vector(7 downto 0);

component MUX4_8bit is
	port(s  : in std_logic_vector(1 downto 0); --Selection bit
		  d0,d1,d2,d3 : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic_vector(7 downto 0)); --Out bit
end component;

component MUX8_8bit is
	port(s  : in std_logic_vector(2 downto 0); --Selection bit
		  d0,d1,d2,d3,d4,d5,d6,d7 : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic_vector(7 downto 0)); --Out bit
end component;

begin
MUXTop:MUX4_8bit
	port map (
		s => s(4 downto 3),
		d0 => Mux0,
		d1 => Mux1,
		d2 => Mux2,
		d3 => Mux3,
		y => y );
MUX07:MUX8_8bit 
	port map (
		s => s(2 downto 0),
		d0 => d0,
		d1 => d1,
		d2 => d2,
		d3 => d3,
		d4 => d4,
		d5 => d5,
		d6 => d6,
		d7 => d7,
		y => MUX0
	);
MUX815:MUX8_8bit
	port map (
		s => s(2 downto 0),
		d0 => d8,
		d1 => d9,
		d2 => d10,
		d3 => d11,
		d4 => d12,
		d5 => d13,
		d6 => d14,
		d7 => d15,
		y => MUX1
	);
MUX1623:MUX8_8bit
	port map (
		s => s(2 downto 0),
		d0 => d16,
		d1 => d17,
		d2 => d18,
		d3 => d19,
		d4 => d20,
		d5 => d21,
		d6 => d22,
		d7 => d23,
		y => MUX2
	);
MUX3124:MUX8_8bit
	port map (
		s => s(2 downto 0),
		d0 => d24,
		d1 => d25,
		d2 => d26,
		d3 => d27,
		d4 => d28,
		d5 => d29,
		d6 => d30,
		d7 => d31,
		y => MUX3
	);

end rtl;
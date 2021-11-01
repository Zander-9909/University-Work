library ieee;
use ieee.std_logic_1164.all;

entity and3bit is
	port(
	a,b,c : in STD_LOGIC;
	y   : out STD_LOGIC);
end and3bit;

architecture rtl of and3bit is
	SIGNAL andAB : STD_LOGIC;

	COMPONENT and2bit -- 2 bit and gate 
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
begin
and0 : and2bit 
	port map (
		a => a,
		b => b,
		y => andAB
	);
and1 : and2bit 
	port map (
		a => andAB,
		b => c,
		y => y
	); 
end architecture rtl;
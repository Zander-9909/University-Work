library ieee;
use ieee.std_logic_1164.all;

entity and5bit is
	port(
	a,b,c,d,e : in STD_LOGIC;
	y   : out STD_LOGIC);
end and5bit;

architecture rtl of and5bit is
	SIGNAL andAB : STD_LOGIC;
	SIGNAL andCD : STD_LOGIC;
	SIGNAL andABCD : STD_LOGIC;

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
		a => c,
		b => d,
		y => andCD
	);
and2 : and2bit 
	port map (
		a => andAB,
		b => andCD,
		y => andABCD
	);
and3 : and2bit 
	port map (
		a => andABCD,
		b => e,
		y => y
	);
end architecture rtl;
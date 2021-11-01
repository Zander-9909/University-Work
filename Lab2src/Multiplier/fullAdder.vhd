library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
	port(
	A,B,Cin : in STD_LOGIC;
	Sum,Cout   : out STD_LOGIC);
end fullAdder;

architecture rtl of fullAdder is
	SIGNAL SUMSIG : STD_LOGIC;
	SIGNAL CARRY0 : STD_LOGIC;
	SIGNAL CARRY1 : STD_LOGIC;

	COMPONENT xor2bit -- 2 bit xor gate 
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT and2bit
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT or2bit
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
begin

xor0 : xor2bit
	port map (
		a => A,
		b => B,
		y => SUMSIG
	);

xor1 : xor2bit
	port map (
		a => SUMSIG,
		b => Cin,
		y => Sum
	);
	
and0 : and2bit 
	port map (
		a => A,
		b => B,
		y => CARRY0
	);
	
and1 : and2bit 
	port map (
		a => SUMSIG,
		b => Cin,
		y => CARRY1
	);
	
or0 : or2bit
	port map (
		a => CARRY0,
		b => CARRY1,
		y => Cout
	);

end architecture rtl;
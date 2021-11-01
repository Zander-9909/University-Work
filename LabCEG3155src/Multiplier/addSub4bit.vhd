library ieee;
use ieee.std_logic_1164.all;

entity addSub4bit is
	port(
	X, Y : in STD_LOGIC_VECTOR(3 downto 0);
	Control : in STD_LOGIC;-- 0 = add, 1 = subtract
	Sum : out STD_LOGIC_VECTOR(3 downto 0);
	Cout   : out STD_LOGIC);
end addSub4bit;

architecture rtl of addSub4bit is
	SIGNAL inv : STD_LOGIC_VECTOR (3 downto 0);
	SIGNAL carries : STD_LOGIC_VECTOR (2 downto 0);

	COMPONENT xor2bit -- 2 bit xor gate
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT fullAdder 
		port(
			A,B,Cin : in STD_LOGIC;
			Sum,Cout   : out STD_LOGIC);
	END COMPONENT;

begin
	
add0 : fullAdder
	port map(
		A => X(0),
		B => inv(0),
		Cin => Control,
		Sum => Sum(0),
		Cout => carries(0)
	);
	
add1 : fullAdder
	port map(
		A => X(1),
		B => inv(1),
		Cin => carries(0),
		Sum => Sum(1),
		Cout => carries(1)
	);
	
add2 : fullAdder
	port map(
		A => X(2),
		B => inv(2),
		Cin => carries(1),
		Sum => Sum(2),
		Cout => carries(2)
	);
	
add3 : fullAdder
	port map(
		A => X(3),
		B => inv(3),
		Cin => carries(2),
		Sum => Sum(3),
		Cout => Cout
	);

xor0 : xor2bit
	port map (
		a => Y(0),
		b => Control,
		y => inv(0)
	);
	
xor1 : xor2bit
	port map (
		a => Y(1),
		b => Control,
		y => inv(1)
	);

xor2 : xor2bit
	port map (
		a => Y(2),
		b => Control,
		y => inv(2)
	);
	
xor3 : xor2bit
	port map (
		a => Y(3),
		b => Control,
		y => inv(3)
	);
end architecture rtl;
library ieee;
use ieee.std_logic_1164.all;

entity fullAdder_8bit is
	port(
	A,B : in STD_LOGIC_vector(7 downto 0);
	Cin : in STD_LOGIC;
	Sum : out STD_LOGIC_vector(7 downto 0);
	Cout: out STD_LOGIC);
end fullAdder_8bit;

architecture rtl of fullAdder_8bit is
Signal cOuts : std_logic_vector(6 downto 0);

component fullAdder is
	port(
	A,B,Cin  : in STD_LOGIC;
	Sum,Cout : out STD_LOGIC);
end component;

begin
	
fa0:fullAdder
port map(
	A => A(0),
	B => B(0),
	Cin  => Cin,
	Sum  => Sum(0),
	Cout => cOuts(0));

fa1:fullAdder
port map(
	A => A(1),
	B => B(1),
	Cin  => cOuts(0),
	Sum  => Sum(1),
	Cout => cOuts(1));
	
fa2:fullAdder
port map(
	A => A(2),
	B => B(2),
	Cin  => cOuts(1),
	Sum  => Sum(2),
	Cout => cOuts(2));
	
fa3:fullAdder
port map(
	A => A(3),
	B => B(3),
	Cin  => cOuts(2),
	Sum  => Sum(3),
	Cout => cOuts(3));
	
fa4:fullAdder
port map(
	A => A(4),
	B => B(4),
	Cin  => cOuts(3),
	Sum  => Sum(4),
	Cout => cOuts(4));
	
fa5:fullAdder
port map(
	A => A(5),
	B => B(5),
	Cin  => cOuts(4),
	Sum  => Sum(5),
	Cout => cOuts(5));
	
fa6:fullAdder
port map(
	A => A(6),
	B => B(6),
	Cin  => cOuts(5),
	Sum  => Sum(6),
	Cout => cOuts(6));
	
fa7:fullAdder
port map(
	A => A(7),
	B => B(7),
	Cin  => cOuts(6),
	Sum  => Sum(7),
	Cout => Cout);


end architecture rtl;
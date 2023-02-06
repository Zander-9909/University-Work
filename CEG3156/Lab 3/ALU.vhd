library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port(
	A,B : in STD_LOGIC_VECTOR(7 downto 0);
	Operation: in STD_LOGIC_VECTOR(2 downto 0);
	ALUResult   : out STD_LOGIC_VECTOR(7 downto 0);
	Zero : out STD_LOGIC);
end ALU;

architecture rtl of ALU is
Signal AddSubOut,MuxOut,compOut: std_LOGIC_VECTOR(7 downto 0);
Signal AddSubCout : STD_LOGIC;

component MUX8_8bit is
	port(s  : in std_logic_vector(2 downto 0); --Selection bit
		  d0 : in std_logic_vector(7 downto 0); --Data bits
		  d1 : in std_logic_vector(7 downto 0); --Data bits
		  d2 : in std_logic_vector(7 downto 0); --Data bits
		  d3 : in std_logic_vector(7 downto 0); --Data bits
		  d4 : in std_logic_vector(7 downto 0); --Data bits
		  d5 : in std_logic_vector(7 downto 0); --Data bits
		  d6 : in std_logic_vector(7 downto 0); --Data bits
		  d7 : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic_vector(7 downto 0)); --Out bit
end component;

component AddSub_8bit is
	port(
	A,B : in STD_LOGIC_vector(7 downto 0);
	Sub : in STD_LOGIC;
	Sum : out STD_LOGIC_vector(7 downto 0);
	Cout: out STD_LOGIC);
end component;

component comparator8_bit
port(A,B : in std_logic_vector(7 downto 0); --Data bits
		  AgtB,BgtA,AeqB   : out std_logic); --Out bits
end component;

begin

comparator:comparator8_bit
port map(
	A => A,
	B => B,
	BgtA => compOut(0));
	
compOut (7 downto 1)<= "0000000";

fa:AddSub_8bit
port map(
	A    => A,
	B    => B,
	Sub  => Operation(2),
	Sum  => AddSubOut,
	Cout => AddSubCout);

mux:MUX8_8bit
port map(
		s  => Operation, --Selection bits
		d0 => A AND B, --AND
		d1 => A OR B, --OR
		d2 => AddSubOut, --add
		d3 => "00000000",--unused
		d4 => "00000000",--unused
		d5 => "00000000",--unused
		d6 => AddSubOut, --subtract
		d7 => compOut, --set-on-less-than
		y  => MuxOut); 

Zero <= 	(MuxOut(0)XNOR '0')AND(MuxOut(1)XNOR '0')AND(MuxOut(2)XNOR '0')AND(MuxOut(3)XNOR '0')AND(MuxOut(4)XNOR '0')AND(MuxOut(5)XNOR '0')AND(MuxOut(6)XNOR '0')AND(MuxOut(7)XNOR '0');
ALUResult <= MuxOut;
end architecture rtl;
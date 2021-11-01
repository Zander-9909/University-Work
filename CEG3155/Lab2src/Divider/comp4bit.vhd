library ieee;
use ieee.std_logic_1164.all;

entity comp4bit is
	port(
	A,B : in STD_LOGIC_VECTOR(3 downto 0);
	EQ,AG,BG   : out STD_LOGIC);--EQ = 1 if A = B, AG = 1 if A > B, BG = 1 if A < B
end comp4bit;

architecture rtl of comp4bit is
	SIGNAL ANOT,BNOT : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL EQ0,EQ1,EQ2,EQ3 : STD_LOGIC;
	SIGNAL AG0,AG1,AG2,AG3 : STD_LOGIC;
	SIGNAL BG0,BG1,BG2,BG3 : STD_LOGIC;

	COMPONENT xnor2bit
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT and5bit
		port(
			a,b,c,d,e : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT and2bit
		port(
			a,b : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT and3bit
		port(
			a,b,c : in STD_LOGIC;
			y   : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT or4bit
		port(
			a,b,c,d : in STD_LOGIC;
		y   : out STD_LOGIC);
	END COMPONENT;
begin

ANOT <= not A;
BNOT <= not B;

--FOR EQ, 4 XNOR gates into a 5 bit AND gate, with 1 input tied to '1', to make a 4 bit AND (Less to implement)
xnor0 : xnor2bit
	port map(
	a => A(0),
	b => B(0),
	y => EQ0
	);
	
xnor1 : xnor2bit
	port map(
	a => A(1),
	b => B(1),
	y => EQ1
	);
	
xnor2 : xnor2bit
	port map(
	a => A(2),
	b => B(2),
	y => EQ2
	);
	
xnor3 : xnor2bit
	port map(
	a => A(3),
	b => B(3),
	y => EQ3
	);
	
andEQ : and5bit
	port map(
	a => EQ0,
	b => EQ1,
	c => EQ2,
	d => EQ3,
	e => '1',
	y => EQ
	);

--FOR AG, 2 5 bit ANDs, 1 3 bit AND, 1 2 bit AND, and 4 bit OR (Ties into the XNORs from above)
andAG0 : and5bit --LSB
	port map(
	a => A(0),
	b => BNOT(0),
	c => EQ1,
	d => EQ2,
	e => EQ3,
	y => AG0
	);
andAG1 : and5bit --left of LSB
	port map(
	a => A(1),
	b => BNOT(1),
	c => '1',
	d => EQ2,
	e => EQ3,
	y => AG1
	);
andAG2 : and3bit --right of MSB
	port map(
	a => A(2),
	b => BNOT(2),
	c => EQ3,
	y => AG2
	);
andAG3 : and2bit --MSB
	port map(
	a => A(3),
	b => BNOT(3),
	y => AG3
	);
orAG : or4bit
port map(
	a => AG0,
	b => AG1,
	c => AG2,
	d => AG3,
	y => AG
	);

--FOR BG, 2 5 bit ANDs, 1 3 bit AND, 1 2 bit AND, and 4 bit OR (Ties into the XNORs from above)
andBG0 : and5bit --LSB
	port map(
	a => ANOT(0),
	b => B(0),
	c => EQ1,
	d => EQ2,
	e => EQ3,
	y => BG0
	);
andBG1 : and5bit --left of LSB
	port map(
	a => ANOT(1),
	b => B(1),
	c => '1',
	d => EQ2,
	e => EQ3,
	y => BG1
	);
andBG2 : and3bit --right of MSB
	port map(
	a => ANOT(2),
	b => B(2),
	c => EQ3,
	y => BG2
	);
andBG3 : and2bit --MSB
	port map(
	a => ANOT(3),
	b => B(3),
	y => BG3
	);
orBG : or4bit
port map(
	a => BG0,
	b => BG1,
	c => BG2,
	d => BG3,
	y => BG
	);


end architecture rtl;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--a parallel 8 bit 2x1 MUX
ENTITY MUX2_8bit IS
	PORT(
		d0,d1	  : IN	STD_LOGIC_VECTOR (7 downto 0);
		s		  : IN	STD_LOGIC;
		o_Value : OUT	STD_LOGIC_VECTOR(7 downto 0));
END MUX2_8bit;

ARCHITECTURE rtl OF MUX2_8bit IS

	COMPONENT MUX2_1bit is
	port(s     : in std_logic; --Selection bit
		  d0,d1 : in std_logic; --Data bits
		  y     : out std_logic); --Out bit
	end COMPONENT;

BEGIN
m0: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(0),
		d1 => d1(0),
		y => o_Value(0)
	);
m1: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(1),
		d1 => d1(1),
		y => o_Value(1)
	);
m2: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(2),
		d1 => d1(2),
		y => o_Value(2)
	);
m3: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(3),
		d1 => d1(3),
		y => o_Value(3)
	);
m4: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(4),
		d1 => d1(4),
		y => o_Value(4)
	);
m5: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(5),
		d1 => d1(5),
		y => o_Value(5)
	);
m6: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(6),
		d1 => d1(6),
		y => o_Value(6)
	);
m7: MUX2_1bit
	PORT MAP(
		s => s,
		d0 => d0(7),
		d1 => d1(7),
		y => o_Value(7)
	);
end rtl;
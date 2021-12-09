LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit8counter IS
	PORT(
		clk	: IN	STD_LOGIC;
		outValue	 : OUT	STD_LOGIC_VECTOR(7 downto 0));
END bit8counter;

ARCHITECTURE rtl OF bit8counter IS
	SIGNAL ffin    : STD_LOGIC_VECTOR(5 downto 0);
	SIGNAL ffout    : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL ffoutNOT : STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT jkFF_2
	PORT(
		i_j, i_k	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN
jk0 : jkFF_2 --LSB
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => clk,
		o_q => ffOut(0),
		o_qBar => ffOutNOT(0));

jk1 : jkFF_2
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNot(0),
		o_q => ffOut(1),
		o_qBar => ffOutNOT(1));
		
jk2 : jkFF_2
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNOT(1),
		o_q => ffOut(2),
		o_qBar => ffOutNOT(2));
		
jk3 : jkFF_2
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNOT(2),
		o_q => ffOut(3),
		o_qBar => ffOutNOT(3));
		
jk4 : jkFF_2 
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNOT(3),
		o_q => ffOut(4),
		o_qBar => ffOutNOT(4));

jk5 : jkFF_2
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNOT(4),
		o_q => ffOut(5),
		o_qBar => ffOutNOT(5));
		
jk6 : jkFF_2
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNOT(5),
		o_q => ffOut(6),
		o_qBar => ffOutNOT(6));
		
jk7 : jkFF_2--MSB
	PORT MAP(
		i_j => '1',
		i_k => '1',
		i_clock => ffOutNOT(6),
		o_q => ffOut(7),
		o_qBar => ffOutNOT(7));
outValue <= ffOut;
END;
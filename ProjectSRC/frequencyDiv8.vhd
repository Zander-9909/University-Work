---------------------------------------------------------
--   8 bit frequency Divider, for baud rate generator  --
---------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY frequencyDiv8 IS
	PORT(
		clk	: IN	STD_LOGIC;
		f_out	: OUT	STD_LOGIC_VECTOR(7 downto 0));
END frequencyDiv8;

ARCHITECTURE rtl OF frequencyDiv8 IS
	SIGNAL dsigs : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL qouts : STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT dFF_2 IS
	PORT(
		i_d			: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN 
bit0:dFF_2
	port map(
		i_d => dsigs(0),
		i_clock => clk,
		o_q => qouts(0),
		o_qBar => dsigs(0));

bit1:dFF_2
	port map(
		i_d => dsigs(1),
		i_clock => qouts(0),
		o_q => qouts(1),
		o_qBar => dsigs(1));

bit2:dFF_2
	port map(
		i_d => dsigs(2),
		i_clock => qouts(1),
		o_q => qouts(2),
		o_qBar => dsigs(2));

bit3:dFF_2
	port map(
		i_d => dsigs(3),
		i_clock => qouts(2),
		o_q => qouts(3),
		o_qBar => dsigs(3));

bit4:dFF_2
	port map(
		i_d => dsigs(4),
		i_clock => qouts(3),
		o_q => qouts(4),
		o_qBar => dsigs(4));

bit5:dFF_2
	port map(
		i_d => dsigs(5),
		i_clock => qouts(4),
		o_q => qouts(5),
		o_qBar => dsigs(5));

bit6:dFF_2
	port map(
		i_d => dsigs(6),
		i_clock => qouts(5),
		o_q => qouts(6),
		o_qBar => dsigs(6));

bit7:dFF_2
	port map(
		i_d => dsigs(7),
		i_clock => qouts(6),
		o_q => qouts(7),
		o_qBar => dsigs(7));
f_out <= qouts;
		
END rtl;

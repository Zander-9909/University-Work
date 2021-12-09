LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ESPL5counter IS
	PORT(
		resetBar, count, load, clk	: IN	STD_LOGIC;
		dataValue : IN STD_LOGIC_VECTOR(4 downto 0);
		outValue	 : OUT	STD_LOGIC_VECTOR(4 downto 0));
END ESPL5counter;

ARCHITECTURE rtl OF ESPL5counter IS
	SIGNAL notLoad : STD_LOGIC;
	SIGNAL notData : STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL aOut    : STD_LOGIC_VECTOR(4 downto 0);

	COMPONENT jkFF_2
	PORT(
		i_j, i_k	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN
notLoad <= not load;
notData <= not dataValue;
jk0 : jkFF_2
	PORT MAP(
		i_j => (load AND dataValue(0)) OR (count AND notLoad),
		i_k => (load AND notData(0)) OR (count AND notLoad),
		i_clock => clk,
		o_q => aOut(0));

jk1 : jkFF_2
	PORT MAP(
		i_j => (load AND dataValue(1)) OR (count AND notLoad AND aOut(0)),
		i_k => (load AND notData(1)) OR (count AND notLoad AND aOut(0)),
		i_clock => clk,
		o_q => aOut(1));
		
jk2 : jkFF_2
	PORT MAP(
		i_j => (load AND dataValue(2)) OR (count AND notLoad AND aOut(0) AND aOut(1)),
		i_k => (load AND notData(2)) OR (count AND notLoad AND aOut(0) AND aOut(1)),
		i_clock => clk,
		o_q => aOut(2));
		
jk3 : jkFF_2
	PORT MAP(
		i_j => (load AND dataValue(3)) OR (count AND notLoad AND aOut(0) AND aOut(1) AND aOut(2)),
		i_k => (load AND notData(3)) OR (count AND notLoad AND aOut(0) AND aOut(1) AND aOut(2)),
		i_clock => clk,
		o_q => aOut(3));
		
jk4 : jkFF_2
	PORT MAP(
		i_j => (load AND dataValue(4)) OR (count AND notLoad AND aOut(0) AND aOut(1) AND aOut(2) AND aOut(3)),
		i_k => (load AND notData(4)) OR (count AND notLoad AND aOut(0) AND aOut(1) AND aOut(2)AND aOut(3)),
		i_clock => clk,
		o_q => aOut(4));
outValue <= aOut;
END;
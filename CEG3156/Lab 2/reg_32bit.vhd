--------------------------------------------------------------------------------
--Eight bit register, based on the implementation of the 3bitregister by Professor Rami.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_32bit IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(31 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(31 downto 0));
END reg_32bit;

ARCHITECTURE rtl OF reg_32bit IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(31 downto 0);

	COMPONENT eightBitRegister
		PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
	END component;

BEGIN

reg07: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => i_load,
			  i_clock => i_clock,
			  o_Value => int_Value(7 downto 0));

reg815: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(15 downto 8), 
			  i_load => i_load,
			  i_clock => i_clock,
			  o_Value => int_Value(15 downto 8));

reg1623: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(23 downto 16), 
			  i_load => i_load,
			  i_clock => i_clock,
			  o_Value => int_Value(23 downto 16));

reg2431: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(31 downto 24), 
			  i_load => i_load,
			  i_clock => i_clock,
			  o_Value => int_Value(31 downto 24));

o_value <= int_Value;
END rtl;
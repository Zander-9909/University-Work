--------------------------------------------------------------------------------
--Eight bit register, based on the implementation of the 3bitregister by Professor Rami.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clkdiv IS
	PORT(
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC);
END clkdiv;

ARCHITECTURE rtl OF clkdiv IS
	SIGNAL int_notValue : STD_LOGIC;

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END component;

BEGIN

bit0: enARdFF_2 --the d flip-flop implementation done by Prof. Rami
	PORT MAP (i_resetBar => '1',
			  i_d => int_notValue, 
			  i_enable => '1',
			  i_clock => i_clock,
			  o_q => o_Value,
	        o_qBar => int_notValue);
			  
end rtl;
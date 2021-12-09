---------------------------------------------------------
--A Serial in, Parallel out Shift register: For the RDR--
--  Using Prof. Rami's implementation of the enardff_2 --
---------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SIPOReg8 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_shift  : IN  STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		s_out	: OUT	STD_LOGIC_VECTOR(7 downto 0));
END SIPOReg8;

ARCHITECTURE rtl OF SIPOReg8 IS
	SIGNAL d_sigs : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL q_outs : STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT enardFF_2 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN
	
bit0: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(1),
		i_clock => i_clock,
		o_q => q_outs(0)
	);
	
bit1: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(2),
		i_clock => i_clock,
		o_q => q_outs(1)
	);
	
bit2: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(3),
		i_clock => i_clock,
		o_q => q_outs(2)
	);
	
bit3: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(4),
		i_clock => i_clock,
		o_q => q_outs(3)
	);
	
bit4: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(5),
		i_clock => i_clock,
		o_q => q_outs(4)
	);
	
bit5: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(6),
		i_clock => i_clock,
		o_q => q_outs(5)
	);
	
bit6: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => q_outs(7),
		i_clock => i_clock,
		o_q => q_outs(6)
	);
	
bit7: enardFF_2
	Port map(
		i_resetBar => i_resetBar,
		i_enable => i_enable,
		i_d => i_shift,
		i_clock => i_clock,
		o_q => q_outs(7)
	);
--  Output Driver
	s_out		<=	q_outs;

END rtl;

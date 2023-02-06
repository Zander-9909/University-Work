--------------------------------------------------------------------------------
-- Title         : Type J-K Flip-Flop - 2nd realization
-- Project       : VHDL Synthesis Overview
-------------------------------------------------------------------------------
-- File          : jkFF_2.vhd
-- Author        : Rami Abielmona  <rabielmo@site.uottawa.ca>
-- Created       : 2003/05/17
-- Last modified : 2007/09/25
-------------------------------------------------------------------------------
-- Description : This file creates a flip-flop of type J-K as defined in the VHDL
--		 Synthesis lecture.  The architecture is done at the RTL
--		 abstraction level and the implementation is done in structural
--		 VHDL.
-------------------------------------------------------------------------------
-- Modification history :
-- 2003.05.17 	R. Abielmona		Creation
-- 2004.09.22 	R. Abielmona		Ported for CEG 3550
-- 2007.09.25 	R. Abielmona		Modified copyright notice
-------------------------------------------------------------------------------
-- This file is copyright material of Rami Abielmona, Ph.D., P.Eng., Chief Research
-- Scientist at Larus Technologies.  Permission to make digital or hard copies of part
-- or all of this work for personal or classroom use is granted without fee
-- provided that copies are not made or distributed for profit or commercial
-- advantage and that copies bear this notice and the full citation of this work.
-- Prior permission is required to copy, republish, redistribute or post this work.
-- This notice is adapted from the ACM copyright notice.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jkFF_2 IS
	PORT(
		i_j, i_k	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END jkFF_2;

ARCHITECTURE rtl OF jkFF_2 IS
	SIGNAL int_q, int_qBar, int_muxOutput : STD_LOGIC;
	SIGNAL int_jk : STD_LOGIC_VECTOR(1 downto 0);

	COMPONENT dFF_2
		PORT(
			i_d			: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

dFlipFlop: dFF_2
	PORT MAP (i_d => int_muxOutput, 
			  i_clock => i_clock,
			  o_q => int_q,
	          o_qBar => int_qBar);

int_jk			<=	i_j & i_k;
int_muxOutput	<=	int_q when int_jk = "00" else
					'0' when int_jk = "01" else
					'1' when int_jk = "10" else
					int_qBar;

	-- Output Driver
	o_q	<= int_q;
	o_qBar	<= int_qBar;

END rtl;

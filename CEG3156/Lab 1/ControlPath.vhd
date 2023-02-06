LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ControlPath IS
	PORT(
		EAeqEB,EAgtEB,EBgtEA,SAeqSB, MAgtMB, SA, MO7, SO: IN	STD_LOGIC;
		GClock,GReset	: IN	STD_LOGIC;
		loadMA,loadEA,loadSA,loadMB,loadEB,loadSB   : OUT	STD_LOGIC;
		incEB,shiftMB,incEA,shiftMA,loadEO,SMUX     : OUT STD_LOGIC;
		loadSO,loadMO,invB,invA,incEO,shiftMO,invMO : OUT STD_LOGIC);
END ControlPath;

ARCHITECTURE rtl OF ControlPath IS
SIGNAL ffOuts,ffIns : STD_LOGIC_VECTOR(10 downto 0);


	COMPONENT enARdFF_2 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN
s0: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(0),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_qBar	  => ffOuts(0));
s1: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(1),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(1));
s2: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(2),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(2));
s3: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(3),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(3));
s4: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(4),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(4));
s5: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(5),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(5));
s6: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(6),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(6));
s7: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(7),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(7));
s8: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(8),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(8));
s9: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(9),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(9));
s10: enARdFF_2
	PORT MAP(
		i_resetBar => GReset,
		i_d		  => ffIns(10),
		i_enable	  => '1',
		i_clock	  => GClock,
		o_q	  => ffOuts(10));
--Inputs from the datapath 
ffIns(0) <= '1';
ffIns(1) <= ffOuts(0) AND EAgtEB;
ffIns(2) <= ffOuts(0) AND EBgtEA;
ffIns(3) <= (ffOuts(0) OR ffOuts(1) OR ffOuts(2))AND EAeqEB;
ffIns(4) <= ffOuts(3)AND SAeqSB;
ffIns(5) <= ffOuts(3)AND NOT SAeqSB AND MAgtMB;
ffIns(6) <= ffOuts(3)AND NOT SAeqSB AND NOT MAgtMB;
ffIns(7) <= (ffOuts(5)OR ffOuts(6)) AND NOT SA;
ffIns(8) <= (ffOuts(5)OR ffOuts(6)) AND SA;
ffIns(9) <= (ffOuts(4)OR ffOuts(7) OR ffOuts(8))AND SO;
ffIns(10) <= ((ffOuts(9)OR ffOuts(10))AND NOT MO7)OR ((ffOuts(4)OR ffOuts(7) OR ffOuts(8))AND NOT SO AND NOT MO7);

--Outputs to the datapath
loadMA  <= ffOuts(0);
loadEA  <= ffOuts(0);
loadSA  <= ffOuts(0);
loadMB  <= ffOuts(0);
loadEB  <= ffOuts(0);
loadSB  <= ffOuts(0);
incEB   <= ffOuts(1);
shiftMB <= ffOuts(1);
incEA   <= ffOuts(2);
shiftMA <= ffOuts(2);
loadEO  <= ffOuts(3);
SMUX    <= ffOuts(4)OR ffOuts(6);
loadSO  <= ffOuts(4)OR ffOuts(5)OR ffOuts(6);
loadMO  <= ffOuts(4)OR ffOuts(7)OR ffOuts(8) OR ffOuts(9);
invB    <= ffOuts(7);
invA    <= ffOuts(8);
incEO   <= ffOuts(10);
shiftMO <= ffouts(10);
invMO   <= ffOuts(9);
end rtl;
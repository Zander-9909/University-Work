library ieee;
use ieee.std_logic_1164.all;

--This is a 1 bit, 4x1 MUX. 
entity MUX4_1bit is
	port(s0,s1,clk : in std_logic; --Selection bits and clock
		  d0,d1,d2,d3 : in std_logic; --Data bits
		  y : out std_logic); --Out bit
end MUX4_1bit;
--STRUCTURE
architecture structural of MUX4_1bit is
component NOTbasic --1 input NOT gate for inverting the selection bits 
	port(pin : in std_logic;
		  pout: out std_logic);
end component;

component and4 --4 input AND gates for MUX
	port(a0,a1,a2,a3 : in std_logic;
	     aout : out std_logic);
end component;

component or4 --4 input OR gates for selection
	port(r0,r1,r2,r3 : in std_logic;
	     rout : out std_logic);
end component;

signal sNOT0, sNOT1,t1,t2,t3,t4 : std_logic;
begin	
	NOT0 : NOTbasic port map (s0, sNOT0);
	NOT1 : NOTbasic port map (s1, sNOT1);
	A1 : and4 port map (d0, sNOT0,sNOT1,clk);--0th output (00)
	A2 : and4 port map (d1, s0,sNOT1,clk);--1st output (01)
	A3 : and4 port map (d2, sNOT0,s1,clk);--2nd output (10)
	A4 : and4 port map (d3, s0,s1,clk);--3rd output (11)
	O1 : or4  port map (t1,t2,t3,t4,y);--output of MUX
end structural;
--DATAFLOW
architecture dataflow of MUX4_1bit is
signal sNOT0,sNOT1, t1,t2,t3,t4 : std_logic;
begin
	muxBehavior : process (clk)
	begin
		sNOT0 <= not s0;
		sNOT1 <= not s1;
		if rising_edge(clk) then
			t1 <= d0 and sNOT0 and sNOT1; --creating the synchronized AND outputs (00)
			t2 <= d1 and s0 and sNOT1; --(01)
			t3 <= d2 and sNOT0 and s1;--(10)
			t4 <= d3 and s0 and s1;--(11)
			end if;
		y  <= t1 or t2 or t3 or t4;
		end process muxBehavior;
end dataflow;
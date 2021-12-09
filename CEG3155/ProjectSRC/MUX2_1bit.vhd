library ieee;
use ieee.std_logic_1164.all;

--This is a 1 bit, 4x1 MUX. 
entity MUX2_1bit is
	port(s,clk : in std_logic; --Selection bits and clock
		  d0,d1 : in std_logic; --Data bits
		  y : out std_logic); --Out bit
end MUX2_1bit;
--STRUCTURE
architecture structural of MUX2_1bit is
component NOTbasic --1 input NOT gate for inverting the selection bits 
	port(pin : in std_logic;
		  pout: out std_logic);
end component;

component and3 --3 input AND gates for MUX
	port(a0,a1,a2 : in std_logic;
	     aout : out std_logic);
end component;

component or2 --3 input OR gates for selection
	port(r0,r1 : in std_logic;
	     rout : out std_logic);
end component;

signal sNOT,t1,t2 : std_logic;
begin	
	NOT0 : NOTbasic port map (s, sNOT);
	A1 : and3 port map (d0, sNOT,clk);--0th output (00)
	A2 : and3 port map (d1, s,clk);--1st output (01)
	O1 : or2  port map (t1,t2,y);--output of MUX
end structural;
--DATAFLOW
architecture dataflow of MUX2_1bit is
signal sNOT,t1,t2 : std_logic;
begin
	muxBehavior : process (clk)
	begin
		sNOT <= not s;
		if rising_edge(clk) then
			t1 <= d0 and sNOT; --creating the synchronized AND outputs (0)
			t2 <= d1 and s; --(1)
			end if;
		y  <= t1 or t2;
		end process muxBehavior;
end dataflow;
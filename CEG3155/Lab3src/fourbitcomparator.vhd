library ieee;
use ieee.std_logic_1164.all;

entity fourbitcomparator is
	port(
	A,B : in STD_LOGIC_VECTOR(3 downto 0);
	EQ,AG,BG   : out STD_LOGIC);--EQ = 1 if A = B, AG = 1 if A > B, BG = 1 if A < B
end fourbitcomparator;

architecture rtl of fourbitcomparator is
	SIGNAL ANOT,BNOT : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL ASIG, BSIG : STD_LOGIC_VECTOR(3 downto 0);
begin
ANOT <= not A;
BNOT <= not B;

EQ <= (A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND (A(0) XNOR B(0));
AG <= (A(3) AND BNOT(3)) OR (A(2) AND BNOT(2) AND (A(3) XNOR BNOT(3))) OR (A(1) AND BNOT(1) AND (A(3) XNOR BNOT(3))AND (A(2) XNOR BNOT(2))) OR (A(0) AND BNOT(0) AND (A(3) XNOR BNOT(3))AND (A(2) XNOR BNOT(2))AND (A(1) XNOR BNOT(1)));
BG <= (B(3) AND ANOT(3)) OR (B(2) AND ANOT(2) AND (B(3) XNOR ANOT(3))) OR (B(1) AND ANOT(1) AND (B(3) XNOR ANOT(3))AND (B(2) XNOR ANOT(2))) OR (B(0) AND ANOT(0) AND (B(3) XNOR ANOT(3))AND (B(2) XNOR ANOT(2))AND (B(1) XNOR ANOT(1)));

end architecture rtl;
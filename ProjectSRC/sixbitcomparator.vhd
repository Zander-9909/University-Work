library ieee;
use ieee.std_logic_1164.all;

entity sixbitcomparator is
	port(
	A,B : in STD_LOGIC_VECTOR(5 downto 0);
	EQ,AG,BG   : out STD_LOGIC);--EQ = 1 if A = B, AG = 1 if A > B, BG = 1 if A < B
end sixbitcomparator;

architecture rtl of sixbitcomparator is
	SIGNAL ANOT,BNOT : STD_LOGIC_VECTOR(5 downto 0);
begin
ANOT <= not A;
BNOT <= not B;

EQ <= (A(5) XNOR B(5)) AND 
		(A(4) XNOR B(4)) AND
		(A(3) XNOR B(3)) AND
		(A(2) XNOR B(2)) AND
		(A(1) XNOR B(1)) AND
		(A(0) XNOR B(0));
		
AG <= (A(5) AND BNOT(5))OR
		(A(4) AND BNOT(4) AND (A(5)XNOR B(5))) OR
		(A(3) AND BNOT(3) AND (A(5)XNOR B(5))AND (A(4)XNOR B(4))) OR 
		(A(2) AND BNOT(2) AND (A(5)XNOR B(5))AND (A(4)XNOR B(4))AND (A(3)XNOR B(3))) OR 
		(A(1) AND BNOT(1) AND (A(5)XNOR B(5))AND (A(4)XNOR B(4))AND (A(3)XNOR B(3)) AND (A(2)XNOR B(2)))OR 
		(A(0) AND BNOT(0) AND (A(5)XNOR B(5))AND (A(4)XNOR B(4))AND (A(3)XNOR B(3)) AND (A(2)XNOR B(2))AND (A(1) XNOR B(1)));
		
BG <= (B(5) AND ANOT(5))OR
		(B(4) AND ANOT(4) AND (B(5)XNOR A(5))) OR
		(B(3) AND ANOT(3) AND (B(5)XNOR A(5))AND (B(4)XNOR A(4))) OR 
		(B(2) AND ANOT(2) AND (B(5)XNOR A(5))AND (B(4)XNOR A(4))AND (B(3)XNOR A(3))) OR 
		(B(1) AND ANOT(1) AND (B(5)XNOR A(5))AND (B(4)XNOR A(4))AND (B(3)XNOR A(3))AND (B(2)XNOR A(2))) OR 
		(B(0) AND ANOT(0) AND (B(5)XNOR A(5))AND (B(4)XNOR A(4))AND (B(3)XNOR A(3))AND (B(2)XNOR A(2))AND (B(1)XNOR A(1)));

end architecture rtl;
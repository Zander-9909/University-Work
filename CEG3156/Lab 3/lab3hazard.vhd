LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Hazard IS
PORT (
IDEXreadMEM : IN STD_LOGIC;
IDEXrt, IFIDrs, IFIDrt : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
stall : OUT STD_LOGIC
);
END Hazard;

ARCHITECTURE structural OF Hazard IS
SIGNAL eq1, eq2 : STD_LOGIC;

BEGIN
    eq1 <= (IDEXrt(4) XNOR IFIDrs(4)) AND (IDEXrt(3) XNOR IFIDrs(3)) AND (IDEXrt(2) XNOR IFIDrs(2)) AND (IDEXrt(1) XNOR
    IFIDrs(1)) AND (IDEXrt(0) XNOR IFIDrs(0));
    eq2 <= (IDEXrt(4) XNOR IFIDrt(4)) AND (IDEXrt(3) XNOR IFIDrt(3)) AND (IDEXrt(2) XNOR IFIDrt(2)) AND (IDEXrt(1) XNOR
    IFIDrt(1)) AND (IDEXrt(0) XNOR IFIDrt(0));
    stall <= IDEXreadMEM AND (eq1 OR eq2); 

END structural;
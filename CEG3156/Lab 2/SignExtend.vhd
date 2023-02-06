library ieee;
use ieee.std_logic_1164.all;
--Sign extension unit

entity SignExtend is
	port(Instruction16 : in std_logic_vector(15 downto 0);
		  Instruction32 : out std_logic_vector(31 downto 0)); 
end SignExtend;

architecture rtl of SignExtend is
signal sign : std_logic;
signal sigOut : std_logic_vector(31 downto 0);

begin
sign <= Instruction16(15);
sigOut(15 downto 0) <= Instruction16;
sigOut(16) <= sign;
sigOut(17) <= sign;
sigOut(18) <= sign;
sigOut(19) <= sign;
sigOut(20) <= sign;
sigOut(21) <= sign;
sigOut(22) <= sign;
sigOut(23) <= sign;
sigOut(24) <= sign;
sigOut(25) <= sign;
sigOut(26) <= sign;
sigOut(27) <= sign;
sigOut(28) <= sign;
sigOut(29) <= sign;
sigOut(30) <= sign;
sigOut(31) <= sign;

Instruction32 <= sigOut;

end rtl;
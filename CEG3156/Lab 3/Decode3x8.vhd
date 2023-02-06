library ieee;
use ieee.std_logic_1164.all;
--3x8 Decoder

entity Decode3x8 is
	port(s : in std_logic_vector(2 downto 0); --Selection bits
		  e : in std_logic; --enable
		  d : out std_logic_vector(7 downto 0)); --Out bits
end Decode3x8;

architecture rtl of Decode3x8 is

begin
	d(0) <= e and not s(2) and not s(1) and not s(0);
	d(1) <= e and not s(2) and not s(1) and  s(0);
	d(2) <= e and not s(2) and s(1) and not s(0);
	d(3) <= e and not s(2) and s(1) and s(0);
	d(4) <= e and s(2) and not s(1) and not s(0);
	d(5) <= e and s(2) and not s(1) and s(0);
	d(6) <= e and s(2) and s(1) and not s(0);
	d(7) <= e and s(2) and s(1) and s(0);
end rtl;
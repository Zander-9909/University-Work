library ieee;
use ieee.std_logic_1164.all;
--2x4 Decoder

entity Decode2x4 is
	port(s : in std_logic_vector(1 downto 0); --Selection bits
		  e : in std_logic; --enable
		  d : out std_logic_vector(3 downto 0)); --Out bits
end Decode2x4;

architecture rtl of Decode2x4 is

begin
	d(0) <= e and not s(1) and not s(0);
	d(1) <= e and not s(1) and s(0);
	d(2) <= e and s(1) and not s(0);
	d(3) <= e and s(1) and s(0);
end rtl;
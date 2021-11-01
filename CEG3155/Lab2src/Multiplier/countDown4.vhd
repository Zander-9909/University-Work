library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countDown4 is
	port(
	clk, dec, loadB : in STD_LOGIC;
	y   : out STD_LOGIC_VECTOR(2 downto 0));
end countDown4;

architecture rtl of countDown4 is
	SIGNAL count : unsigned(2 downto 0) := "100";	
begin

process (clk, dec, loadB)
    begin
		  if (loadB = '1') then
				count <= "100";
        elsif (rising_edge(clk)) then
            if (dec = '1') then
                count <= count - 1;   -- counting down
            end if;
        end if;
		  y <= std_logic_vector(count);
    end process;
end architecture rtl;	

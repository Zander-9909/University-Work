library ieee;
use ieee.std_logic_1164.all;

entity complementor8_bit is
	port(dataIn : in std_logic_vector(7 downto 0); --Data bits
		  dataOut: out std_logic_vector(7 downto 0)); --Out bits
end complementor8_bit;

architecture dataflow of complementor8_bit is
	use ieee.numeric_std.all;
	SIGNAL data : unsigned(7 downto 0);
begin
	compBehavior : process (dataIn)
	begin
		data <= unsigned(dataIn);
		dataOut <= std_logic_vector(NOT data + 1);
	end process compBehavior;
end dataflow;
library ieee;
use ieee.std_logic_1164.all;

--This is an 4 bit shift left register, used for "R" register
entity shiftReg4bit is
	port(shift,load,load0,lsb,sign,reset,clk : in std_logic; --Selection bits and clock
		  data : in std_logic_vector(3 downto 0); --Data bits, not used for this implementation
		  y : out std_logic_vector(3 downto 0)); --Out bits
end shiftReg4bit;

architecture dataflow of shiftReg4bit is
	use ieee.numeric_std.all;
	signal iniVal1: signed(3 downto 0) := "0000";
	signal iniVal2: signed(3 downto 0) := "1111";
	signal dataValueCurr   : signed(3 downto 0);
	signal dataValueNext   : signed (3 downto 0);
begin
	regBehavior : process (clk,reset)--repeating process
	begin
		if reset = '1' then --async reset
			if(sign = '1')then
					dataValueNext <= iniVal2;--load 1111
				else
					dataValueNext <= iniVal1;--load 0000
				end if;
		elsif rising_edge(clk) then --shifting on clock pulse
			if(shift = '1') then --SHIFT left, bringing in exterior "lsb" input
				dataValueNext(3) <= dataValueCurr(2);
				dataValueNext(2) <= dataValueCurr(1);
				dataValueNext(1) <= dataValueCurr(0);
				dataValueNext(0) <= lsb;
			elsif(load = '1')then --load in data input
				dataValueNext <= signed(data);--load data
			elsif(load0 = '1') then
				dataValueNext(3) <= dataValueCurr(3);
				dataValueNext(2) <= dataValueCurr(2);
				dataValueNext(1) <= dataValueCurr(1);
				dataValueNext(0) <= lsb;
			end if;
		end if;
		dataValueCurr <= dataValueNext;
		y <= std_logic_vector(dataValueCurr);--sending data to output
	end process regBehavior;
end dataflow;
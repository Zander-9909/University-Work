library ieee;
use ieee.std_logic_1164.all;

--This is an 4 bit shift left register, used for "R" register
entity shiftReg8bit is
	port(shift,load,resetBAR,clk : in std_logic; --Selection bits and clock
		  data : in std_logic_vector(7 downto 0); --Data bits, not used for this implementation
		  y : out std_logic_vector(7 downto 0)); --Out bits
end shiftReg8bit;

architecture structural of shiftReg8bit is
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT enARdFF_2--d flip-flop implementation by Prof. Rami
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;
	
begin
	ff0 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(0),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(0), 
			o_qBar	=> int_notValue(0));--unused bit, only need the non-inverted output
	
	ff1 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(1),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(1), 
			o_qBar	=> int_notValue(1));--unused bit, only need the non-inverted output
			
	ff2 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(2),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(2), 
			o_qBar	=> int_notValue(2));--unused bit, only need the non-inverted output

	ff3 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(3),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(3), 
			o_qBar	=> int_notValue(3));--unused bit, only need the non-inverted output
			
	ff4 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(4),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(4), 
			o_qBar	=> int_notValue(4));--unused bit, only need the non-inverted output
			
	ff5 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(5),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(5), 
			o_qBar	=> int_notValue(5));--unused bit, only need the non-inverted output
			
	ff6 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(6),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(6), 
			o_qBar	=> int_notValue(6));--unused bit, only need the non-inverted output
			
	ff7 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(7),
			i_enable	=> shift,
			i_clock	=> clk,
			o_q => int_Value(7), 
			o_qBar	=> int_notValue(7));--unused bit, only need the non-inverted output
			
end structural;

architecture dataflow of shiftReg8bit is
	use ieee.numeric_std.all;
	signal iniVal1: unsigned(7 downto 0) := "00000000";
	signal dataValueCurr   : unsigned(7 downto 0);
	signal dataValueNext   : unsigned(7 downto 0);
begin
	regBehavior : process (clk)--repeating process
	begin
		if resetBAR = '0' then --async reset
			dataValueNext <= iniVal1;
		elsif rising_edge(clk) then --shifting on clock pulse
			if(shift = '1') then --Circular shift right
				dataValueNext(7) <= dataValueCurr(0);
				dataValueNext(6) <= dataValueCurr(7);
				dataValueNext(5) <= dataValueCurr(6);
				dataValueNext(4) <= dataValueCurr(5);
				dataValueNext(3) <= dataValueCurr(4);
				dataValueNext(2) <= dataValueCurr(3);
				dataValueNext(1) <= dataValueCurr(2);
				dataValueNext(0) <= dataValueCurr(1);
			elsif(load = '1')then --load in data input
				dataValueNext <= unsigned(data);--load data
			end if;
		end if;
		dataValueCurr <= dataValueNext;
		y <= std_logic_vector(dataValueCurr);--sending data to output
	end process regBehavior;
end dataflow;
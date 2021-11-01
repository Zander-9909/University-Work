library ieee;
use ieee.std_logic_1164.all;

--This is an 4 bit register, PIPO
entity register4bit is
	port(load,resetBAR,clk : in std_logic; --Selection bits and clock
		  data : in std_logic_vector(3 downto 0); --Data bits, not used for this implementation
		  y : out std_logic_vector(3 downto 0)); --Out bits
end register4bit;

architecture structural of register4bit is
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(3 downto 0);

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
			i_enable	=> load,
			i_clock	=> clk,
			o_q => int_Value(0), 
			o_qBar	=> int_notValue(0));--unused bit, only need the non-inverted output
	
	ff1 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(1),
			i_enable	=> load,
			i_clock	=> clk,
			o_q => int_Value(1), 
			o_qBar	=> int_notValue(1));--unused bit, only need the non-inverted output
			
	ff2 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(2),
			i_enable	=> load,
			i_clock	=> clk,
			o_q => int_Value(2), 
			o_qBar	=> int_notValue(2));--unused bit, only need the non-inverted output

	ff3 : enARdFF_2 --implementation of an enabled d flip-flop from Prof. Rami
		port map(
			i_resetBar	=> resetBAR,
			i_d => data(3),
			i_enable	=> load,
			i_clock	=> clk,
			o_q => int_Value(3), 
			o_qBar	=> int_notValue(3));--unused bit, only need the non-inverted output
			
			y <= int_Value;
end structural;
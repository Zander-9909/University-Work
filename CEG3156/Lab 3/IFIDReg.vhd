library ieee;
use ieee.std_logic_1164.all;

entity IFIDReg is
	port(
		Enable, GClock, GReset : in std_logic;
		PCAdd4 : in std_LOGIC_VECTOR(7 downto 0);
		PCAdd4Out: out STD_LOGIC_VECTOR(7 downto 0);
		Instruction : in std_logic_vector(31 downto 0); 
		InstructionOut : Out std_logic_vector(31 downto 0)); 
end IFIDReg;

architecture rtl of IFIDReg is
	
	COMPONENT reg_8bit
		PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
	END component;
	
	Component reg_32bit
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(31 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(31 downto 0));
	end component;
begin


PCadd4Reg: reg_8bit
PORT MAP (i_resetBar => GReset,
	i_Value => PCAdd4(7 downto 0), 
	i_load => Enable,
	i_clock => GClock,
	o_Value => PCAdd4Out(7 downto 0));
	
instReg:reg_32bit
	PORT MAP(
		i_resetBar => GReset,
		i_load => Enable,
		i_clock => GClock,
		i_Value => Instruction(31 downto 0),
		o_Value => InstructionOut(31 downto 0));

end rtl;
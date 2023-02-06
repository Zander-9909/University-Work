library ieee;
use ieee.std_logic_1164.all;

entity IDEXReg is
	port(
		Enable, GClock, GReset : in std_logic;
		RegWrite,MemToReg : in std_logic; --WB Stage
		Branch, MemRead,MemWrite : in std_logic; --Memory access stage 
		RegDst,ALUSrc : in std_logic;-- Execution Stage
		ALUOp : in std_logic_vector(1 downto 0);-- Execution Stage
		ReadData1: in std_logic_vector(7 downto 0);
		ReadData2: in std_logic_vector(7 downto 0);
		Instruction : in std_logic_vector(31 downto 0);
		RegWriteOut,MemToRegOut : out std_logic; --WB Stage
		BranchOut, MemReadOut,MemWriteOut : out std_logic; --Memory access stage 
		RegDstOut,ALUSrcOut : out std_logic;-- Execution Stage
		ALUOpOut : out std_logic_vector(1 downto 0);-- Execution Stage
		ReadData1Out: Out std_logic_vector(7 downto 0);
		ReadData2Out: Out std_logic_vector(7 downto 0);
		InstructionOut : Out std_logic_vector(31 downto 0)); 
end IDEXReg;

architecture rtl of IDEXReg is

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END component;
	
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
--WB Stage
RWff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => RegWrite,
	i_enable => Enable,
	i_clock => GClock,
	o_q => RegWriteOut);

MtRff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => MemToReg,
	i_enable => Enable,
	i_clock => GClock,
	o_q => MemToRegOut);
--Memory Access
Brff:enaRdFF_2
Port map (
	i_resetBar => GReset,
	i_d => Branch,
	i_enable => Enable,
	i_clock => GClock,
	o_q => BranchOut);
	
MRff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => MemRead,
	i_enable => Enable,
	i_clock => GClock,
	o_q => MemReadOut);

MWRff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => MemWrite,
	i_enable => Enable,
	i_clock => GClock,
	o_q => MemWriteOut);
--Execution stage
RDstff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => RegDst,
	i_enable => Enable,
	i_clock => GClock,
	o_q => RegDstOut);
	
ALUSrcff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => ALUSrc,
	i_enable => Enable,
	i_clock => GClock,
	o_q => ALUSrcOut);
	
ALUOp0ff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => ALUOp(0),
	i_enable => Enable,
	i_clock => GClock,
	o_q => ALUOpOut(0));
	
ALUOp1ff:enARdFF_2
Port map (
	i_resetBar => GReset,
	i_d => ALUOp(1),
	i_enable => Enable,
	i_clock => GClock,
	o_q => ALUOpOut(1));


RD1Reg: reg_8bit
PORT MAP (i_resetBar => GReset,
	i_Value => ReadData1(7 downto 0), 
	i_load => Enable,
	i_clock => GClock,
	o_Value => ReadData1Out(7 downto 0));

RD2Reg: reg_8bit
PORT MAP (i_resetBar => GReset,
	i_Value => ReadData2(7 downto 0), 
	i_load => Enable,
	i_clock => GClock,
	o_Value => ReadData2Out(7 downto 0));
	
instReg:reg_32bit
	PORT MAP(
		i_resetBar => GReset,
		i_load => Enable,
		i_clock => GClock,
		i_Value => Instruction(31 downto 0),
		o_Value => InstructionOut(31 downto 0));

end rtl;
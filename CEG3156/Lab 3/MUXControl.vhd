library ieee;
use ieee.std_logic_1164.all;
--8x1 Mux

entity MUXControl is
	port(s : in std_logic; --Selection bit
		RegWrite,MemToReg : in std_logic; --WB Stage
		Branch, MemRead,MemWrite : in std_logic; --Memory access stage 
		RegDst,ALUSrc : in std_logic;-- Execution Stage
		ALUOp : in std_logic_vector(1 downto 0);-- Execution Stage
		RegWriteOut,MemToRegOut : out std_logic; --WB Stage
		BranchOut, MemReadOut,MemWriteOut : out std_logic; --Memory access stage 
		RegDstOut,ALUSrcOut : out std_logic;-- Execution Stage
		ALUOpOut : out std_logic_vector(1 downto 0));-- Execution Stage
end MUXControl;

architecture rtl of MUXControl is
component MUX2_1bit is
	port(s     : in std_logic; --Selection bit
		  d0,d1 : in std_logic; --Data bits
		  y     : out std_logic); --Out bit
end component;

begin
muxRegWrite:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => RegWrite,
		y => RegWriteOut);

muxMemToReg:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => MemToReg,
		y => MemToRegOut);
		
muxBranch:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => Branch,
		y => BranchOut);

muxMemRead:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => MemRead,
		y => MemReadOut);
		
muxMemWrite:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => MemWrite,
		y => MemWriteOut);

muxRegDst:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => RegDst,
		y => RegDstOut);
		
muxALUSrc:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => ALUSrc,
		y => ALUSrcOut);

muxALUOp0:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => ALUOp(0),
		y => ALUOpOut(0));
		
muxALUOp1:MUX2_1bit
	port map(
		s => s,
		d1 => '0',
		d0 => ALUOp(1),
		y => ALUOpOut(1));
end rtl;
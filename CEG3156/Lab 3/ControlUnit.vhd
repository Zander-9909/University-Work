library ieee;
use ieee.std_logic_1164.all;
--Processor Control unit

entity ControlUnit is
	port(OpCode : in std_logic_vector(5 downto 0); --OpCode
		  RegDst,ALUSrc,MemToReg,RegWrite,MemRead : out std_logic;
		  MemWrite,Branch,BranchNEQ,Jump : out std_logic;
		  ALUOp : out std_logic_vector(1 downto 0)); --Control signals
end ControlUnit;

architecture rtl of ControlUnit is
signal rFormat,lw,sw,beq,bne,j : std_logic;

begin
--Instruction type 
	rFormat <= not OpCode(0)AND not OpCode(1)AND not OpCode(2)AND not OpCode(3)AND not OpCode(4)AND not OpCode(5);-- 0, rFormat
	lw      <= OpCode(0)AND OpCode(1)AND not OpCode(2)AND not OpCode(3)AND not OpCode(4)AND OpCode(5);--35,lw
	sw      <= OpCode(0)AND OpCode(1)AND not OpCode(2)AND OpCode(3)AND not OpCode(4)AND OpCode(5);--43,sw
	beq     <= not OpCode(0)AND not OpCode(1)AND OpCode(2)AND not OpCode(3)AND not OpCode(4)AND not OpCode(5);--4, branch if equal
	bne     <= OpCode(0)AND not OpCode(1)AND OpCode(2)AND not OpCode(3)AND not OpCode(4)AND not OpCode(5);--5, branch if not equal
	j       <= not OpCode(0)AND OpCode(1)AND not OpCode(2)AND not OpCode(3)AND not OpCode(4)AND not OpCode(5);--2, jump
	
--Control signal outputs 
	RegDst    <= rFormat;
	ALUSrc    <= lw OR sw;
	MemToReg  <= lw;
	RegWrite  <= rFormat OR lw;
	MemRead   <= lw;
	MemWrite  <= sw;
	Branch    <= beq;
	BranchNEQ <= bne;
	ALUOp(1)  <= rFormat;
	ALUOp(0)  <= beq OR bne;
	Jump      <= j;
end rtl;
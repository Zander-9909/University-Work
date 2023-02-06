--32x8 bit register file
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegisterFile IS
	PORT(
		i_resetBar, RegWrite	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		ReadReg1,ReadReg2,WriteReg: IN STD_LOGIC_VECTOR(4 downto 0);
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		ReadData1,ReadData2			: OUT	STD_LOGIC_VECTOR(7 downto 0));
END RegisterFile;

ARCHITECTURE rtl OF RegisterFile IS
	Signal RegOut0,RegOut1,RegOut2,RegOut3,RegOut4,RegOut5,RegOut6,RegOut7 : std_logic_vector(7 downto 0); --Data bits
	Signal RegOut8,RegOut9,RegOut10,RegOut11,RegOut12,RegOut13,RegOut14,RegOut15 : std_logic_vector(7 downto 0); --Data bits
	Signal RegOut16,RegOut17,RegOut18,RegOut19,RegOut20,RegOut21,RegOut22,RegOut23 : std_logic_vector(7 downto 0); --Data bits
	Signal RegOut24,RegOut25,RegOut26,RegOut27,RegOut28,RegOut29,RegOut30,RegOut31 : std_logic_vector(7 downto 0); --Data bits
	Signal decodes : STD_LOGIC_VECTOR(31 downto 0);

	COMPONENT eightBitRegister
		PORT(
			i_resetBar, i_load	: IN	STD_LOGIC;
			i_clock			: IN	STD_LOGIC;
			i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
			o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
	END component;
	
	COMPONENT Decode5x32
		port(
			s : in std_logic_vector(4 downto 0); --Selection bits
			e : in std_logic;
			decode : out std_logic_vector(31 downto 0)); --Out bits
	end COMPONENT;
	
	COMPONENT MUX32_8bit is
	port(s  : in std_logic_vector(4 downto 0); --Selection bit
		  d0,d1,d2,d3,d4,d5,d6,d7 : in std_logic_vector(7 downto 0); --Data bits
		  d8,d9,d10,d11,d12,d13,d14,d15 : in std_logic_vector(7 downto 0); --Data bits
		  d16,d17,d18,d19,d20,d21,d22,d23 : in std_logic_vector(7 downto 0); --Data bits
		  d24,d25,d26,d27,d28,d29,d30,d31 : in std_logic_vector(7 downto 0); --Data bits
		  y : out std_logic_vector(7 downto 0)); --Out bit
	end COMPONENT;

BEGIN
decodeTop:Decode5x32
	port map(
		s => WriteReg,
		decode => decodes(31 downto 0),
		e => RegWrite
	);

reg0: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(0),
			  o_Value => RegOut0);

reg1: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(1),
			  o_Value => RegOut1);

reg2: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(2),
			  o_Value => RegOut2);

reg3: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(3),
			  o_Value => RegOut3);

reg4: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(4),
			  o_Value => RegOut4);

reg5: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(5),
			  o_Value => RegOut5);

reg6: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(6),
			  o_Value => RegOut6);

reg7: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(7),
			  o_Value => RegOut7);
			  
reg8: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(8),
			  o_Value => RegOut8);

reg9: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(9),
			  o_Value => RegOut9);

reg10: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(10),
			  o_Value => RegOut10);

reg11: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(11),
			  o_Value => RegOut11);

reg12: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(12),
			  o_Value => RegOut12);

reg13: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(13),
			  o_Value => RegOut13);

reg14: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(14),
			  o_Value => RegOut14);

reg15: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(15),
			  o_Value => RegOut15);
			  
reg16: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(16),
			  o_Value => RegOut16);

reg17: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(17),
			  o_Value => RegOut17);

reg18: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(18),
			  o_Value => RegOut18);

reg19: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(19),
			  o_Value => RegOut19);

reg20: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(20),
			  o_Value => RegOut20);

reg21: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(21),
			  o_Value => RegOut21);

reg22: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(22),
			  o_Value => RegOut22);

reg23: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(23),
			  o_Value => RegOut23);
			  
reg24: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(24),
			  o_Value => RegOut24);

reg25: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(25),
			  o_Value => RegOut25);

reg26: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(26),
			  o_Value => RegOut26);

reg27: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(27),
			  o_Value => RegOut27);

reg28: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(28),
			  o_Value => RegOut28);

reg29: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(29),
			  o_Value => RegOut29);

reg30: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(30),
			  o_Value => RegOut30);

reg31: eightbitRegister
	PORT MAP (i_resetBar => i_resetBar,
			  i_Value => i_Value(7 downto 0), 
			  i_load => '1',
			  i_clock => decodes(31),
			  o_Value => RegOut31);
Mux1:MUX32_8bit
	port map(
			s  => ReadReg1, --Selection bit
		  d0  => RegOut0,
		  d1  => RegOut1,
		  d2  => RegOut2,
		  d3  => RegOut3,
		  d4  => RegOut4,
		  d5  => RegOut5,
		  d6  => RegOut6,
		  d7  => RegOut7,
		  d8  => RegOut8,
		  d9  => RegOut9,
		  d10 => RegOut10,
		  d11 => RegOut11,
		  d12 => RegOut12,
		  d13 => RegOut13,
		  d14 => RegOut14,
		  d15 => RegOut15, 
		  d16 => RegOut16,
		  d17 => RegOut17,
		  d18 => RegOut18,
		  d19 => RegOut19,
		  d20 => RegOut20,
		  d21 => RegOut21, 
		  d22 => RegOut22,
		  d23 => RegOut23, 
		  d24 => RegOut24,
		  d25 => RegOut25,
		  d26 => RegOut26,
		  d27 => RegOut27,
		  d28 => RegOut28,
		  d29 => RegOut29,
		  d30 => RegOut30,
		  d31 => RegOut31,
		  y => ReadData1
	);
	
Mux2:MUX32_8bit
	port map(
			s  => ReadReg2, --Selection bit
		  d0  => RegOut0,
		  d1  => RegOut1,
		  d2  => RegOut2,
		  d3  => RegOut3,
		  d4  => RegOut4,
		  d5  => RegOut5,
		  d6  => RegOut6,
		  d7  => RegOut7,
		  d8  => RegOut8,
		  d9  => RegOut9,
		  d10 => RegOut10,
		  d11 => RegOut11,
		  d12 => RegOut12,
		  d13 => RegOut13,
		  d14 => RegOut14,
		  d15 => RegOut15, 
		  d16 => RegOut16,
		  d17 => RegOut17,
		  d18 => RegOut18,
		  d19 => RegOut19,
		  d20 => RegOut20,
		  d21 => RegOut21, 
		  d22 => RegOut22,
		  d23 => RegOut23, 
		  d24 => RegOut24,
		  d25 => RegOut25,
		  d26 => RegOut26,
		  d27 => RegOut27,
		  d28 => RegOut28,
		  d29 => RegOut29,
		  d30 => RegOut30,
		  d31 => RegOut31,
		  y => ReadData2
	);
END rtl;

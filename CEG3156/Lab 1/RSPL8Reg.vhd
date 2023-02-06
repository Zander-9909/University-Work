LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--Load = 0, Shift = 1
ENTITY RSPL8Reg IS
	PORT(
		i_resetBar, i_load, shift: IN	STD_LOGIC;
		i_clock, shift_val		 : IN	STD_LOGIC;
		i_value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
END RSPL8Reg;

ARCHITECTURE rtl OF RSPL8Reg IS
	SIGNAL mux_value: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL int_Value: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL shift_values: STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;
	
	COMPONENT MUX2_8bit is
	port(s       : in  std_logic; --Selection bit
		  d0,d1   : in  std_logic_vector (7 downto 0); --Data bits
		  o_Value : out std_logic_vector (7 downto 0)); --Out bits
	end COMPONENT;

BEGIN


shift_values(0)<= int_Value(1);
shift_values(1)<= int_Value(2);
shift_values(2)<= int_Value(3);
shift_values(3)<= int_Value(4);
shift_values(4)<= int_Value(5);
shift_values(5)<= int_Value(6);
shift_values(6)<= int_Value(7);
shift_values(7)<= '0';
mux: MUX2_8bit
	port map(
		s       => shift,
		d0 	  => i_value,--load value
		d1 	  => shift_values,--shift value
		o_Value => mux_value); 
	
d0: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(0), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(0));

d1: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(1), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(1));
d2: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(2), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(2));

d3: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(3), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(3));

d4: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(4), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(4));

d5: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(5), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(5));
d6: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(6), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(6));

d7: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => mux_value(7), 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_Value(7));
	-- Output Driver
	o_Value		<= int_Value;

END rtl;
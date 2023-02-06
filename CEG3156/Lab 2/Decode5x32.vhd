library ieee;
use ieee.std_logic_1164.all;
--5x32 Decoder

entity Decode5x32 is
	port(s : in std_logic_vector(4 downto 0); --Selection bits
		  e : in std_logic;
		  decode : out std_logic_vector(31 downto 0)); --Out bits
end Decode5x32;

architecture rtl of Decode5x32 is
signal enables : std_logic_vector(3 downto 0);
signal decodesOut : std_logic_vector(31 downto 0);

component Decode3x8 is
	port(s : in std_logic_vector(2 downto 0); --Selection bits
		  e : in std_logic; --enable
		  d : out std_logic_vector(7 downto 0)); --Out bits
end component;

component Decode2x4 is
	port(s : in std_logic_vector(1 downto 0); --Selection bits
		  e : in std_logic; --enable
		  d : out std_logic_vector(3 downto 0)); --Out bits
end component;

begin
dec04:Decode2x4
	port map(
		s => s(4 downto 3),
		e => e,
		d => enables(3 downto 0)
	);

dec07:Decode3x8
	port map(
		s => s(2 downto 0),
		e => enables(0),
		d => decodesOut(7 downto 0)
	);
	
dec158:Decode3x8
	port map(
		s => s(2 downto 0),
		e => enables(1),
		d => decodesOut(15 downto 8)
	);
	
dec2316:Decode3x8
	port map(
		s => s(2 downto 0),
		e => enables(2),
		d => decodesOut(23 downto 16)
	);
	
dec3124:Decode3x8
	port map(
		s => s(2 downto 0),
		e => enables(3),
		d => decodesOut(31 downto 24)
	);
decode <= decodesOut;

end rtl;
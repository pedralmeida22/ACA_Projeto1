LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity decoderV4 is
	port(	a : in STD_LOGIC_VECTOR(15 downto 0);
			resto : out STD_LOGIC_VECTOR(7 downto 0)
		);

end decoderV4;


ARCHITECTURE behavior of decoderV4 is 
	signal a9_10 : STD_LOGIC;
	signal a7to11 : STD_LOGIC;
	signal a5to7 : STD_LOGIC;
	signal a0_15 : STD_LOGIC;
	signal a0_3_15 : STD_LOGIC;
	signal a1_4_13 : STD_LOGIC;
	signal a2_14 : STD_LOGIC;
	signal a1_3_9_10 : STD_LOGIC;
	signal a0_2_8_9 : STD_LOGIC;
	signal a4_6 : STD_LOGIC;
Begin
	a9_10 <= a(9) xor a(10);
	a7to11 <= a(7) xor a(8) xor a9_10 xor a(11);
	a5to7 <= a(5) xor a(6) xor a(7);
	a0_15 <= a(0) xor a(15);
	a0_3_15 <= a0_15 xor a(3);
	a1_4_13 <= a(1) xor a(4) xor a(13); 
	a2_14 <= a(2) xor a(14);
	a1_3_9_10 <= a(1) xor a(3) xor a9_10;
	a0_2_8_9 <= a(0) xor a(2) xor a(8) xor a(9);
	a4_6 <= a(4) xor a(6);

	resto(0) <= a0_3_15 xor a(5) xor a7to11 xor a(12);
	resto(1) <= a0_3_15 xor a1_4_13 xor a5to7;
	resto(2) <= a0_15 xor a1_3_9_10 xor a2_14 xor a4_6 xor a(11) xor a(12);
	resto(3) <= a0_2_8_9 xor a1_4_13;
	resto(4) <= a1_3_9_10 xor a2_14 xor a(5);
	resto(5) <= a0_2_8_9 xor a5to7 xor a(12) xor a(4);
	resto(6) <= a1_3_9_10 xor a5to7 xor a(8) xor a(13);
	resto(7) <= a2_14 xor a4_6 xor a7to11;
	
end behavior;
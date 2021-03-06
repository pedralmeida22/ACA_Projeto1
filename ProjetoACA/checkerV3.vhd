LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity checkerV3 is
	port(	a_r : in STD_LOGIC_VECTOR(23 downto 0);
			error : out STD_LOGIC
		);

end checkerV3;


ARCHITECTURE structure of checkerV3 is 
	signal result : STD_LOGIC_VECTOR(7 downto 0);
	signal output : STD_LOGIC;
Begin
	decoder : entity work.decoderV3(behavior)
					port map(a => a_r(23 downto 8),
								resto => result);
	
	comp : entity work.comparator_8bits(behavior)
				port map(a => result,
							b => a_r(7 downto 0),
							error => output);
	error <= output;
	
end structure;
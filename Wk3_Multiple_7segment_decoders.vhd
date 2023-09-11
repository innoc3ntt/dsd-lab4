library IEEE;
use IEEE.std_logic_1164.ALL;

entity Wk3_Multiple_7segment_decoders is
port (SW: in std_logic_vector (3 downto 0);
		LEDR: out std_logic_vector (3 downto 0);
		HEX0: out std_logic_vector (6 downto 0);
		HEX1: out std_logic_vector (6 downto 0);
		HEX2: out std_logic_vector (6 downto 0);
		test: out std_logic_vector (8 downto 0 ));
end Wk3_Multiple_7segment_decoders;



architecture impl of Wk3_Multiple_7segment_decoders is

	component Wk3_7segment_decoder
		port (SW: in std_logic_vector (3 downto 0);
				LEDR: out std_logic_vector (3 downto 0);
				HEX0: out std_logic_vector (6 downto 0));
	end component;

	begin
		hex_0:Wk3_7segment_decoder port map(sw => sw, hex0 => hex0, LEDR => LEDR); 
		hex_1:Wk3_7segment_decoder port map(sw => sw, hex0 => test(6 downto 0)); 
		hex_2:Wk3_7segment_decoder port map(sw => sw, hex0 => hex2); 
end impl;

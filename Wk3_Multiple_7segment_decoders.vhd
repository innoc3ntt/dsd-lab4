LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Wk3_Multiple_7segment_decoders IS
	PORT (
		SW : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		HEX1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		HEX2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		test : OUT STD_LOGIC_VECTOR (8 DOWNTO 0));
END Wk3_Multiple_7segment_decoders;

ARCHITECTURE impl OF Wk3_Multiple_7segment_decoders IS

	COMPONENT Wk3_7segment_decoder
		PORT (
			SW : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
	END COMPONENT;

BEGIN
	hex_0 : Wk3_7segment_decoder PORT MAP(sw => sw, hex0 => hex0, LEDR => LEDR);
	hex_1 : Wk3_7segment_decoder PORT MAP(sw => sw, hex0 => test(6 DOWNTO 0));
	hex_2 : Wk3_7segment_decoder PORT MAP(sw => sw, hex0 => hex2);
END impl;
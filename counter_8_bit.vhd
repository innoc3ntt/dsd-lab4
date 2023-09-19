LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter_8_bit IS
	PORT (
		en, clk, clr : IN STD_LOGIC;
		q_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		HEX1, HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END counter_8_bit;

ARCHITECTURE behav OF counter_8_bit IS
	ATTRIBUTE chip_pin : STRING;
	ATTRIBUTE chip_pin OF clr : SIGNAL IS "C10"; --SW0, active low reset
	ATTRIBUTE chip_pin OF EN : SIGNAL IS "C11"; --SW1
	ATTRIBUTE chip_pin OF CLK : SIGNAL IS "B8"; --KEY0
	ATTRIBUTE chip_pin OF q_out : SIGNAL IS "A11,D14,E14,C13,D13,B10,A10,A9,A8"; --LED8 to 0

	SIGNAL q, t : STD_LOGIC_VECTOR (7 DOWNTO 0);

	COMPONENT t_flip_flop IS
		PORT (
			clk, T, CLR : IN STD_LOGIC;
			Q, Q_inv : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT Wk3_7segment_decoder IS
		PORT (
			SW : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
	END COMPONENT;

BEGIN
	t(0) <= en;
	
	flip_flop : FOR i IN 0 TO 7 GENERATE
		ffx : t_flip_flop PORT MAP(clk => clk, t => t(i), clr => clr, q => q(i));
	END GENERATE flip_flop;

	l_assign : FOR i IN 0 TO 6 GENERATE
		t(i+1) <= q(i) AND t(i);
	END GENERATE l_assign;

	q_out <= q;

	seg1 : Wk3_7segment_decoder PORT MAP(SW => q(3 DOWNTO 0), HEX0 => HEX1);
	seg2 : Wk3_7segment_decoder PORT MAP(SW => q(7 DOWNTO 4), HEX0 => HEX2);
END behav;
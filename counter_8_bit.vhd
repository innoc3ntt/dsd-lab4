LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter_8_bit IS
	PORT (
		en, clk, clr : IN STD_LOGIC;
		q_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		HEX1, HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END counter_8_bit;

ARCHITECTURE behav OF counter_8_bit IS
	SIGNAL q0, q1, q2, q3, q4, q5, q6, q7 : STD_LOGIC;
	SIGNAL t0, t1, t2, t3, t4, t5, t6 : STD_LOGIC;
	SIGNAL q1t, q2t : STD_LOGIC_VECTOR (3 DOWNTO 0);

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
	ff0 : t_flip_flop PORT MAP(clk => clk, t => en, clr => clr, q => q0);
	ff1 : t_flip_flop PORT MAP(clk => clk, t => t0, clr => clr, q => q1);
	ff2 : t_flip_flop PORT MAP(clk => clk, t => t1, clr => clr, q => q2);
	ff3 : t_flip_flop PORT MAP(clk => clk, t => t2, clr => clr, q => q3);
	ff4 : t_flip_flop PORT MAP(clk => clk, t => t3, clr => clr, q => q4);
	ff5 : t_flip_flop PORT MAP(clk => clk, t => t4, clr => clr, q => q5);
	ff6 : t_flip_flop PORT MAP(clk => clk, t => t5, clr => clr, q => q6);
	ff7 : t_flip_flop PORT MAP(clk => clk, t => t6, clr => clr, q => q7);

	t0 <= q0 AND EN;
	t1 <= q1 AND t0;
	t2 <= q2 AND t1;
	t3 <= q3 AND t2;
	t4 <= q4 AND t3;
	t5 <= q5 AND t4;
	t6 <= q6 AND t5;

	q_out <= q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;
	q1t <= (q3 & q2 & q1 & q0);
	q2t <= (q7 & q6 & q5 & q4);

	seg1 : Wk3_7segment_decoder PORT MAP(SW => q1t, HEX0 => HEX1);
	seg2 : Wk3_7segment_decoder PORT MAP(SW => q2t, HEX0 => HEX2);
END behav;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY t_flip_flop IS
	PORT (
		clk, T, CLR : IN STD_LOGIC;
		Q, Q_inv : OUT STD_LOGIC);
END t_flip_flop;

ARCHITECTURE behav OF t_flip_flop IS
	SIGNAL q_out : STD_LOGIC;
	SIGNAL next_q : STD_LOGIC;
BEGIN

	PROCESS (CLR, clk, T)
	BEGIN
		IF CLR = '0' THEN
			q_out <= '0';

		ELSIF rising_edge(clk) AND T = '1' THEN
			q_out <= next_q;

		END IF;
	END PROCESS;
	next_q <= q_out WHEN T = '0' ELSE
		NOT q_out;
	Q <= q_out;
END behav;
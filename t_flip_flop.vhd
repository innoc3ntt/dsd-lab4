LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY t_flip_flop IS
	PORT (
		clk, T, CLR : IN STD_LOGIC;
		Q, Q_inv : OUT STD_LOGIC);
END t_flip_flop;

ARCHITECTURE behav OF t_flip_flop IS
	SIGNAL curr_q : STD_LOGIC;
	SIGNAL next_q : STD_LOGIC;
BEGIN

	PROCESS (CLR, clk)
	BEGIN
		IF CLR = '0' THEN
			curr_q <= '0';

		ELSIF rising_edge(clk) THEN
			curr_q <= next_q;

		END IF;
	END PROCESS;
	
	next_q <= curr_q WHEN T = '0' ELSE
		NOT curr_q;
	
	Q <= curr_q;
END behav;
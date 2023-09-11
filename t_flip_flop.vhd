library ieee;
use ieee.std_logic_1164.all;

entity t_flip_flop is
	port ( clk, T, CLR : in std_logic;
				Q, Q_inv : out std_logic);
end t_flip_flop;

architecture behav  of t_flip_flop is
	Signal q_out : std_logic;
	signal next_q : std_logic;
	begin
	
		process (CLR, clk, T)
			begin
				if CLR = '0' then 
					q_out <= '0';
				
				elsif rising_edge(clk) and T ='1' then
					q_out <= next_q;

				end if;
		end process;
		next_q <= q_out when T='0' else not q_out;
		Q <= q_out;
end behav;
				
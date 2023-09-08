library ieee;
use ieee.std_logic_1164.all;

entity t_flip_flop is
	port ( clk, T, CLR : in std_logic;
				Q, Q_inv : out std_logic);
end t_flip_flop;

architecture behav  of t_flip_flop is
	Signal q_out : std_logic;
	begin
		process (CLR, clk, T)
			begin
				if CLR = '0' then 
					Q <= '0';
					Q_inv <= '1';
				
				elsif rising_edge(clk) and T ='1' then
					Q <= not q_out;
					Q_inv <= q_out;
				end if;
		end process;
end behav;
				
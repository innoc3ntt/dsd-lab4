library ieee;
use ieee.std_logic_1164.all;

entity counter_8_bit is 
	port ( en, clk, clr : in std_logic;
				q_out : out std_logic_vector (7 downto 0);
				HEX1, HEX2: out std_logic_vector(6 downto 0));
end counter_8_bit;

architecture behav of counter_8_bit is
signal q0,q1,q2,q3,q4,q5,q6,q7 : std_logic;
signal t0,t1,t2,t3,t4,t5,t6 : std_logic;
Signal q1t, q2t : std_logic_vector (3 downto 0);

component t_flip_flop is
	port ( clk, T, CLR : in std_logic;
				Q, Q_inv : out std_logic);
end component;


component Wk3_7segment_decoder is
	port (SW: in std_logic_vector (3 downto 0);
			LEDR: out std_logic_vector (3 downto 0);
			HEX0: out std_logic_vector (6 downto 0));
end component;

begin
	ff0 : t_flip_flop port map (clk => clk, t => en, clr => clr, q => q0);
	ff1 : t_flip_flop port map (clk => clk, t => t0, clr => clr, q => q1);
	ff2 : t_flip_flop port map (clk => clk, t => t1, clr => clr, q => q2);
	ff3 : t_flip_flop port map (clk => clk, t => t2, clr => clr, q => q3);
	ff4 : t_flip_flop port map (clk => clk, t => t3, clr => clr, q => q4);
	ff5 : t_flip_flop port map (clk => clk, t => t4, clr => clr, q => q5);
	ff6 : t_flip_flop port map (clk => clk, t => t5, clr => clr, q => q6);
	ff7 : t_flip_flop port map (clk => clk, t => t6, clr => clr, q => q7);
	
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
	
	seg1 : Wk3_7segment_decoder port map (SW => q1t, HEX0 => HEX1);
	seg2 : Wk3_7segment_decoder port map (SW => q2t, HEX0 => HEX2);
	

	
	
	
	
end behav;
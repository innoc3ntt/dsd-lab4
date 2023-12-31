library ieee;
use ieee.std_logic_1164.all;

entity counter_8_bit_augmented is 
	port ( en, clk, clr : in std_logic;
				q : out std_logic);
end counter_8_bit_augmented;

architecture behav of counter_8_bit_augmented is
signal q0,q1,q2,q3,q4,q5,q6 : std_logic;
signal t0,t1,t2,t3,t4,t5,t6 : std_logic;
signal clk_out : std_logic;

component Clk_divider_to_1Hz is 
   GENERIC (Freq_in : INTEGER := 50_000_000); -- 50MHz clock on DE-10 Lite FPGA board
   PORT (
      clk_in : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      clk_out : OUT STD_LOGIC

   );
end component;

component t_flip_flop is
	port ( clk, T, CLR : in std_logic;
				Q, Q_inv : out std_logic);
end component;

begin
	clk_1hz : Clk_divider_to_1hz port map (clk_in => clk, reset => clr, clk_out => clk_out);
	ff0 : t_flip_flop port map (clk => clk_out, t => en, clr => clr, q => q0);
	ff1 : t_flip_flop port map (clk => clk_out, t => t0, clr => clr, q => q1);
	ff2 : t_flip_flop port map (clk => clk_out, t => t1, clr => clr, q => q2);
	ff3 : t_flip_flop port map (clk => clk_out, t => t2, clr => clr, q => q3);
	ff4 : t_flip_flop port map (clk => clk_out, t => t3, clr => clr, q => q4);
	ff5 : t_flip_flop port map (clk => clk_out, t => t4, clr => clr, q => q5);
	ff6 : t_flip_flop port map (clk => clk_out, t => t5, clr => clr, q => q6);
	ff7 : t_flip_flop port map (clk => clk_out, t => t6, clr => clr, q => q);
	
	t0 <= q0 AND EN;
	t1 <= q1 AND t0;
	t2 <= q2 AND t1;
	t3 <= q3 AND t2;
	t4 <= q4 AND t3;
	t5 <= q5 AND t4;
	t6 <= q6 AND t5;	
end behav;
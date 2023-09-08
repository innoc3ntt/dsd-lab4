LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Clk_divider_to_1Hz IS
   GENERIC (Freq_in : INTEGER := 50_000_000); -- 50MHz clock on DE-10 Lite FPGA board
   PORT (
      clk_in : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      clk_out : OUT STD_LOGIC

   );
END Clk_divider_to_1Hz;

ARCHITECTURE Behav OF Clk_divider_to_1Hz IS
	attribute chip_pin : string;
	attribute chip_pin of reset : signal is "B8";
   SIGNAL temp : STD_LOGIC;
   SIGNAL counter : INTEGER;
   CONSTANT N : INTEGER := 2;
BEGIN
   frequency_divider : PROCESS (reset, clk_in)
   BEGIN
      IF (reset = '1') THEN
         temp <= '0';
         counter <= 0;
      ELSIF rising_edge(clk_in) THEN
         IF (counter = Freq_in/N * 4) THEN
            temp <= NOT(temp);
            counter <= 0;
         ELSE
            counter <= counter + 1;
         END IF;
      END IF;
   END PROCESS;
   clk_out <= temp;
END Behav;
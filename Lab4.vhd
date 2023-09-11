 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
  
  
  entity Lab4 is
    generic(Freq_in : integer := 50000000); -- 50MHz clock on DE-10 Lite FPGA board
	 Port ( 
	       clk_in : in STD_LOGIC; 
	        reset : in STD_LOGIC; 
			 clk_out: out STD_LOGIC
			  
          );
			 
   end Lab4;
	
	
   architecture Behav of Lab4 is 
	   attribute chip_pin : string;
		attribute chip_pin of clk_out : signal is "A8";
   attribute chip_pin of clk_in : signal is "P11";
	    signal temp: STD_LOGIC;
       signal counter : integer; 
		 constant N : integer:=2;  
	begin
      frequency_divider: process (reset, clk_in) 
		      begin 
				   if (reset = '1') then
                    temp <= '0';
                    counter <= 0;
               elsif rising_edge(clk_in) then
                  if (counter = Freq_in/N) then 
					     	 temp <= NOT(temp); 
						    counter <= 0;
                   else
                      counter <= counter + 1; 
                   end if;
               end if; 
					end process;
              clk_out <= temp; 
				  end Behav;
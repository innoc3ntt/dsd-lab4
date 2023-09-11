LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MY_REGISTER IS
    GENERIC (SIZE : INTEGER := 4);
    PORT (
        data : IN STD_LOGIC_VECTOR(SIZE - 1 DOWNTO 0);
        pload : IN STD_LOGIC;
        s_right : IN STD_LOGIC;
        s_in : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(SIZE - 1 DOWNTO 0)
    );
END MY_REGISTER;

ARCHITECTURE behavior OF MY_REGISTER IS
	Signal data_reg : STD_LOGIC_VECTOR(size-1 downto 0);
	
	begin
    PROCESS (pload, s_right, s_in, clk, reset, data, data_reg)
    BEGIN
        IF (reset = '0') THEN
            Q <= (OTHERS => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (pload = '1') THEN
                Q <= data;
            ELSIF (s_right = '1') THEN
                data_reg(3) <= s_in;
					 data_reg(2 downto 0) <= data_reg(SIZE - 1 DOWNTO 1);
					 Q <= data_reg;
            END IF;
        END IF;

	
    END PROCESS;
	 
	 
	 		  	
END behavior;
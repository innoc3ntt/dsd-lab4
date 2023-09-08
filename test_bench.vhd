LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Wk4_D_Pos_Latch_tb IS
END Wk4_D_Pos_Latch_tb;

ARCHITECTURE v1 OF Wk4_D_Pos_Latch_tb IS
    --Declare components
    COMPONENT Wk4_D_Pos_Latch is
        PORT (
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        CLK : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    END COMPONENT;

    --Declare signals

    SIGNAL D : STD_LOGIC;
    SIGNAL CLK : STD_LOGIC;
    SIGNAL Q : STD_LOGIC;
    CONSTANT T : TIME := 100 ns;

BEGIN
    --Instantiating devive under test (component of type Wk4_D_Pos_Latch) and connecting testbench signals with Wk4_D_Pos_Latch.vhd 

    DUT : Wk4_D_Pos_Latch PORT MAP(D => D, CLK => CLK, Q => Q);

    main_process :

    PROCESS
        -- Declarations here
    BEGIN
        -- Apply inputs once at a time	
        --Initialise
        D <= "0000";
        RESET <= '0';
        PLOAD <= '0';
        S_RIGHT <= '0';
        S_IN <= '0';
        CLK <= '0'; -- what do i do with the clock?
        WAIT FOR T;

        --Let's go
        D <= "0101";
        RESET <= '1';
        PLOAD <= '1';
        WAIT FOR T;

        D <= "0000";
        RESET <= '1';
        PLOAD <= '0';
        WAIT FOR T;

        D <= "1011"; --300ns
        PLOAD <= '1';
        WAIT FOR T;

        D <= "0110"; 
        PLOAD <= '0';
        WAIT FOR T;

        RESET <= '0';
        PLOAD <= '1';
        WAIT FOR T;

		  RESET <= '1' --600ns
        WAIT FOR T;

        D <= "0000";
        PLOAD <= '0';
        WAIT FOR T;

        S_IN <= '1';
        
        WAIT FOR T;

        S_RIGHT <= '1';
        WAIT FOR T;

        WAIT FOR T;

        S_IN <= '0'
        WAIT FOR T;

        S_IN <= '1';
        WAIT FOR T;
		  
		  D <= "1001";
		  PLOAD <= '1';
		  WAIT FOR T;
		  
		  RESET <= '0';
		  WAIT FOR T;
		  
		  RESET <= '1';
		  PLOAD <= '0';
		  S_RIGHT <= '0';
		  S_IN <= '0';
		  WAIT FOR T;

        --End of test is to wait forever
        WAIT;
    END PROCESS;

END v1;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY register_tb IS
	     GENERIC (SIZE : INTEGER := 4);
END register_tb;

ARCHITECTURE v1 OF register_tb IS
    --Declare components

    COMPONENT MY_REGISTER is
    PORT (
        data : IN STD_LOGIC_VECTOR(SIZE - 1 DOWNTO 0);
        pload : IN STD_LOGIC;
        s_right : IN STD_LOGIC;
        s_in : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(SIZE - 1 DOWNTO 0)
    );
    END COMPONENT;

    --Declare signals

    SIGNAL D : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL pload, s_right, s_in : STD_LOGIC;
    SIGNAL CLK, RESET : STD_LOGIC;
    SIGNAL Q_OUT : STD_LOGIC_VECTOR (3 DOWNTO 0);
    CONSTANT T : TIME := 100 ns;

BEGIN
    --Instantiating devive under test (component of type Wk4_D_Pos_Latch) and connecting testbench signals with Wk4_D_Pos_Latch.vhd 

    DUT : MY_REGISTER PORT MAP(RESET => reset, data => D, pload => pload, s_right => s_right, s_in => s_in, CLK => CLK, Q => Q_OUT);

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

		  RESET <= '1'; --600ns
        WAIT FOR T;

        D <= "0000";
        PLOAD <= '0';
        WAIT FOR T;

        S_IN <= '1';
        
        WAIT FOR T;

        S_RIGHT <= '1';
        WAIT FOR T;

        WAIT FOR T;

        S_IN <= '0';
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
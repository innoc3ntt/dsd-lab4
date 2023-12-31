LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY counter_tb IS
END counter_tb;

ARCHITECTURE v1 OF counter_8_bit_augmented IS
    --Declare components
    COMPONENT counter_tb IS
        PORT (
            en, clk, clr : IN STD_LOGIC;
            q : OUT STD_LOGIC);
    END COMPONENT;
    --Declare signals

    SIGNAL D : STD_LOGIC;
    SIGNAL CLK : STD_LOGIC;
    SIGNAL Q : STD_LOGIC;
    CONSTANT T : TIME := 100 ns;

BEGIN
    --Instantiating devive under test (component of type Wk4_D_Pos_Latch) and connecting testbench signals with Wk4_D_Pos_Latch.vhd 

    DUT : counter_8_bit_augmented PORT MAP(D => D, CLK => CLK1, Q => Q);

    main_process :

    PROCESS
        -- Declarations here
    BEGIN

        T_clock <= '0';
        WAIT FOR T;

        T_clocl <= '1';
        WAIT FOR T;

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
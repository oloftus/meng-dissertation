library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DelayLatchTB is
    generic (
        tbDelay : INTEGER := 2;
        tbDelayWidth : INTEGER := 2
    );
end DelayLatchTB;

architecture Behavioral of DelayLatchTB is
    signal sigClk, sigRst, sigClr, sigSet, sigQ : STD_LOGIC;
    
    component DelayLatch is
        generic (
            delay : INTEGER;
            delayWidth : INTEGER
        );
        port (
            CLK, RST, CLR, SET : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
begin
    uut: DelayLatch
        generic map (
            delay => tbDelay,
            delayWidth => tbDelayWidth
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            CLR => sigClr,
            SET => sigSet,
            Q => sigQ
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;

    tb: process begin
        wait for 100ns;
        sigRst <= '1';
        wait for 100ns;
        sigRst <= '0';
        
        wait for 100ns;
        sigSet <= '1';
        wait for 100ns;
        sigSet <= '0';
        
        wait for 500ns;
        sigClr <= '1';
        wait for 100ns;
        sigClr <= '0';
        
        wait for 100ns;
        sigSet <= '1';
        wait for 100ns;
        sigSet <= '0';

        wait;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DelayedLatchTB is
end DelayedLatchTB;

architecture Behavioral of DelayedLatchTB is
    signal sigClk, sigRst, sigSet, sigQ : STD_LOGIC;
    
    component DelayedLatch is
        generic (
            delayVal : INTEGER;
            delayWidth : INTEGER
        );
        port (
            CLK, RST, SET : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
begin
    uut: DelayedLatch
        generic map (
            delayVal => 2,
            delayWidth => 2
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
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
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        sigSet <= '1';
        wait for 200ns;
        sigSet <= '0';

        wait;
    end process;
end Behavioral;

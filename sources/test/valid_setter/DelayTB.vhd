library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DelayTB is
    generic (
        tbDelay : INTEGER := 2;
        tbDelayWidth : INTEGER := 2
    );
end DelayTB;

architecture Behavioral of DelayTB is
    signal sigClk, sigRst, sigSet, sigQ : STD_LOGIC;
    
    component Delay is
        generic (
            delay : INTEGER;
            delayWidth : INTEGER
        );
        port (
            CLK, RST, SET : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
begin
    uut: Delay
        generic map (
            delay => tbDelay,
            delayWidth => tbDelayWidth
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
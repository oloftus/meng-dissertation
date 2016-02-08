library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DelayTB is
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
            delay => 2,
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
        sigSet <= '0';
        
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        sigSet <= '1';
        wait for 200ns;
        sigSet <= '0';
        
        wait for 290ns;
        assert sigQ = '0' report "Test failed: 1";
        wait for 20ns;
        assert sigQ = '1' report "Test failed: 2";
        wait for 180ns;
        assert sigQ = '1' report "Test failed: 3";
        wait for 20ns;
        assert sigQ = '0' report "Test failed: 4";

        wait;
    end process;
end Behavioral;

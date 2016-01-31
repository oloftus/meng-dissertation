library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PulseTB is
end PulseTB;

architecture Behavioral of PulseTB is
    signal sigClk, sigSet, sigRst, sigP : STD_LOGIC;
    
    component Pulse is
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            RST : in STD_LOGIC;
            P : out STD_LOGIC
        );
    end component;
begin
    uut: Pulse
        port map (
            CLK => sigClk,
            SET => sigSet,
            RST => sigRst,
            P => sigP
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
        wait for 210ns;
        assert sigP = '1' report "Test failed: 1";
        wait for 200ns;
        assert sigP = '0' report "Test failed: 2";
        wait for 190ns;
        sigSet <= '0';
        
        wait for 200ns;
        
        sigSet <= '1';
        wait for 210ns;
        assert sigP = '1' report "Test failed: 3";
        wait for 200ns;
        assert sigP = '0' report "Test failed: 4";
        wait for 190ns;
        sigSet <= '0';

        wait;
    end process;
    
end Behavioral;

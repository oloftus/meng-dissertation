library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RisingEdgeDetectorTB is
end RisingEdgeDetectorTB;

architecture Behavioral of RisingEdgeDetectorTB is
    signal sigClk, sigSet, sigP : STD_LOGIC;
    
    component RisingEdgeDetector is
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            P : out STD_LOGIC
        );
    end component;
begin
    uut: RisingEdgeDetector
        port map (
            CLK => sigClk,
            SET => sigSet,
            P => sigP
        );
        
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;

    tb: process begin
        sigSet <= '1';
        wait for 100ns;
        wait for 10ns;
        assert sigP = '1' report "Test failed: 1";
        wait for 400ns;
        assert sigP = '0' report "Test failed: 2";
        wait for 90ns;
        sigSet <= '0';
        
        wait for 400ns; -- 2 clock periods
        
        -- Repeat from above
        sigSet <= '1';
        wait for 100ns;
        wait for 10ns;
        assert sigP = '1' report "Test failed: 3";
        wait for 400ns;
        assert sigP = '0' report "Test failed: 4";
        wait for 90ns;
        sigSet <= '0';
        
        wait;
    end process;
    
end Behavioral;

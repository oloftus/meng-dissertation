library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PulseTB is
    generic (
        tbMultiple : INTEGER := 3;
        tbMultipleWidth : INTEGER := 3
    );
end PulseTB;

architecture Behavioral of PulseTB is
    signal sigClk, sigRst, sigPOut : STD_LOGIC;
    
    component Pulse is
        generic (
            multiple : INTEGER;
            multipleWidth : INTEGER
        );
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            P_OUT : out STD_LOGIC
        );
    end component;
begin
    uut: Pulse
        generic map (
            multiple => tbMultiple,
            multipleWidth => tbMultipleWidth
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            P_OUT => sigPOut
        );
        
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;

    tb: process begin
        sigRst <= '0';
        wait for 100ns;
        sigRst <= '1';
        assert sigPOut = '0' report "Test failed: 1";
        wait for 100ns;
        sigRst <= '0';
        wait for 100ns;
        
        wait for 10ns; -- Wait until stable before asserting
        
        assert sigPOut = '0' report "Test failed: 2";
        wait for 200ns;

        assert sigPOut = '0' report "Test failed: 3";
        wait for 200ns;

        assert sigPOut = '1' report "Test failed: 4";
        wait for 100ns;
        
        assert sigPOut = '0' report "Test failed: 5";

        wait;
    end process;
    
end Behavioral;

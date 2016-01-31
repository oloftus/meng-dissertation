library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LatchTB is
    generic (
        tbSize : INTEGER := 12
    );
end LatchTB;

architecture Behavioral of LatchTB is
    signal sigClk, sigSet, sigRst : STD_LOGIC;
    signal sigDin, sigDout : STD_LOGIC_VECTOR (tbSize - 1 downto 0);
    
    component Latch is
        generic (
            size : INTEGER
        );
        port (
            clk : in STD_LOGIC;
            set : in STD_LOGIC;
            RST : in STD_LOGIC;
            din : in STD_LOGIC_VECTOR (size - 1 downto 0);
            dout : out STD_LOGIC_VECTOR (size - 1 downto 0) 
        );
    end component;
begin
    uut: Latch
        generic map (
            size => tbSize
        )
        port map (
            clk => sigClk,
            set => sigSet,
            rst => sigRst,
            din => sigDin,
            dout => sigDout 
        );
        
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process
        constant zero : STD_LOGIC_VECTOR (tbSize - 1 downto 0) := "0000"&"0000"&"0000";
        constant zeroOneZero : STD_LOGIC_VECTOR (tbSize - 1 downto 0) := "0000"&"1111"&"0000";
        constant oneZeroOne : STD_LOGIC_VECTOR (tbSize - 1 downto 0) := "1111"&"0000"&"1111";
    begin
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';

        sigDin <= oneZeroOne;
        sigSet <= '1';
        wait for 200ns;
        sigSet <= '0';
        wait for 200ns;
        assert sigDout = oneZeroOne report "Test failed: 1";

        sigDin <= zeroOneZero;
        sigSet <= '1';
        wait for 200ns;
        sigSet <= '0';
        wait for 200ns;
        assert sigDout = zeroOneZero report "Test failed: 2";

        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        assert sigDout = zero report "Test failed: 3";
        
        wait;
    end process;
end Behavioral;

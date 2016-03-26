library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShifterTB is
    generic (
        shiftWidth : INTEGER := 3;
        valueWidth : INTEGER := 5
    );
end ShifterTB;

architecture Behavioral of ShifterTB is
    component Shifter is
        generic (
            shiftWidth : INTEGER;
            valueWidth : INTEGER
        );
        port (
            SHIFT : in STD_LOGIC_VECTOR (shiftWidth - 1 downto 0);
            DIN : in STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
            DOUT : out STD_LOGIC_VECTOR (valueWidth - 1 downto 0)
        );
    end component;
    
    signal sigShift : STD_LOGIC_VECTOR (shiftWidth - 1 downto 0);
    signal sigDin, sigDout : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
begin
    uut: Shifter
        generic map (
            shiftWidth => shiftWidth,
            valueWidth => valueWidth
        )
        port map (
            SHIFT => sigShift,
            DIN => sigDin,
            DOUT => sigDout
        );

    tb: process begin
        sigShift <= "011"; -- 3
        sigDin <= "00011";
        wait for 10ns;
        assert sigDout = "11000" report "Test failed: 1";

        wait for 190ns;
        
        sigShift <= "101"; -- -3
        sigDin <= "11000";
        wait for 10ns;
        assert sigDout = "00011" report "Test failed: 2";
        
        wait;    
    end process;
end Behavioral;

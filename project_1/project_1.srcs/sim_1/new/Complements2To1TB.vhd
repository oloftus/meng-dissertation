library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Complements2To1TB is
    generic (
        tbPrecision : INTEGER := 8
    );
end Complements2To1TB;

architecture Behavioral of Complements2To1TB is
    component Complements2To1 is
        generic (
            precision : INTEGER
        );
        port (
            twos : in SIGNED (precision - 1 downto 0);
            ones : out UNSIGNED (precision - 1 downto 0)
        );
    end component;
    
    signal sigTwos : SIGNED (tbPrecision - 1 downto 0);
    signal sigOnes : UNSIGNED (tbPrecision - 1 downto 0);
begin
    uut: Complements2To1
        generic map (
            precision => tbPrecision
        )
        port map (
            twos => sigTwos,
            ones => sigOnes
        );
 
    tb: process begin
        sigTwos <= "1000"&"0010"; -- -126
        wait for 100 ns;
        assert sigOnes = "0111"&"1110" report "Test failed: 2's complement 1000 0010 (-126) should be 0111 1110 (126)";

        sigTwos <= "1111"&"1111"; -- -1
        wait for 100 ns;
        assert sigOnes = "0000"&"0001" report "Test failed: 2's complement 1111 1111 (-1) should be 0000 0001 (1)";

        sigTwos <= "0111"&"1110";
        wait for 100 ns;
        assert sigOnes = "0111"&"1110" report "Test failed: 2's complement 0111 1110 (126) should be 0111 1110 (126)";
        
        sigTwos <= "0000"&"0001";
        wait for 100 ns;
        assert sigOnes = "0000"&"0001" report "Test failed: 2's complement 0000 0001 (1) should be 0000 0001 (1)";
    end process;
    
end Behavioral;
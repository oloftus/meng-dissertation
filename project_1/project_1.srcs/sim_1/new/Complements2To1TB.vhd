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
            twos : in SIGNED (precision downto 0);
            ones : out UNSIGNED (precision - 1 downto 0);
            sign : out STD_LOGIC
        );
    end component;
    
    signal sigTwos : SIGNED (tbPrecision downto 0);
    signal sigOnes : UNSIGNED (tbPrecision - 1 downto 0);
    signal sigSign : STD_LOGIC;
begin
    uut: Complements2To1
        generic map (
            precision => tbPrecision
        )
        port map (
            twos => sigTwos,
            ones => sigOnes,
            sign => sigSign
        );
 
    tb: process begin
        sigTwos <= "110111"&"001";
        wait for 100ns;
        assert sigOnes = "01000"&"111" report "Test failed: 2's complement 110111 001 (-8.875) should be 1000 111 (8.875)";
        assert sigSign = '1' report "Test failed: Input -8.875 should output sign 1";

        sigTwos <= "100001"&"000";
        wait for 100 ns;
        assert sigOnes = "11111"&"000" report "Test failed: 2's complement 100001 000 (-32) should be 11111 000 (32)";
        assert sigSign = '1' report "Test failed: Input -32 should output sign 1";

        sigTwos <= "111111"&"000";
        wait for 100 ns;
        assert sigOnes = "00001"&"000" report "Test failed: 2's complement 111111 000 (-1) should be 00001 000 (1)";
        assert sigSign = '1' report "Test failed: Input -1 should output sign 1";

        sigTwos <= "001000"&"111";
        wait for 100ns;
        assert sigOnes = "01000"&"111" report "Test failed: 2's complement 01000 111 (8.875) should be 1000 111 (8.875)";
        assert sigSign = '0' report "Test failed: Input -8.875 should output sign 1";
        
        sigTwos <= "011111"&"000";
        wait for 100 ns;
        assert sigOnes = "11111"&"000" report "Test failed: 2's complement 0111 1110 (32) should be 0111 1110 (32)";
        assert sigSign = '0' report "Test failed: Input 32 should output sign 0";
        
        sigTwos <= "000001"&"000";
        wait for 100 ns;
        assert sigOnes = "00001"&"000" report "Test failed: 2's complement 0000 0001 (1) should be 0000 0001 (1)";
        assert sigSign = '0' report "Test failed: Input 1 should output sign 0";
    end process;
    
end Behavioral;

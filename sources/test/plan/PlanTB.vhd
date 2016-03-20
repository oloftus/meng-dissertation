library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PlanTB is
    generic (
        integerPrecision1 : INTEGER := 5;
        fractionPrecision1 : INTEGER := 5;
        integerPrecision2 : INTEGER := 2;
        fractionPrecision2 : INTEGER := 2;
        integerPrecision3 : INTEGER := 4;
        fractionPrecision3 : INTEGER := 7
    );
end PlanTB;

architecture Behavioral of PlanTB is
    signal sigX1 : STD_LOGIC_VECTOR (integerPrecision1 + fractionPrecision1 downto 0);
    signal sigY1 : STD_LOGIC_VECTOR (integerPrecision1 + fractionPrecision1 downto 0);
    
    signal sigX2 : STD_LOGIC_VECTOR (integerPrecision2 + fractionPrecision2 downto 0);
    signal sigY2 : STD_LOGIC_VECTOR (integerPrecision2 + fractionPrecision2 downto 0);
    
    signal sigX3 : STD_LOGIC_VECTOR (integerPrecision3 + fractionPrecision3 downto 0);
    signal sigY3 : STD_LOGIC_VECTOR (integerPrecision3 + fractionPrecision3 downto 0);

    component Plan is
        generic (
            integerPrecision : INTEGER;
            fractionPrecision : INTEGER
        );
        port (
            X : in STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0);
            Y : out STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0)
        );
    end component;
begin

    uut1: Plan
        generic map (
            integerPrecision => integerPrecision1,
            fractionPrecision => fractionPrecision1
        )
        port map (
            X => sigX1,
            Y => sigY1
        );

    uut2: Plan
        generic map (
            integerPrecision => integerPrecision2,
            fractionPrecision => fractionPrecision2
        )
        port map (
            X => sigX2,
            Y => sigY2
        );

    uut3: Plan
            generic map (
                integerPrecision => integerPrecision3,
                fractionPrecision => fractionPrecision3
            )
            port map (
                X => sigX3,
                Y => sigY3
            );
    
    tb: process begin
        -- Test normal operation
        sigX1 <= "1"&"11000"&"00000"; -- -8
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"00000" report "Test failed: 1";
        
        sigX1 <= "1"&"11010"&"00000"; -- -6
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"00000" report "Test failed: 2";

        sigX1 <= "1"&"11100"&"00000"; -- -4
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"00001" report "Test failed: 3";

        sigX1 <= "1"&"11110"&"00000"; -- -2
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"00100" report "Test failed: 4";

        sigX1 <= "0"&"00000"&"00000"; -- 0
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"10000" report "Test failed: 5";

        sigX1 <= "0"&"00010"&"00000"; -- 2
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"11100" report "Test failed: 6";

        sigX1 <= "0"&"00100"&"00000"; -- 4
        wait for 100ns;
        assert sigY1 = "0"&"00000"&"11111" report "Test failed: 7";

        sigX1 <= "0"&"00110"&"00000"; -- 6
        wait for 100ns;
        assert sigY1 = "0"&"00001"&"00000" report "Test failed: 8";

        sigX1 <= "0"&"01000"&"00000"; -- 8
        wait for 100ns;
        assert sigY1 = "0"&"00001"&"00000" report "Test failed: 9";
        
        -- Test when integer and fraction part is trimmed
        sigX2 <= "0"&"10"&"00"; -- 2
        wait for 100ns;
        assert sigY2 = "0"&"00"&"11" report "Test failed: 10";
        
        -- Test with decimals
        sigX3 <= "1"&"1101"&"0100010"; -- -2.736662327
        wait for 100ns;
        assert sigY3 = "0"&"0000"&"0001010" report "Test failed: 11"; -- 0.070729302

        sigX3 <= "0"&"0010"&"1011110"; -- 2.736662327
        wait for 100ns;
        assert sigY3 = "0"&"0000"&"1110110" report "Test failed: 12"; -- 0.92927069771875

        wait;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PlanTB is
    generic (
        integerPrecision : INTEGER := 5;
        fractionPrecision : INTEGER := 5
    );
end PlanTB;

architecture Behavioral of PlanTB is
    signal sigX : STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0);
    signal sigY : STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0);

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

    uut: Plan
        generic map (
            integerPrecision => integerPrecision,
            fractionPrecision => fractionPrecision
        )
        port map (
            X => sigX,
            Y => sigY
        );
    
    tb: process begin
        sigX <= "1"&"11000"&"00000"; -- -8
        wait for 100ns;
        assert sigY = "0"&"00000"&"00000" report "Test failed: 1";
        
        sigX <= "1"&"11010"&"00000"; -- -6
        wait for 100ns;
        assert sigY = "0"&"00000"&"00000" report "Test failed: 2";

        sigX <= "1"&"11100"&"00000"; -- -4
        wait for 100ns;
        assert sigY = "0"&"00000"&"00001" report "Test failed: 3";

        sigX <= "1"&"11110"&"00000"; -- -2
        wait for 100ns;
        assert sigY = "0"&"00000"&"00100" report "Test failed: 4";

        sigX <= "0"&"00000"&"00000"; -- 0
        wait for 100ns;
        assert sigY = "0"&"00000"&"10000" report "Test failed: 5";

        sigX <= "0"&"00010"&"00000"; -- 2
        wait for 100ns;
        assert sigY = "0"&"00000"&"11100" report "Test failed: 6";

        sigX <= "0"&"00100"&"00000"; -- 4
        wait for 100ns;
        assert sigY = "0"&"00000"&"11111" report "Test failed: 7";

        sigX <= "0"&"00110"&"00000"; -- 6
        wait for 100ns;
        assert sigY = "0"&"00001"&"00000" report "Test failed: 8";

        sigX <= "0"&"01000"&"00000"; -- 8
        wait for 100ns;
        assert sigY = "0"&"00001"&"00000" report "Test failed: 9";
        
        wait;
    end process;
end Behavioral;

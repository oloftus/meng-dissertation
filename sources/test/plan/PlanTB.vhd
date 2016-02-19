library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PlanTB is
    generic (
        inputIntegerPrecision : INTEGER := 5;
        inputFractionPrecision : INTEGER := 5
    );
end PlanTB;

architecture Behavioral of PlanTB is
    constant inputTotalPrecision : INTEGER := inputIntegerPrecision + inputFractionPrecision;

    signal sigIn : SIGNED (inputTotalPrecision downto 0);
    signal sigOut : UNSIGNED (inputTotalPrecision - 1 downto 0);

    component Plan is
        generic (
            planInputIntegerPrecision : INTEGER;
            planInputFractionPrecision : INTEGER
        );
        port (
            X : in SIGNED (planInputIntegerPrecision + planInputFractionPrecision downto 0);
            Y : out UNSIGNED (planInputIntegerPrecision + planInputFractionPrecision - 1 downto 0)
        );
    end component;
begin

    uut: Plan
        generic map (
            planInputIntegerPrecision => inputIntegerPrecision,
            planInputFractionPrecision => inputFractionPrecision
        )
        port map (
            X => sigIn,
            Y => sigOut
        );
    
    tb: process begin
        sigIn <= "1"&"11000"&"00000"; -- -8
        wait for 100ns;
        assert sigOut = "00000"&"00000" report "Test failed: 1";
        
        sigIn <= "1"&"11010"&"00000"; -- -6
        wait for 100ns;
        assert sigOut = "00000"&"00000" report "Test failed: 2";

        sigIn <= "1"&"11100"&"00000"; -- -4
        wait for 100ns;
        assert sigOut = "00000"&"00001" report "Test failed: 3";

        sigIn <= "1"&"11110"&"00000"; -- -2
        wait for 100ns;
        assert sigOut = "00000"&"00100" report "Test failed: 4";

        sigIn <= "0"&"00000"&"00000"; -- 0
        wait for 100ns;
        assert sigOut = "00000"&"10000" report "Test failed: 5";

        sigIn <= "0"&"00010"&"00000"; -- 2
        wait for 100ns;
        assert sigOut = "00000"&"11100" report "Test failed: 6";

        sigIn <= "0"&"00100"&"00000"; -- 4
        wait for 100ns;
        assert sigOut = "00000"&"11111" report "Test failed: 7";

        sigIn <= "0"&"00110"&"00000"; -- 6
        wait for 100ns;
        assert sigOut = "00001"&"00000" report "Test failed: 8";

        sigIn <= "0"&"01000"&"00000"; -- 8
        wait for 100ns;
        assert sigOut = "00001"&"00000" report "Test failed: 9";

    end process;
end Behavioral;

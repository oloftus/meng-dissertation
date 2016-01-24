library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PlanTB is
    generic (
        inputIntegerPrecision : INTEGER := 5;
        inputFractionPrecision : INTEGER := 3
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
        sigIn <= "1"&"11000"&"000"; -- -8
        wait for 100ns;
        assert sigOut = "0"&"0000"&"000" report "Test failed: 1";
        
        sigIn <= "1"&"11010"&"000"; -- -6
        wait for 100ns;
        assert sigOut = "0"&"0000"&"000" report "Test failed: 2";

        sigIn <= "1"&"11100"&"000"; -- -4
        wait for 100ns;
        assert sigOut = "0"&"0000"&"010" report "Test failed: 3";

        sigIn <= "1"&"11110"&"000"; -- -2
        wait for 100ns;
        assert sigOut = "0"&"0001"&"000" report "Test failed: 4";

        sigIn <= "0"&"00000"&"000"; -- 0
        wait for 100ns;
        assert sigOut = "0"&"0100"&"000" report "Test failed: 5";

        sigIn <= "0"&"00010"&"000"; -- 2
        wait for 100ns;
        assert sigOut = "0"&"0111"&"000" report "Test failed: 6";

        sigIn <= "0"&"00100"&"000"; -- 4
        wait for 100ns;
        assert sigOut = "0"&"0111"&"110" report "Test failed: 7";

        sigIn <= "0"&"00110"&"000"; -- 6
        wait for 100ns;
        assert sigOut = "0"&"1000"&"000" report "Test failed: 8";

        sigIn <= "0"&"01000"&"000"; -- 8
        wait for 100ns;
        assert sigOut = "0"&"1000"&"000" report "Test failed: 9";


    end process;
end Behavioral;

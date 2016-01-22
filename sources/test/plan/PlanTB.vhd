library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PlanTB is
    generic (
        tbPrecision : INTEGER := 8;
        tbFixedPointLoc : INTEGER := 3
    );
end PlanTB;

architecture Behavioral of PlanTB is

    signal sigIn : SIGNED (tbPrecision downto 0);
    signal sigOut : UNSIGNED (tbPrecision - 1 downto 0);

    component Plan is
        generic (
            planPrecision : INTEGER;
            fixedPointLoc : INTEGER
        );
        port (
            X : in SIGNED (planPrecision downto 0);
            Y : out UNSIGNED (planPrecision - 1 downto 0)
        );
    end component;
begin

    uut: Plan
        generic map (
            planPrecision => tbPrecision,
            fixedPointLoc => tbFixedPointLoc
        )
        port map (
            X => sigIn,
            Y => sigOut
        );
    
    tb: process begin
        sigIn <= "1"&"11000"&"000"; -- -8
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));
        
        sigIn <= "1"&"11010"&"000"; -- -6
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "1"&"11100"&"000"; -- -4
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "1"&"11110"&"000"; -- -2
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "0"&"00000"&"000"; -- 0
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "0"&"00010"&"000"; -- 2
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "0"&"00100"&"000"; -- 4
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "0"&"00110"&"000"; -- 6
        wait for 100ns;
        report "PLAN output: " & INTEGER'Image(To_Integer(sigOut));

        sigIn <= "0"&"01000"&"000"; -- 8
        wait for 100ns;
        report INTEGER'Image(To_Integer(sigOut));

    end process;
end Behavioral;

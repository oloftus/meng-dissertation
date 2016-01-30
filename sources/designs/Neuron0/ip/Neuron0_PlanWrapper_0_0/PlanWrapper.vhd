library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PlanWrapper is
    generic (
        integerPrecision : INTEGER;
        fractionPrecision : INTEGER
    );
    port (
        X : in STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0);
        Y : out STD_LOGIC_VECTOR (integerPrecision + fractionPrecision - 1 downto 0)
    );
end PlanWrapper;

architecture Behavioral of PlanWrapper is
    signal sigX : SIGNED (integerPrecision + fractionPrecision downto 0);
    signal sigY : UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0);

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
    sigX <= SIGNED(X);
    Y <= STD_LOGIC_VECTOR(sigY);

    planComp: Plan
        generic map (
            planInputIntegerPrecision => integerPrecision,
            planInputFractionPrecision => fractionPrecision
        )
        port map (
            X => sigX,
            Y => sigY
        );
end Behavioral;

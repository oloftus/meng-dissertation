library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dtxy is
    generic (
        integerPrecision : INTEGER;
        fractionPrecision : INTEGER
    );
    port (
        Z : in STD_LOGIC_VECTOR (3 downto 0);
        X : in UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0);
        Y : out UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0)
    );
end Dtxy;

architecture Behavioral of Dtxy is

    constant precision : INTEGER := integerPrecision + fractionPrecision;
    constant implicitPointShift : INTEGER := 3;
    constant newFixedPointLoc : INTEGER := fractionPrecision + implicitPointShift;
    constant offsetFractionWidth : INTEGER := 5;
    
    constant z4Offset : UNSIGNED (precision - 1 downto 0) := Shift_Left(Resize("1"&"00000", precision), newFixedPointLoc - offsetFractionWidth);
    constant z3Offset : UNSIGNED (precision - 1 downto 0) := Shift_Left(Resize("0"&"11011", precision), newFixedPointLoc - offsetFractionWidth);
    constant z2Offset : UNSIGNED (precision - 1 downto 0) := Shift_Left(Resize("0"&"10100", precision), newFixedPointLoc - offsetFractionWidth);
    constant z1Offset : UNSIGNED (precision - 1 downto 0) := Shift_Left(Resize("0"&"10000", precision), newFixedPointLoc - offsetFractionWidth);
begin

    process (X, Z) begin
        case Z is
            when "1000" => -- Z4
                Y <= z4Offset;
        
            when "0100" => -- Z3
                Y <= Shift_Right(X, 2) + z3Offset;
                
            when "0010" => -- Z2
                Y <= X + z2Offset;
                
            when "0001" => -- Z1
                Y <= Shift_Left(X, 1) + z1Offset;
                
            when others =>
                null;
        end case;
    end process;

end Behavioral;
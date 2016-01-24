library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dtxy is
    generic (
        inputIntegerPrecision : INTEGER;
        inputFractionPrecision : INTEGER
    );
    port (
        Z : in STD_LOGIC_VECTOR (3 downto 0);
        X : in UNSIGNED (inputIntegerPrecision + inputFractionPrecision - 1 downto 0);
        Y : out UNSIGNED (inputIntegerPrecision + inputFractionPrecision - 1 downto 0)
    );
end Dtxy;

architecture Behavioral of Dtxy is

    constant inputTotalPrecision : INTEGER := inputIntegerPrecision + inputFractionPrecision;
    constant implicitPointShift : INTEGER := 3;
    constant newFixedPointLoc : INTEGER := inputFractionPrecision + implicitPointShift;
    constant offsetFractionWidth : INTEGER := 5;
    
--    function Align_Offset return UNSIGNED (6 downto 0) is
--    begin
--        return "1000000";
--    end;
    
    constant z4Offset : UNSIGNED (inputTotalPrecision - 1 downto 0) := Shift_Left(Resize("1"&"00000", inputTotalPrecision), newFixedPointLoc - offsetFractionWidth); -- Align_Offset
    constant z3Offset : UNSIGNED (inputTotalPrecision - 1 downto 0) := Shift_Left(Resize("0"&"11011", inputTotalPrecision), newFixedPointLoc - offsetFractionWidth);
    constant z2Offset : UNSIGNED (inputTotalPrecision - 1 downto 0) := Shift_Left(Resize("0"&"10100", inputTotalPrecision), newFixedPointLoc - offsetFractionWidth);
    constant z1Offset : UNSIGNED (inputTotalPrecision - 1 downto 0) := Shift_Left(Resize("0"&"10000", inputTotalPrecision), newFixedPointLoc - offsetFractionWidth);
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
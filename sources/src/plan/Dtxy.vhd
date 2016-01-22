library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dtxy is
    generic (
        precision : INTEGER
    );
    port (
        Z : in STD_LOGIC_VECTOR (3 downto 0);
        X : in UNSIGNED (precision - 1 downto 0);
        Y : out UNSIGNED (precision - 1 downto 0)
    );
end Dtxy;

architecture Behavioral of Dtxy is
    -----------------------------------------------------------
    -- Really I would like to pass this in as a generic but this
    -- is not locally static and hence not allowed.
    -- See http://www.esperan.com/downloads/vhdl_qrg_sample1.pdf
    -----------------------------------------------------------
    constant fixedPointLoc : INTEGER := 3;
    -----------------------------------------------------------
    -----------------------------------------------------------
    
    constant implicitPointShift : INTEGER := 3;
    constant newFixedPointLoc : INTEGER := fixedPointLoc + implicitPointShift;
    
    constant precisionTop : INTEGER := precision - 1;
    
    constant z4Offset : UNSIGNED (precisionTop downto 0) := (
        newFixedPointLoc => '1',
        others => '0'); --"1"&"000000";
    constant z3Offset : UNSIGNED (precisionTop downto 0) := (
        newFixedPointLoc => '0',
        newFixedPointLoc - 1 => '1',
        newFixedPointLoc - 2 => '1',
        newFixedPointLoc - 3 => '0',
        newFixedPointLoc - 4 => '1',
        newFixedPointLoc - 5 => '1',
        newFixedPointLoc - 6 => '0',
        others => '0'); --("0"&"110110");
    constant z2Offset : UNSIGNED (precisionTop downto 0) := (
        newFixedPointLoc => '0',
        newFixedPointLoc - 1 => '1',
        newFixedPointLoc - 2 => '0',
        newFixedPointLoc - 3 => '1',
        others => '0'); --("0"&"101000");
    constant z1Offset : UNSIGNED (precisionTop downto 0) := (
        newFixedPointLoc => '0',
        newFixedPointLoc - 1 => '1',
        others => '0'); --("0"&"100000");  
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
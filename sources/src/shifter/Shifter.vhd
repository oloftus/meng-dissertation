library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shifter is
    generic (
        shiftWidth : INTEGER;
        transferWidth : INTEGER;
        valueWidth : INTEGER
    );
    port (
        SHIFT : in STD_LOGIC_VECTOR (shiftWidth - 1 downto 0);
        DIN : in STD_LOGIC_VECTOR (transferWidth - 1 downto 0);
        DOUT : out STD_LOGIC_VECTOR (valueWidth - 1 downto 0)
    );
end Shifter;

architecture Behavioral of Shifter is
    constant ones : STD_LOGIC_VECTOR (shiftWidth - 1 downto 0) := (others => '1');
    constant zeros : STD_LOGIC_VECTOR (valueWidth - transferWidth - 1 downto 0) := (others => '0');
    
    signal sigDout : UNSIGNED (valueWidth - 1 downto 0);
    signal sigDin : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
    signal sigShiftSign, sigDinSign : STD_LOGIC; -- sign = 1 means negative
begin
    sigShiftSign <= '1' when SHIFT(shiftWidth - 1) = '1' else '0';
    sigDinSign <= '1' when DIN(transferWidth - 1) = '1' else '0';
    
    sigDin <= zeros & DIN;
    sigDout <= Shift_Left(UNSIGNED(sigDin), To_Integer(UNSIGNED(SHIFT))) when sigShiftSign = '0'
        else Shift_Right(UNSIGNED(sigDin), To_Integer(UNSIGNED(ones xor SHIFT) + 1));
        
    process (sigDout) is
        constant maxShift : UNSIGNED (shiftWidth - 1 downto 0) := (others => '1');
        variable mask : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
    begin
        -- If you're shifting a -ve number to the righ, then left-pad with 1's not 0's
        if sigShiftSign = '1' and sigDinSign = '1' then
            for shiftPos in 0 to To_Integer(maxShift) loop
                mask := (mask'high downto mask'high - shiftPos + 2 => '1', others => '0');
                
                if SHIFT = STD_LOGIC_VECTOR(To_Unsigned(shiftPos, shiftWidth)) then
                    DOUT <= mask or STD_LOGIC_VECTOR(sigDout);
                end if;
            end loop;
        else
            DOUT <= STD_LOGIC_VECTOR(sigDout);
        end if;
    end process;
end Behavioral;

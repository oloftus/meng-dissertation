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
        SHIFT : in STD_LOGIC_VECTOR (valueWidth - 1 downto 0); -- Only the first 0..shiftWidth bits are used 
        DIN : in STD_LOGIC_VECTOR (transferWidth - 1 downto 0);
        DOUT : out STD_LOGIC_VECTOR (valueWidth - 1 downto 0)
    );
end Shifter;

architecture Behavioral of Shifter is
    constant zeros : STD_LOGIC_VECTOR (valueWidth - transferWidth - 1 downto 0) := (others => '0');
    constant ones : STD_LOGIC_VECTOR  (valueWidth - 1 downto 0) := (others => '1');
    
    signal sigDout1 : UNSIGNED (valueWidth - 1 downto 0);
    signal sigDout2 : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
    signal sigDin : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
    signal sigShiftDirection, sigShiftSign, sigDinSign : STD_LOGIC; -- sign = 1 means negative
    signal shiftVal : UNSIGNED (shiftWidth - 2 downto 0);
begin
    sigShiftSign <= '1' when SHIFT(shiftWidth) = '1' else '0';
    sigShiftDirection <= SHIFT(shiftWidth - 1); -- 1 means shift right
    sigDinSign <= '1' when DIN(transferWidth - 1) = '1' else '0';
    shiftVal <= UNSIGNED(SHIFT(shiftWidth - 2 downto 0));
    
    sigDin <= zeros & DIN;
    sigDout1 <= Shift_Left(UNSIGNED(sigDin), To_Integer(shiftVal)) when sigShiftDirection = '0'
        else Shift_Right(UNSIGNED(sigDin), To_Integer(shiftVal));
    
    process (sigDout1) is
        constant maxShift : UNSIGNED (shiftWidth - 2 downto 0) := (others => '1');
        constant padding : INTEGER := valueWidth - transferWidth;
        variable mask : UNSIGNED (valueWidth - 1 downto 0) := (others => '1');
    begin
        -- If you're shifting a -ve number to the right, then left-pad with 1's not 0's
        if sigShiftDirection = '1' and sigDinSign = '1' then
            for shiftVal2 in 0 to To_Integer(maxShift) loop
                if shiftVal = To_Unsigned(shiftVal2, shiftWidth) then
                    sigDout2 <= STD_LOGIC_VECTOR(
                        mask(valueWidth - 1 downto valueWidth - shiftVal2 - padding - 1) &
                        sigDout1(valueWidth - shiftVal2 - padding - 2 downto 0));
                end if;
            end loop;
        else
            sigDout2 <= STD_LOGIC_VECTOR(sigDout1);
        end if;
    end process;
    
    process (sigShiftSign, sigDinSign, sigDout2) begin
        if (sigShiftSign = '1' and sigDinSign = '1') or (sigShiftSign = '1' and sigDinSign = '0') then
            DOUT <= STD_LOGIC_VECTOR(UNSIGNED(ones xor STD_LOGIC_VECTOR(sigDout2)) + 1);
        else
            DOUT <= sigDout2;
        end if;
    end process;
end Behavioral;

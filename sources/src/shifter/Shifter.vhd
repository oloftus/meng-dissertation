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
    signal sigSign : STD_LOGIC; -- sign = 1 means negative
begin
    sigSign <= '1' when SHIFT(shiftWidth - 1) = '1' else '0';
    sigDin <= zeros & DIN;
    sigDout <= Shift_Left(UNSIGNED(sigDin), To_Integer(UNSIGNED(SHIFT))) when sigSign = '0'
        else Shift_Right(UNSIGNED(sigDin), To_Integer(UNSIGNED(ones xor SHIFT) + 1));
    DOUT <= STD_LOGIC_VECTOR(sigDout);
end Behavioral;

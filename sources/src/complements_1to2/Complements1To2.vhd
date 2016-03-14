library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Complements1To2 is
    generic (
        width : INTEGER
    );
    port (
        ONES : in STD_LOGIC_VECTOR (width - 1 downto 0);
        SIGN : in STD_LOGIC;
        TWOS : out STD_LOGIC_VECTOR (width downto 0) -- Extra bit for sign bit
    );
end Complements1To2;

architecture Behavioral of Complements1To2 is
    constant max : UNSIGNED (width downto 0) := (others => '1');

    signal twosUnsigned : UNSIGNED (width downto 0);
begin
    twosUnsigned <= max - UNSIGNED(ONES) + 1;
    TWOS <= STD_LOGIC_VECTOR(twosUnsigned) when SIGN = '1' else '0' & ONES;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Complements1To2 is
    generic (
        width : INTEGER
    );
    port (
        SIGN : in STD_LOGIC;
        ONES : in STD_LOGIC_VECTOR (width - 1 downto 0);
        TWOS : out STD_LOGIC_VECTOR (width - 1 downto 0)
    );
end Complements1To2;

architecture Behavioral of Complements1To2 is
    constant max : UNSIGNED (width - 1 downto 0) := (others => '1');

    signal twosUnsigned : UNSIGNED (width - 1 downto 0);
begin
    twosUnsigned <= max - UNSIGNED(ONES) + 1;
    TWOS <= STD_LOGIC_VECTOR(twosUnsigned) when SIGN = '1' else '0' & ONES;
end Behavioral;

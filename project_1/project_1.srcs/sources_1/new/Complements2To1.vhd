library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Complements2To1 is
    generic (
        precision : INTEGER
    );
    port (
        twos : in SIGNED (precision - 1 downto 0);
        ones : out UNSIGNED (precision - 1 downto 0);
        sign : out STD_LOGIC -- sign = 1 means negative
    );
end Complements2To1;

architecture Behavioral of Complements2To1 is
    signal twosUnsigned : UNSIGNED (precision - 1 downto 0);
    signal sigSign : STD_LOGIC;
begin
    twosUnsigned <= UNSIGNED(STD_LOGIC_VECTOR(twos));
    sigSign <= '1' when twos(precision - 1) = '1' else '0';
    sign <= sigSign;
    ones <= 2 ** (precision) - twosUnsigned when sigSign = '1' else twosUnsigned;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Complements2To1 is
    generic (
        precision : INTEGER
    );
    port (
        twos : in SIGNED (precision downto 0); -- Extra bit for sign bit
        ones : out UNSIGNED (precision - 1 downto 0);
        sign : out STD_LOGIC -- sign = 1 means negative
    );
end Complements2To1;

architecture Behavioral of Complements2To1 is
    constant max : UNSIGNED (precision downto 0) := (others => '1');

    signal twosUnsigned : UNSIGNED (precision downto 0);
    signal onesLong : UNSIGNED (precision downto 0);
    signal sigSign : STD_LOGIC;
begin
    sigSign <= '1' when twos(precision) = '1' else '0';
    sign <= sigSign;

    twosUnsigned <= UNSIGNED(STD_LOGIC_VECTOR(twos));
    onesLong <= max - twosUnsigned + 1 when sigSign = '1' else twosUnsigned;
    ones <= onesLong(precision - 1 downto 0);
end Behavioral;

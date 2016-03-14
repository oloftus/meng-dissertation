library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Complements2To1_2 is
    generic (
        width : INTEGER
    );
    port (
        TWOS : in STD_LOGIC_VECTOR (width - 1 downto 0);
        ONES : out STD_LOGIC_VECTOR (width - 1 downto 0);
        SIGN : out STD_LOGIC -- sign = 1 means negative
    );
end Complements2To1_2;

architecture Behavioral of Complements2To1_2 is
    constant max : UNSIGNED (width - 1 downto 0) := (others => '1');

    signal sigOnes : UNSIGNED (width - 1 downto 0);
    signal sigSign : STD_LOGIC;
begin
    sigSign <= '1' when TWOS(width - 1) = '1' else '0';
    SIGN <= sigSign;
    
    sigOnes <= max - UNSIGNED(twos) + 1 when sigSign = '1' else UNSIGNED(twos);
    ONES <= STD_LOGIC_VECTOR(sigOnes);
end Behavioral;

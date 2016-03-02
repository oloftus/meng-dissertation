library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AndN is
    generic (
        n : INTEGER
    );
    port (
        DIN : in STD_LOGIC_VECTOR (n - 1 downto 0);
        DOUT : out STD_LOGIC
    );
end AndN;

architecture Behavioral of AndN is
    constant comparisonVect : STD_LOGIC_VECTOR (n - 1 downto 0) := (others => '1');
begin
    DOUT <= '1' when DIN = comparisonVect else '0';
end Behavioral;

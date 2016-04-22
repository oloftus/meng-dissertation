library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrN is
    generic (
        n : INTEGER
    );
    port (
        DIN : in STD_LOGIC_VECTOR (n - 1 downto 0);
        DOUT : out STD_LOGIC
    );
end OrN;

architecture Behavioral of OrN is
    constant comparisonVect : STD_LOGIC_VECTOR (n - 1 downto 0) := (others => '0');
begin
    DOUT <= '1' when DIN /= comparisonVect else '0';
end Behavioral;

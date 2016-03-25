library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BlankMux is
    generic (
        width : INTEGER
    );
    port (
        SEL : STD_LOGIC;
        DIN : STD_LOGIC_VECTOR (width - 1 downto 0);
        DOUT : STD_LOGIC_VECTOR (width - 1 downto 0)
    );
end BlankMux;

architecture Behavioral of BlankMux is
begin
    DOUT <= DIN when SEL = 1 else (others => '0');
end Behavioral;

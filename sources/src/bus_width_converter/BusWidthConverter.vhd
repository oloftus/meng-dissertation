library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BusWidthConverter is
    generic (
        dinWidth : INTEGER;
        doutWidth : INTEGER
    );
    port (
        DIN : in STD_LOGIC_VECTOR (dinWidth - 1 downto 0);
        DOUT : out STD_LOGIC_VECTOR (doutWidth - 1 downto 0)
    );
end BusWidthConverter;

architecture Behavioral of BusWidthConverter is
begin
    DOUT <= STD_LOGIC_VECTOR(Resize(UNSIGNED(DIN), doutWidth));
end Behavioral;

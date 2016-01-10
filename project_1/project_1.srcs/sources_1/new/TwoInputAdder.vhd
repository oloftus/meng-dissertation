library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TwoInputAdder is
    generic (
        precision : INTEGER
    );
    port (
        A : in STD_LOGIC_VECTOR (precision - 1 downto 0);
        B : in STD_LOGIC_VECTOR (precision - 1 downto 0);
        S : out STD_LOGIC_VECTOR (precision - 1 downto 0)
    );
end TwoInputAdder;

architecture Behavioral of TwoInputAdder is
begin
    S <= A + B;
end Behavioral;

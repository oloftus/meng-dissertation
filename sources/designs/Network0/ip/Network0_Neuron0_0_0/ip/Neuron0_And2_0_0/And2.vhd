library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity And2 is
    port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        O : out STD_LOGIC
    );
end And2;

architecture Behavioral of And2 is
begin
    O <= A and B;
end Behavioral;

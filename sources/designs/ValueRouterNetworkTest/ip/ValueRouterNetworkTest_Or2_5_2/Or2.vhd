library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Or2 is
    port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        O : out STD_LOGIC
    );
end Or2;

architecture Behavioral of Or2 is
begin
    O <= A or B;
end Behavioral;

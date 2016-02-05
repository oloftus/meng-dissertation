library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inverter is
    port (
        i : in STD_LOGIC;
        o : out STD_LOGIC
    );
end Inverter;

architecture Behavioral of Inverter is
begin
    o <= not i;
end Behavioral;

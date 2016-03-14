library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Xor2 is
    port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        O : out STD_LOGIC
    );
end Xor2;

architecture Behavioral of Xor2 is
    signal AB : STD_LOGIC_VECTOR (1 downto 0);
begin
    AB <= A & B;
    O <= '1' when AB /= "11" and AB /= "00" else '0';
end Behavioral;

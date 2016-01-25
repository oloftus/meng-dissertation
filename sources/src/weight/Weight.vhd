library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Weight is
    generic (
        size : INTEGER
    );
    port (
        clk : in STD_LOGIC;
        sel : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR (size - 1 downto 0);
        dout : out STD_LOGIC_VECTOR (size - 1 downto 0) 
    );
end Weight;

architecture Behavioral of Weight is
begin
    latch: process (clk) begin
        if clk'event and sel = '1' then
            dout <= din;
        end if;
    end process;
end Behavioral;

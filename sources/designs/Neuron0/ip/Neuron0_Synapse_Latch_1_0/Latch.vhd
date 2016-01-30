library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch is
    generic (
        size : INTEGER
    );
    port (
        CLK : in STD_LOGIC;
        SET : in STD_LOGIC;
        RST : in STD_LOGIC;
        DIN : in STD_LOGIC_VECTOR (size - 1 downto 0);
        DOUT : out STD_LOGIC_VECTOR (size - 1 downto 0) 
    );
end Latch;

architecture Behavioral of Latch is
begin
    latch: process (CLK) begin
        if Rising_Edge(CLK) and SET = '1' then
            DOUT <= DIN;
        elsif Rising_Edge(CLK) and RST = '1' then
            DOUT <= (others => '0');
        end if;
    end process;
end Behavioral;

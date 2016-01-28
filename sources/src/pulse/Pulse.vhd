library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pulse is
    generic (
        multiple : INTEGER;
        multipleWidth : INTEGER
    );
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        P_OUT : out STD_LOGIC
    );
end Pulse;

architecture Behavioral of Pulse is
    constant multipleUnsigned : UNSIGNED (multipleWidth - 1 downto 0) := To_Unsigned(multiple, multipleWidth);
    
    signal sigCnt : UNSIGNED (multipleWidth - 1 downto 0);
begin
    pulse: process (CLK) begin
        if Rising_Edge(CLK) and RST = '1' then
            sigCnt <= (0 => '1', others => '0'); -- Reset count
        elsif Rising_Edge(CLK) and sigCnt = multipleUnsigned - 1 then
            P_OUT <= '1';
            sigCnt <= (others => '0'); -- Reset count
        elsif Rising_Edge(CLK) then
            sigCnt <= sigCnt + 1; -- Increment count
        else
            P_OUT <= '0'; -- Reset pulse when clock is on falling edge
        end if;
    end process;
end Behavioral;

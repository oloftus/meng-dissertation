library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pulse is
    port (
        CLK : in STD_LOGIC;
        SET : in STD_LOGIC;
        RST : in STD_LOGIC;
        P : out STD_LOGIC
    );
end Pulse;

architecture Behavioral of Pulse is
    signal sigCnt : STD_LOGIC_VECTOR (1 downto 0);
begin
    process (CLK)
        constant zero : STD_LOGIC_VECTOR (1 downto 0) := "00";
        constant one : STD_LOGIC_VECTOR (1 downto 0) := "01";
        constant two : STD_LOGIC_VECTOR (1 downto 0) := "10";
    begin
        if Rising_Edge(CLK) and RST = '1' then
            P <= '0';
            sigCnt <= zero;
        elsif Rising_Edge(CLK) and SET = '1' and sigCnt = zero then
            sigCnt <= one;
        elsif Falling_Edge(CLK) and sigCnt = one then
            P <= '1';
            sigCnt <= two;
        elsif Falling_Edge(CLK) and sigCnt = two then
            P <= '0';
        elsif Rising_Edge(CLK) and SET = '0' and sigCnt = two then
            sigCnt <= zero;
        end if;
    end process;
end Behavioral;

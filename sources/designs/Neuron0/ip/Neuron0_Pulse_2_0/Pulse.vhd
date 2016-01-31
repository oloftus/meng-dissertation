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
    signal sigCurrState : STD_LOGIC_VECTOR (1 downto 0);
begin
    process (CLK)
        constant zero : STD_LOGIC_VECTOR (1 downto 0) := "00";
        constant one : STD_LOGIC_VECTOR (1 downto 0) := "01";
        constant two : STD_LOGIC_VECTOR (1 downto 0) := "10";
        constant three : STD_LOGIC_VECTOR (1 downto 0) := "11";
    begin
        if Rising_Edge(CLK) and RST = '1' then
            P <= '0';
            sigCurrState <= zero;
            
        elsif Rising_Edge(CLK) and SET = '1' and sigCurrState = zero then
            sigCurrState <= one;
            
        elsif Falling_Edge(CLK) and sigCurrState = one then
            P <= '1';
            sigCurrState <= two;
            
        elsif Falling_Edge(CLK) and SET = '1' and sigCurrState = two then
            P <= '0';
            sigCurrState <= three;
        
        elsif Falling_Edge(CLK) and SET = '0' and sigCurrState = two then
            P <= '0';
            sigCurrState <= zero;

        elsif Falling_Edge(CLK) and SET = '0' and sigCurrState = three then
            sigCurrState <= zero;
        end if;
    end process;
end Behavioral;

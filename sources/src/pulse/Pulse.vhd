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
    constant zero : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant one : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant two : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant three : STD_LOGIC_VECTOR (1 downto 0) := "11";

    signal sigCurrState : STD_LOGIC_VECTOR (1 downto 0);
begin
    process (CLK) begin
        if Rising_Edge(CLK) then
            if RST = '1' then
                P <= '0';
                sigCurrState <= zero;
            elsif SET = '1' and sigCurrState = zero then
                sigCurrState <= one;
            end if;
        end if;
            
        if Falling_Edge(CLK) then
            if sigCurrState = one then
                P <= '1';
                sigCurrState <= two;
            elsif SET = '1' and sigCurrState = two then
                P <= '0';
                sigCurrState <= three;
            elsif SET = '0' and sigCurrState = two then
                P <= '0';
                sigCurrState <= zero;
            elsif SET = '0' and sigCurrState = three then
                sigCurrState <= zero;
            end if;
        end if;
    end process;
end Behavioral;

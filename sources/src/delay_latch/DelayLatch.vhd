library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DelayLatch is
    generic (
        delay : INTEGER;
        delayWidth : INTEGER
    );
    port (
        CLK, RST, CLR, SET : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end DelayLatch;

architecture Behavioural of DelayLatch is
    constant delayUnsigned : UNSIGNED (delayWidth - 1 downto 0) := To_Unsigned(delay, delayWidth);
    constant zero : UNSIGNED (delayWidth - 1 downto 0) := (others => '0');
    constant one : UNSIGNED (delayWidth - 1 downto 0) := (0 => '1', others => '0');
    
    signal sigDelayCntr : UNSIGNED (delayWidth - 1 downto 0);
begin
    process (CLK) begin
        if Rising_Edge(CLK) and (RST ='1' or CLR = '1') then
            Q <= '0';
            sigDelayCntr <= zero;
        elsif Rising_Edge(CLK) and SET = '1' and sigDelayCntr = zero then
            sigDelayCntr <= one;
        elsif Rising_Edge(CLK) and sigDelayCntr /= delay and sigDelayCntr > 0 then
            sigDelayCntr <= sigDelayCntr + 1;
        elsif Rising_Edge(CLK) and sigDelayCntr = delay then
            sigDelayCntr <= zero;
            Q <= '1';
        end if;
    end process;
end Behavioural;

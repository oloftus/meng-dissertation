library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Delay is
    generic (
        delay : INTEGER;
        delayWidth : INTEGER
    );
    port (
        CLK, RST, SET : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end Delay;

architecture Behavioural of Delay is
    constant delayUnsigned : UNSIGNED (delayWidth - 1 downto 0) := To_Unsigned(delay, delayWidth);
    constant zero : UNSIGNED (delayWidth - 1 downto 0) := (others => '0');
    constant one : UNSIGNED (delayWidth - 1 downto 0) := (0 => '1', others => '0');
    
    signal sigDelayCntr : UNSIGNED (delayWidth - 1 downto 0) := zero;
begin
    process (CLK) begin
        if Rising_Edge(CLK) then
            if RST = '1' then
                Q <= '0';
                sigDelayCntr <= zero;
            else
                case sigDelayCntr is
                    when zero =>
                        if SET = '1' then
                            sigDelayCntr <= one;
                        end if;
                    when delayUnsigned - 1 =>
                        Q <= '1';
                        sigDelayCntr <= sigDelayCntr + 1;
                    when delayUnsigned =>
                        Q <= '0';
                        sigDelayCntr <= zero;
                    when others =>
                        sigDelayCntr <= sigDelayCntr + 1;
                end case;
            end if;
        end if;
    end process;
end Behavioural;

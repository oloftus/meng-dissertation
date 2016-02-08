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
    -- Need extra bit for the possibility of overflowing with + 1
    constant delayUnsigned : UNSIGNED (delayWidth downto 0) := To_Unsigned(delay, delayWidth + 1);
    constant zero : UNSIGNED (delayWidth downto 0) := (others => '0');
    constant one : UNSIGNED (delayWidth downto 0) := (0 => '1', others => '0');
    
    signal sigDelayCntr : UNSIGNED (delayWidth downto 0) := Resize(zero, delayWidth + 1);
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
                    when delayUnsigned =>
                        Q <= '1';
                        sigDelayCntr <= sigDelayCntr + 1;
                    when delayUnsigned + 1 =>
                        Q <= '0';
                        sigDelayCntr <= zero;
                    when others =>
                        sigDelayCntr <= sigDelayCntr + 1;
                end case;
            end if;
        end if;
    end process;
end Behavioural;

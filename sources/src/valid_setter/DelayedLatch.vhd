library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DelayedLatch is
    generic (
        delay : INTEGER -- range 1 to 15
    );
    port (
        CLK, RST, SET : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end DelayedLatch;

architecture Behavioral of DelayedLatch is
    constant delayUnsigned : UNSIGNED (2 downto 0) := To_Unsigned(delay, 3);
    constant zero : UNSIGNED (2 downto 0) := (others => '0');
    constant one : UNSIGNED (2 downto 0) := (0 => '1', others => '0');

    signal sigDelayCntr : UNSIGNED (2 downto 0) := zero;
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
                    when others =>
                        sigDelayCntr <= sigDelayCntr + 1;
                end case;
            end if;
        end if;
    end process;
end Behavioral;

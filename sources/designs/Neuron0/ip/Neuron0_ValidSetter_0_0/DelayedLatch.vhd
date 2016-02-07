library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DelayedLatch is
    generic (
        delayVal : INTEGER;
        delayWidth : INTEGER
    );
    port (
        CLK, RST, SET : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end DelayedLatch;

architecture Behavioral of DelayedLatch is
    component Delay is
        generic (
            delay : INTEGER;
            delayWidth : INTEGER
        );
        port (
            CLK, RST, SET : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
    
    signal sigQ, sigRst : STD_LOGIC;
begin
    delay_inst: Delay
        generic map (
            delay => delayVal,
            delayWidth => delayWidth
        )
        port map (
            CLK => CLK,
            RST => RST,
            SET => SET,
            Q => sigQ
        );
    
    process (CLK) begin
        if Rising_Edge(CLK) then
            if sigQ = '1' then
                Q <= '1';
            elsif RST = '1' then
                Q <= '0';
            end if;
        end if;
    end process;
end Behavioral;

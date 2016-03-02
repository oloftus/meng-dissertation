library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RisingEdgeDetector is
    -- Minimum delay between SE low to SE high 2 clock periods
    port (
        CLK : in STD_LOGIC;
        SET : in STD_LOGIC;
        P : out STD_LOGIC
    );
end RisingEdgeDetector;

architecture Behavioral of RisingEdgeDetector is
    signal sigSet, sigSetDelay, sigP : STD_LOGIC := '0';
begin
    P <= sigP;
    
    process (CLK) begin
        if Rising_Edge(CLK) then
            sigSetDelay <= SET;
            sigSet <= sigSetDelay;
        end if;
    end process;
    
    process (CLK) begin
        if Rising_Edge(CLK) then
            if SET = '1' and sigSet = '0' then
                sigP <= '1';
            else
                sigP <= '0';
            end if;
        end if;
    end process;
end Behavioral;

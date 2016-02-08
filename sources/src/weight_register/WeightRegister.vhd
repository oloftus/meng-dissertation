library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WeightRegister is
    generic (
        dataSize : INTEGER;
        addrSize : INTEGER
    );
    port (
        CLK, RST : in STD_LOGIC;
        ADDR : in STD_LOGIC_VECTOR (addrSize - 1 downto 0);
        WOUT : out STD_LOGIC_VECTOR (dataSize - 1 downto 0);
        WVALID : in STD_LOGIC;
        WADDR : in STD_LOGIC_VECTOR (addrSize - 1 downto 0);
        WIN : in STD_LOGIC_VECTOR (dataSize - 1 downto 0)
    );
end WeightRegister;

architecture Behavioral of WeightRegister is
    signal sigSet : STD_LOGIC;
begin
    sigSet <= '1' when WADDR = ADDR and WVALID = '1' else '0';
        
    latch: process (CLK) begin
        if Rising_Edge(CLK) then
            if sigSet = '1' then
                WOUT <= WIN;
            elsif RST = '1' then
                WOUT <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;

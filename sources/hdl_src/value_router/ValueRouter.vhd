library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ValueRouter is
    generic (
        packetInWidth : INTEGER;
        packetOutWidth : INTEGER
    );
    port (
        CLK, RST : in STD_LOGIC;
        PKT_IN_VALID : in STD_LOGIC;
        PKT_IN : in STD_LOGIC_VECTOR (packetInWidth - 1 downto 0);
        PKT_OUT_VALID : out STD_LOGIC;
        PKT_OUT : out STD_LOGIC_VECTOR (packetOutWidth - 1 downto 0);
        DONE_IN : in STD_LOGIC;
        DONE_OUT : out STD_LOGIC;
        ADDR : in STD_LOGIC_VECTOR (packetInWidth - packetOutWidth - 1 downto 0)
    );
end ValueRouter;

architecture Behavioral of ValueRouter is
    signal sigPacketOutValid : STD_LOGIC := '0';
    signal sigDoneOut : STD_LOGIC := '0';
    signal sigValidChange : STD_LOGIC := '1';
begin
    PKT_OUT_VALID <= sigPacketOutValid;
    DONE_OUT <= sigDoneOut;
    
    process (CLK) is
        variable addressWidth : INTEGER := packetInWidth - packetOutWidth;
        variable packetDestAddr : STD_LOGIC_VECTOR (addressWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            if RST = '1' then
                sigPacketOutValid <= '0';
                sigDoneOut <= '0';
                sigValidChange <= '1';
            else
                if sigDoneOut = '1' then
                    sigDoneOut <= '0';
                end if;
                
                if PKT_IN_VALID = '0' then
                    sigValidChange <= '1';
                end if;
                
                packetDestAddr := PKT_IN(packetInWidth - 1 downto packetInWidth - addressWidth);
                        
                if PKT_IN_VALID = '1' and sigValidChange = '1' and sigPacketOutValid = '0' and packetDestAddr = ADDR then
                    PKT_OUT <= PKT_IN (packetOutWidth - 1 downto 0);
                    sigPacketOutValid <= '1';
                    sigValidChange <= '0';
                elsif DONE_IN = '1' then
                    sigPacketOutValid <= '0';
                    sigDoneOut <= '1';
                end if;
            end if;
        end if;
    end process;
end Behavioral;

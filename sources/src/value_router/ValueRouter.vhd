library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ValueRouter is
    generic (
        packetInWidth : INTEGER;
        packetOutWidth : INTEGER;
        address : INTEGER
    );
    port (
        CLK : in STD_LOGIC;
        PKT_IN_VALID : in STD_LOGIC;
        PKT_IN : in STD_LOGIC_VECTOR (packetInWidth - 1 downto 0);
        PKT_OUT_VALID : out STD_LOGIC;
        PKT_OUT : out STD_LOGIC_VECTOR (packetOutWidth - 1 downto 0);
        DONE_IN : in STD_LOGIC;
        DONE_OUT : out STD_LOGIC
    );
end ValueRouter;

architecture Behavioral of ValueRouter is
    signal sigPacketOutValid : STD_LOGIC := '0';
begin
    PKT_OUT_VALID <= sigPacketOutValid;
    
    process (CLK) is
        variable addressWidth : INTEGER := packetInWidth - packetOutWidth;
        variable packetDestAddr : STD_LOGIC_VECTOR (addressWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            packetDestAddr := PKT_IN(packetInWidth - 1 downto packetInWidth - addressWidth);
            
            if PKT_IN_VALID = '1' and sigPacketOutValid = '0' and packetDestAddr = STD_LOGIC_VECTOR(To_Unsigned(address, addressWidth)) then
                PKT_OUT <= PKT_IN (packetOutWidth - 1 downto 0);
                sigPacketOutValid <= '1';
                DONE_OUT <= '0';
            elsif DONE_IN = '1' then
                sigPacketOutValid <= '0';
                DONE_OUT <= '1';
            end if;
        end if;
    end process;
end Behavioral;

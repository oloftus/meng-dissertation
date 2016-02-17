library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AddressableRegister is
    generic (
        dataWidth : INTEGER;
        addressWidth : INTEGER;
        address : INTEGER
    );
    port (
        CLK, RST : in STD_LOGIC;
        PKT_IN : in STD_LOGIC_VECTOR (addressWidth + dataWidth - 1 downto 0);
        PKT_IN_VALID : in STD_LOGIC;
        VAL_OUT : out STD_LOGIC_VECTOR (dataWidth - 1 downto 0);
        VAL_OUT_VALID : out STD_LOGIC;
        DONE_OUT : out STD_LOGIC
    );
end AddressableRegister;

architecture Behavioral of AddressableRegister is
    signal sigDoneOut : STD_LOGIC;
begin
    DONE_OUT <= sigDoneOut;
    
    process (CLK) is
        variable packetDestAddr : STD_LOGIC_VECTOR (addressWidth - 1 downto 0);
        variable thisAddress : STD_LOGIC_VECTOR (addressWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            packetDestAddr := PKT_IN(dataWidth + addressWidth - 1 downto dataWidth);
            thisAddress := STD_LOGIC_VECTOR(To_Unsigned(address, addressWidth));
            
            if RST = '1' then
                VAL_OUT_VALID <= '0';
                sigDoneOut <= '0';
            elsif sigDoneOut = '1' then
                sigDoneOut <= '0';
            elsif PKT_IN_VALID = '1' and packetDestAddr = thisAddress then
                VAL_OUT <= PKT_IN (dataWidth - 1 downto 0);
                VAL_OUT_VALID <= '1';
                sigDoneOut <= '1';
            end if;
        end if;
    end process;
end Behavioral;

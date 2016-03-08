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
    signal sigValOutValid, sigDoneOut : STD_LOGIC := '0';
begin
    VAL_OUT_VALID <= sigValOutValid;
    DONE_OUT <= sigDoneOut;
    
    process (CLK) is
        variable packetDestAddr : STD_LOGIC_VECTOR (addressWidth - 1 downto 0);
        variable thisAddress : STD_LOGIC_VECTOR (addressWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            if RST = '1' then
                sigValOutValid <= '0';
                sigDoneOut <= '0';
            else
                packetDestAddr := PKT_IN(dataWidth + addressWidth - 1 downto dataWidth);
                thisAddress := STD_LOGIC_VECTOR(To_Unsigned(address, addressWidth));

                if PKT_IN_VALID = '1' and packetDestAddr = thisAddress then
                    VAL_OUT <= PKT_IN (dataWidth - 1 downto 0);
                    sigValOutValid <= '1';
                    sigDoneOut <= '1';
                else
                    if sigDoneOut = '1' then
                        sigDoneOut <= '0';
                    end if;
                    
                    if sigValOutValid = '1' then
                        sigValOutValid <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;

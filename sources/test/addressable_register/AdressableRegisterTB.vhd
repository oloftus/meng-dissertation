library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AddressableRegisterTB is
end AddressableRegisterTB;

architecture Behavioral of AddressableRegisterTB is
    signal sigClk, sigRst : STD_LOGIC;
    signal sigPktInValid, sigValOutValid, sigDoneOut : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (19 downto 0);
    signal sigValOut : STD_LOGIC_VECTOR (15 downto 0);
    
    component AddressableRegister is
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
    end component;
begin
    uut: AddressableRegister
        generic map (
            dataWidth => 16,
            addressWidth => 4,
            address => 8
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            PKT_IN => sigPktIn,
            PKT_IN_VALID => sigPktInValid,
            VAL_OUT => sigValOut,
            VAL_OUT_VALID => sigValOutValid,
            DONE_OUT => sigDoneOut
        );
    
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process is
        constant val1 : STD_LOGIC_VECTOR(15 downto 0) := "00000000"&"11111111";
        constant val2 : STD_LOGIC_VECTOR(15 downto 0) := "11111111"&"00000000";
    begin
        sigPktIn <= (others => '0');
        sigPktInValid <= '0';

        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';

        sigPktIn <= "1000"&val1;
        sigPktInValid <= '1';
        wait for 200ns;
        assert sigValOut = val1 report "Test failed: 1";
        assert sigValOutValid = '1' report "Test failed: 2";
        
        sigPktInValid <= '0';
        wait for 200ns;
        
        sigPktIn <= "0100"&val2;
        sigPktInValid <= '1';
        wait for 200ns;
        assert sigValOut = val1 report "Test failed: 3";
        assert sigValOutValid = '1' report "Test failed: 4";
        
        sigPktInValid <= '0';

--        sigValOut
--        sigValOutValid
--        sigDoneOut

        wait;
    end process;

end Behavioral;

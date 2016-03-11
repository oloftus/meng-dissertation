library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ValueRouterTB is
    generic (
        packetInWidth : INTEGER := 20;
        packetOutWidth : INTEGER := 16
    );
end ValueRouterTB;

architecture Behavioral of ValueRouterTB is
    signal sigClk, sigRst : STD_LOGIC;
    signal sigPktInValid, sigPktOutValid, sigDoneIn, sigDoneOut : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (packetInWidth - 1 downto 0);
    signal sigPktOut : STD_LOGIC_VECTOR (packetOutWidth - 1 downto 0);
    signal sigAddr : STD_LOGIC_VECTOR (packetInWidth - packetOutWidth - 1 downto 0);
    
    component ValueRouter is
        generic (
            packetInWidth : INTEGER;
            packetOutWidth : INTEGER
        );
        port (
            CLK : in STD_LOGIC;
            PKT_IN_VALID : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR (packetInWidth - 1 downto 0);
            PKT_OUT_VALID : out STD_LOGIC;
            PKT_OUT : out STD_LOGIC_VECTOR (packetOutWidth - 1 downto 0);
            DONE_IN : in STD_LOGIC;
            DONE_OUT : out STD_LOGIC;
            ADDR : in STD_LOGIC_VECTOR (packetInWidth - packetOutWidth - 1 downto 0)
        );
    end component;
    
    constant address : INTEGER := 8;
    constant addrBits : STD_LOGIC_VECTOR (packetInWidth - packetOutWidth - 1 downto 0) := "1000";
begin
    uut: ValueRouter
        generic map (
            packetInWidth => packetInWidth,
            packetOutWidth => packetOutWidth
        )
        port map (
            CLK => sigClk,
            PKT_IN_VALID => sigPktInValid,
            PKT_IN  => sigPktIn,
            PKT_OUT_VALID => sigPktOutValid,
            PKT_OUT => sigPktOut,
            DONE_IN => sigDoneIn,
            DONE_OUT => sigDoneOut,
            ADDR => sigAddr
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process is
        constant wrongAddrBits : STD_LOGIC_VECTOR (packetInWidth - packetOutWidth - 1 downto 0) := "0100";
        constant pktOut1 : STD_LOGIC_VECTOR (packetOutWidth - 1 downto 0) := "11111111"&"00000000";
        constant pktOut2 : STD_LOGIC_VECTOR (packetOutWidth - 1 downto 0) := "00000000"&"11111111";
    begin
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';

        sigAddr <= addrBits;
        sigDoneIn <= '0';
        
        -- Verify packets with the correct address are forwarded
        sigPktInValid <= '1';
        sigPktIn <= addrBits & pktOut1;
        wait for 110ns;
        assert sigPktOut = pktOut1 report "Test failed: 1";
        assert sigPktOutValid = '1' report "Test failed: 2";
        wait for 90ns;
        
        -- Verify packets with an incorrect address are ignored
        sigPktInValid <= '1';
        sigPktIn <= wrongAddrBits & pktOut2;
        wait for 110ns;
        assert sigPktOut = pktOut1 report "Test failed: 3";
        assert sigPktOutValid = '1' report "Test failed: 4";
        wait for 90ns;

        sigPktInValid <= '0';
        wait for 200ns;
        
        -- Verify the done signal is forwarded
        sigDoneIn <= '1';
        wait for 110ns;
        assert sigPktOutValid = '0' report "Test failed: 5";
        assert sigDoneOut = '1' report "Test failed: 6";
        wait for 90ns;
        
        -- Verify packets sent after forwarding the done signal are correctly handled
        sigDoneIn <= '0';
        sigPktInValid <= '1';
        sigPktIn <= addrBits & pktOut2;
        wait for 110ns;
        assert sigPktOut = pktOut2 report "Test failed: 7";
        assert sigPktOutValid = '1' report "Test failed: 8";
        assert sigDoneOut = '0' report "Test failed: 9";
        wait for 90ns;
        
        sigPktInValid <= '0';
        wait for 200ns;
        
        -- Verify the done signal is high for only one clock cycle
        sigDoneIn <= '1';
        wait for 200ns;
        sigDoneIn <= '0';
        wait for 110ns;
        assert sigDoneOut = '0' report "Test failed: 10"; 
        
        wait;
    end process;

end Behavioral;

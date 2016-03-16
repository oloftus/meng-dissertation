library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AddressableRegisterTB is
    generic (
        dataWidth : INTEGER := 16;
        addressWidth : INTEGER := 4;
        address : INTEGER := 8
    );
end AddressableRegisterTB;

architecture Behavioral of AddressableRegisterTB is
    signal sigClk, sigRst : STD_LOGIC;
    signal sigPktInValid, sigValOutValid1, sigDoneOut1, sigValOutValid2, sigDoneOut2, sigValOutValid3, sigDoneOut3 : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (dataWidth + addressWidth - 1 downto 0);
    signal sigValOut1 : STD_LOGIC_VECTOR (dataWidth - 1 downto 0);
    signal sigValOut2 : STD_LOGIC_VECTOR (dataWidth + 4 + 3 - 1 downto 0);
    signal sigValOut3 : STD_LOGIC_VECTOR (dataWidth - 4 - 3 - 1 downto 0);
    
    component AddressableRegister is
        generic (
            dataWidth : INTEGER;
            addressWidth : INTEGER;
            address : INTEGER;
            padHighWidth : INTEGER := 0;
            padLowWidth : INTEGER := 0
        );
        port (
            CLK, RST : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR (addressWidth + dataWidth - 1 downto 0);
            PKT_IN_VALID : in STD_LOGIC;
            VAL_OUT : out STD_LOGIC_VECTOR (dataWidth + padHighWidth + padLowWidth - 1 downto 0);
            VAL_OUT_VALID : out STD_LOGIC;
            DONE_OUT : out STD_LOGIC
        );
    end component;
begin
    uut1: AddressableRegister
        generic map (
            dataWidth => dataWidth,
            addressWidth => addressWidth,
            address => address
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            PKT_IN => sigPktIn,
            PKT_IN_VALID => sigPktInValid,
            VAL_OUT => sigValOut1,
            VAL_OUT_VALID => sigValOutValid1,
            DONE_OUT => sigDoneOut1
        );
    
    uut2: AddressableRegister
        generic map (
            dataWidth => dataWidth,
            addressWidth => addressWidth,
            address => address,
            padHighWidth => 4,
            padLowWidth => 3
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            PKT_IN => sigPktIn,
            PKT_IN_VALID => sigPktInValid,
            VAL_OUT => sigValOut2,
            VAL_OUT_VALID => sigValOutValid2,
            DONE_OUT => sigDoneOut2
        );
    
    uut3: AddressableRegister
        generic map (
            dataWidth => dataWidth,
            addressWidth => addressWidth,
            address => address,
            padHighWidth => -4,
            padLowWidth => -3
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            PKT_IN => sigPktIn,
            PKT_IN_VALID => sigPktInValid,
            VAL_OUT => sigValOut3,
            VAL_OUT_VALID => sigValOutValid3,
            DONE_OUT => sigDoneOut3
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
        constant correctAddr : STD_LOGIC_VECTOR(3 downto 0) := "1000";
        constant incorrectAddr : STD_LOGIC_VECTOR(3 downto 0) := "0100";
    begin
        sigPktIn <= (others => '0');
        sigPktInValid <= '0';

        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';

        -- Test correctly addressed packets are received correctly
        sigPktIn <= correctAddr & val1;
        sigPktInValid <= '1';
        
        wait until sigDoneOut1 = '1';
        wait for 10ns;
        assert sigValOut1 = val1 report "Test failed: 1";
        assert sigValOutValid1 = '1' report "Test failed: 2";
--        assert sigDoneOut1 = '1' report "Test failed: 3";
        
        wait for 90ns;
        sigPktInValid <= '0';
        
        wait for 110ns;
        assert sigValOutValid1 = '0' report "Test failed: 4";
        assert sigDoneOut1 = '0' report "Test failed: 5";
        wait for 90ns; -- 500ns
        
        -- Test incorrectly addressed packets are rejected correctly
        sigPktIn <= incorrectAddr & val2;
        sigPktInValid <= '1';
        
        wait for 110ns;
        assert sigValOut1 = val1 report "Test failed: 6";
        assert sigValOutValid1 = '0' report "Test failed: 7";
        
        wait for 90ns;
        sigPktInValid <= '0';

        wait for 200ns; -- 1000ns
        
        -- Test values are padded correctly
        sigPktIn <= correctAddr & val1;
        sigPktInValid <= '1';
        
        wait until sigDoneOut1 = '1';
        wait for 10ns;
        assert sigValOut2 = "0000" & val1 & "000" report "Test failed: 8";
        
        wait for 90ns;
        sigPktInValid <= '0';

        wait for 200ns;        
        
        -- Test values are slices correctly
        sigPktIn <= correctAddr & val1;
        sigPktInValid <= '1';
        
        wait until sigDoneOut1 = '1';
        wait for 10ns;
        assert sigValOut3 = val1 (11 downto 3) report "Test failed: 9";
        
        wait for 90ns;
        sigPktInValid <= '0';

        wait;
    end process;

end Behavioral;

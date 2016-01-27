library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity WeightRegisterTB is
    generic (
        tbDataSize : INTEGER := 8;
        tbAddrSize : INTEGER := 2
    );
end WeightRegisterTB;

architecture Behavioral of WeightRegisterTB is
    signal sigClk, sigRst : STD_LOGIC;
    signal sigWValid : STD_LOGIC;
    signal sigAddr, sigWAddr : STD_LOGIC_VECTOR (tbAddrSize - 1 downto 0);
    signal sigWIn, sigWOut : STD_LOGIC_VECTOR (tbDataSize - 1 downto 0);

    component WeightRegister is
        generic (
            dataSize : INTEGER;
            addrSize : INTEGER
        );
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
    
            ADDR : in STD_LOGIC_VECTOR (addrSize - 1 downto 0);
            WOUT : out STD_LOGIC_VECTOR (dataSize - 1 downto 0);
    
            WVALID : in STD_LOGIC;
            WADDR : in STD_LOGIC_VECTOR (addrSize - 1 downto 0);
            WIN : in STD_LOGIC_VECTOR (dataSize - 1 downto 0)
        );
    end component;
begin
    uut: WeightRegister
        generic map (
            dataSize => tbDataSize,
            addrSize => tbAddrSize
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            ADDR => sigAddr,
            WOUT => sigWOut,
            WVALID => sigWValid,
            WADDR => sigWAddr,
            WIN => sigWIn
        );
    
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process is
        constant zeroAddr : STD_LOGIC_VECTOR (tbAddrSize - 1 downto 0) := (others => '0');

        constant weight0 : STD_LOGIC_VECTOR (tbDataSize - 1 downto 0) := (others => '0');
        constant weight1 : STD_LOGIC_VECTOR (tbDataSize - 1 downto 0) := "00000001";
        constant weight2 : STD_LOGIC_VECTOR (tbDataSize - 1 downto 0) := "00000010";
    begin
        sigAddr <= "01";
        sigRst <= '0';

        sigWValid <= '0';
        sigWAddr <= zeroAddr;
        sigWIn <= weight0;

        -- Test that the synchronous reset line works
        wait for 50ns;
        sigRst <= '1';
        wait for 100ns;
        sigRst <= '0';
        wait for 50ns;
        
        assert sigWOut = weight0 report "Test failed : 1";

        -- Test that latching in occurs correctly and on the clock rising edge
        wait for 50ns;
        sigWAddr <= "01";
        sigWIn <= weight1;
        sigWValid <= '1';
        
        assert sigWOut = weight0 report "Test failed : 2";
        wait for 100ns;
        assert sigWOut = weight1 report "Test failed : 3";
        
        sigWValid <= '0';
        sigWAddr <= zeroAddr;
        sigWIn <= weight0;

        wait for 100ns;
        
        -- Test that latching does not occur if the address doesn't match
        sigWAddr <= "10";
        sigWIn <= weight2;
        sigWValid <= '1';
        
        assert sigWOut = weight1 report "Test failed : 4";
        wait for 100ns;
        assert sigWOut = weight1 report "Test failed : 5";
        
        sigWValid <= '0';
        sigWAddr <= zeroAddr;
        sigWIn <= weight0;
        
        wait;
    end process;

end Behavioral;

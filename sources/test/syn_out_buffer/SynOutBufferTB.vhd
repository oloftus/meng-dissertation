library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SynOutBufferTB is
    generic (
        doutWidth : INTEGER := 8;
        dinWidth : INTEGER := 6;
        numInputs : INTEGER := 3
    );
end SynOutBufferTB;

architecture Behavioral of SynOutBufferTB is
    component SynOutBuffer is
        generic (
            doutWidth : INTEGER;
            dinWidth : INTEGER;
            numInputs : INTEGER range 0 to 31
        );
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            DIN : in STD_LOGIC_VECTOR (dinWidth * numInputs - 1 downto 0);
            DVALID : in STD_LOGIC_VECTOR (numinputs - 1 downto 0);
            NXT : in STD_LOGIC;
            DOUT : out STD_LOGIC_VECTOR (doutWidth - 1 downto 0)
        );
    end component;
    
    signal sigClk : STD_LOGIC;
    signal sigRst : STD_LOGIC;
    signal sigDin : STD_LOGIC_VECTOR (dinWidth * numInputs - 1 downto 0);
    signal sigDValid : STD_LOGIC_VECTOR (numinputs - 1 downto 0);
    signal sigNext : STD_LOGIC;
    signal sigDout : STD_LOGIC_VECTOR (doutWidth - 1 downto 0);
begin
    uut: SynOutBuffer
        generic map (
            doutWidth => doutWidth,
            dinWidth => dinWidth,
            numInputs => numInputs
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            DIN => sigDin,
            DVALID => sigDValid,
            NXT => sigNext,
            DOUT => sigDout
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process is
        variable loc : INTEGER := 0;
        
        constant val1 : STD_LOGIC_VECTOR (dinWidth - 1 downto 0) := "110000";
        constant val2 : STD_LOGIC_VECTOR (dinWidth - 1 downto 0) := "001100";
        constant val3 : STD_LOGIC_VECTOR (dinWidth - 1 downto 0) := "000011";
        constant val4 : STD_LOGIC_VECTOR (dinWidth - 1 downto 0) := "100001";
        constant val5 : STD_LOGIC_VECTOR (dinWidth - 1 downto 0) := "010010";
        constant val6 : STD_LOGIC_VECTOR (dinWidth - 1 downto 0) := "001100";
    begin
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        -- Test we can store and retrieve data
        loc := 0;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val1;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        loc := 1;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val2;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        loc := 2;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val3;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        sigNext <= '1';
        wait for 110ns;
        
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val1), doutWidth)) report "Test failed: 1";
        wait for 200ns;
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val2), doutWidth)) report "Test failed: 2";
        wait for 200ns;
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val3), doutWidth)) report "Test failed: 3";
        wait for 200ns;
        sigNext <= '0';
        sigDin <= (others => '0');

        wait for 100ns;
        
        -- Test we can store and retrieve data again
        loc := 0;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val4;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        loc := 1;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val5;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        loc := 2;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val6;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        sigNext <= '1';
        wait for 100ns;
        
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val4), doutWidth)) report "Test failed: 4";
        wait for 200ns;
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val5), doutWidth)) report "Test failed: 5";
        wait for 200ns;
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val6), doutWidth)) report "Test failed: 6";
        wait for 200ns;
        sigNext <= '0';
        sigDin <= (others => '0');

        wait for 100ns;
        
        -- Test we can store and retrieve data when it come in in parallel
        loc := 0;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val4;
        sigDValid(loc) <= '1';
        wait for 200ns;
        sigDValid(loc) <= '0';
        
        loc := 1;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val5;
        loc := 2;
        sigDin(loc * dinWidth + dinWidth - 1 downto loc * dinWidth) <= val6;
        sigDValid(1) <= '1';
        sigDValid(2) <= '1';
        wait for 200ns;
        sigDValid(1) <= '0';
        sigDValid(2) <= '0';
        
        sigNext <= '1';
        wait for 100ns;
        
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val4), doutWidth)) report "Test failed: 7";
        wait for 200ns;
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val5), doutWidth)) report "Test failed: 8";
        wait for 200ns;
        assert sigDout = STD_LOGIC_VECTOR(Resize(UNSIGNED(val6), doutWidth)) report "Test failed: 9";
        wait for 200ns;
        sigNext <= '0';
        sigDin <= (others => '0');
        
        wait for 100ns;
        
        wait;
    end process;
    
end Behavioral;

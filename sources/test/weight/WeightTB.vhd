library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WeightTB is
    generic (
        tbSize : INTEGER := 12
    );
end WeightTB;

architecture Behavioral of WeightTB is
    signal sigClk, sigSel : STD_LOGIC;
    signal sigDin, sigDout : STD_LOGIC_VECTOR (tbSize - 1 downto 0);
    
    constant zero : STD_LOGIC_VECTOR (tbSize - 1 downto 0) := "0000"&"0000"&"0000";
    constant one : STD_LOGIC_VECTOR (tbSize - 1 downto 0) := "1111"&"1111"&"1111";
    constant zed : STD_LOGIC_VECTOR (tbSize - 1 downto 0) := "ZZZZ"&"ZZZZ"&"ZZZZ";
    
    component Weight is
        generic (
            size : INTEGER
        );
        port (
            clk : in STD_LOGIC;
            sel : in STD_LOGIC;
            din : in STD_LOGIC_VECTOR (size - 1 downto 0);
            dout : out STD_LOGIC_VECTOR (size - 1 downto 0) 
        );
    end component;
begin
    uut: Weight
        generic map (
            size => tbSize
        )
        port map (
            clk => sigClk,
            sel => sigSel,
            din => sigDin,
            dout => sigDout 
        );
    
    tb: process begin
        sigDin <= zero;
        sigSel <= '1';
        
        sigClk <= '1';
        wait for 100ns;
        sigClk <= '0';
        wait for 100ns;
        
        sigSel <= '0';
        sigDin <= zed;
        
        assert sigDout = zero;
                
        sigClk <= '1';
        wait for 100ns;
        sigClk <= '0';
        wait for 100ns;
        assert sigDout = zero;

        sigDin <= one;
        sigSel <= '1';
        
        wait for 100ns;

        sigClk <= '1';
        wait for 100ns;
        sigClk <= '0';
        wait for 100ns;
        assert sigDout = one;

        sigSel <= '0';
        sigDin <= zed;
        
        sigClk <= '1';
        wait for 100ns;
        sigClk <= '0';
        wait for 100ns;
        assert sigDout = one;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShifterTB is
    generic (
        shiftWidth : INTEGER := 4;
        transferWidth : INTEGER := 5;
        valueWidth : INTEGER := 9
    );
end ShifterTB;

architecture Behavioral of ShifterTB is
    component Shifter is
        generic (
            shiftWidth : INTEGER;
            transferWidth : INTEGER;
            valueWidth : INTEGER
        );
        port (
            SHIFT : in STD_LOGIC_VECTOR (valueWidth - 1 downto 0); -- Only the first 0..shiftWidth bits are used 
            DIN : in STD_LOGIC_VECTOR (transferWidth - 1 downto 0);
            DOUT : out STD_LOGIC_VECTOR (valueWidth - 1 downto 0)
        );
    end component;
    
    signal sigShift : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
    signal sigDin : STD_LOGIC_VECTOR (transferWidth - 1 downto 0);
    signal sigDout : STD_LOGIC_VECTOR (valueWidth - 1 downto 0);
begin
    uut: Shifter
        generic map (
            shiftWidth => shiftWidth,
            transferWidth => transferWidth,
            valueWidth => valueWidth
        )
        port map (
            SHIFT => sigShift,
            DIN => sigDin,
            DOUT => sigDout
        );

    tb: process begin
        sigShift(3 downto 0) <= "0011"; -- << 3 (* 8)
        sigShift(valueWidth - 1 downto 4) <= (others => '0');
        sigDin <= "00011"; -- 3
        wait for 10ns;
        assert sigDout = "000011000" report "Test failed: 1"; -- 24

        wait for 190ns;
    
        sigShift(3 downto 0) <= "1011"; -- << 3 * -1 (* -8)
        sigShift(valueWidth - 1 downto 4) <= (others => '0');
        sigDin <= "00011"; -- 3
        wait for 10ns;
        assert sigDout = "111101000" report "Test failed: 2"; -- -24
        
        wait for 190ns;
        
        sigShift(3 downto 0) <= "0111"; -- >> 3 (* 1/8)
        sigShift(valueWidth - 1 downto 4) <= (others => '0');
        sigDin <= "11000"; -- -8
        wait for 10ns;
        assert sigDout = "111111111" report "Test failed: 3"; -- -1

        wait for 190ns;
        
        sigShift(3 downto 0) <= "1111"; -- >> 3 * -1 (* -1/8)
        sigShift(valueWidth - 1 downto 4) <= (others => '0');
        sigDin <= "11000"; -- -8
        wait for 10ns;
        assert sigDout = "000000001" report "Test failed: 4"; -- 1

        wait;    
    end process;
end Behavioral;

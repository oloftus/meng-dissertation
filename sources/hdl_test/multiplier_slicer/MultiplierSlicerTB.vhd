library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplierSlicerTB is
end MultiplierSlicerTB;

architecture Behavioral of MultiplierSlicerTB is
    signal sigA, sigB : STD_LOGIC_VECTOR (15 downto 0);
    signal sigP : STD_LOGIC_VECTOR (15 downto 0);
    signal sigClk : STD_LOGIC;
    
    component MultiplierSlicer is
        port (
            CLK : in STD_LOGIC;
            A : in STD_LOGIC_VECTOR (15 downto 0);
            B : in STD_LOGIC_VECTOR (15 downto 0);
            P : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
begin
    uut: MultiplierSlicer
        port map (
            A => sigA,
            B => sigB,
            CLK => sigClk,
            P => sigP
        );
    
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process clock;
    
    tb: process begin
        -- Multiply +ve numbers
        sigA <= "0"&"00001001"&"1100000"; -- +9.75
        sigB <= "0"&"00010000"&"0011100"; -- +16.21875
        wait for 110ns;
        assert sigP = "0"&"10011110"&"0010001" report "Test failed: 1"; -- 158.133
        
        wait for 100ns;

        -- Multiply -ve numbers (two complement)
        sigA <= "1"&"11111101"&"1100000"; -- -9.75
        sigB <= "0"&"11110101"&"0010100"; -- -16.21875
        wait for 100ns;
        assert sigP = "0"&"10011110"&"0010001" report "Test failed: 2"; -- 158.133

        wait;
    end process;
end Behavioral;

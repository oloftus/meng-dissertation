library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MagnitudeComparatorTB is
end MagnitudeComparatorTB;

architecture Behavioral of MagnitudeComparatorTB is
    signal sigInput : UNSIGNED (6 downto 0);
    signal sigOutput : STD_LOGIC_VECTOR (3 downto 0);
    
    component MagnitudeComparator is
        port (
            A, B, C, D, E, F, G : in STD_LOGIC;
            Z : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
begin
    uut: MagnitudeComparator
        port map (
            A => sigInput(6),
            B => sigInput(5),
            C => sigInput(4),
            D => sigInput(3),
            E => sigInput(2),
            F => sigInput(1),
            G => sigInput(0),
            Z => sigOutput
        );
    
    process begin
        -- Test vectors came from amin1997piecewise paper
        
        -- |X| >= 5
        sigInput <= "1111"&"111"; -- 15.9
        wait for 100ns;
        assert sigOutput = "1000" report "Test failed: Z4 should be 1";

        sigInput <= "0101"&"000"; -- 5
        wait for 100ns;
        assert sigOutput = "1000" report "Test failed: Z4 should be 1";
        
        
        -- 2.375 <= |X| < 5
        sigInput <= "0100"&"111"; -- 4.9
        wait for 100ns;
        assert sigOutput = "0100" report "Test failed: Z3 should be 1";
        
        sigInput <= "0010"&"011"; -- 2.375
        wait for 100ns;
        assert sigOutput = "0100" report "Test failed: Z3 should be 1";


        -- 1 <= |X| < 2.375
        sigInput <= "0010"&"010"; -- 2.3749
        wait for 100ns;
        assert sigOutput = "0010" report "Test failed: Z2 should be 1";

        sigInput <= "0001"&"000"; -- 1
        wait for 100ns;
        assert sigOutput = "0010" report "Test failed: Z2 should be 1";


        -- 0 <= |X| < 1
        sigInput <= "0000"&"111"; -- 0.99
        wait for 100ns;
        assert sigOutput = "0001" report "Test failed: Z1 should be 1";

        sigInput <= "0000"&"000"; -- 0
        wait for 100ns;
        assert sigOutput = "0001" report "Test failed: Z1 should be 1";
    end process;
end Behavioral;

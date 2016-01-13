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
        -- Vectors came from amin1997piecewise paper
        sigInput <= "1111"&"111"; -- 15.9: |X| >= 5
        -- assert Z4
        wait for 100ns;

        sigInput <= "0101"&"000"; -- 5: |X| >= 5
        -- assert Z4
        wait for 100ns;
        
        sigInput <= "0100"&"111"; -- 4.9:  2.375 <= |X| < 5
        -- assert Z3
        wait for 100ns;
        
        sigInput <= "0010"&"011"; -- 2.375:  2.375 <= |X| < 5
        -- assert Z3
        wait for 100ns;

        sigInput <= "0010"&"010"; -- 2.3749: 1 <= |X| < 2.375
        -- assert Z2
        wait for 100ns;

        sigInput <= "0001"&"000"; -- 1: 1 <= |X| < 2.375
        -- assert Z2
        wait for 100ns;

        sigInput <= "0000"&"111"; -- 0.99: 0 <= |X| < 1
        -- assert Z1
        wait for 100ns;

        sigInput <= "0000"&"000"; -- 0: 0 <= |X| < 1
        -- assert Z1
        wait for 100ns;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity And2TB is
end And2TB;

architecture Behavioral of And2TB is
    signal sigA, sigB, sigO : STD_LOGIC;
    
    component And2 is
        port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            O : out STD_LOGIC
        );
    end component;
begin
    uut: And2
        port map (
            A => sigA,
            B => sigB,
            O => sigO
        );

    tb: process begin
        sigA <= '1';
        sigB <= '1';
        wait for 100ns;
        assert sigO = '1' report "Test failed: 1";

        sigA <= '0';
        sigB <= '0';
        wait for 100ns;
        assert sigO = '0' report "Test failed: 2";

        sigA <= '1';
        sigB <= '0';
        wait for 100ns;
        assert sigO = '0' report "Test failed: 3";

        sigA <= '0';
        sigB <= '1';
        wait for 100ns;
        assert sigO = '0' report "Test failed: 4";
        
        wait;
    end process;
end Behavioral;

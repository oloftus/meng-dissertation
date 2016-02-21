library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrNTB is
    generic (
        n : INTEGER := 5
    );
end OrNTB;

architecture Behavioral of OrNTB is
    component OrN is
        generic (
            n : INTEGER
        );
        port (
            DIN : in STD_LOGIC_VECTOR (n - 1 downto 0);
            DOUT : out STD_LOGIC
        );
    end component;
    
    signal sigDin : STD_LOGIC_VECTOR (n - 1 downto 0);
    signal sigDout : STD_LOGIC;
begin
    uut: OrN
        generic map (
            n => n
        )
        port map (
            DIN => sigDin,
            DOUT => sigDout
        );
    
    tb: process begin
        sigDin <= "10100";
        wait for 10ns;
        assert sigDout = '1' report "Test failed: 1";
        
        wait for 90ns;
        
        sigDin <= "00000";
        wait for 10ns;
        assert sigDout = '0' report "Test failed: 3";
        
        wait;
    end process;

end Behavioral;

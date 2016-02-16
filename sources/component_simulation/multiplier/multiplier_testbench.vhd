library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_testbench is
end multiplier_testbench;

architecture Behavioral of multiplier_testbench is
    signal sigA, sigB, sigP : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal sigClk : STD_LOGIC;
    
    component multiplier_harness_wrapper is
        port (
            A : in STD_LOGIC_VECTOR ( 3 downto 0 );
            B : in STD_LOGIC_VECTOR ( 3 downto 0 );
            CLK : in STD_LOGIC;
            P : out STD_LOGIC_VECTOR ( 3 downto 0 )
        );
    end component;
begin
    multiplier_harness_wrapper_inst: multiplier_harness_wrapper
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
        sigA <= "0010";
        sigB <= "0100";
        
        wait;
    end process;
end Behavioral;

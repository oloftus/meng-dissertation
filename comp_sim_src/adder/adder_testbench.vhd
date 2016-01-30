library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_testbench is
end adder_testbench;

architecture Behavioral of adder_testbench is
    signal sigClk : STD_LOGIC;
    signal sigA, sigB, sigS : STD_LOGIC_VECTOR ( 3 downto 0);
    
    component adder_harness_wrapper is
        port (
            A : in STD_LOGIC_VECTOR ( 3 downto 0 );
            B : in STD_LOGIC_VECTOR ( 3 downto 0 );
            CLK : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR ( 3 downto 0 )
        );
    end component;
    
begin
    uut: adder_harness_wrapper
        port map (
            A => sigA,
            B => sigB,
            CLK => sigClk,
            S => sigS
        );
      
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process clock;

    tb: process begin
        sigA <= "0100"; -- 4
        sigB <= "0010"; -- 2
        
        wait;
    end process;
end Behavioral;

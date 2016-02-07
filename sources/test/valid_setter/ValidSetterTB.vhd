library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ValidSetterTB is
end ValidSetterTB;

architecture Behavioral of ValidSetterTB is
    signal sigClk, sigRst, sigSynInValid, sigSynOutValid, sigSynInClr: STD_LOGIC;
    
    component ValidSetter is
        generic (
            latency : INTEGER;
            latencyWidth : INTEGER
        );
        port (
            CLK, RST, SYN_IN_VALID : in STD_LOGIC;
            SYN_OUT_VALID, SYN_IN_CLR : out STD_LOGIC
        );
    end component;
begin
    uut: ValidSetter
        generic map (
            latency => 2,
            latencyWidth => 2
        )
        port map (
            CLK => sigClk,
            RST => sigRst,
            SYN_IN_VALID => sigSynInValid,
            SYN_OUT_VALID => sigSynOutValid,
            SYN_IN_CLR => sigSynInClr
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;

    tb: process begin
        sigSynInValid <= '0';
        
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        sigSynInValid <= '1';

        wait;
    end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ValidSetterTB is
end ValidSetterTB;

architecture Behavioral of ValidSetterTB is
    signal sigClk, sigRst, sigSynInValid, sigSynOutValid, sigSynInClr: STD_LOGIC;
    
    component ValidSetter is
        generic (
            latency : INTEGER
        );
        port (
            CLK, RST, SYN_IN_VALID : in STD_LOGIC;
            SYN_OUT_VALID, SYN_IN_CLR : out STD_LOGIC
        );
    end component;
begin
    uut: ValidSetter
        generic map (
            latency => 2
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
        sigRst <= '1';
        sigSynInValid <= '0';
        wait for 200ns;
        sigRst <= '0';
        sigSynInValid <= '1';
        
        wait for 490ns;
        assert sigSynOutValid = '0' report "Test failed: 1";
        wait for 20ns;
        assert sigSynOutValid = '1' report "Test failed: 2";
        wait for 180ns;
        assert sigSynInClr = '0' report "Test failed: 3";
        wait for 20ns;
        assert sigSynInClr = '1' report "Test failed: 4";
        wait for 380ns;
        assert sigSynInClr = '1' report "Test failed: 5";
        wait for 20ns;
        assert sigSynInClr = '0' report "Test failed: 6";
        
        wait for 90ns;
        sigRst <= '1';
        sigSynInValid <= '0';
        wait for 110ns;
        assert sigSynOutValid = '0' report "Test failed: 7";
        wait for 90ns;
        sigRst <= '0';
        
        wait for 200ns; -- 2 clock periods in total with RST above
        sigSynInValid <= '1';

        -- Repeat above
        wait for 490ns;
        assert sigSynOutValid = '0' report "Test failed: 8";
        wait for 20ns;
        assert sigSynOutValid = '1' report "Test failed: 9";
        wait for 180ns;
        assert sigSynInClr = '0' report "Test failed: 10";
        wait for 20ns;
        assert sigSynInClr = '1' report "Test failed: 11";
        wait for 380ns;
        assert sigSynInClr = '1' report "Test failed: 12";
        wait for 20ns;
        assert sigSynInClr = '0' report "Test failed: 13";

        wait;
    end process;

end Behavioral;

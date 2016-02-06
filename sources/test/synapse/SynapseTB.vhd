library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SynapseTB is
    generic (
        size : INTEGER := 4
    );
end SynapseTB;

architecture Behavioral of SynapseTB is
    signal sigClk, sigClr, sigRst, sigSynInValid, sigSynOutValid : STD_LOGIC;
    signal sigSynIn, sigSynOut : STD_LOGIC_VECTOR (size - 1 downto 0);

    component Synapse is
--        generic (
--            size : INTEGER
--        );
        port (
            CLK, CLR, RST : in STD_LOGIC;
            SYN_IN_VALID : in STD_LOGIC;
            SYN_IN : in STD_LOGIC_VECTOR (size - 1 downto 0);
            SYN_OUT_VALID : out STD_LOGIC;
            SYN_OUT : out STD_LOGIC_VECTOR (size - 1 downto 0)
        );
    end component;
begin
    uut: Synapse
--        generic map (
--            size => size
--        )
        port map (
            CLK => sigClk,
            CLR => sigClr,
            RST => sigRst,
            SYN_IN_VALID => sigSynInValid,
            SYN_IN => sigSynIn,
            SYN_OUT_VALID => sigSynOutValid,
            SYN_OUT => sigSynOut
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process
        constant zero : STD_LOGIC_VECTOR (3 downto 0) := "0000";
        constant three : STD_LOGIC_VECTOR (3 downto 0) := "0011";
        constant twelve : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    begin
        sigClr <= '0';
        sigSynInValid <= '0';
        
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';

        sigSynInValid <= '1';
        sigSynIn <= three;
        wait for 200ns;
        sigSynInValid <= '0';
        sigSynIn <= zero;

        assert sigSynOut = three;
        wait for 200ns;

        sigSynInValid <= '1';
        sigSynIn <= twelve;
        wait for 200ns;
        sigSynInValid <= '0';
        sigSynIn <= zero;
        
        assert sigSynOut = three;
        wait for 200ns;

        sigClr <= '1';
        wait for 200ns;
        sigClr <= '0';

        sigSynInValid <= '1';
        sigSynIn <= twelve;
        wait for 200ns;
        sigSynInValid <= '0';
        sigSynIn <= zero;

        assert sigSynOut = twelve;

        wait;
    end process;
end Behavioral;

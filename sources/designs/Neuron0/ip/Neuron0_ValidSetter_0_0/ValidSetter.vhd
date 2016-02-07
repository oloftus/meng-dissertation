library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ValidSetter is
    generic (
        latency : INTEGER := 2;
        latencyWidth : INTEGER := 2
    );
    port (
        CLK, RST, SYN_IN_VALID : in STD_LOGIC;
        SYN_OUT_VALID, SYN_IN_CLR : out STD_LOGIC
    );
end ValidSetter;

architecture Behavioral of ValidSetter is
    signal sigQ, sigRst, sigSet, sigClr, sigNotSynInsValid : STD_LOGIC;
    
    component RisingEdgeDetector is
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            P : out STD_LOGIC
        );
    end component;
    
    component DelayedLatch is
        generic (
            delayVal : INTEGER;
            delayWidth : INTEGER
        );
        port (
            CLK, RST, SET : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
begin
    SYN_OUT_VALID <= sigQ;
    sigNotSynInsValid <= not SYN_IN_VALID; 
    sigRst <= RST or sigClr;
    
    dl_clr_red_inst: RisingEdgeDetector
        port map (
            CLK => CLK,
            SET => sigNotSynInsValid,
            P => sigClr
        );
    
    dl_set_red_inst: RisingEdgeDetector
        port map (
            CLK => CLK,
            SET => SYN_IN_VALID,
            P => sigSet
        );
        
    syn_in_clr_red_inst: RisingEdgeDetector
        port map (
            CLK => CLK,
            SET => sigQ,
            P => SYN_IN_CLR
        );
    
    delay_latch_comp: DelayedLatch
        generic map (
            delayVal => latency,
            delayWidth => latencyWidth
        )
        port map (
            CLK => CLK,
            RST => sigRst,
            SET => sigSet,
            Q => sigQ
        );
end Behavioral;

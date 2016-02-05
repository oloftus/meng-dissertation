library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ValidSetter is
    generic (
        latency : INTEGER;
        latencyWidth : INTEGER
    );
    port (
        CLK, RST, SYN_IN_VALID : in STD_LOGIC;
        SYN_OUT_VALID, SYN_IN_CLR : out STD_LOGIC
    );
end ValidSetter;

architecture Behavioral of ValidSetter is
    signal sigQ, sigSet, sigClr, sigNotSynInValid : STD_LOGIC;
    
    component Pulse is
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            RST : in STD_LOGIC;
            P : out STD_LOGIC
        );
    end component;
    
    component DelayLatch is
        generic (
            delay : INTEGER;
            delayWidth : INTEGER
        );
        port (
            CLK, RST, CLR, SET : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
begin
    SYN_OUT_VALID <= sigQ;
    sigNotSynInValid <= not SYN_IN_VALID; 
    
    clr_pulse_comp: Pulse
        port map (
            CLK => CLK,
            SET => sigNotSynInValid,
            RST => RST,
            P => sigClr
        );
    
    set_pulse_comp: Pulse
        port map (
            CLK => CLK,
            SET => SYN_IN_VALID,
            RST => RST,
            P => sigSet
        );
        
    syn_in_clr_pulse_comp: Pulse
        port map (
            CLK => CLK,
            SET => sigQ,
            RST => RST,
            P => SYN_IN_CLR
        );
    
    delay_latch_comp: DelayLatch
        generic map (
            delay => latency,
            delayWidth => latencyWidth
        )
        port map (
            CLK => CLK,
            RST => RST,
            CLR => sigClr,
            SET => sigSet,
            Q => sigQ
        );
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Synapse is
    generic (
        size : INTEGER
    );
    port (
        CLK : in STD_LOGIC;
        CLR : in STD_LOGIC;
        RST : in STD_LOGIC;
        
        SYN_IN_VALID : in STD_LOGIC;
        SYN_IN : in STD_LOGIC_VECTOR (size - 1 downto 0);
        
        SYN_OUT_VALID : out STD_LOGIC;
        SYN_OUT : out STD_LOGIC_VECTOR (size - 1 downto 0)
    );
end Synapse;

architecture Behavioral of Synapse is
    signal sigAndOut, sigSynOutValid : STD_LOGIC;
    
    component Latch is
        generic (
            size : INTEGER
        );
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            RST : in STD_LOGIC;
            DIN : in STD_LOGIC_VECTOR (size - 1 downto 0);
            DOUT : out STD_LOGIC_VECTOR (size - 1 downto 0) 
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
    SYN_OUT_VALID <= sigSynOutValid;
    sigAndOut <= SYN_IN_VALID and not sigSynOutValid;
    
    memory_latch_inst: Latch
        generic map (
            size => size
        )
        port map (
            CLK => CLK,
            SET => sigAndOut,
            RST => RST,
            DIN => SYN_IN,
            DOUT => SYN_OUT
        );
    
    delay_latch_inst: DelayLatch
        generic map (
            delay => 1,
            delayWidth => 1
        )
        port map (
            CLK => CLK,
            RST => RST,
            CLR => CLR,
            SET => sigAndOut,
            Q => sigSynOutValid
        );
end Behavioral;

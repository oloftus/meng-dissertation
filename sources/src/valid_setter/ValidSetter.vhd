library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ValidSetter is
    -- Minimum delay between SYN_IN_VALID low to SYN_IN_VALID highL 2 clock periods
    generic (
        latency : INTEGER -- range 2 to 16
    );
    port (
        CLK, RST, SYN_IN_VALID : in STD_LOGIC;
        SYN_OUT_VALID, SYN_IN_CLR : out STD_LOGIC
    );
end ValidSetter;

architecture Behavioral of ValidSetter is
    component RisingEdgeDetector is
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            P : out STD_LOGIC
        );
    end component;
    
    signal sigRstDelayLatch, sigSetDelayLatch, sigClrDelayLatch, sigNotSynInValid : STD_LOGIC;
    signal sigSynOutValid : STD_LOGIC := '0';

    constant delayUnsigned : UNSIGNED (2 downto 0) := To_Unsigned(latency - 1, 3);
    constant zero : UNSIGNED (2 downto 0) := (others => '0');
    constant one : UNSIGNED (2 downto 0) := (0 => '1', others => '0');

    signal sigDelayCntr : UNSIGNED (2 downto 0) := zero;
begin
    SYN_OUT_VALID <= sigSynOutValid;
    sigNotSynInValid <= not SYN_IN_VALID; 
    sigRstDelayLatch <= RST or sigClrDelayLatch;
    
    dl_clr_red_inst: RisingEdgeDetector
        port map (
            CLK => CLK,
            SET => sigNotSynInValid,
            P => sigClrDelayLatch
        );
    
    dl_set_red_inst: RisingEdgeDetector
        port map (
            CLK => CLK,
            SET => SYN_IN_VALID,
            P => sigSetDelayLatch
        );
        
    syn_in_clr_red_inst: RisingEdgeDetector
        port map (
            CLK => CLK,
            SET => sigSynOutValid,
            P => SYN_IN_CLR
        );
        
    delay_latch_proc: process (CLK) begin
        if Rising_Edge(CLK) then
            if sigRstDelayLatch = '1' then
                sigSynOutValid <= '0';
                sigDelayCntr <= zero;
            else
                case sigDelayCntr is
                    when zero =>
                        if sigSetDelayLatch = '1' then
                            sigDelayCntr <= one;
                        end if;
                    when delayUnsigned =>
                        sigSynOutValid <= '1';
                    when others =>
                        sigDelayCntr <= sigDelayCntr + 1;
                end case;
            end if;
        end if;
    end process;
end Behavioral;

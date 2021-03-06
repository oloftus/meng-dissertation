library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SynOutBuffer is
    generic (
        doutWidth : INTEGER;
        dinWidth : INTEGER;
        numInputs : INTEGER range 0 to 31 -- Range 0..31
    );
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        DIN : in STD_LOGIC_VECTOR (dinWidth * numInputs - 1 downto 0);
        DVALID : in STD_LOGIC_VECTOR (numinputs - 1 downto 0);
        NXT : in STD_LOGIC;
        DOUT : out STD_LOGIC_VECTOR (doutWidth - 1 downto 0);
        READY : out STD_LOGIC
    );
end SynOutBuffer;

architecture Behavioral of SynOutBuffer is
    constant allLatched : STD_LOGIC_VECTOR (numinputs - 1 downto 0) := (others => '1');
    constant sigOutCntZero : UNSIGNED (5 downto 0) := (others => '0');
    
    signal sigDinLatch : STD_LOGIC_VECTOR (dinWidth * numInputs - 1 downto 0) := (others => '0');
    signal sigDinsLatched : STD_LOGIC_VECTOR (numinputs - 1 downto 0) := (others => '0');
    signal sigOutCnt : UNSIGNED (5 downto 0) := (others => '0');
begin
    READY <= '1' when sigDinsLatched = allLatched and sigOutCnt = sigOutCntZero else '0';
    
    process (CLK) is
        variable sliceHigh, sliceLow : INTEGER;        
        variable currSlice : STD_LOGIC_VECTOR (dinWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            if RST = '1' then
                sigDinLatch <= (others => '0');
                sigDinsLatched <= (others => '0');
                sigOutCnt <= (others => '0');
            end if;
        
            for i in 0 to numInputs - 1 loop
                if DVALID(i) = '1' then
                    sliceHigh := i * dinWidth + dinWidth - 1;
                    sliceLow := i * dinWidth;
                    sigDinLatch(sliceHigh downto sliceLow) <= DIN(sliceHigh downto sliceLow);
                    sigDinsLatched(i) <= '1';
                end if;
            end loop;
            
            if sigDinsLatched = allLatched then
                if sigOutCnt /= numInputs then
                    if NXT = '1' then
                        for i in numInputs - 1 downto 0 loop
                            if sigOutCnt = i then
                                currSlice := sigDinLatch(i * dinWidth + dinWidth - 1 downto i * dinWidth);
                            end if;
                        end loop;
                        
                        DOUT <= STD_LOGIC_VECTOR(Resize(UNSIGNED(currSlice), doutWidth));
                        sigOutCnt <= sigOutCnt + 1;
                    end if;
                else
                    sigDinsLatched <= (others => '0');
                    sigOutCnt <= (others => '0');
                end if;
            end if;
        end if;
    end process;
end Behavioral;

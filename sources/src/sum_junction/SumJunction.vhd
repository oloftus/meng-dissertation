library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SumJunction is
    generic (
        numInputs : INTEGER; -- Range 1..7
        inputWidth : INTEGER
    );
    port (
        DIN : in STD_LOGIC_VECTOR (numInputs * inputWidth - 1 downto 0);
        DOUT : out STD_LOGIC_VECTOR (inputWidth - 1 downto 0);
        CLK : in STD_LOGIC
    );
end SumJunction;

architecture Behavioral of SumJunction is
    signal sigDin : STD_LOGIC_VECTOR (numInputs * inputWidth - 1 downto 0);
    signal sigLatch : UNSIGNED (inputWidth downto 0) := (others => '0');
    signal sigCount : UNSIGNED (2 downto 0) := (others => '0');
    signal sigStart, sigDone : STD_LOGIC := '0';
begin
    start_proc: process (DIN, sigDone) begin
        if DIN'event and sigStart = '0' and sigDone = '0' then
            sigStart <= '1';
            sigDin <= DIN;
        elsif sigDone = '1' then
            sigStart <= '0';
        end if;
    end process;
    
    control_proc: process (CLK) is
        variable sliceHigh, sliceLow : INTEGER;
        variable currOperand : UNSIGNED (inputWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            if sigStart = '1' then
                if sigCount = numInputs then
                    DOUT <= STD_LOGIC_VECTOR(sigLatch);
                    sigDone <= '1';
                else
                    sliceHigh := To_Integer((sigCount + 1) * inputWidth - 1);
                    sliceLow := To_Integer(sigCount * inputWidth);
                    currOperand := UNSIGNED(sigDin(sliceHigh downto sliceLow));
                    
                    sigLatch <= sigLatch + currOperand;
                    sigCount <= sigCount + 1;
                end if;
            else
                sigDone <= '0';
                sigLatch <= (others => '0');
                sigCount <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;

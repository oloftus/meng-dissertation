library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.AdderInputType.all;

entity SumJuncTB is
    generic (
        tbPrecision : INTEGER := 8;
        tbNumInputs : INTEGER := 4
    );
end SumJuncTB;

architecture Behavioral of SumJuncTB is
    signal sigInput : AdderInput (tbNumInputs - 1 downto 0);
    signal sigOutput : UNSIGNED (tbPrecision - 1 downto 0);
    
    component SumJunc is
        generic (
            numInputs : INTEGER;
            precision : INTEGER
        );
        port (
            input : in AdderInput (tbNumInputs - 1 downto 0);
            output : out UNSIGNED (precision - 1 downto 0)
        );
    end component;
begin
    uut: SumJunc
        generic map (
            numInputs => tbNumInputs,
            precision => tbPrecision
        )
        port map (
            input => sigInput,
            output => sigOutput
        );
    
    process begin
        sigInput <= ("00000001", "00000010", "00000011", "00000100");
        wait for 100ns;
        assert sigOutput = "00001010" report "Test failed: Sum should be 00001010";
    end process;
end Behavioral;

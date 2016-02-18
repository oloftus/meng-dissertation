library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SumJuncTB is
    generic (
        tbPrecision : INTEGER := 9;
        tbNumInputs : INTEGER := 4
    );
end SumJuncTB;

architecture Behavioral of SumJuncTB is
    type InputType is array (1 to 10) of SIGNED (precision downto 0);

    signal in1 : SIGNED (tbPrecision downto 0);
    signal in2 : SIGNED (tbPrecision downto 0);
    signal in3 : SIGNED (tbPrecision downto 0);
    signal in4 : SIGNED (tbPrecision downto 0);
    signal in5 : SIGNED (tbPrecision downto 0);
    signal in6 : SIGNED (tbPrecision downto 0);
    signal in7 : SIGNED (tbPrecision downto 0);
    signal in8 : SIGNED (tbPrecision downto 0);
    signal in9 : SIGNED (tbPrecision downto 0);
    signal in10 : SIGNED (tbPrecision downto 0);
    signal sigOutput : SIGNED (tbPrecision downto 0);
    
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
    
    process is
        variable inputs : InputType := (in1, in2, in3, in4); -- , in5, in6, in7, in8, in9, in10
        variable intermediate : SIGNED (precision downto 0);
    begin
        inputs <= ("0"&"00000001", "0"&"0000010", "0"&"0000011", "0"&"0000100");
        wait for 100ns;
        assert sigOutput = "0"&"0001010" report "Test failed: Sum should be 00001010";
    end process;
end Behavioral;

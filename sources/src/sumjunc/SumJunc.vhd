library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SumJunc is
    generic (
        numInputs : INTEGER;
        precision : INTEGER
    );
    port (
        in1 : in SIGNED (precision downto 0);
        in2 : in SIGNED (precision downto 0);
        in3 : in SIGNED (precision downto 0);
        in4 : in SIGNED (precision downto 0);
        in5 : in SIGNED (precision downto 0);
        in6 : in SIGNED (precision downto 0);
        in7 : in SIGNED (precision downto 0);
        in8 : in SIGNED (precision downto 0);
        in9 : in SIGNED (precision downto 0);
        in10 : in SIGNED (precision downto 0);
        output : out SIGNED (precision downto 0)
    );
end SumJunc;

architecture Behavioral of SumJunc is
    type InputType is array (1 to 10) of SIGNED (precision downto 0);
begin
    adderProc: process (input)
        variable inputs : InputType := (in1, in2, in3, in4, in5, in6, in7, in8, in9, in10);
        variable intermediate : SIGNED (precision downto 0);
    begin
        intermediate := (others => '0');
        
        for input in inputs loop
            intermediate := intermediate + input;
        end loop;
        
        output <= intermediate;
    end process;
end Behavioral;

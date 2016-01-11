library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.AdderInputType.all;

entity SumJunc is
    generic (
        numInputs : INTEGER;
        precision : INTEGER
    );
    port (
        input : in AdderInput (numInputs - 1 downto 0);
        output : out UNSIGNED (precision - 1 downto 0)
    );
end SumJunc;

architecture Behavioral of SumJunc is
begin
    adderProc: process (input)
        variable intermediate : UNSIGNED (precision - 1 downto 0);
    begin
        intermediate := (others => '0');
        
        for input_num in 0 to numInputs - 1 loop
            intermediate := intermediate + input(input_num);
        end loop;
        
        output <= intermediate;
    end process;
end Behavioral;

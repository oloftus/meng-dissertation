library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SumJunc is
    generic (
        num_inputs : UNSIGNED;
        precision : UNSIGNED
    );
    port (
        input : in STD_LOGIC_VECTOR (num_inputs * precision - 1 downto 0);
        output : out UNSIGNED (precision - 1 downto 0)
    );
end SumJunc;

architecture Behavioral of SumJunc is
    component TwoInputAdder port (
        A : in STD_LOGIC_VECTOR (precision - 1 downto 0);
        B : in STD_LOGIC_VECTOR (precision - 1 downto 0);
        S : out STD_LOGIC_VECTOR (precision - 1 downto 0)
    );
    end component;
begin
    process (input)
        variable msb, lsb, prevMSB, prevLSB : UNSIGNED;
        variable interOutput : STD_LOGIC_VECTOR (num_inputs * precision - 1 downto 0);
    begin
        -- Configure first input (top input to first adder)
        msb := (num_inputs - 0) * precision - 1;
        lsb := (num_inputs - 1) * precision;
        interOutput(msb downto lsb) := input(msb downto lsb);
        
        -- Configure subsequent inputs (bottom inputs to adders)
        for input in 1 to num_inputs - 1 loop
            prevMSB := msb;
            prevLSB := lsb;
            msb := (num_inputs - input - 0) * precision - 1;
            lsb := (num_inputs - input - 1) * precision;
            
            TwoinputAdder port map (
                A => interOutput(prevMSB downto prevLSB),
                B => input(msb downto lsb),
                S => interOutput(msb downto lsb)
            );
        end loop;
        
        output <= interOutput(msb downto lsb);
    end process;
end Behavioral;

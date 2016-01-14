library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VectorOrTB is
    generic (
        precision : INTEGER := 8
    );
end VectorOrTB;

architecture Behavioral of VectorOrTB is
    signal sigOp1 : STD_LOGIC_VECTOR (precision - 1 downto 0);
    signal sigOp2 : STD_LOGIC_VECTOR (precision - 1 downto 0);
    signal sigResult : STD_LOGIC_VECTOR (precision - 1 downto 0);
    
    component VectorOr is
        generic (
            width : INTEGER
        );
        port
        (
            op1 : in STD_LOGIC_VECTOR (width - 1 downto 0);
            op2 : in STD_LOGIC_VECTOR (width - 1 downto 0);
            result : out STD_LOGIC_VECTOR (width - 1 downto 0)
        );
    end component;
begin
    uut: VectorOr
        generic map (
            width => precision
        )
        port map (
            op1 => sigOp1,
            op2 => sigOp2,
            result => sigResult
        );
        
    tb: process begin
        sigOp1 <= "10101010";
        sigOp2 <= "01010101";
        wait for 100ns;
        assert sigResult = "11111111" report "Test failed: Result should be '11111111'";
    end process;

end Behavioral;

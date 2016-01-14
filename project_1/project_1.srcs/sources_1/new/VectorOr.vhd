library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VectorOr is
    generic (
        width : INTEGER
    );
    port (
        op1 : in STD_LOGIC_VECTOR (width - 1 downto 0);
        op2 : in STD_LOGIC_VECTOR (width - 1 downto 0);
        result : out STD_LOGIC_VECTOR (width - 1 downto 0)
    );
end VectorOr;

architecture Behavioral of VectorOr is
begin
    process (op1, op2) begin
        for i in width - 1 downto 0 loop
            result(i) <= op1(i) or op2(i);
        end loop;
    end process;
end Behavioral;

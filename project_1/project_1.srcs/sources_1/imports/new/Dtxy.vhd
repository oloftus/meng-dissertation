library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dtxy is
    generic (
        precision : INTEGER
    );
    port (
        Z : in STD_LOGIC_VECTOR (3 downto 0);
        X : in UNSIGNED (precision - 1 downto 0);
        Y : out UNSIGNED (precision - 1 downto 0)
    );
end Dtxy;

architecture Behavioral of Dtxy is
begin
    process (X, Z) begin
        case Z is
            when "1000" => -- Z4
                Y <= "1"&"000000";
        
            when "0100" => -- Z3
                Y <= Shift_Right(X, 2) + ("0"&"110110");
                
            when "0010" => -- Z2
                Y <= X + ("0"&"101000");
                
            when "0001" => -- Z1
                Y <= Shift_Left(X, 1) + ("0"&"100000");
                
            when others =>
                null;
        end case;
    end process;

end Behavioral;

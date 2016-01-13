library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MagnitudeComparator is
    port (
        A, B, C, D, E, F, G : in STD_LOGIC;
        Z : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MagnitudeComparator;

architecture Behavioral of MagnitudeComparator is
    signal Z1, Z2, Z3, Z4 : STD_LOGIC;
begin
    Z <= (Z4, Z3, Z2, Z1);
    
    Z1 <= NOT (A OR B OR C OR D);
    Z2 <=
            (
                NOT (A OR B OR C OR NOT D)
            )
        OR
            (
                    (
                        NOT
                            (
                                    (F AND G)
                                OR
                                    E
                            )
                    )
                AND
                    (
                        NOT (A OR B OR NOT C OR D)
                    )
            ); 
    Z3 <= NOT (Z1 OR Z2 OR Z4);
    Z4 <= ((C OR D) AND B) OR A;
    
end Behavioral;

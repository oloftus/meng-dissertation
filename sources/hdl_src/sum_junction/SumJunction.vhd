library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SumJunction is
    generic (
        numInputs : INTEGER := 3;
        inputWidth : INTEGER := 16
    );
    port (
        DIN : in STD_LOGIC_VECTOR (numInputs * inputWidth - 1 downto 0);
        DOUT : out STD_LOGIC_VECTOR (inputWidth - 1 downto 0);
        CLK : in STD_LOGIC
    );
end SumJunction;

architecture Behavioral of SumJunction is
    signal sigDinLatch : STD_LOGIC_VECTOR (numInputs * inputWidth - 1 downto 0) := (others => '0');
    signal sigLatch : UNSIGNED (inputWidth - 1 downto 0) := (others => '0');
    signal sigCount : UNSIGNED (inputWidth - 1 downto 0) := (others => '0');
    signal sigStart : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
begin
    process (CLK) is
        variable currOperand : UNSIGNED (inputWidth - 1 downto 0);
    begin
        if Rising_Edge(CLK) then
            if (DIN /= sigDinLatch and sigStart = "00") or sigStart = "01" then
                if sigStart = "00" then
                    sigDinLatch <= DIN;
                    sigStart <= "01";
                end if;

                if sigCount = numInputs then
                    DOUT <= STD_LOGIC_VECTOR(sigLatch);
                    sigStart <= "10";
                else
                    for i in numInputs - 1 downto 0 loop
                        if sigCount = i then
                            currOperand := UNSIGNED(DIN((i + 1) * inputWidth - 1 downto i * inputWidth));
                        end if;
                    end loop;

                    sigLatch <= sigLatch + currOperand;
                    sigCount <= sigCount + 1;
                end if;
            else
                sigStart <= "00";
                sigLatch <= (others => '0');
                sigCount <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;

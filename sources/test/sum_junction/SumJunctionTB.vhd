library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SumJunctionTB is
    generic (
        numInputs : INTEGER := 3;
        inputWidth : INTEGER := 16
    );
end SumJunctionTB;

architecture Behavioral of SumJunctionTB is
    component SumJunction is
        generic (
            numInputs : INTEGER; -- Range 1..7
            inputWidth : INTEGER
        );
        port (
            DIN : in STD_LOGIC_VECTOR (numInputs * inputWidth - 1 downto 0);
            DOUT : out STD_LOGIC_VECTOR (inputWidth - 1 downto 0);
            CLK : in STD_LOGIC
        );
    end component;
    
    signal sigDin : STD_LOGIC_VECTOR (numInputs * inputWidth - 1 downto 0);
    signal sigDout : STD_LOGIC_VECTOR (inputWidth - 1 downto 0);
    signal sigClk : STD_LOGIC;
begin
    uut: SumJunction
        generic map (
            numInputs => numInputs,
            inputWidth => inputWidth
        )
        port map (
            DIN => sigDin,
            DOUT => sigDout,
            CLK => sigClk
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process is
        constant val1 : UNSIGNED (inputWidth - 1 downto 0) := To_Unsigned(33, inputWidth);
        constant val2 : UNSIGNED (inputWidth - 1 downto 0) := To_Unsigned(18, inputWidth);
        constant val3 : UNSIGNED (inputWidth - 1 downto 0) := To_Unsigned(3, inputWidth);
        constant val4 : UNSIGNED (inputWidth - 1 downto 0) := To_Unsigned(20, inputWidth);
        constant val5 : UNSIGNED (inputWidth - 1 downto 0) := To_Unsigned(23, inputWidth);

        constant sum123 : UNSIGNED (inputWidth - 1 downto 0) := Resize(val1 + val2 + val3, inputWidth);
        constant sum345 : UNSIGNED (inputWidth - 1 downto 0) := Resize(val3 + val4 + val5, inputWidth);
    begin
        sigDin <=
            STD_LOGIC_VECTOR(val1) &
            STD_LOGIC_VECTOR(val2) &
            STD_LOGIC_VECTOR(val3);
        wait for 710ns;
        assert sigDout = STD_LOGIC_VECTOR(sum123) report "Test failed: 1"; -- 710ns

        wait;
    end process;
    
end Behavioral;

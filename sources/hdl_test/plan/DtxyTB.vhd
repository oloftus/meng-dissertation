library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DtxyTB is
    generic (
        integerPrecision : INTEGER := 4;
        fractionPrecision : INTEGER := 3
    );
end DtxyTB;

architecture Behavioral of DtxyTB is
    component Dtxy is
        generic (
            integerPrecision : INTEGER;
            fractionPrecision : INTEGER
        );
        port
        (
            Z : in STD_LOGIC_VECTOR (3 downto 0);
            X : in UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0);
            Y : out UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0)
        );
    end component;

    constant busTop : INTEGER := integerPrecision + fractionPrecision - 1;
    constant busBottom : INTEGER := integerPrecision + fractionPrecision - 7;
    
    signal sigZ : STD_LOGIC_VECTOR (3 downto 0);
    signal sigX, sigY : UNSIGNED (busTop downto 0);
begin
    uut: Dtxy
        generic map (
            integerPrecision => integerPrecision,
            fractionPrecision => fractionPrecision
        )
        port map
        (
            Z => sigZ,
            X => sigX,
            Y => sigY
        );
    
    tb: process begin
        -- |X| >= 5
        sigZ <= "1000"; -- Z4
        
        sigX <= "1111"&"111"; -- 15.9
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("1"&"000000") report "Test failed: Should be 15.9 ==> 1";
        
        sigX <= "0101"&"000"; -- 5
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("1"&"000000") report "Test failed: Should be 5 ==> 1";
       
        
        -- 2.375 <= |X| < 5
        sigZ <= "0100"; -- Z3
        
        sigX <= "0100"&"111"; -- 4.9       
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("0"&"111111") report "Test failed: Should be 4.9 ==> 0.996875";

        sigX <= "0010"&"011"; -- 2.375
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("0"&"111010") report "Test failed: Should be 2.375 ==> 0.91796875";


        -- 1 <= |X| < 2.375
        sigZ <= "0010"; -- Z2
        
        sigX <= "0010"&"010"; -- 2.25
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("0"&"111010") report "Test failed: Should be 2.25 ==> 0.91796525";

        sigX <= "0001"&"000"; -- 1
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("0"&"110000") report "Test failed: Should be 1 ==> 0.75";


        -- 0 <= |X| < 1
        sigZ <= "0001"; -- Z1
        
        sigX <= "0000"&"111"; -- 0.99
        wait for 100ns;
        -- Note: Because the output is the result of a shift, the right-most bit is 0 when it should be 1, i.e.
        -- accuracy is out by 0.015625
        assert sigY(busTop downto busBottom) = ("0"&"101110") report "Test failed: Should be 0.99 ==> 0.7475";
    
        sigX <= "0000"&"000"; -- 0
        wait for 100ns;
        assert sigY(busTop downto busBottom) = ("0"&"100000") report "Test failed: Should be 0 ==> 0.84375";
        
        wait;
    end process;

end Behavioral;

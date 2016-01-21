library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DtxyTB is
    generic (
        tbPrecision : INTEGER := 7
    );
end DtxyTB;

architecture Behavioral of DtxyTB is
    constant precisionTop : INTEGER := tbPrecision - 1;
    constant aminBusBottom : INTEGER := tbPrecision - 7; -- The width of the bus as proposed in the amin1997piecewise paper

    signal sigZ : STD_LOGIC_VECTOR (3 downto 0);
    signal sigX : UNSIGNED (precisionTop downto 0);
    signal sigY : UNSIGNED (precisionTop downto 0);
            
    component Dtxy is
        generic (
            precision : INTEGER
        );
        port
        (
            Z : in STD_LOGIC_VECTOR (3 downto 0);
            X : in UNSIGNED (precisionTop downto 0);
            Y : out UNSIGNED (precisionTop downto 0)
        );
    end component;
begin
    uut: Dtxy
        generic map (
            precision => tbPrecision
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
        assert sigY(precisionTop downto aminBusBottom) = ("1"&"000000") report "Test failed: Should be 15.9 ==> 1";
        
        sigX <= "0101"&"000"; -- 5
        wait for 100ns;
        assert sigY(precisionTop downto aminBusBottom) = ("1"&"000000") report "Test failed: Should be 5 ==> 1";
       
        
        -- 2.375 <= |X| < 5
        sigZ <= "0100"; -- Z3
        
        sigX <= "0100"&"111"; -- 4.9       
        wait for 100ns;
        assert sigY(precisionTop downto aminBusBottom) = ("0"&"111111") report "Test failed: Should be 4.9 ==> 0.996875";

        sigX <= "0010"&"011"; -- 2.375
        wait for 100ns;
        assert sigY(precisionTop downto aminBusBottom) = ("0"&"111010") report "Test failed: Should be 2.375 ==> 0.91796875";


        -- 1 <= |X| < 2.375
        sigZ <= "0010"; -- Z2
        
        sigX <= "0010"&"010"; -- 2.25
        wait for 100ns;
        assert sigY(precisionTop downto aminBusBottom) = ("0"&"111010") report "Test failed: Should be 2.25 ==> 0.91796525";

        sigX <= "0001"&"000"; -- 1
        wait for 100ns;
        assert sigY(precisionTop downto aminBusBottom) = ("0"&"110000") report "Test failed: Should be 1 ==> 0.75";


        -- 0 <= |X| < 1
        sigZ <= "0001"; -- Z1
        
        sigX <= "0000"&"111"; -- 0.99
        wait for 100ns;
        -- Note: Because the output is the result of a shift, the right-most bit is 0 when it should be 1, i.e.
        -- accuracy is out by 0.015625
        assert sigY(precisionTop downto aminBusBottom) = ("0"&"101110") report "Test failed: Should be 0.99 ==> 0.7475";
    
        sigX <= "0000"&"000"; -- 0
        wait for 100ns;
        assert sigY(precisionTop downto aminBusBottom) = ("0"&"100000") report "Test failed: Should be 0 ==> 0.84375";
    end process;

end Behavioral;

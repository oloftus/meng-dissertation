library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ComplementsMultiplierTB is
end ComplementsMultiplierTB;

architecture Behavioral of ComplementsMultiplierTB is
    component ComplementsMultiplierTest is
        port (
            CLK : in STD_LOGIC;
            A : in STD_LOGIC_VECTOR (16 downto 0);
            B : in STD_LOGIC_VECTOR (16 downto 0);
            P : out STD_LOGIC_VECTOR (32 downto 0) 
        );
    end component ComplementsMultiplierTest;
    
    constant zeros : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');
    
    constant valA1 : STD_LOGIC_VECTOR (16 downto 0) := "1"&"11111111"&"11111101"; -- -3
    constant valB1 : STD_LOGIC_VECTOR (16 downto 0) := "0"&"00000000"&"00000100"; -- 4
    constant valP1 : STD_LOGIC_VECTOR (32 downto 0) := "1"&"11111111"&"11111111"&"11111111"&"11110100"; -- -12

    constant valA2 : STD_LOGIC_VECTOR (16 downto 0) := "0"&"00000000"&"00000011"; -- 3
    constant valB2 : STD_LOGIC_VECTOR (16 downto 0) := "1"&"11111111"&"11111100"; -- -4
    constant valP2 : STD_LOGIC_VECTOR (32 downto 0) := "1"&"11111111"&"11111111"&"11111111"&"11110100"; -- -12

    constant valA3 : STD_LOGIC_VECTOR (16 downto 0) := "1"&"11111111"&"11111101"; -- -3
    constant valB3 : STD_LOGIC_VECTOR (16 downto 0) := "1"&"11111111"&"11111100"; -- -4
    constant valP3 : STD_LOGIC_VECTOR (32 downto 0) := "0"&"00000000"&"00000000"&"00000000"&"00001100"; -- 12

    constant valA4 : STD_LOGIC_VECTOR (16 downto 0) := "0"&"00000000"&"00000011"; -- 3
    constant valB4 : STD_LOGIC_VECTOR (16 downto 0) := "0"&"00000000"&"00000100"; -- 4
    constant valP4 : STD_LOGIC_VECTOR (32 downto 0) := "0"&"00000000"&"00000000"&"00000000"&"00001100"; -- 12

    -- Assume <sign><8>.<8> representation.
    constant valA5 : STD_LOGIC_VECTOR (16 downto 0) := "0"&"00000000"&"10000000"; -- 0.5
    constant valB5 : STD_LOGIC_VECTOR (16 downto 0) := "1"&"11111111"&"11000000"; -- -0.25
    -- -0.125 has not been shifted down 8 positions which would normally be done by the Slice component
    constant valP5 : STD_LOGIC_VECTOR (32 downto 0) := "1"&"11111111"&"11111111"&"11100000"&"00000000"; -- -0.125
    
    signal sigClk : STD_LOGIC;
    signal sigA, sigB : STD_LOGIC_VECTOR (16 downto 0);
    signal sigP : STD_LOGIC_VECTOR (32 downto 0);
begin
    uut: ComplementsMultiplierTest
        port map (
            CLK => sigClk,
            A => sigA,
            B => sigB,
            P => sigP 
        );

    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process begin
        -- Test one +ve, one -ve
        sigA <= valA1;
        sigB <= valB1;
        
        wait for 110ns;
        assert sigP = valP1 report "Test failed: 1";
        wait for 90ns;

        sigA <= zeros;
        sigB <= zeros;
        wait for 200ns;        
                
        -- Test both -ve
        sigA <= valA3;
        sigB <= valB3;
        
        wait for 110ns;
        assert sigP = valP3 report "Test failed: 2";
        wait for 90ns;

        sigA <= zeros;
        sigB <= zeros;
        wait for 200ns;        
        
        -- Test one -ve, one +ve
        sigA <= valA2;
        sigB <= valB2;
        
        wait for 110ns;
        assert sigP = valP2 report "Test failed: 2";
        wait for 90ns;

        sigA <= zeros;
        sigB <= zeros;
        wait for 200ns;        
        
        -- Test both +ve
        sigA <= valA4;
        sigB <= valB4;
        
        wait for 110ns;
        assert sigP = valP4 report "Test failed: 4";
        wait for 90ns;

        sigA <= zeros;
        sigB <= zeros;
        wait for 200ns;        
        
        -- Test decimals
        sigA <= valA5;
        sigB <= valB5;
        
        wait for 110ns;
        assert sigP = valP5 report "Test failed: 5";

        wait;
    end process;
end Behavioral;

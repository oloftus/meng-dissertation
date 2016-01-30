library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Plan is
    generic (
        planInputIntegerPrecision : INTEGER;
        planInputFractionPrecision : INTEGER
    );
    port (
        X : in SIGNED (planInputIntegerPrecision + planInputFractionPrecision downto 0);
        Y : out UNSIGNED (planInputIntegerPrecision + planInputFractionPrecision - 1 downto 0)
    );
end Plan;

architecture Behavioral of Plan is
    constant inputTotalPrecision : INTEGER := planInputIntegerPrecision + planInputFractionPrecision;

    constant dtxyPointShift : INTEGER := 3; -- -3 because DTXY format is 0000.000
    constant dtxySliceLow : INTEGER := planInputFractionPrecision - dtxyPointShift;
    constant one : UNSIGNED (inputTotalPrecision - 1 downto 0) := (planInputFractionPrecision + dtxyPointShift => '1', others => '0');
    
    signal sigIn : SIGNED (inputTotalPrecision downto 0);
    signal sigInUnsigned : UNSIGNED (inputTotalPrecision - 1 downto 0);
    signal sigSigned : STD_LOGIC;
    signal sigMagCompDtxy : STD_LOGIC_VECTOR (3 downto 0); 
    signal sigDtxyMirror : UNSIGNED (inputTotalPrecision - 1 downto 0);
    
    component Complements2To1 is
        generic (
            precision : INTEGER
        );
        port (
            twos : in SIGNED (precision downto 0);
            ones : out UNSIGNED (precision - 1 downto 0);
            sign : out STD_LOGIC
        );
    end component;
    
    component MagnitudeComparator is
        port (
            A, B, C, D, E, F, G : in STD_LOGIC;
            Z : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component Dtxy is
        generic (
            inputIntegerPrecision : INTEGER;
            inputFractionPrecision : INTEGER
        );
        port (
            Z : in STD_LOGIC_VECTOR (3 downto 0);
            X : in UNSIGNED (inputIntegerPrecision + inputFractionPrecision - 1 downto 0);
            Y : out UNSIGNED (inputIntegerPrecision + inputFractionPrecision - 1 downto 0)
        );
    end component;
begin
    sigIn <= X;
    Y <= one - sigDtxyMirror when sigSigned = '1' else sigDtxyMirror;
    
    complements2To1Comp: Complements2To1
        generic map (
            precision => inputTotalPrecision
        )
        port map (
            twos => sigIn,
            ones => sigInUnsigned,
            sign => sigSigned
        );
    
    magnitudeComparatorComp: MagnitudeComparator
        port map (
            A => sigInUnsigned(dtxySliceLow + 6),
            B => sigInUnsigned(dtxySliceLow + 5),
            C => sigInUnsigned(dtxySliceLow + 4),
            D => sigInUnsigned(dtxySliceLow + 3),
            E => sigInUnsigned(dtxySliceLow + 2),
            F => sigInUnsigned(dtxySliceLow + 1),
            G => sigInUnsigned(dtxySliceLow),
            
            Z => sigMagCompDtxy
        );
    
    dtxyComp: Dtxy
        generic map (
            inputIntegerPrecision => planInputIntegerPrecision,
            inputFractionPrecision => planInputFractionPrecision
        )
        port map (
            X => sigInUnsigned,
            Y => sigDtxyMirror,
            Z => sigMagCompDtxy
        );

end Behavioral;

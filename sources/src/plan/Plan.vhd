library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Plan is
    generic (
        integerPrecision : INTEGER;
        fractionPrecision : INTEGER
    );
    port (
        X : in STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0);
        Y : out STD_LOGIC_VECTOR (integerPrecision + fractionPrecision downto 0)
    );
end Plan;

architecture Behavioral of Plan is
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
            integerPrecision : INTEGER;
            fractionPrecision : INTEGER
        );
        port (
            Z : in STD_LOGIC_VECTOR (3 downto 0);
            X : in UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0);
            Y : out UNSIGNED (integerPrecision + fractionPrecision - 1 downto 0)
        );
    end component;

    constant precision : INTEGER := integerPrecision + fractionPrecision;

    constant dtxyPointShift : INTEGER := 3; -- -3 because DTXY format is 0000.000
    constant dtxySliceLow : INTEGER := fractionPrecision - dtxyPointShift;
    constant one : UNSIGNED (precision - 1 downto 0) := (fractionPrecision + dtxyPointShift => '1', others => '0');
    
    signal sigIn : SIGNED (precision downto 0);
    signal sigInUnsigned : UNSIGNED (precision - 1 downto 0);
    signal sigSigned : STD_LOGIC;
    signal sigMagCompDtxy : STD_LOGIC_VECTOR (3 downto 0); 
    signal sigDtxyMirror, sigMirrorShift, sigShiftResize : UNSIGNED (precision - 1 downto 0);
begin
    sigIn <= SIGNED(X);
    
    sigMirrorShift <= one - sigDtxyMirror when sigSigned = '1' else sigDtxyMirror;
    sigShiftResize <= Shift_Right(sigMirrorShift, dtxyPointShift);
    Y <= STD_LOGIC_VECTOR("0" & sigShiftResize);
    
    complements2To1Comp: Complements2To1
        generic map (
            precision => precision
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
            integerPrecision => integerPrecision,
            fractionPrecision => fractionPrecision
        )
        port map (
            X => sigInUnsigned,
            Y => sigDtxyMirror,
            Z => sigMagCompDtxy
        );

end Behavioral;

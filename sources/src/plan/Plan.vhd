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
    constant one : UNSIGNED (precision - 1 downto 0) := (fractionPrecision => '1', others => '0');
    constant padding : UNSIGNED (dtxyPointShift - 1 downto 0) := (others => '0');
    
    signal sigIn : SIGNED (precision downto 0);
    signal sigInUnsigned : UNSIGNED (precision - 1 downto 0);
    signal sigInUnsignedPadded, sigDtxyShift, sigShiftMirror, sigMirrorResize : UNSIGNED (precision - 1 + 2 * dtxyPointShift downto 0);
    signal sigSign : STD_LOGIC;
    signal sigMagCompDtxy : STD_LOGIC_VECTOR (3 downto 0); 
    signal sigInMagComp : STD_LOGIC_VECTOR (6 downto 0);
begin
    sigIn <= SIGNED(X);
    sigInUnsignedPadded <= padding & sigInUnsigned & padding; 
    
    sigShiftMirror <= Shift_Right(sigDtxyShift, dtxyPointShift);
    sigMirrorResize <= one - sigShiftMirror when sigSign = '1' else sigShiftMirror;
    Y <= "0" & STD_LOGIC_VECTOR(sigMirrorResize(precision - 1 + dtxyPointShift downto dtxyPointShift));
    
    complements2To1Comp: Complements2To1
        generic map (
            precision => precision
        )
        port map (
            twos => sigIn,
            ones => sigInUnsigned,
            sign => sigSign
        );
        
    sigInMagComp(0) <= sigInUnsigned(dtxySliceLow + 6) when dtxySliceLow + 6 < precision and dtxySliceLow + 6 >= 0 else '0';
    sigInMagComp(1) <= sigInUnsigned(dtxySliceLow + 5) when dtxySliceLow + 5 < precision and dtxySliceLow + 5 >= 0 else '0';
    sigInMagComp(2) <= sigInUnsigned(dtxySliceLow + 4) when dtxySliceLow + 4 < precision and dtxySliceLow + 4 >= 0 else '0';
    sigInMagComp(3) <= sigInUnsigned(dtxySliceLow + 3) when dtxySliceLow + 3 < precision and dtxySliceLow + 3 >= 0 else '0';
    sigInMagComp(4) <= sigInUnsigned(dtxySliceLow + 2) when dtxySliceLow + 2 < precision and dtxySliceLow + 2 >= 0 else '0';
    sigInMagComp(5) <= sigInUnsigned(dtxySliceLow + 1) when dtxySliceLow + 1 < precision and dtxySliceLow + 1 >= 0 else '0';
    sigInMagComp(6) <= sigInUnsigned(dtxySliceLow + 0) when dtxySliceLow + 0 < precision and dtxySliceLow + 0 >= 0 else '0';

    magnitudeComparatorComp: MagnitudeComparator
        port map (
            A => sigInMagComp(0),
            B => sigInMagComp(1),
            C => sigInMagComp(2),
            D => sigInMagComp(3),
            E => sigInMagComp(4),
            F => sigInMagComp(5),
            G => sigInMagComp(6),
            
            Z => sigMagCompDtxy
        );
    
    dtxyComp: Dtxy
        generic map (
            integerPrecision => integerPrecision + dtxyPointShift,
            fractionPrecision => fractionPrecision + dtxyPointShift
        )
        port map (
            X => sigInUnsignedPadded,
            Y => sigDtxyShift,
            Z => sigMagCompDtxy
        );

end Behavioral;

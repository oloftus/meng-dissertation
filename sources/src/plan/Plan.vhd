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
    
    signal sigInSigned : SIGNED (precision downto 0);
    signal sigInUnsigned, sigResize, sigMirror : UNSIGNED (precision - 1 downto 0);
    signal sigInUnsignedPadded, sigDtxy, sigShift : UNSIGNED (precision - 1 + 2 * dtxyPointShift downto 0);
    signal sigSign : STD_LOGIC;
    signal sigMagComp : STD_LOGIC_VECTOR (3 downto 0); 
    signal sigInSliced : STD_LOGIC_VECTOR (6 downto 0);
begin
    sigInSigned <= SIGNED(X);

    complements2To1Comp: Complements2To1
        generic map (
            precision => precision
        )
        port map (
            twos => sigInSigned,
            
            ones => sigInUnsigned,
            sign => sigSign
        );

    sigInSliced(0) <= sigInUnsigned(dtxySliceLow + 6) when dtxySliceLow + 6 < precision and dtxySliceLow + 6 >= 0 else '0';
    sigInSliced(1) <= sigInUnsigned(dtxySliceLow + 5) when dtxySliceLow + 5 < precision and dtxySliceLow + 5 >= 0 else '0';
    sigInSliced(2) <= sigInUnsigned(dtxySliceLow + 4) when dtxySliceLow + 4 < precision and dtxySliceLow + 4 >= 0 else '0';
    sigInSliced(3) <= sigInUnsigned(dtxySliceLow + 3) when dtxySliceLow + 3 < precision and dtxySliceLow + 3 >= 0 else '0';
    sigInSliced(4) <= sigInUnsigned(dtxySliceLow + 2) when dtxySliceLow + 2 < precision and dtxySliceLow + 2 >= 0 else '0';
    sigInSliced(5) <= sigInUnsigned(dtxySliceLow + 1) when dtxySliceLow + 1 < precision and dtxySliceLow + 1 >= 0 else '0';
    sigInSliced(6) <= sigInUnsigned(dtxySliceLow + 0) when dtxySliceLow + 0 < precision and dtxySliceLow + 0 >= 0 else '0';

    magnitudeComparatorComp: MagnitudeComparator
        port map (
            A => sigInSliced(0),
            B => sigInSliced(1),
            C => sigInSliced(2),
            D => sigInSliced(3),
            E => sigInSliced(4),
            F => sigInSliced(5),
            G => sigInSliced(6),
            
            Z => sigMagComp
        );
    
    sigInUnsignedPadded <= padding & sigInUnsigned & padding; 
            
    dtxyComp: Dtxy
        generic map (
            integerPrecision => integerPrecision + dtxyPointShift,
            fractionPrecision => fractionPrecision + dtxyPointShift
        )
        port map (
            X => sigInUnsignedPadded,
            Z => sigMagComp,
            
            Y => sigDtxy
        );
    
    sigShift <= Shift_Right(sigDtxy, dtxyPointShift);
    sigResize <= sigShift(precision - 1 + dtxyPointShift downto dtxyPointShift);
    sigMirror <= one - sigResize when sigSign = '1' else sigResize;
    Y <= "0" & STD_LOGIC_VECTOR(sigMirror);
    
end Behavioral;

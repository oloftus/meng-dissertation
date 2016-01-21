library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Plan is
    generic (
        planPrecision : INTEGER;
        fixedPointLoc : INTEGER -- The decimal point position, e.g. 00000.000 = 3
    );
    port (
        X : in SIGNED (planPrecision downto 0);
        Y : out UNSIGNED (planPrecision - 1 downto 0)
    );
end Plan;

architecture Behavioral of Plan is
    constant precisionTop : INTEGER := planPrecision - 1;
    
    constant dtxySliceLow : INTEGER := fixedPointLoc - 3;
    constant one : UNSIGNED (precisionTop downto 0) := (fixedPointLoc + 3 => '1', others => '0');
    
    signal sigIn : SIGNED (planPrecision downto 0);

    signal sigInUnsigned : UNSIGNED (precisionTop downto 0);
    signal sigSigned : STD_LOGIC;
    signal sigMagCompDtxy : STD_LOGIC_VECTOR (3 downto 0); 
    signal sigDtxyMirror : UNSIGNED (precisionTop downto 0);
    
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
            precision : INTEGER
        );
        port (
            Z : in STD_LOGIC_VECTOR (3 downto 0);
            X : in UNSIGNED (precision - 1 downto 0);
            Y : out UNSIGNED (precision - 1 downto 0)
        );
    end component;
begin
    sigIn <= X;
    Y <= one - sigDtxyMirror when sigSigned = '1' else sigDtxyMirror;
    
    complements2To1Comp: Complements2To1
        generic map (
            precision => planPrecision
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
            G => sigInUnsigned(dtxySliceLow + 0),
            
            Z => sigMagCompDtxy
        );
    
    dtxyComp: Dtxy
        generic map (
            precision => planPrecision
        )
        port map (
            X => sigInUnsigned,
            Y => sigDtxyMirror,
            Z => sigMagCompDtxy
        );

end Behavioral;

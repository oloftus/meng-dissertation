--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Mon Mar 14 21:26:02 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target ComplementsMultiplierTest.bd
--Design      : ComplementsMultiplierTest
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ComplementsMultiplierTest is
  port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ComplementsMultiplierTest : entity is "ComplementsMultiplierTest,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0}";
end ComplementsMultiplierTest;

architecture STRUCTURE of ComplementsMultiplierTest is
  component ComplementsMultiplierTest_Multiplier_2 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component ComplementsMultiplierTest_Multiplier_2;
  component ComplementsMultiplierTest_Multiplier_Complements1To2_2 is
  port (
    SIGN : in STD_LOGIC;
    ONES : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TWOS : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component ComplementsMultiplierTest_Multiplier_Complements1To2_2;
  component ComplementsMultiplierTest_Multiplier_Complements2To1_0_3 is
  port (
    TWOS : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ONES : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SIGN : out STD_LOGIC
  );
  end component ComplementsMultiplierTest_Multiplier_Complements2To1_0_3;
  component ComplementsMultiplierTest_Multiplier_Complements2To1_1_3 is
  port (
    TWOS : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ONES : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SIGN : out STD_LOGIC
  );
  end component ComplementsMultiplierTest_Multiplier_Complements2To1_1_3;
  component ComplementsMultiplierTest_Multiplier_Xor2_3 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ComplementsMultiplierTest_Multiplier_Xor2_3;
  signal A_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal B_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal Multiplier_Complements1To2_TWOS : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Multiplier_Complements2To1_0_ONES : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Multiplier_Complements2To1_0_SIGN : STD_LOGIC;
  signal Multiplier_Complements2To1_1_ONES : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Multiplier_Complements2To1_1_SIGN : STD_LOGIC;
  signal Multiplier_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Multiplier_Xor2_O : STD_LOGIC;
begin
  A_1(15 downto 0) <= A(15 downto 0);
  B_1(15 downto 0) <= B(15 downto 0);
  CLK_1 <= CLK;
  P(31 downto 0) <= Multiplier_Complements1To2_TWOS(31 downto 0);
Multiplier: component ComplementsMultiplierTest_Multiplier_2
    port map (
      A(15 downto 0) => Multiplier_Complements2To1_1_ONES(15 downto 0),
      B(15 downto 0) => Multiplier_Complements2To1_0_ONES(15 downto 0),
      CLK => CLK_1,
      P(31 downto 0) => Multiplier_P(31 downto 0)
    );
Multiplier_Complements1To2: component ComplementsMultiplierTest_Multiplier_Complements1To2_2
    port map (
      ONES(31 downto 0) => Multiplier_P(31 downto 0),
      SIGN => Multiplier_Xor2_O,
      TWOS(31 downto 0) => Multiplier_Complements1To2_TWOS(31 downto 0)
    );
Multiplier_Complements2To1_0: component ComplementsMultiplierTest_Multiplier_Complements2To1_0_3
    port map (
      ONES(15 downto 0) => Multiplier_Complements2To1_0_ONES(15 downto 0),
      SIGN => Multiplier_Complements2To1_0_SIGN,
      TWOS(15 downto 0) => B_1(15 downto 0)
    );
Multiplier_Complements2To1_1: component ComplementsMultiplierTest_Multiplier_Complements2To1_1_3
    port map (
      ONES(15 downto 0) => Multiplier_Complements2To1_1_ONES(15 downto 0),
      SIGN => Multiplier_Complements2To1_1_SIGN,
      TWOS(15 downto 0) => A_1(15 downto 0)
    );
Multiplier_Xor2: component ComplementsMultiplierTest_Multiplier_Xor2_3
    port map (
      A => Multiplier_Complements2To1_1_SIGN,
      B => Multiplier_Complements2To1_0_SIGN,
      O => Multiplier_Xor2_O
    );
end STRUCTURE;

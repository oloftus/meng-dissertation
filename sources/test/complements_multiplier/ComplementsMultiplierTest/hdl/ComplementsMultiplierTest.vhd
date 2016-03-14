--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Mon Mar 14 20:16:23 2016
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
    A : in STD_LOGIC_VECTOR ( 16 downto 0 );
    B : in STD_LOGIC_VECTOR ( 16 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 32 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ComplementsMultiplierTest : entity is "ComplementsMultiplierTest,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0}";
end ComplementsMultiplierTest;

architecture STRUCTURE of ComplementsMultiplierTest is
  component ComplementsMultiplierTest_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component ComplementsMultiplierTest_mult_gen_0_0;
  component ComplementsMultiplierTest_Xor2_0_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ComplementsMultiplierTest_Xor2_0_0;
  component ComplementsMultiplierTest_Complements1To2_0_0 is
  port (
    ONES : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SIGN : in STD_LOGIC;
    TWOS : out STD_LOGIC_VECTOR ( 32 downto 0 )
  );
  end component ComplementsMultiplierTest_Complements1To2_0_0;
  component ComplementsMultiplierTest_Complements2To1_2_0_3 is
  port (
    TWOS : in STD_LOGIC_VECTOR ( 16 downto 0 );
    ONES : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SIGN : out STD_LOGIC
  );
  end component ComplementsMultiplierTest_Complements2To1_2_0_3;
  component ComplementsMultiplierTest_Complements2To1_2_1_1 is
  port (
    TWOS : in STD_LOGIC_VECTOR ( 16 downto 0 );
    ONES : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SIGN : out STD_LOGIC
  );
  end component ComplementsMultiplierTest_Complements2To1_2_1_1;
  signal A_1 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal B_1 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal Complements1To2_0_TWOS : STD_LOGIC_VECTOR ( 32 downto 0 );
  signal Complements2To1_2_0_ONES : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Complements2To1_2_0_SIGN : STD_LOGIC;
  signal Complements2To1_2_1_ONES : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Complements2To1_2_1_SIGN : STD_LOGIC;
  signal Xor2_0_O : STD_LOGIC;
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  A_1(16 downto 0) <= A(16 downto 0);
  B_1(16 downto 0) <= B(16 downto 0);
  CLK_1 <= CLK;
  P(32 downto 0) <= Complements1To2_0_TWOS(32 downto 0);
Complements1To2_0: component ComplementsMultiplierTest_Complements1To2_0_0
    port map (
      ONES(31 downto 0) => mult_gen_0_P(31 downto 0),
      SIGN => Xor2_0_O,
      TWOS(32 downto 0) => Complements1To2_0_TWOS(32 downto 0)
    );
Complements2To1_2_0: component ComplementsMultiplierTest_Complements2To1_2_0_3
    port map (
      ONES(15 downto 0) => Complements2To1_2_0_ONES(15 downto 0),
      SIGN => Complements2To1_2_0_SIGN,
      TWOS(16 downto 0) => B_1(16 downto 0)
    );
Complements2To1_2_1: component ComplementsMultiplierTest_Complements2To1_2_1_1
    port map (
      ONES(15 downto 0) => Complements2To1_2_1_ONES(15 downto 0),
      SIGN => Complements2To1_2_1_SIGN,
      TWOS(16 downto 0) => A_1(16 downto 0)
    );
Xor2_0: component ComplementsMultiplierTest_Xor2_0_0
    port map (
      A => Complements2To1_2_1_SIGN,
      B => Complements2To1_2_0_SIGN,
      O => Xor2_0_O
    );
mult_gen_0: component ComplementsMultiplierTest_mult_gen_0_0
    port map (
      A(15 downto 0) => Complements2To1_2_1_ONES(15 downto 0),
      B(15 downto 0) => Complements2To1_2_0_ONES(15 downto 0),
      CLK => CLK_1,
      P(31 downto 0) => mult_gen_0_P(31 downto 0)
    );
end STRUCTURE;

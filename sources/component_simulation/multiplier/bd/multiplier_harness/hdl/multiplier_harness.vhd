--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Tue Jan 26 18:18:40 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target multiplier_harness.bd
--Design      : multiplier_harness
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity multiplier_harness is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of multiplier_harness : entity is "multiplier_harness,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0}";
end multiplier_harness;

architecture STRUCTURE of multiplier_harness is
  component multiplier_harness_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    P : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component multiplier_harness_mult_gen_0_0;
  signal A_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal B_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  A_1(3 downto 0) <= A(3 downto 0);
  B_1(3 downto 0) <= B(3 downto 0);
  CLK_1 <= CLK;
  P(3 downto 0) <= mult_gen_0_P(3 downto 0);
mult_gen_0: component multiplier_harness_mult_gen_0_0
    port map (
      A(3 downto 0) => A_1(3 downto 0),
      B(3 downto 0) => B_1(3 downto 0),
      CLK => CLK_1,
      P(3 downto 0) => mult_gen_0_P(3 downto 0)
    );
end STRUCTURE;

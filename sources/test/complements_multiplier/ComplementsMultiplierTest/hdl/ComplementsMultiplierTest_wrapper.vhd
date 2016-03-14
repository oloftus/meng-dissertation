--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Mon Mar 14 20:16:23 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target ComplementsMultiplierTest_wrapper.bd
--Design      : ComplementsMultiplierTest_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ComplementsMultiplierTest_wrapper is
  port (
    A : in STD_LOGIC_VECTOR ( 16 downto 0 );
    B : in STD_LOGIC_VECTOR ( 16 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 32 downto 0 )
  );
end ComplementsMultiplierTest_wrapper;

architecture STRUCTURE of ComplementsMultiplierTest_wrapper is
  component ComplementsMultiplierTest is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 16 downto 0 );
    B : in STD_LOGIC_VECTOR ( 16 downto 0 );
    P : out STD_LOGIC_VECTOR ( 32 downto 0 )
  );
  end component ComplementsMultiplierTest;
begin
ComplementsMultiplierTest_i: component ComplementsMultiplierTest
    port map (
      A(16 downto 0) => A(16 downto 0),
      B(16 downto 0) => B(16 downto 0),
      CLK => CLK,
      P(32 downto 0) => P(32 downto 0)
    );
end STRUCTURE;

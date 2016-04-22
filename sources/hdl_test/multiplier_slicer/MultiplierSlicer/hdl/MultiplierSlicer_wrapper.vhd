--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Tue Feb 23 18:02:04 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target MultiplierSlicer_wrapper.bd
--Design      : MultiplierSlicer_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MultiplierSlicer_wrapper is
  port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end MultiplierSlicer_wrapper;

architecture STRUCTURE of MultiplierSlicer_wrapper is
  component MultiplierSlicer is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component MultiplierSlicer;
begin
MultiplierSlicer_i: component MultiplierSlicer
    port map (
      A(15 downto 0) => A(15 downto 0),
      B(15 downto 0) => B(15 downto 0),
      CLK => CLK,
      P(15 downto 0) => P(15 downto 0)
    );
end STRUCTURE;

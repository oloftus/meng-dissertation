--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Wed Feb 17 12:08:16 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target ValueRouterNetworkTest_wrapper.bd
--Design      : ValueRouterNetworkTest_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ValueRouterNetworkTest_wrapper is
  port (
    CLK : in STD_LOGIC;
    DONE : out STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_0_VALID : out STD_LOGIC;
    SYN_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_1_VALID : out STD_LOGIC;
    WEIGHT_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_2_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_3_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_4_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_5_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_6_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_7_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end ValueRouterNetworkTest_wrapper;

architecture STRUCTURE of ValueRouterNetworkTest_wrapper is
  component ValueRouterNetworkTest is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RST : in STD_LOGIC;
    SYN_0_VALID : out STD_LOGIC;
    SYN_1_VALID : out STD_LOGIC;
    SYN_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_3_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_2_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_7_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_6_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_4_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_5_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DONE : out STD_LOGIC
  );
  end component ValueRouterNetworkTest;
begin
ValueRouterNetworkTest_i: component ValueRouterNetworkTest
    port map (
      CLK => CLK,
      DONE => DONE,
      PKT_IN(31 downto 0) => PKT_IN(31 downto 0),
      PKT_IN_VALID => PKT_IN_VALID,
      RST => RST,
      SYN_0_DATA(15 downto 0) => SYN_0_DATA(15 downto 0),
      SYN_0_VALID => SYN_0_VALID,
      SYN_1_DATA(15 downto 0) => SYN_1_DATA(15 downto 0),
      SYN_1_VALID => SYN_1_VALID,
      WEIGHT_0_DATA(15 downto 0) => WEIGHT_0_DATA(15 downto 0),
      WEIGHT_1_DATA(15 downto 0) => WEIGHT_1_DATA(15 downto 0),
      WEIGHT_2_DATA(15 downto 0) => WEIGHT_2_DATA(15 downto 0),
      WEIGHT_3_DATA(15 downto 0) => WEIGHT_3_DATA(15 downto 0),
      WEIGHT_4_DATA(15 downto 0) => WEIGHT_4_DATA(15 downto 0),
      WEIGHT_5_DATA(15 downto 0) => WEIGHT_5_DATA(15 downto 0),
      WEIGHT_6_DATA(15 downto 0) => WEIGHT_6_DATA(15 downto 0),
      WEIGHT_7_DATA(15 downto 0) => WEIGHT_7_DATA(15 downto 0)
    );
end STRUCTURE;

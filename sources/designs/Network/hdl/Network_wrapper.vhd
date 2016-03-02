--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Wed Mar 02 22:27:24 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target Network_wrapper.bd
--Design      : Network_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Network_wrapper is
  port (
    CLK : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    NXT_SYN_OUT : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_OUTS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SYN_OUTS_READY : out STD_LOGIC
  );
end Network_wrapper;

architecture STRUCTURE of Network_wrapper is
  component Network is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    NXT_SYN_OUT : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    SYN_OUTS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SYN_OUTS_READY : out STD_LOGIC
  );
  end component Network;
begin
Network_i: component Network
    port map (
      CLK => CLK,
      DONE_OUT => DONE_OUT,
      NXT_SYN_OUT => NXT_SYN_OUT,
      PKT_IN(31 downto 0) => PKT_IN(31 downto 0),
      PKT_IN_VALID => PKT_IN_VALID,
      RST => RST,
      SYN_OUTS(31 downto 0) => SYN_OUTS(31 downto 0),
      SYN_OUTS_READY => SYN_OUTS_READY
    );
end STRUCTURE;

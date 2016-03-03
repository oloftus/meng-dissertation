-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: oloftus.com:prif:ValueRouter:4.0
-- IP Revision: 4

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ValueRouterNetworkTest_NeuronRouter0_1 IS
  PORT (
    CLK : IN STD_LOGIC;
    PKT_IN_VALID : IN STD_LOGIC;
    PKT_IN : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
    PKT_OUT_VALID : OUT STD_LOGIC;
    PKT_OUT : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    DONE_IN : IN STD_LOGIC;
    DONE_OUT : OUT STD_LOGIC;
    ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END ValueRouterNetworkTest_NeuronRouter0_1;

ARCHITECTURE ValueRouterNetworkTest_NeuronRouter0_1_arch OF ValueRouterNetworkTest_NeuronRouter0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF ValueRouterNetworkTest_NeuronRouter0_1_arch: ARCHITECTURE IS "yes";

  COMPONENT ValueRouter IS
    GENERIC (
      packetInWidth : INTEGER;
      packetOutWidth : INTEGER
    );
    PORT (
      CLK : IN STD_LOGIC;
      PKT_IN_VALID : IN STD_LOGIC;
      PKT_IN : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
      PKT_OUT_VALID : OUT STD_LOGIC;
      PKT_OUT : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      DONE_IN : IN STD_LOGIC;
      DONE_OUT : OUT STD_LOGIC;
      ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0)
    );
  END COMPONENT ValueRouter;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF ValueRouterNetworkTest_NeuronRouter0_1_arch: ARCHITECTURE IS "ValueRouter,Vivado 2014.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF ValueRouterNetworkTest_NeuronRouter0_1_arch : ARCHITECTURE IS "ValueRouterNetworkTest_NeuronRouter0_1,ValueRouter,{}";
BEGIN
  U0 : ValueRouter
    GENERIC MAP (
      packetInWidth => 26,
      packetOutWidth => 20
    )
    PORT MAP (
      CLK => CLK,
      PKT_IN_VALID => PKT_IN_VALID,
      PKT_IN => PKT_IN,
      PKT_OUT_VALID => PKT_OUT_VALID,
      PKT_OUT => PKT_OUT,
      DONE_IN => DONE_IN,
      DONE_OUT => DONE_OUT,
      ADDR => ADDR
    );
END ValueRouterNetworkTest_NeuronRouter0_1_arch;

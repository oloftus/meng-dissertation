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

-- IP VLNV: xilinx.com:ip:xlconstant:1.1
-- IP Revision: 0

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.xlconstant;

ENTITY ValueRouterNetworkTest_xlconstant_6_0 IS
  PORT (
    dout : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END ValueRouterNetworkTest_xlconstant_6_0;

ARCHITECTURE ValueRouterNetworkTest_xlconstant_6_0_arch OF ValueRouterNetworkTest_xlconstant_6_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF ValueRouterNetworkTest_xlconstant_6_0_arch: ARCHITECTURE IS "yes";

  COMPONENT xlconstant IS
    GENERIC (
      CONST_VAL : INTEGER;
      CONST_WIDTH : INTEGER
    );
    PORT (
      dout : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT xlconstant;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF ValueRouterNetworkTest_xlconstant_6_0_arch: ARCHITECTURE IS "xlconstant,Vivado 2014.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF ValueRouterNetworkTest_xlconstant_6_0_arch : ARCHITECTURE IS "ValueRouterNetworkTest_xlconstant_6_0,xlconstant,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF ValueRouterNetworkTest_xlconstant_6_0_arch: ARCHITECTURE IS "ValueRouterNetworkTest_xlconstant_6_0,xlconstant,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=xlconstant,x_ipVersion=1.1,x_ipCoreRevision=0,x_ipLanguage=VHDL,CONST_VAL=17,CONST_WIDTH=5}";
BEGIN
  U0 : xlconstant
    GENERIC MAP (
      CONST_VAL => 17,
      CONST_WIDTH => 5
    )
    PORT MAP (
      dout => dout
    );
END ValueRouterNetworkTest_xlconstant_6_0_arch;

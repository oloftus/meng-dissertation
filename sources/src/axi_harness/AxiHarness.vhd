library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_arith.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity axi_harness_v1_0 is
    generic (
        C_S00_AXI_DATA_WIDTH : integer := 32;
        C_S00_AXI_ADDR_WIDTH : integer := 4
    );
    port (
        SYN_OUTS : in STD_LOGIC_VECTOR (C_S00_AXI_DATA_WIDTH - 1 downto 0);
        SYN_OUTS_VALID : in STD_LOGIC;
        DONE_OUT : in STD_LOGIC;
        PKT_IN : out STD_LOGIC_VECTOR (C_S00_AXI_DATA_WIDTH - 1 downto 0);
        PKT_IN_VALID : out STD_LOGIC;
        NXT_SYN_OUT : out STD_LOGIC;

        s00_axi_aclk : in STD_LOGIC;
        s00_axi_aresetn : in STD_LOGIC;
        s00_axi_awaddr : in STD_LOGIC_VECTOR (C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_awprot : in STD_LOGIC_VECTOR (2 downto 0);
        s00_axi_awvalid : in STD_LOGIC;
        s00_axi_awready : out STD_LOGIC;
        s00_axi_wdata : in STD_LOGIC_VECTOR (C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_wstrb : in STD_LOGIC_VECTOR ((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
        s00_axi_wvalid : in STD_LOGIC;
        s00_axi_wready : out STD_LOGIC;
        s00_axi_bresp : out STD_LOGIC_VECTOR (1 downto 0);
        s00_axi_bvalid : out STD_LOGIC;
        s00_axi_bready : in STD_LOGIC;
        s00_axi_araddr : in STD_LOGIC_VECTOR (C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_arprot : in STD_LOGIC_VECTOR (2 downto 0);
        s00_axi_arvalid : in STD_LOGIC;
        s00_axi_arready : out STD_LOGIC;
        s00_axi_rdata : out STD_LOGIC_VECTOR (C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_rresp : out STD_LOGIC_VECTOR (1 downto 0);
        s00_axi_rvalid : out STD_LOGIC;
        s00_axi_rready : in STD_LOGIC
    );
end axi_harness_v1_0;

architecture arch_imp of axi_harness_v1_0 is
    component axi_harness_v1_0_S00_AXI is
        generic (
            C_S_AXI_DATA_WIDTH    : integer    := 32;
            C_S_AXI_ADDR_WIDTH    : integer    := 4
        );
        port (
            DIN0, DIN1, DIN2, DIN3 : in STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH - 1 downto 0);
            DOUT0, DOUT1, DOUT2, DOUT3 : out STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH - 1 downto 0);
    
            S_AXI_ACLK : in STD_LOGIC;
            S_AXI_ARESETN : in STD_LOGIC;
            S_AXI_AWADDR : in STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT : in STD_LOGIC_VECTOR (2 downto 0);
            S_AXI_AWVALID : in STD_LOGIC;
            S_AXI_AWREADY : out STD_LOGIC;
            S_AXI_WDATA : in STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB : in STD_LOGIC_VECTOR ((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID : in STD_LOGIC;
            S_AXI_WREADY : out STD_LOGIC;
            S_AXI_BRESP : out STD_LOGIC_VECTOR (1 downto 0);
            S_AXI_BVALID : out STD_LOGIC;
            S_AXI_BREADY : in STD_LOGIC;
            S_AXI_ARADDR : in STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT : in STD_LOGIC_VECTOR (2 downto 0);
            S_AXI_ARVALID : in STD_LOGIC;
            S_AXI_ARREADY : out STD_LOGIC;
            S_AXI_RDATA : out STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP : out STD_LOGIC_VECTOR (1 downto 0);
            S_AXI_RVALID : out STD_LOGIC;
            S_AXI_RREADY : in STD_LOGIC
        );
    end component axi_harness_v1_0_S00_AXI;

    signal sigDin0, sigDin1, sigSynOuts, sigControlOut : STD_LOGIC_VECTOR (C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal sigPktIn, sigControlIn, sigDout2, sigDout3 : STD_LOGIC_VECTOR (C_S00_AXI_DATA_WIDTH - 1 downto 0);
begin

axi_harness_v1_0_S00_AXI_inst : axi_harness_v1_0_S00_AXI
    generic map (
        C_S_AXI_DATA_WIDTH    => C_S00_AXI_DATA_WIDTH,
        C_S_AXI_ADDR_WIDTH    => C_S00_AXI_ADDR_WIDTH
    )
    port map (
        DIN0 => sigDin0,
        DIN1 => sigDin1,
        DIN2 => sigSynOuts,
        DIN3 => sigControlOut,
        DOUT0 => sigPktIn,
        DOUT1 => sigControlIn,
        DOUT2 => sigDout2,
        DOUT3 => sigDout3,

        S_AXI_ACLK => s00_axi_aclk,
        S_AXI_ARESETN => s00_axi_aresetn,
        S_AXI_AWADDR => s00_axi_awaddr,
        S_AXI_AWPROT => s00_axi_awprot,
        S_AXI_AWVALID => s00_axi_awvalid,
        S_AXI_AWREADY => s00_axi_awready,
        S_AXI_WDATA => s00_axi_wdata,
        S_AXI_WSTRB => s00_axi_wstrb,
        S_AXI_WVALID => s00_axi_wvalid,
        S_AXI_WREADY => s00_axi_wready,
        S_AXI_BRESP => s00_axi_bresp,
        S_AXI_BVALID => s00_axi_bvalid,
        S_AXI_BREADY => s00_axi_bready,
        S_AXI_ARADDR => s00_axi_araddr,
        S_AXI_ARPROT => s00_axi_arprot,
        S_AXI_ARVALID => s00_axi_arvalid,
        S_AXI_ARREADY => s00_axi_arready,
        S_AXI_RDATA => s00_axi_rdata,
        S_AXI_RRESP => s00_axi_rresp,
        S_AXI_RVALID => s00_axi_rvalid,
        S_AXI_RREADY => s00_axi_rready
    );

    PKT_IN <= sigPktIn;
    PKT_IN_VALID <= '1' when sigControlIn(0) = '1' else '0';
    NXT_SYN_OUT <= '1' when sigControlIn(1) = '1' else '0';
    
    sigSynOuts <= SYN_OUTS;
    sigControlOut(31 downto 2) <= (others => '0');
    sigControlOut(1) <= '1' when SYN_OUTS_VALID = '1' else '0';
    sigControlOut(0) <= '1' when DONE_OUT = '1' else '0';

end arch_imp;

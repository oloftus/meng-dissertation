create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.4 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_M_AXI_GP0 {1}] [get_bd_cells processing_system7_0]
create_bd_cell -type ip -vlnv oloftus.com:prif:axi_harness:5.0 axi_harness_0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" }  [get_bd_intf_pins axi_harness_0/S00_AXI]
create_bd_cell -type ip -vlnv oloftus.com:prif:Network:1.0 Network_0
connect_bd_net -net [get_bd_nets processing_system7_0_FCLK_CLK0] [get_bd_pins Network_0/CLK] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins Network_0/RST] [get_bd_pins rst_processing_system7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins Network_0/PKT_IN] [get_bd_pins axi_harness_0/PKT_IN]
connect_bd_net [get_bd_pins Network_0/PKT_IN_VALID] [get_bd_pins axi_harness_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins Network_0/NXT_SYN_OUT] [get_bd_pins axi_harness_0/NXT_SYN_OUT]
connect_bd_net [get_bd_pins Network_0/DONE_OUT] [get_bd_pins axi_harness_0/DONE_OUT]
connect_bd_net [get_bd_pins Network_0/SYN_OUTS] [get_bd_pins axi_harness_0/SYN_OUTS]
connect_bd_net [get_bd_pins Network_0/SYN_OUTS_READY] [get_bd_pins axi_harness_0/SYN_OUTS_VALID]
regenerate_bd_layout

# Initialize vFPGA ILA with the correct configuration
# Important parameters that need to be set:
#   1. The number of probes 
#   2. Width of each probe, if different than 1
create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name ila_perf_host
set_property -dict [list CONFIG.C_NUM_OF_PROBES {8} CONFIG.C_PROBE7_WIDTH {512} CONFIG.C_PROBE3_WIDTH {512} CONFIG.C_EN_STRG_QUAL {1} CONFIG.ALL_PROBE_SAME_MU_CNT {2}] [get_ips ila_perf_host]

##################################################################
# CREATE IP axi_kvs_mem_interconnect
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set axi_kvs_mem_interconnect [create_ip -name axi_interconnect -vendor xilinx.com -library ip -version 1.7 -module_name axi_kvs_mem_interconnect]

set_property -dict { 
  CONFIG.AXI_ADDR_WIDTH {34}
  CONFIG.S00_AXI_DATA_WIDTH {512}
  CONFIG.S01_AXI_DATA_WIDTH {512}
  CONFIG.M00_AXI_DATA_WIDTH {512}
  CONFIG.INTERCONNECT_DATA_WIDTH {512}
  CONFIG.S00_AXI_WRITE_ACCEPTANCE {8}
  CONFIG.S01_AXI_WRITE_ACCEPTANCE {8}
  CONFIG.S00_AXI_READ_ACCEPTANCE {8}
  CONFIG.S01_AXI_READ_ACCEPTANCE {8}
  CONFIG.M00_AXI_WRITE_ISSUING {8}
  CONFIG.M00_AXI_READ_ISSUING {8}
  CONFIG.S00_AXI_REGISTER {1}
  CONFIG.S01_AXI_REGISTER {1}
  CONFIG.M00_AXI_REGISTER {1}
  CONFIG.SYNCHRONIZATION_STAGES {2}
} [get_ips axi_kvs_mem_interconnect]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $axi_kvs_mem_interconnect

##################################################################

##################################################################
# CREATE IP axi_kvs_mem_interconnect_3
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set axi_kvs_mem_interconnect_3 [create_ip -name axi_interconnect -vendor xilinx.com -library ip -version 1.7 -module_name axi_kvs_mem_interconnect_3]

set_property -dict { 
  CONFIG.NUM_SLAVE_PORTS {3}
  CONFIG.AXI_ADDR_WIDTH {34}
  CONFIG.S00_AXI_DATA_WIDTH {512}
  CONFIG.S01_AXI_DATA_WIDTH {512}
  CONFIG.S02_AXI_DATA_WIDTH {512}
  CONFIG.M00_AXI_DATA_WIDTH {512}
  CONFIG.INTERCONNECT_DATA_WIDTH {512}
  CONFIG.S00_AXI_WRITE_ACCEPTANCE {8}
  CONFIG.S01_AXI_WRITE_ACCEPTANCE {8}
  CONFIG.S02_AXI_WRITE_ACCEPTANCE {8}
  CONFIG.S00_AXI_READ_ACCEPTANCE {16}
  CONFIG.S01_AXI_READ_ACCEPTANCE {16}
  CONFIG.S02_AXI_READ_ACCEPTANCE {16}
  CONFIG.M00_AXI_WRITE_ISSUING {8}
  CONFIG.M00_AXI_READ_ISSUING {16}
  CONFIG.S00_AXI_WRITE_FIFO_DEPTH {32}
  CONFIG.S01_AXI_WRITE_FIFO_DEPTH {32}
  CONFIG.S02_AXI_WRITE_FIFO_DEPTH {32}
  CONFIG.S00_AXI_READ_FIFO_DEPTH {32}
  CONFIG.S01_AXI_READ_FIFO_DEPTH {32}
  CONFIG.S02_AXI_READ_FIFO_DEPTH {32}
  CONFIG.S00_AXI_REGISTER {1}
  CONFIG.S01_AXI_REGISTER {1}
  CONFIG.S02_AXI_REGISTER {1}
  CONFIG.M00_AXI_REGISTER {1}
  CONFIG.SYNCHRONIZATION_STAGES {2}
} [get_ips axi_kvs_mem_interconnect_3]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $axi_kvs_mem_interconnect_3

##################################################################

##################################################################
# CREATE IP axi_read_kvs_datamover
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set axi_read_kvs_datamover [create_ip -name axi_datamover -vendor xilinx.com -library ip -version 5.1 -module_name axi_read_kvs_datamover]

set_property -dict { 
  CONFIG.c_mm2s_stscmd_is_async {true}
  CONFIG.c_m_axi_mm2s_data_width {512}
  CONFIG.c_m_axis_mm2s_tdata_width {512}
  CONFIG.c_include_s2mm {Omit}
  CONFIG.c_include_s2mm_stsfifo {false}
  CONFIG.c_s2mm_addr_pipe_depth {3}
  CONFIG.c_mm2s_include_sf {false}
  CONFIG.c_s2mm_include_sf {false}
  CONFIG.c_m_axi_s2mm_awid {1}
  CONFIG.c_enable_s2mm {0}
} [get_ips axi_read_kvs_datamover]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $axi_read_kvs_datamover

##################################################################

##################################################################
# CREATE IP axi_write_kvs_datamover
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set axi_write_kvs_datamover [create_ip -name axi_datamover -vendor xilinx.com -library ip -version 5.1 -module_name axi_write_kvs_datamover]

set_property -dict { 
  CONFIG.c_include_mm2s {Omit}
  CONFIG.c_include_mm2s_stsfifo {false}
  CONFIG.c_s2mm_stscmd_is_async {true}
  CONFIG.c_m_axi_s2mm_data_width {512}
  CONFIG.c_s_axis_s2mm_tdata_width {512}
  CONFIG.c_s2mm_burst_size {16}
  CONFIG.c_mm2s_include_sf {false}
  CONFIG.c_enable_mm2s {0}
  CONFIG.c_addr_width {32}
} [get_ips axi_write_kvs_datamover]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $axi_write_kvs_datamover

##################################################################



##################################################################
# CREATE IP axis_data_fifo_kvs_to_dm_512
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set axis_data_fifo_kvs_to_dm_512 [create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name axis_data_fifo_kvs_to_dm_512]

set_property -dict { 
  CONFIG.TDATA_NUM_BYTES {64}
  CONFIG.FIFO_DEPTH {256}
  CONFIG.IS_ACLK_ASYNC {1}
  CONFIG.HAS_TKEEP {1}
  CONFIG.HAS_TLAST {1}
  CONFIG.SYNCHRONIZATION_STAGES {2}
  CONFIG.HAS_WR_DATA_COUNT {1}
  CONFIG.HAS_RD_DATA_COUNT {1}
} [get_ips axis_data_fifo_kvs_to_dm_512]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $axis_data_fifo_kvs_to_dm_512

##################################################################


##################################################################
# CREATE IP fifo_256bit_regslice
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set fifo_256bit_regslice [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifo_256bit_regslice]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Distributed_RAM}
  CONFIG.INTERFACE_TYPE {AXI_STREAM}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Full_Threshold_Assert_Value {1022}
  CONFIG.Full_Threshold_Negate_Value {1021}
  CONFIG.TDATA_NUM_BYTES {32}
  CONFIG.TUSER_WIDTH {0}
  CONFIG.TSTRB_WIDTH {32}
  CONFIG.TKEEP_WIDTH {32}
  CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wach {15}
  CONFIG.Empty_Threshold_Assert_Value_wach {14}
  CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wrch {15}
  CONFIG.Empty_Threshold_Assert_Value_wrch {14}
  CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_rach {15}
  CONFIG.Empty_Threshold_Assert_Value_rach {14}
  CONFIG.axis_type {Register_Slice}
  CONFIG.FIFO_Implementation_axis {Common_Clock_Distributed_RAM}
  CONFIG.Input_Depth_axis {16}
  CONFIG.Full_Threshold_Assert_Value_axis {15}
  CONFIG.Empty_Threshold_Assert_Value_axis {14}
} [get_ips fifo_256bit_regslice]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifo_256bit_regslice

##################################################################

##################################################################
# CREATE IP fifo_512bit_regslice
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set fifo_512bit_regslice [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifo_512bit_regslice]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Distributed_RAM}
  CONFIG.INTERFACE_TYPE {AXI_STREAM}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Full_Threshold_Assert_Value {1022}
  CONFIG.Full_Threshold_Negate_Value {1021}
  CONFIG.TDATA_NUM_BYTES {64}
  CONFIG.TUSER_WIDTH {0}
  CONFIG.TSTRB_WIDTH {64}
  CONFIG.TKEEP_WIDTH {64}
  CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wach {15}
  CONFIG.Empty_Threshold_Assert_Value_wach {14}
  CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wrch {15}
  CONFIG.Empty_Threshold_Assert_Value_wrch {14}
  CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_rach {15}
  CONFIG.Empty_Threshold_Assert_Value_rach {14}
  CONFIG.axis_type {Register_Slice}
} [get_ips fifo_512bit_regslice]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifo_512bit_regslice

##################################################################

##################################################################
# CREATE IP fifo_64bit_regslice
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set fifo_64bit_regslice [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifo_64bit_regslice]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Distributed_RAM}
  CONFIG.INTERFACE_TYPE {AXI_STREAM}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Full_Threshold_Assert_Value {1022}
  CONFIG.Full_Threshold_Negate_Value {1021}
  CONFIG.TDATA_NUM_BYTES {8}
  CONFIG.TUSER_WIDTH {0}
  CONFIG.TSTRB_WIDTH {8}
  CONFIG.TKEEP_WIDTH {8}
  CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wach {15}
  CONFIG.Empty_Threshold_Assert_Value_wach {14}
  CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wrch {15}
  CONFIG.Empty_Threshold_Assert_Value_wrch {14}
  CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_rach {15}
  CONFIG.Empty_Threshold_Assert_Value_rach {14}
  CONFIG.axis_type {Register_Slice}
} [get_ips fifo_64bit_regslice]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifo_64bit_regslice

##################################################################

##################################################################
# CREATE IP fifo_dm_to_kvs_s
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set fifo_dm_to_kvs_s [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifo_dm_to_kvs_s]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Shift_Register}
  CONFIG.Performance_Options {Standard_FIFO}
  CONFIG.Input_Data_Width {512}
  CONFIG.Input_Depth {16}
  CONFIG.Output_Data_Width {512}
  CONFIG.Output_Depth {16}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Synchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {0}
  CONFIG.Use_Extra_Logic {false}
  CONFIG.Data_Count_Width {4}
  CONFIG.Write_Data_Count_Width {4}
  CONFIG.Read_Data_Count_Width {4}
  CONFIG.Full_Threshold_Assert_Value {14}
  CONFIG.Full_Threshold_Negate_Value {13}
  CONFIG.Empty_Threshold_Assert_Value {2}
  CONFIG.Empty_Threshold_Negate_Value {3}
  CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM}
  CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}
  CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM}
} [get_ips fifo_dm_to_kvs_s]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifo_dm_to_kvs_s

##################################################################

##################################################################
# CREATE IP fifogen_dram_cmd_in
##################################################################

set fifogen_dram_cmd_in [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifogen_dram_cmd_in]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO}
  CONFIG.Performance_Options {First_Word_Fall_Through}
  CONFIG.Input_Data_Width {64}
  CONFIG.Output_Data_Width {64}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Synchronous_Reset}
  CONFIG.Use_Dout_Reset {true}
  CONFIG.Full_Threshold_Assert_Value {1022}
  CONFIG.Full_Threshold_Negate_Value {1021}
  CONFIG.Empty_Threshold_Assert_Value {4}
  CONFIG.Empty_Threshold_Negate_Value {5}
  CONFIG.TDATA_NUM_BYTES {0}
  CONFIG.TSTRB_WIDTH {0}
  CONFIG.TKEEP_WIDTH {0}
} [get_ips fifogen_dram_cmd_in]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifogen_dram_cmd_in

##################################################################

##################################################################
# CREATE IP fifogen_dram_data_in
##################################################################

set fifogen_dram_data_in [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifogen_dram_data_in]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Block_RAM}
  CONFIG.Performance_Options {First_Word_Fall_Through}
  CONFIG.Input_Data_Width {512}
  CONFIG.Input_Depth {64}
  CONFIG.Output_Data_Width {512}
  CONFIG.Output_Depth {64}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Use_Extra_Logic {true}
  CONFIG.Data_Count_Width {7}
  CONFIG.Write_Data_Count_Width {7}
  CONFIG.Read_Data_Count_Width {7}
  CONFIG.Full_Threshold_Assert_Value {63}
  CONFIG.Full_Threshold_Negate_Value {62}
  CONFIG.Empty_Threshold_Assert_Value {4}
  CONFIG.Empty_Threshold_Negate_Value {5}
  CONFIG.TDATA_NUM_BYTES {0}
  CONFIG.TSTRB_WIDTH {0}
  CONFIG.TKEEP_WIDTH {0}
} [get_ips fifogen_dram_data_in]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifogen_dram_data_in

##################################################################

##################################################################
# CREATE IP fifogen_dram_data_out
##################################################################

set fifogen_dram_data_out [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name fifogen_dram_data_out]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Block_RAM}
  CONFIG.Input_Data_Width {512}
  CONFIG.Input_Depth {256}
  CONFIG.Output_Data_Width {512}
  CONFIG.Output_Depth {256}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Data_Count_Width {8}
  CONFIG.Write_Data_Count_Width {8}
  CONFIG.Read_Data_Count_Width {8}
  CONFIG.Full_Threshold_Assert_Value {254}
  CONFIG.Full_Threshold_Negate_Value {253}
  CONFIG.TDATA_NUM_BYTES {0}
  CONFIG.TSTRB_WIDTH {0}
  CONFIG.TKEEP_WIDTH {0}
} [get_ips fifogen_dram_data_out]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $fifogen_dram_data_out

##################################################################

##################################################################
# CREATE IP zk_blkmem_32x1024
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set zk_blkmem_32x1024 [create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name zk_blkmem_32x1024]

set_property -dict { 
  CONFIG.Write_Width_A {48}
  CONFIG.Write_Depth_A {1024}
  CONFIG.Read_Width_A {48}
  CONFIG.Operating_Mode_A {READ_FIRST}
  CONFIG.Enable_A {Always_Enabled}
  CONFIG.Write_Width_B {48}
  CONFIG.Read_Width_B {48}
  CONFIG.Register_PortA_Output_of_Memory_Primitives {false}
  CONFIG.Register_PortA_Output_of_Memory_Core {true}
} [get_ips zk_blkmem_32x1024]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $zk_blkmem_32x1024

##################################################################

##################################################################
# CREATE IP zk_fifo_1024w_256d
##################################################################

# Hint: I changed Input_Depth_axis 256 -> 512 because 256 is not available and threw an error

set zk_fifo_1024w_256d [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name zk_fifo_1024w_256d]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Block_RAM}
  CONFIG.INTERFACE_TYPE {AXI_STREAM}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Full_Threshold_Assert_Value {1022}
  CONFIG.Full_Threshold_Negate_Value {1021}
  CONFIG.TDATA_NUM_BYTES {64}
  CONFIG.TUSER_WIDTH {64}
  CONFIG.Enable_TLAST {true}
  CONFIG.TSTRB_WIDTH {64}
  CONFIG.TKEEP_WIDTH {64}
  CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wach {15}
  CONFIG.Empty_Threshold_Assert_Value_wach {14}
  CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wrch {15}
  CONFIG.Empty_Threshold_Assert_Value_wrch {14}
  CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_rach {15}
  CONFIG.Empty_Threshold_Assert_Value_rach {14}
  CONFIG.FIFO_Implementation_rdch {Common_Clock_Builtin_FIFO}
  CONFIG.FIFO_Application_Type_axis {Packet_FIFO}
  CONFIG.Input_Depth_axis {512}
  CONFIG.Enable_Data_Counts_axis {true}
  CONFIG.Programmable_Full_Type_axis {Single_Programmable_Full_Threshold_Constant}
  CONFIG.Full_Threshold_Assert_Value_axis {128}
  CONFIG.Programmable_Empty_Type_axis {No_Programmable_Empty_Threshold}
  CONFIG.Empty_Threshold_Assert_Value_axis {254}
} [get_ips zk_fifo_1024w_256d]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $zk_fifo_1024w_256d

##################################################################

##################################################################
# CREATE IP zk_fifo_576x1024
##################################################################

#set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
set zk_fifo_576x1024 [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name zk_fifo_576x1024]

set_property -dict { 
  CONFIG.Fifo_Implementation {Common_Clock_Block_RAM}
  CONFIG.INTERFACE_TYPE {AXI_STREAM}
  CONFIG.Use_Embedded_Registers {false}
  CONFIG.Reset_Type {Asynchronous_Reset}
  CONFIG.Full_Flags_Reset_Value {1}
  CONFIG.Full_Threshold_Assert_Value {1022}
  CONFIG.Full_Threshold_Negate_Value {1021}
  CONFIG.TDATA_NUM_BYTES {128}
  CONFIG.TUSER_WIDTH {0}
  CONFIG.Enable_TLAST {true}
  CONFIG.TSTRB_WIDTH {128}
  CONFIG.TKEEP_WIDTH {128}
  CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wach {15}
  CONFIG.Empty_Threshold_Assert_Value_wach {14}
  CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_wrch {15}
  CONFIG.Empty_Threshold_Assert_Value_wrch {14}
  CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM}
  CONFIG.Full_Threshold_Assert_Value_rach {15}
  CONFIG.Empty_Threshold_Assert_Value_rach {14}
  CONFIG.FIFO_Implementation_rdch {Common_Clock_Builtin_FIFO}
  CONFIG.FIFO_Application_Type_axis {Packet_FIFO}
  CONFIG.Input_Depth_axis {1024}
  CONFIG.Enable_Data_Counts_axis {true}
  CONFIG.Programmable_Full_Type_axis {Single_Programmable_Full_Threshold_Constant}
  CONFIG.Full_Threshold_Assert_Value_axis {850}
  CONFIG.Programmable_Empty_Type_axis {No_Programmable_Empty_Threshold}
  CONFIG.Empty_Threshold_Assert_Value_axis {1022}
} [get_ips zk_fifo_576x1024]

set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $zk_fifo_576x1024

##################################################################

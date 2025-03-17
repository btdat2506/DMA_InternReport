quit -sim
vsim -t ps -L work -L work_lib -L altera_common_sv_packages -L error_adapter_0 -L avalon_st_adapter -L rsp_mux_003 -L rsp_mux_002 -L rsp_mux -L rsp_demux_001 -L cmd_mux_002 -L cmd_mux_001 -L cmd_mux -L cmd_demux_003 -L cmd_demux_002 -L cmd_demux_001 -L cmd_demux -L DMA_Controller_0_avalon_master_limiter -L router_006 -L router_005 -L router_004 -L router_003 -L router_002 -L router -L onchip_memory2_0_s1_agent_rsp_fifo -L onchip_memory2_0_s1_agent -L DMA_Controller_0_avalon_master_agent -L onchip_memory2_0_s1_translator -L DMA_Controller_0_avalon_master_translator -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_0 -L onchip_memory2_1 -L onchip_memory2_0 -L nios2_gen2_0 -L jtag_uart_0 -L DMA_Controller_0 -L system_inst_reset_bfm -L system_inst_clk_bfm -L system_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver system_tb -voptargs="+acc" 

add wave -divider "Control Slave"
add wave -position end sim:/system_tb/system_inst/dma_controller_0/u_CONTROL_SLAVE/*
add wave -divider "READ_MASTER"
add wave -position end sim:/system_tb/system_inst/dma_controller_0/u_READ_MASTER/*
add wave -divider "WRITE_MASTER"
add wave -position end sim:/system_tb/system_inst/dma_controller_0/u_WRITE_MASTER/*
add wave -divider "FIFO"
add wave -position end sim:/system_tb/system_inst/dma_controller_0/FIFO_IP_inst/*
run 4 ms


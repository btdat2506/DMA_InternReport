elab_debug

add wave -divider "Control Slave"
add wave -position end sim:/system_tb/system_inst/dma_controller/u_CONTROL_SLAVE/*
add wave -divider "READ_MASTER"
add wave -position end sim:/system_tb/system_inst/dma_controller/u_READ_MASTER/*
add wave -divider "WRITE_MASTER"
add wave -position end sim:/system_tb/system_inst/dma_controller/u_WRITE_MASTER/*
add wave -divider "FIFO"
add wave -position end sim:/system_tb/system_inst/dma_controller/FIFO_IP_inst/*
run 7 ms
// system.v

// Generated using ACDS version 23.1 993

`timescale 1 ps / 1 ps
module system (
		input  wire  clk_clk,       //   clk.clk
		input  wire  reset_reset_n  // reset.reset_n
	);

	wire         dma_controller_avalon_master_waitrequest;                    // mm_interconnect_0:DMA_Controller_avalon_master_waitrequest -> DMA_Controller:iRM_waitrequest
	wire  [31:0] dma_controller_avalon_master_readdata;                       // mm_interconnect_0:DMA_Controller_avalon_master_readdata -> DMA_Controller:iRM_readdata
	wire         dma_controller_avalon_master_read;                           // DMA_Controller:oRM_read -> mm_interconnect_0:DMA_Controller_avalon_master_read
	wire  [31:0] dma_controller_avalon_master_address;                        // DMA_Controller:oRM_readaddress -> mm_interconnect_0:DMA_Controller_avalon_master_address
	wire         dma_controller_avalon_master_readdatavalid;                  // mm_interconnect_0:DMA_Controller_avalon_master_readdatavalid -> DMA_Controller:iRM_readdatavalid
	wire         dma_controller_avalon_master_1_waitrequest;                  // mm_interconnect_0:DMA_Controller_avalon_master_1_waitrequest -> DMA_Controller:iWM_waitrequest
	wire  [31:0] dma_controller_avalon_master_1_address;                      // DMA_Controller:oWM_writeaddress -> mm_interconnect_0:DMA_Controller_avalon_master_1_address
	wire   [3:0] dma_controller_avalon_master_1_byteenable;                   // DMA_Controller:oWM_byteenable -> mm_interconnect_0:DMA_Controller_avalon_master_1_byteenable
	wire  [31:0] dma_controller_avalon_master_1_writedata;                    // DMA_Controller:oWM_writedata -> mm_interconnect_0:DMA_Controller_avalon_master_1_writedata
	wire         dma_controller_avalon_master_1_write;                        // DMA_Controller:oWM_write -> mm_interconnect_0:DMA_Controller_avalon_master_1_write
	wire  [31:0] nios2_gen2_0_data_master_readdata;                           // mm_interconnect_0:nios2_gen2_0_data_master_readdata -> nios2_gen2_0:d_readdata
	wire         nios2_gen2_0_data_master_waitrequest;                        // mm_interconnect_0:nios2_gen2_0_data_master_waitrequest -> nios2_gen2_0:d_waitrequest
	wire         nios2_gen2_0_data_master_debugaccess;                        // nios2_gen2_0:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:nios2_gen2_0_data_master_debugaccess
	wire  [18:0] nios2_gen2_0_data_master_address;                            // nios2_gen2_0:d_address -> mm_interconnect_0:nios2_gen2_0_data_master_address
	wire   [3:0] nios2_gen2_0_data_master_byteenable;                         // nios2_gen2_0:d_byteenable -> mm_interconnect_0:nios2_gen2_0_data_master_byteenable
	wire         nios2_gen2_0_data_master_read;                               // nios2_gen2_0:d_read -> mm_interconnect_0:nios2_gen2_0_data_master_read
	wire         nios2_gen2_0_data_master_write;                              // nios2_gen2_0:d_write -> mm_interconnect_0:nios2_gen2_0_data_master_write
	wire  [31:0] nios2_gen2_0_data_master_writedata;                          // nios2_gen2_0:d_writedata -> mm_interconnect_0:nios2_gen2_0_data_master_writedata
	wire  [31:0] nios2_gen2_0_instruction_master_readdata;                    // mm_interconnect_0:nios2_gen2_0_instruction_master_readdata -> nios2_gen2_0:i_readdata
	wire         nios2_gen2_0_instruction_master_waitrequest;                 // mm_interconnect_0:nios2_gen2_0_instruction_master_waitrequest -> nios2_gen2_0:i_waitrequest
	wire  [18:0] nios2_gen2_0_instruction_master_address;                     // nios2_gen2_0:i_address -> mm_interconnect_0:nios2_gen2_0_instruction_master_address
	wire         nios2_gen2_0_instruction_master_read;                        // nios2_gen2_0:i_read -> mm_interconnect_0:nios2_gen2_0_instruction_master_read
	wire         mm_interconnect_0_onchip_memory2_0_s1_chipselect;            // mm_interconnect_0:onchip_memory2_0_s1_chipselect -> onchip_memory2_0:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_readdata;              // onchip_memory2_0:readdata -> mm_interconnect_0:onchip_memory2_0_s1_readdata
	wire  [14:0] mm_interconnect_0_onchip_memory2_0_s1_address;               // mm_interconnect_0:onchip_memory2_0_s1_address -> onchip_memory2_0:address
	wire   [3:0] mm_interconnect_0_onchip_memory2_0_s1_byteenable;            // mm_interconnect_0:onchip_memory2_0_s1_byteenable -> onchip_memory2_0:byteenable
	wire         mm_interconnect_0_onchip_memory2_0_s1_write;                 // mm_interconnect_0:onchip_memory2_0_s1_write -> onchip_memory2_0:write
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_writedata;             // mm_interconnect_0:onchip_memory2_0_s1_writedata -> onchip_memory2_0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_clken;                 // mm_interconnect_0:onchip_memory2_0_s1_clken -> onchip_memory2_0:clken
	wire         mm_interconnect_0_onchip_memory2_1_s1_chipselect;            // mm_interconnect_0:onchip_memory2_1_s1_chipselect -> onchip_memory2_1:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory2_1_s1_readdata;              // onchip_memory2_1:readdata -> mm_interconnect_0:onchip_memory2_1_s1_readdata
	wire  [14:0] mm_interconnect_0_onchip_memory2_1_s1_address;               // mm_interconnect_0:onchip_memory2_1_s1_address -> onchip_memory2_1:address
	wire   [3:0] mm_interconnect_0_onchip_memory2_1_s1_byteenable;            // mm_interconnect_0:onchip_memory2_1_s1_byteenable -> onchip_memory2_1:byteenable
	wire         mm_interconnect_0_onchip_memory2_1_s1_write;                 // mm_interconnect_0:onchip_memory2_1_s1_write -> onchip_memory2_1:write
	wire  [31:0] mm_interconnect_0_onchip_memory2_1_s1_writedata;             // mm_interconnect_0:onchip_memory2_1_s1_writedata -> onchip_memory2_1:writedata
	wire         mm_interconnect_0_onchip_memory2_1_s1_clken;                 // mm_interconnect_0:onchip_memory2_1_s1_clken -> onchip_memory2_1:clken
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_chipselect -> jtag_uart_0:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_readdata;    // jtag_uart_0:av_readdata -> mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_waitrequest; // jtag_uart_0:av_waitrequest -> mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_address -> jtag_uart_0:av_address
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_read -> jtag_uart_0:av_read_n
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_write -> jtag_uart_0:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_writedata -> jtag_uart_0:av_writedata
	wire  [31:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata;     // nios2_gen2_0:debug_mem_slave_readdata -> mm_interconnect_0:nios2_gen2_0_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest;  // nios2_gen2_0:debug_mem_slave_waitrequest -> mm_interconnect_0:nios2_gen2_0_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess;  // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_debugaccess -> nios2_gen2_0:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address;      // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_address -> nios2_gen2_0:debug_mem_slave_address
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read;         // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_read -> nios2_gen2_0:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable;   // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_byteenable -> nios2_gen2_0:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write;        // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_write -> nios2_gen2_0:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata;    // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_writedata -> nios2_gen2_0:debug_mem_slave_writedata
	wire         mm_interconnect_0_dma_controller_avalon_slave_0_chipselect;  // mm_interconnect_0:DMA_Controller_avalon_slave_0_chipselect -> DMA_Controller:iChipselect
	wire  [31:0] mm_interconnect_0_dma_controller_avalon_slave_0_readdata;    // DMA_Controller:oReaddata -> mm_interconnect_0:DMA_Controller_avalon_slave_0_readdata
	wire   [2:0] mm_interconnect_0_dma_controller_avalon_slave_0_address;     // mm_interconnect_0:DMA_Controller_avalon_slave_0_address -> DMA_Controller:iAddress
	wire         mm_interconnect_0_dma_controller_avalon_slave_0_read;        // mm_interconnect_0:DMA_Controller_avalon_slave_0_read -> DMA_Controller:iRead
	wire         mm_interconnect_0_dma_controller_avalon_slave_0_write;       // mm_interconnect_0:DMA_Controller_avalon_slave_0_write -> DMA_Controller:iWrite
	wire  [31:0] mm_interconnect_0_dma_controller_avalon_slave_0_writedata;   // mm_interconnect_0:DMA_Controller_avalon_slave_0_writedata -> DMA_Controller:iWritedata
	wire         irq_mapper_receiver0_irq;                                    // jtag_uart_0:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] nios2_gen2_0_irq_irq;                                        // irq_mapper:sender_irq -> nios2_gen2_0:irq
	wire         rst_controller_reset_out_reset;                              // rst_controller:reset_out -> [DMA_Controller:iReset_n, irq_mapper:reset, jtag_uart_0:rst_n, mm_interconnect_0:DMA_Controller_reset_sink_reset_bridge_in_reset_reset, nios2_gen2_0:reset_n, onchip_memory2_0:reset, rst_translator:in_reset]
	wire         rst_controller_reset_out_reset_req;                          // rst_controller:reset_req -> [nios2_gen2_0:reset_req, onchip_memory2_0:reset_req, rst_translator:reset_req_in]
	wire         nios2_gen2_0_debug_reset_request_reset;                      // nios2_gen2_0:debug_reset_request -> rst_controller:reset_in1
	wire         rst_controller_001_reset_out_reset;                          // rst_controller_001:reset_out -> [mm_interconnect_0:onchip_memory2_1_reset1_reset_bridge_in_reset_reset, onchip_memory2_1:reset]
	wire         rst_controller_001_reset_out_reset_req;                      // rst_controller_001:reset_req -> onchip_memory2_1:reset_req

	DMAController dma_controller (
		.iChipselect       (mm_interconnect_0_dma_controller_avalon_slave_0_chipselect), //  avalon_slave_0.chipselect
		.iWrite            (mm_interconnect_0_dma_controller_avalon_slave_0_write),      //                .write
		.iAddress          (mm_interconnect_0_dma_controller_avalon_slave_0_address),    //                .address
		.iWritedata        (mm_interconnect_0_dma_controller_avalon_slave_0_writedata),  //                .writedata
		.oReaddata         (mm_interconnect_0_dma_controller_avalon_slave_0_readdata),   //                .readdata
		.iRead             (mm_interconnect_0_dma_controller_avalon_slave_0_read),       //                .read
		.iClk              (clk_clk),                                                    //      clock_sink.clk
		.iReset_n          (~rst_controller_reset_out_reset),                            //      reset_sink.reset_n
		.oRM_read          (dma_controller_avalon_master_read),                          //   avalon_master.read
		.oRM_readaddress   (dma_controller_avalon_master_address),                       //                .address
		.iRM_readdatavalid (dma_controller_avalon_master_readdatavalid),                 //                .readdatavalid
		.iRM_waitrequest   (dma_controller_avalon_master_waitrequest),                   //                .waitrequest
		.iRM_readdata      (dma_controller_avalon_master_readdata),                      //                .readdata
		.iWM_waitrequest   (dma_controller_avalon_master_1_waitrequest),                 // avalon_master_1.waitrequest
		.oWM_writedata     (dma_controller_avalon_master_1_writedata),                   //                .writedata
		.oWM_writeaddress  (dma_controller_avalon_master_1_address),                     //                .address
		.oWM_write         (dma_controller_avalon_master_1_write),                       //                .write
		.oWM_byteenable    (dma_controller_avalon_master_1_byteenable)                   //                .byteenable
	);

	system_jtag_uart_0 jtag_uart_0 (
		.clk            (clk_clk),                                                     //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                             //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                     //               irq.irq
	);

	system_nios2_gen2_0 nios2_gen2_0 (
		.clk                                 (clk_clk),                                                    //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                            //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                         //                          .reset_req
		.d_address                           (nios2_gen2_0_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios2_gen2_0_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios2_gen2_0_data_master_read),                              //                          .read
		.d_readdata                          (nios2_gen2_0_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios2_gen2_0_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios2_gen2_0_data_master_write),                             //                          .write
		.d_writedata                         (nios2_gen2_0_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (nios2_gen2_0_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios2_gen2_0_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios2_gen2_0_instruction_master_read),                       //                          .read
		.i_readdata                          (nios2_gen2_0_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios2_gen2_0_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (nios2_gen2_0_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (nios2_gen2_0_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                            // custom_instruction_master.readra
	);

	system_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                          //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_0_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_0_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_0_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory2_0_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                   // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),               //       .reset_req
		.freeze     (1'b0)                                              // (terminated)
	);

	system_onchip_memory2_1 onchip_memory2_1 (
		.clk        (clk_clk),                                          //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_1_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_1_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_1_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_1_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory2_1_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_1_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory2_1_s1_byteenable), //       .byteenable
		.reset      (rst_controller_001_reset_out_reset),               // reset1.reset
		.reset_req  (rst_controller_001_reset_out_reset_req),           //       .reset_req
		.freeze     (1'b0)                                              // (terminated)
	);

	system_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                         (clk_clk),                                                     //                                       clk_0_clk.clk
		.DMA_Controller_reset_sink_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                              // DMA_Controller_reset_sink_reset_bridge_in_reset.reset
		.onchip_memory2_1_reset1_reset_bridge_in_reset_reset   (rst_controller_001_reset_out_reset),                          //   onchip_memory2_1_reset1_reset_bridge_in_reset.reset
		.DMA_Controller_avalon_master_address                  (dma_controller_avalon_master_address),                        //                    DMA_Controller_avalon_master.address
		.DMA_Controller_avalon_master_waitrequest              (dma_controller_avalon_master_waitrequest),                    //                                                .waitrequest
		.DMA_Controller_avalon_master_read                     (dma_controller_avalon_master_read),                           //                                                .read
		.DMA_Controller_avalon_master_readdata                 (dma_controller_avalon_master_readdata),                       //                                                .readdata
		.DMA_Controller_avalon_master_readdatavalid            (dma_controller_avalon_master_readdatavalid),                  //                                                .readdatavalid
		.DMA_Controller_avalon_master_1_address                (dma_controller_avalon_master_1_address),                      //                  DMA_Controller_avalon_master_1.address
		.DMA_Controller_avalon_master_1_waitrequest            (dma_controller_avalon_master_1_waitrequest),                  //                                                .waitrequest
		.DMA_Controller_avalon_master_1_byteenable             (dma_controller_avalon_master_1_byteenable),                   //                                                .byteenable
		.DMA_Controller_avalon_master_1_write                  (dma_controller_avalon_master_1_write),                        //                                                .write
		.DMA_Controller_avalon_master_1_writedata              (dma_controller_avalon_master_1_writedata),                    //                                                .writedata
		.nios2_gen2_0_data_master_address                      (nios2_gen2_0_data_master_address),                            //                        nios2_gen2_0_data_master.address
		.nios2_gen2_0_data_master_waitrequest                  (nios2_gen2_0_data_master_waitrequest),                        //                                                .waitrequest
		.nios2_gen2_0_data_master_byteenable                   (nios2_gen2_0_data_master_byteenable),                         //                                                .byteenable
		.nios2_gen2_0_data_master_read                         (nios2_gen2_0_data_master_read),                               //                                                .read
		.nios2_gen2_0_data_master_readdata                     (nios2_gen2_0_data_master_readdata),                           //                                                .readdata
		.nios2_gen2_0_data_master_write                        (nios2_gen2_0_data_master_write),                              //                                                .write
		.nios2_gen2_0_data_master_writedata                    (nios2_gen2_0_data_master_writedata),                          //                                                .writedata
		.nios2_gen2_0_data_master_debugaccess                  (nios2_gen2_0_data_master_debugaccess),                        //                                                .debugaccess
		.nios2_gen2_0_instruction_master_address               (nios2_gen2_0_instruction_master_address),                     //                 nios2_gen2_0_instruction_master.address
		.nios2_gen2_0_instruction_master_waitrequest           (nios2_gen2_0_instruction_master_waitrequest),                 //                                                .waitrequest
		.nios2_gen2_0_instruction_master_read                  (nios2_gen2_0_instruction_master_read),                        //                                                .read
		.nios2_gen2_0_instruction_master_readdata              (nios2_gen2_0_instruction_master_readdata),                    //                                                .readdata
		.DMA_Controller_avalon_slave_0_address                 (mm_interconnect_0_dma_controller_avalon_slave_0_address),     //                   DMA_Controller_avalon_slave_0.address
		.DMA_Controller_avalon_slave_0_write                   (mm_interconnect_0_dma_controller_avalon_slave_0_write),       //                                                .write
		.DMA_Controller_avalon_slave_0_read                    (mm_interconnect_0_dma_controller_avalon_slave_0_read),        //                                                .read
		.DMA_Controller_avalon_slave_0_readdata                (mm_interconnect_0_dma_controller_avalon_slave_0_readdata),    //                                                .readdata
		.DMA_Controller_avalon_slave_0_writedata               (mm_interconnect_0_dma_controller_avalon_slave_0_writedata),   //                                                .writedata
		.DMA_Controller_avalon_slave_0_chipselect              (mm_interconnect_0_dma_controller_avalon_slave_0_chipselect),  //                                                .chipselect
		.jtag_uart_0_avalon_jtag_slave_address                 (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_address),     //                   jtag_uart_0_avalon_jtag_slave.address
		.jtag_uart_0_avalon_jtag_slave_write                   (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_write),       //                                                .write
		.jtag_uart_0_avalon_jtag_slave_read                    (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_read),        //                                                .read
		.jtag_uart_0_avalon_jtag_slave_readdata                (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_readdata),    //                                                .readdata
		.jtag_uart_0_avalon_jtag_slave_writedata               (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_writedata),   //                                                .writedata
		.jtag_uart_0_avalon_jtag_slave_waitrequest             (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_waitrequest), //                                                .waitrequest
		.jtag_uart_0_avalon_jtag_slave_chipselect              (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_chipselect),  //                                                .chipselect
		.nios2_gen2_0_debug_mem_slave_address                  (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address),      //                    nios2_gen2_0_debug_mem_slave.address
		.nios2_gen2_0_debug_mem_slave_write                    (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write),        //                                                .write
		.nios2_gen2_0_debug_mem_slave_read                     (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read),         //                                                .read
		.nios2_gen2_0_debug_mem_slave_readdata                 (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata),     //                                                .readdata
		.nios2_gen2_0_debug_mem_slave_writedata                (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata),    //                                                .writedata
		.nios2_gen2_0_debug_mem_slave_byteenable               (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable),   //                                                .byteenable
		.nios2_gen2_0_debug_mem_slave_waitrequest              (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest),  //                                                .waitrequest
		.nios2_gen2_0_debug_mem_slave_debugaccess              (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess),  //                                                .debugaccess
		.onchip_memory2_0_s1_address                           (mm_interconnect_0_onchip_memory2_0_s1_address),               //                             onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_write                             (mm_interconnect_0_onchip_memory2_0_s1_write),                 //                                                .write
		.onchip_memory2_0_s1_readdata                          (mm_interconnect_0_onchip_memory2_0_s1_readdata),              //                                                .readdata
		.onchip_memory2_0_s1_writedata                         (mm_interconnect_0_onchip_memory2_0_s1_writedata),             //                                                .writedata
		.onchip_memory2_0_s1_byteenable                        (mm_interconnect_0_onchip_memory2_0_s1_byteenable),            //                                                .byteenable
		.onchip_memory2_0_s1_chipselect                        (mm_interconnect_0_onchip_memory2_0_s1_chipselect),            //                                                .chipselect
		.onchip_memory2_0_s1_clken                             (mm_interconnect_0_onchip_memory2_0_s1_clken),                 //                                                .clken
		.onchip_memory2_1_s1_address                           (mm_interconnect_0_onchip_memory2_1_s1_address),               //                             onchip_memory2_1_s1.address
		.onchip_memory2_1_s1_write                             (mm_interconnect_0_onchip_memory2_1_s1_write),                 //                                                .write
		.onchip_memory2_1_s1_readdata                          (mm_interconnect_0_onchip_memory2_1_s1_readdata),              //                                                .readdata
		.onchip_memory2_1_s1_writedata                         (mm_interconnect_0_onchip_memory2_1_s1_writedata),             //                                                .writedata
		.onchip_memory2_1_s1_byteenable                        (mm_interconnect_0_onchip_memory2_1_s1_byteenable),            //                                                .byteenable
		.onchip_memory2_1_s1_chipselect                        (mm_interconnect_0_onchip_memory2_1_s1_chipselect),            //                                                .chipselect
		.onchip_memory2_1_s1_clken                             (mm_interconnect_0_onchip_memory2_1_s1_clken)                  //                                                .clken
	);

	system_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (nios2_gen2_0_irq_irq)            //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                         // reset_in0.reset
		.reset_in1      (nios2_gen2_0_debug_reset_request_reset), // reset_in1.reset
		.clk            (clk_clk),                                //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),         // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req),     //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                         // reset_in0.reset
		.clk            (clk_clk),                                //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_001_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_in1      (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

endmodule

module CONTROL_SLAVE (
    input          iClk,
    input          iReset_n,
    input          iChipselect,
    input          iRead,
    input          iWrite,
    input  [2:0]   iAddress,
    input  [31:0]  iWritedata,
    output [31:0]  oReaddata,
    output [31:0]  RM_startaddress,
    output [31:0]  WM_startaddress,
    output [31:0]  Length,
    output         Start,
    input          WM_done
);
    // Register Definitions
    reg [31:0] readaddress_reg;
    reg [31:0] writeaddress_reg;
    reg [31:0] length_reg;
    reg        control_go;
    reg        status_busy;
    reg        status_done;

    // Output Assignments
    assign RM_startaddress = readaddress_reg;
    assign WM_startaddress = writeaddress_reg;
    assign Length          = length_reg;
    assign Start           = control_go;

    // Read Data Multiplexing
    reg [31:0] readdata_reg;
    assign oReaddata = readdata_reg;

    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            readaddress_reg  <= 32'd0;
            writeaddress_reg <= 32'd0;
            length_reg       <= 32'd0;
            control_go       <= 1'b0;
            status_busy      <= 1'b0;
            status_done      <= 1'b0;
        end else begin
            if (iChipselect && iWrite) begin
                case (iAddress)
                    3'd0: readaddress_reg  <= iWritedata;    // readaddress
                    3'd1: writeaddress_reg <= iWritedata;    // writeaddress
                    3'd2: length_reg       <= iWritedata;    // length
                    3'd4: control_go       <= iWritedata[0]; // control register (GO bit)
                    3'd5: begin                              // status register
                        if (iWritedata[0])                   // Write 1 to DONE bit to clear it
                            status_done <= 1'b0;
                    end
                endcase
            end

            // Read Data Multiplexing
            if (iChipselect && iRead) begin
                case (iAddress)
                    3'd0: readdata_reg = readaddress_reg;                  // readaddress
                    3'd1: readdata_reg = writeaddress_reg;                 // writeaddress
                    3'd2: readdata_reg = length_reg;                       // length
                    3'd4: readdata_reg = {31'd0, control_go};              // control register
                    3'd5: readdata_reg = {30'd0, status_busy, status_done}; // status register
                    default: readdata_reg = 32'd0;
                endcase
            end

            // Control Logic
            if (control_go) begin
                status_busy <= 1'b1;
                status_done <= 1'b0;
            end

            if (WM_done) begin
                status_busy <= 1'b0;
                status_done <= 1'b1;
                control_go  <= 1'b0; // Clear GO after completion
            end
        end
    end
endmodule

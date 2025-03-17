module FIFO (
    input          iClk,
    input          iReset_n,
    input          FF_writerequest,
    input  [31:0]  FF_data,
    input          FF_readrequest,
    output [31:0]  FF_q,
    output         FF_empty,
    output         FF_almostfull
);
    parameter DEPTH = 256;
    reg [31:0] mem [0:DEPTH-1];
    reg [7:0]  w_ptr;
    reg [7:0]  r_ptr;
    reg [8:0]  count;

    assign FF_empty      = (count == 0);
    assign FF_almostfull = (count >= DEPTH - 8);
    assign FF_q          = mem[r_ptr];

    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            w_ptr <= 8'd0;
            r_ptr <= 8'd0;
            count <= 9'd0;
        end else begin
            // Write operation
            if (FF_writerequest && !FF_almostfull) begin
                mem[w_ptr] <= FF_data;
                w_ptr <= w_ptr + 1;
                count <= count + 1;
            end
            // Read operation
            if (FF_readrequest && !FF_empty) begin
                r_ptr <= r_ptr + 1;
                count <= count - 1;
            end
        end
    end
endmodule

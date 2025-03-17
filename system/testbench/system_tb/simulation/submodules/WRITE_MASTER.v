module WRITE_MASTER (
    input          iClk,
    input          iReset_n,
    input          Start,
    input  [31:0]  Length,
    input  [31:0]  WM_startaddress,
    input          FF_empty,
    output reg     FF_readrequest,
    input  [31:0]  FF_q,
    output reg     oWM_write,
    output reg [31:0] oWM_writeaddress,
    output reg [31:0] oWM_writedata,
    input          iWM_waitrequest,
    output reg     WM_done
);
    // State Machine States
    parameter IDLE = 3'b000, CHECK_FIFO = 3'b001, WAIT_REQUEST = 3'b010, READ_FIFO = 3'b011, WAIT_READ = 3'b100, START_WRITE = 3'b101, UPDATE_ADDRESS = 3'b110;
    reg [2:0] current_state, next_state;

    // Internal Registers
    reg [31:0] bytes_remaining;

    // Initialization
    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            current_state     <= IDLE;
            FF_readrequest    <= 1'b0;
            oWM_write         <= 1'b0;
            oWM_writeaddress  <= 32'd0;
            oWM_writedata     <= 32'd0;
            bytes_remaining   <= 32'd0;
            WM_done           <= 1'b0;
        end else begin
            current_state <= next_state;
            FF_readrequest <= 1'b0;
            //oWM_write <= 1'b0;

            case (current_state)
                IDLE: begin
                    oWM_write        <= 1'b0;
                    FF_readrequest   <= 1'b0;
                    WM_done          <= 1'b0;
                    if (Start) begin
                        bytes_remaining  <= Length;
                        oWM_writeaddress <= WM_startaddress;
                    end
                end
                CHECK_FIFO: begin
                    if (!FF_empty) begin
                        oWM_write <= 1'b1;
                    end else begin
                        oWM_write <= 1'b0;
                    end
                end
                WAIT_REQUEST: begin
                    //
                end
                READ_FIFO: begin
                    FF_readrequest <= 1'b1;
                end
                WAIT_READ: begin
                    //
                end
                START_WRITE: begin
                    oWM_writedata <= FF_q;
                end
                UPDATE_ADDRESS: begin
                    oWM_writeaddress <= oWM_writeaddress + 4;
                    bytes_remaining  <= bytes_remaining - 4;
                    oWM_write <= 1'b0;
                end
            endcase
        end

        /* if (bytes_remaining == 0 && current_state == WAIT_WRITE) begin
            WM_done <= 1'b1;
        end */
    end

    // Next State Logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (Start && bytes_remaining > 0)
                    next_state = CHECK_FIFO;
                else
                    next_state = IDLE;
            end
            CHECK_FIFO: begin
                if (!FF_empty)
                    next_state = WAIT_REQUEST;
                else
                    next_state = CHECK_FIFO;      
            end
            WAIT_REQUEST: begin
                if (!iWM_waitrequest)
                    next_state = READ_FIFO;
                else
                    next_state = WAIT_REQUEST;
            end
            READ_FIFO: begin
                next_state = WAIT_READ;
            end
            WAIT_READ: begin
                next_state = START_WRITE;
            end
            START_WRITE: begin
                next_state = UPDATE_ADDRESS;
            end
            UPDATE_ADDRESS: begin
                if (oWM_writeaddress < WM_startaddress + Length)
                    next_state = CHECK_FIFO;
                else begin
                    next_state = IDLE;
                    WM_done <= 1'b1;
                end
            end
            //default: next_state = IDLE;
        endcase
    end
endmodule

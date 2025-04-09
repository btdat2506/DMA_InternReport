module WRITE_MASTER (
    input          iClk,
    input          iReset_n,
    // Control Inputs
    input          Start,           // From CONTROL_SLAVE
    input  [31:0]  Length,          // Total bytes to write
    input  [31:0]  WM_startaddress, // Start address for writing
    // FIFO Interface
    input          FF_empty,        // FIFO empty signal
    output reg     FF_readrequest,  // Request to read from FIFO
    input  [31:0]  FF_q,            // Data read from FIFO
    // Avalon Write Master Interface
    output reg     oWM_write,       // Avalon write signal
    output reg [31:0] oWM_writeaddress, // Avalon write address
    output reg [31:0] oWM_writedata,   // Avalon write data
    output reg [3:0]  oWM_byteenable, // <<< ADDED: Avalon byte enable
    input          iWM_waitrequest, // Avalon wait request
    // Status Output
    output reg     WM_done          // DMA Write Master Done
);
    // State Machine States
    parameter IDLE           = 3'b000;
    parameter CHECK_FIFO     = 3'b001; // Check if data is available in FIFO
    parameter READ_FIFO      = 3'b010; // Request data from FIFO
    parameter WAIT_FIFO_DATA = 3'b011; // Wait for FIFO data (usually available next cycle)
    parameter START_WRITE    = 3'b100; // Assert write, address, data, byteenable
    parameter WAIT_WRITE_ACK = 3'b101; // Wait for waitrequest=0
    parameter UPDATE_CNT     = 3'b110; // Update counters, check completion

    reg [2:0] current_state, next_state;

    // Internal Registers
    reg [31:0] bytes_remaining;
    reg [31:0] current_address;
    reg [31:0] data_to_write; // Register to hold data from FIFO

    // Initialization and State Register (WM_done logic moved here for clarity)
    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            current_state   <= IDLE;
            bytes_remaining <= 32'd0;
            current_address <= 32'd0;
            WM_done         <= 1'b0; // Initialize done to 0
        end else begin
            current_state <= next_state;
            // Update counters in UPDATE_CNT state
            if (current_state == UPDATE_CNT) begin
                current_address <= current_address + 4;
                bytes_remaining <= bytes_remaining - 4;
            end
            // Latch configuration in IDLE state when starting
            if (next_state == CHECK_FIFO && current_state == IDLE) begin
                bytes_remaining <= Length;
                current_address <= WM_startaddress;
                WM_done         <= 1'b0; // Clear done when starting a new transfer
            end
            // Set WM_done when transitioning to IDLE from UPDATE_CNT (last word processed)
            // Check bytes_remaining *before* it's decremented in UPDATE_CNT
            if (current_state == UPDATE_CNT && bytes_remaining <= 4) begin
                 WM_done <= 1'b1;
            end else if (current_state == IDLE && !Start) begin
                 // Optional: Keep WM_done high if already set and not starting again
                 // Or ensure it's low if not starting:
                 // WM_done <= 1'b0; // If done should clear once Start goes low
            end

        end
    end

    // Output Logic and Sequential State Logic
    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            FF_readrequest   <= 1'b0;
            oWM_write        <= 1'b0;
            oWM_writeaddress <= 32'd0;
            oWM_writedata    <= 32'd0;
            oWM_byteenable   <= 4'b0000; // <<< ADDED: Initialize
            data_to_write    <= 32'd0;
        end else begin
            // Default assignments - prevent latches and define default behavior
            FF_readrequest <= 1'b0;
            oWM_write      <= 1'b0;
            oWM_byteenable <= 4'b0000; // <<< ADDED: Default to inactive

            // Latch data from FIFO in WAIT_FIFO_DATA state
            if (current_state == WAIT_FIFO_DATA) begin
                 data_to_write <= FF_q;
            end

            // Drive outputs based on state
            case (current_state)
                READ_FIFO: begin
                    FF_readrequest <= 1'b1; // Request data from FIFO
                end
                START_WRITE: begin
                    // Assert write command with address, latched data, and full byte enables
                    oWM_write        <= 1'b1;
                    oWM_writeaddress <= current_address;
                    oWM_writedata    <= data_to_write;
                    oWM_byteenable   <= 4'b1111; // <<< ADDED: Assert for full word write
                end
                WAIT_WRITE_ACK: begin
                    // Keep write asserted while waiting
                    oWM_write        <= 1'b1;
                    oWM_writeaddress <= current_address; // Keep address stable
                    oWM_writedata    <= data_to_write;   // Keep data stable
                    oWM_byteenable   <= 4'b1111; // <<< ADDED: Keep asserted
                end
                // In other states (IDLE, CHECK_FIFO, WAIT_FIFO_DATA, UPDATE_CNT),
                // outputs remain at their default values (write=0, byteenable=0)
                default: begin
                    // Outputs remain at default low/inactive values
                end
            endcase
        end
    end

    // Next State Logic (Combinatorial)
    // (Keep the revised combinatorial logic from the previous answer)
    always @(*) begin
        next_state = current_state; // Default to stay in current state

        case (current_state)
            IDLE: begin
                if (Start && Length > 0) begin
                    next_state = CHECK_FIFO;
                end else begin
                    next_state = IDLE;
                end
            end
            CHECK_FIFO: begin
                if (!FF_empty) begin
                    next_state = READ_FIFO;
                end else begin
                    // Stay here if FIFO is empty but transfer not done
                    // Need to check if Start is still high or if we are mid-transfer
                    if (bytes_remaining > 0 && Start) begin // Check Start too? Or rely on CONTROL_SLAVE keeping it high?
                       next_state = CHECK_FIFO;
                    end else if (bytes_remaining == 0) begin // Transfer finished waiting for FIFO
                       next_state = IDLE; // Should have been caught by UPDATE_CNT -> IDLE path
                    end else begin // No data, not started or stopped
                       next_state = IDLE;
                    end
                end
            end
            READ_FIFO: begin
                next_state = WAIT_FIFO_DATA;
            end
            WAIT_FIFO_DATA: begin
                 next_state = START_WRITE;
            end
            START_WRITE: begin
                next_state = WAIT_WRITE_ACK;
            end
            WAIT_WRITE_ACK: begin
                if (!iWM_waitrequest) begin
                    next_state = UPDATE_CNT;
                end else begin
                    next_state = WAIT_WRITE_ACK;
                end
            end
            UPDATE_CNT: begin
                // Check if this is the last word *before* decrementing bytes_remaining
                if (bytes_remaining <= 4) begin // Assuming Length is multiple of 4
                    next_state = IDLE; // Transfer complete
                end else begin
                    next_state = CHECK_FIFO; // More data to write
                end
            end
            default: next_state = IDLE;
        endcase
    end

endmodule
`default_nettype none

module perceptron (
    input wire [7:0] current,
    input wire       clk,
    input wire       rst_n,
    output reg [1:0] classification,
);

    reg [7:0] next_state, threshold
    reg [7:0] bias
    reg reg [7:0] weights [0:6]  // Declare an array of 7 registers, each with 8 bits

    always @(posedge clk) begin
        if (rst_n) begin
            // Reset the counter and output bit
            bit_counter <= 3'b0;
            bit_out <= 1'b0;
            sum = 0

            // Initialize the weights if needed
            weights[0] = 8'b10000000;   // The representation here is with the decimal at the from .000000000 
            weights[1] = 8'b10000000;   // so b1000000 represents 0.5 in decimal
            weights[2] = 8'b10000000;
            weights[3] = 8'b10000000;
            weights[4] = 8'b10000000;
            weights[5] = 8'b10000000;
            weights[6] = 8'b10000000;
        end else begin
            // Increment the counter
            bit_counter <= bit_counter + 1'b1;
            
            // Output the current bit and update the output
            bit_out <= current[bit_counter];
            if (bit_out == 1) begin
                sum += weight[bit_counter];
            end else begin
                ...
            end
        end
    end

    // next state logic
    next_state = curren * weight + bias

    assign classification = (state >= 0)

endmodule


`default_nettype none

module perceptron (
    input wire [7:0] current,
    input wire       clk,
    input wire       rst_n,
    output reg classification
);

    // reg [7:0] next_state, threshold;
    reg [7:0] bias;
    reg [8:0] sum;
    reg [7:0] weights [0:6];  // Declare an array of 7 registers, each with 8 bits
    reg [2:0] bit_counter;
    reg [0:0] bit_out;

    always @(posedge clk) begin
        if (!rst_n) begin
            // Reset the counter and output bit
            bit_counter <= 3'b000;
            bit_out <= 1'b0;
            sum <= 9'b000000000;
            bias <= 8'b00000000;
            // Initialize the weights if needed
            weights[0] <= 8'b10000000;   // The representation here is with the decimal at the from .000000000 
            weights[1] <= 8'b10000000;   // so b1000000 represents 0.5 in decimal
            weights[2] <= 8'b10000000;
            weights[3] <= 8'b10000000;
            weights[4] <= 8'b10000000;
            weights[5] <= 8'b10000000;
            weights[6] <= 8'b10000000;
            // classification <= 0
        end else begin
            // Increment the counter
            bit_counter <= bit_counter + 1'b1;
            
            // Output the current bit and update the output
            bit_out <= current[bit_counter];

            if (bit_out == 1) begin
                sum += weights[bit_counter];

                if (sum[8] == 1) begin  // check for overflow
                    sum <= 9'b011111111;
                end

            end else begin
                sum += 0;    // The bit out is zero so 0*weight = 0 so the sum doesn't change/gets 0 added to it
            end

            if (bit_counter == 7) begin
                if (sum[7:0] + bias >= 8'b1000000) begin
                    classification <= 1;
                end else begin 
                    classification <= 0;
                end 
            end
        end
    end


endmodule


`default_nettype none

module perceptron (
    input wire [7:0] inputs1,
    input wire [7:0] inputs2,
    input wire       clk,
    input wire       rst_n,
    output reg classification
);

    // reg [7:0] next_state, threshold;
    reg [7:0] bias;
    reg [8:0] sum;
    reg [7:0] trimmed_sum;
    reg [7:0] weights [0:15];  // Declare an array of 14 registers, each with 8 bits
    reg [5:0] bit_counter;
    reg [0:0] bit_out;
    reg overflow;

    always @(posedge clk) begin
        if (!rst_n) begin
            // Reset the counter and output bit
            bit_counter <= 5'b00000;
            bit_out <= 1'b0;
            sum <= 9'b000000000;
            bias <= 8'b00000000;
            classification <= 0;
            overflow <= 0;

            // Initialize the weights
            for (int i = 0; i < 16; i = i + 1) begin    // The representation here is with the decimal at the from .000000000 
                weights[i] <= 8'b10000000;              // so b1000000 represents 0.5 in decimal
            end
        end else begin
            if (bit_counter < 16) begin
                // Reset overflow register
                overflow <= (sum > 9'b011111111);
                if (overflow == 1) begin  // check for overflow
                    sum <= 9'b011111111;
                end

                // Output the current bit and update the output
                if (bit_counter < 8) begin
                    bit_out <= inputs1[bit_counter];
                end    
                else if (bit_counter < 15) begin
                    bit_out <= inputs2[bit_counter - 8];
                end  

                if (bit_out == 1) begin
                    sum <= sum + weights[bit_counter];
                end
                
                // elseThe bit out is zero so 0*weight = 0 so the sum doesn't change/gets 0 added to it

                if (bit_counter == 15) begin
                    overflow <= (sum > 9'b011111111);
                    if (overflow == 1) begin  // check for overflow
                        sum <= 9'b011111111;
                    end
                    
                    trimmed_sum = sum[7:0];
                    if (trimmed_sum + bias > 8'b11111110) begin
                        classification <= 1;
                    end else begin 
                        classification <= 0;
                    end 
                end

                bit_counter <= bit_counter + 1'b1;
            end
        end
    end


endmodule


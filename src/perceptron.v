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
    reg [8:0] old_sum;
    reg [7:0] trimmed_sum;
    reg [7:0] weights [0:15];  // Declare an array of 14 registers, each with 8 bits
    reg [4:0] bit_counter;
    reg [0:0] bit_out;
    reg sum_check;
    reg overflow;
    reg overflow_reset;
    reg bit_check;
    reg overflow_check;

    always @(posedge clk) begin
        if (!rst_n) begin
            // Reset the counter and output bit
            bit_counter <= 5'b00000;
            bit_out <= 1'b0;
            sum <= 9'b000000000;
            old_sum <= 9'b000000000;
            bias <= 8'b00000000;
            classification <= 0;
            overflow <= 0;
            trimmed_sum <= 8'b00000000;
            sum_check <= 0;
            overflow_reset <= 0;
            bit_check <= 0;
            overflow_check <= 0;

            // Initialize the weights
            for (int i = 0; i < 16; i = i + 1) begin    // The representation here is with the decimal at the from .000000000 
                weights[i] <= 8'b10000000;              // so b1000000 represents 0.5 in decimal
            end
        end else begin

            if (bit_counter < 16) begin

                if (sum_check == 0) begin
                    overflow <= 0;
                    sum = old_sum;
                    if (bit_check == 0) begin
                        // Output the current bit and update the output
                        if (bit_counter < 8) begin
                            bit_out <= inputs1[bit_counter];
                        end    
                        else if (bit_counter < 15) begin
                            bit_out <= inputs2[bit_counter - 8];
                        end 
                        bit_check <= 1;
                    end 
                    else begin
                        if (bit_out == 1) begin
                            sum <= sum + weights[bit_counter];
                            sum_check <= 1;
                        end
                        else begin
                            bit_counter <= bit_counter + 1'b1;
                        end
                        bit_check <= 0;
                    end
                end else begin
                    old_sum = sum;
                    if (overflow_check == 0) begin
                        overflow <= (sum > 9'b011111111);
                        overflow_check <= 1;
                    end 
                    else begin
                        if (overflow == 1) begin  // check for overflow
                            overflow_reset <= 1;
                            overflow <= 0;
                        end
                        else begin
                            if (overflow_reset == 0) begin
                                sum_check <= 0;
                                overflow_check <=0;
                                overflow_reset <= 0;
                                bit_counter <= bit_counter + 1'b1;
                            end
                            else begin
                                old_sum <= 9'b011111111;
                                sum_check <= 0;
                                overflow_check <=0;
                                overflow_reset <= 0;
                                bit_counter <= bit_counter + 1'b1;
                            end 
                        end             
                    end
                end

            end

            if (bit_counter == 16) begin
                sum = old_sum;
                trimmed_sum = sum[7:0];
                if (trimmed_sum + bias > 8'b11111110) begin
                    classification <= 1;
                end else begin 
                    classification <= 0;
                end 

            end
        end
    end


endmodule


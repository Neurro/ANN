




module scalar_product(
    input clk,                    // Clock signal
    input [31:0] a1,              // First input for the first multiplier
    input [31:0] w1,              // Second input for the first multiplier
    input [31:0] b1,              // First input for the second multiplier
    input [31:0] w2,              // Second input for the second multiplier
    output reg [31:0] result      // Output result
);

    reg [63:0] product1;           // Product of a1 and b1
    reg [63:0] product2;           // Product of a2 and b2

    always @(posedge clk) begin
        product1 <= a1 * w1;        // First multiplication
        product2 <= b1 * w2;        // Second multiplication
        result <= product1[31:0] + product2[31:0];  // Adding the two products
    end

endmodule


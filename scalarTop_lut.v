
module scalarTop_lut(
    input clk,                     // Clock signal
    input [31:0] i_a1,             // First input for first multiplier
    input [31:0] i_w1,             // Second input for first multiplier
    input [31:0] i_b1,             // First input for second multiplier
    input [31:0] i_w2,             // Second input for second multiplier
    output [31:0] o_result         // Final output after LUT
);

    wire [31:0] scalar_result;

    // Defining the Scalar Product module (with two multipliers)
    scalar_product SP (
        .clk(clk),
        .a(i_a1),
        .b(i_w1),
        .c(i_b1),
        .d(i_w2),
        .result(scalar_result)
    );

    // Defining the LUT module
    lut_module LUT (
        .address(scalar_result),
        .data(o_result)
    );

endmodule

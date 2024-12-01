
module spm_ip (
    input wire clk,            // Clock input
    input wire areset,         // Asynchronous reset
    input wire [31:0] a0,      // First input to first multiplier
    input wire [31:0] b0,      // Second input to first multiplier
    input wire [31:0] a1,      // First input to second multiplier
    input wire [31:0] b1,      // Second input to second multiplier
    output wire [31:0] q       // Output of the scalar product
);

    // Instantiate the Scalar Product Module (SPM)
    spm u_SPM (
        .clk(clk),             // Connect clock
        .areset(areset),       // Connect asynchronous reset
        .a0(a0),               // Connect first input of first multiplier
        .b0(b0),               // Connect second input of first multiplier
        .a1(a1),               // Connect first input of second multiplier
        .b1(b1),               // Connect second input of second multiplier
        .q(q)                  // Connect output (result of scalar product)
    );

endmodule



module lut_module(
    input [95:0] address,           // Combined address input from the three scalar product outputs
    output reg [31:0] data          // Data output after LUT processing
);

    // Define the ROM (LUT) content
    reg [31:0] rom[0:65535];  // Example with 16-bit address space for testing

    initial begin
        // Initialize the LUT with some values (example values)
        rom[16'h0000] = 32'h00000000;  // Example: output for input address 0
        rom[16'h0001] = 32'h00000001;  // Example: output for input address 1
        // Can add more values based on the design requiremnets of the ANN and output
    end

    always @(*) begin
        data = rom[address[15:0]];  // Using lower 16 bits as the address for testing
    end

endmodule

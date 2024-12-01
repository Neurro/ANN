
`timescale 1ns / 1ps

module SPM_test_tb();

    reg clk;
	 reg areset;
    reg [31:0] i_a1_1, i_b1_1, i_w1_1, i_w2_1;
    reg [31:0] i_a1_2, i_b1_2, i_w1_2, i_w2_2;
    reg [31:0] i_a1_3, i_b1_3, i_w1_3, i_w2_3;
    wire [31:0] o_final_result;

    // Instantiate the system
    SPM_test dut (
        .clk(clk),
		  .areset(areset),
        .i_a1_1(i_a1_1),
        .i_w1_1(i_w1_1),
        .i_b1_1(i_b1_1),
        .i_w2_1(i_w2_1),
        .i_a1_2(i_a1_2),
        .i_w1_2(i_w1_2),
        .i_b1_2(i_b1_2),
        .i_w2_2(i_w2_2),
        .i_a1_3(i_a1_3),
        .i_w1_3(i_w1_3),
        .i_b1_3(i_b1_3),
        .i_w2_3(i_w2_3),
        .o_final_result(o_final_result)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units (10ns clock period)
    end

    initial begin
        // Initialize inputs
        clk = 0;
		  areset = 1;
        i_a1_1 = 32'h3F800000;    // 1.0 in IEEE 754
        i_w1_1 = 32'h40000000;    // 2.0 in IEEE 754
        i_b1_1 = 32'h40400000;    // 3.0 in IEEE 754
        i_w2_1 = 32'h40800000;    // 4.0 in IEEE 754

        i_a1_2 = 32'h3F000000;    // 0.5 in IEEE 754
        i_w1_2 = 32'h40000000;    // 2.0 in IEEE 754
        i_b1_2 = 32'h3FC00000;    // 1.5 in IEEE 754
        i_w2_2 = 32'h40400000;    // 3.0 in IEEE 754

        i_a1_3 = 32'h40800000;    // 4.0 in IEEE 754
        i_w1_3 = 32'h40A00000;    // 5.0 in IEEE 754
        i_b1_3 = 32'h40C00000;    // 6.0 in IEEE 754
        i_w2_3 = 32'h40E00000;    // 7.0 in IEEE 754
		  
		  
		  #10 areset = 0;

        // Wait for a few clock cycles to see the output
        #240; // Module requires 240ns to make a complete output
        //$display("Test Case 1 - Result: %h", o_final_result);

        // Test with different values
        i_a1_1 = 32'h3F000000;    // 0.5 in IEEE 754
        i_w1_1 = 32'h40000000;    // 2.0 in IEEE 754
        i_b1_1 = 32'h3F800000;    // 1.0 in IEEE 754
        i_w2_1 = 32'h40400000;    // 3.0 in IEEE 754

        i_a1_2 = 32'h3F800000;    // 1.0 in IEEE 754
        i_w1_2 = 32'h40400000;    // 3.0 in IEEE 754
        i_b1_2 = 32'h40000000;    // 2.0 in IEEE 754
        i_w2_2 = 32'h40800000;    // 4.0 in IEEE 754

        i_a1_3 = 32'h3F000000;    // 0.5 in IEEE 754
        i_w1_3 = 32'h40400000;    // 3.0 in IEEE 754
        i_b1_3 = 32'h3F800000;    // 1.0 in IEEE 754
        i_w2_3 = 32'h40800000;    // 4.0 in IEEE 754

        //#240;  // Another 240ns to output the next set of data
        //$display("Test Case 2 - Result: %h", o_final_result);

        // End simulation
        //$finish;
    end

endmodule


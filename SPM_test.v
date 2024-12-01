

module SPM_test(
    input clk,                     // Clock signal
	 input areset,
//    input [31:0] i_a1_1,           // Inputs for the first scalar product
//    input [31:0] i_b1_1,
//    input [31:0] i_w1_1,
//    input [31:0] i_w2_1,
//    input [31:0] i_a1_2,           // Inputs for the second scalar product
//    input [31:0] i_b1_2,
//    input [31:0] i_w1_2,
//    input [31:0] i_w2_2,
//    input [31:0] i_a1_3,           // Inputs for the third scalar product
//    input [31:0] i_b1_3,
//    input [31:0] i_w1_3,
//    input [31:0] i_w2_3,
	 input [31:0] i_value,          // Single input value to be fed to SPMs
	 input reset,                   // Reset signal for the state machine
    output [31:0] o_final_result   // Final output after the LUT
);

    
    wire [31:0] result1, result2, result3;
    wire [95:0] combined_result;
	 wire [3:0] state;            // State signal to choose active SPM input
	 wire [31:0] output_value;
	 
	 // Need to add a "State Machine" (SM) module at the start of the system design
	 // before the three top-level SPM modules, as the FPGA only has limited
	 // inputs. 
	 
	 // Instantiate the state machine
    state_machine SM (
        .clk(clk),
        .reset(reset),
        .d(i_value),    // Single input value to the state machine
        .q(output_value)        // Output from the state machine
		  
    );
	 
	  

    // First scalar product IP module (Top level ANN)
    spm_ip UUT1 (
        .clk(clk),       // Clock
        .a0(output_value),     // Input 1           
        .b0(output_value),     // Weight 1
        .a1(output_value),     // Input 2
        .b1(output_value),     // Weight 2
        .q(result1),     // Result (output)
        .areset(areset)  // Reset clock
		  
    );

    // Second scalar product IP module (Top Level ANN)
    spm_ip UUT2 (
        .clk(clk),
        .a0(output_value),
        .b0(output_value),
        .a1(output_value),
        .b1(output_value),
        .q(result2),
        .areset(areset)
	  
		 
    );

    // Third scalar product IP module (Top Level ANN)
    spm_ip UUT3 (
        .clk(clk),
        .a0(output_value),
        .b0(output_value),
        .a1(output_value),
        .b1(output_value),
        .q(result3),
        .areset(areset)
	  
		  
    );

    // Combining the outputs into a single address line for the LUT
	 // [Can be seen in the block diagram]
    assign combined_result = {result1, result2, result3};

    // Defining the LUT
    lut_module LUT (
        .address(combined_result),
        .data(o_final_result)
    );

endmodule





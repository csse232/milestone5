`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:04:47 11/08/2015
// Design Name:   SignExtender12to16
// Module Name:   /home/griseous/Documents/csse232/Milestone5/test_SE12to16.v
// Project Name:  Milestone5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtender12to16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_SE12to16;

	// Inputs
	reg [11:0] in;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtender12to16 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      in = 12'b0000_0000_0000; #10;
		in = 12'b0000_0000_0001; #10;
		in = 12'b1000_0000_0000; #10;
		in = 12'b1111_1111_1111; #10;
		in = 12'b1001_0001_0001; #10;

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:58:42 11/08/2015
// Design Name:   SignExtender6to16
// Module Name:   /home/griseous/Documents/csse232/Milestone5/test_SE6to16.v
// Project Name:  Milestone5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtender6to16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_SE6to16;

	// Inputs
	reg [5:0] in;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtender6to16 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		in = 6'b10_0001;
		#10;
		in = 6'b11_1111;
		#10;
		in = 6'b00_0001;
		#10;
		in = 0;
		#10;
		in = 6'b10_0000;
        
		// Add stimulus here

	end
      
endmodule


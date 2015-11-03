`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:49:27 10/27/2015
// Design Name:   Mux2in16b
// Module Name:   /home/griseous/Documents/csse232/milestone4/test_2Mux.v
// Project Name:  milestone4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2in16b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_2Mux;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg control;
	reg clock;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux2in16b uut (
		.in1(in1), 
		.in2(in2), 
		.control(control), 
		.clock(clock), 
		.out(out)
	);
	
	initial begin //clock
		#100;
		forever
			begin
				clock = 0;
				#10
				clock = 1'b1;
				#10;
			end
	end	
	
	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		control = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in1 = "a";
		in2 = "b";
		
		#100;
		$display("\nMux outputs:");
		$display("%b = %c", control, out);
		
		control = 'b1;
		#100;
		$display("%b = %c", control, out);

	end
      
endmodule


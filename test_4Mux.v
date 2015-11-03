`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:02 10/27/2015
// Design Name:   Mux4in16b
// Module Name:   /home/griseous/Documents/csse232/milestone4/test_4Mux.v
// Project Name:  milestone4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4in16b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_4Mux;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg [15:0] in3;
	reg [15:0] in4;
	reg [1:0] control;
	reg clock;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux4in16b uut (
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
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
		in3 = 0;
		in4 = 0;
		control = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in1 = "a";
		in2 = "b";
		in3 = "c";
		in4 = "d";
		
		#100;
		$display("\nMux outputs:");
		$display("%b = %c", control, out);
		
		control = 'b01;
		#100;
		$display("%b = %c", control, out);
		
		control = 'b10;
		#100;
		$display("%b = %c", control, out);
		
		control = 'b11;
		#100;
		$display("%b = %c", control, out);
		
		

	end
      
endmodule


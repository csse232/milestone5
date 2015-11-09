`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:17 10/26/2015
// Design Name:   ALU
// Module Name:   /home/griseous/Documents/csse232/milestone4/test_ALU.v
// Project Name:  milestone4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ALU;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg [2:0] control;
	reg clock;

	// Outputs
	wire [15:0] result;
	wire isZero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.in1(in1), 
		.in2(in2), 
		.control(control), 
		.clock(clock), 
		.result(result),
		.isZero(isZero)
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
		
		//constants
		

		// Wait 100 ns for global reset to finish
		#100;
      
		
		//And cases
		$display("\nAnd:");
		control=0;
		in1 = 16'b0000_0000_0000_0000;
		in2 = 16'b0000_0000_0000_0000;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		in1 = 16'b0000_0000_0000_0000;
		in2 = 16'b1111_1111_1111_1111;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 16'b1111_1111_1111_1111;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 16'b1010_1010_1010_1010;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		in1 = 16'b1111_1111_1111_1111;
		in2 = 16'b1010_1010_1010_1010;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 16'b0101_0101_0101_0101;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		in1 = 16'b1111_1111_1111_1111;
		in2 = 16'b1111_1111_1111_1111;
		#100;
		$display("%b & %b = %b", in1, in2, result);
		
		//Or cases
		$display("\nOr:");
		control='b1;
		in1 = 16'b0000_0000_0000_0000;
		in2 = 16'b0000_0000_0000_0000;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		in1 = 16'b0000_0000_0000_0000;
		in2 = 16'b1111_1111_1111_1111;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 16'b1111_1111_1111_1111;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 16'b1010_1010_1010_1010;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		in1 = 16'b1111_1111_1111_1111;
		in2 = 16'b1010_1010_1010_1010;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 16'b0101_0101_0101_0101;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		in1 = 16'b1111_1111_1111_1111;
		in2 = 16'b1111_1111_1111_1111;
		#100;
		$display("%b | %b = %b", in1, in2, result);
		
		$display("\nAdd:");
		//Add cases
		control = 2;
		in1 = 16'b1111_1111_1111_1111;
		in2 = 16'b0000_0000_0000_0001;
		#100;
		$display("%b + %b = %b", in1, in2, result);
		
		in1 = 1;
		in2 = 1;
		#100;
		$display("%b + %b = %b", in1, in2, result);
		
		in1 = -1;
		in2 = -1;
		#100;
		$display("%b + %b = %b", in1, in2, result);
		
		in1 = 16'b0111_1111_1111_1111;//MAX_INT
		in2 = 16'b0111_1111_1111_1111;
		#100;
		$display("%b + %b = %b", in1, in2, result);
		
		in1 = 16'b0111_1111_1111_1111;//MAX_INT
		in2 = 1;
		#100;
		$display("%b + %b = %b", in1, in2, result);
		
		in1 = 0;
		in2 = 0;
		#100;
		$display("%b + %b = %b", in1, in2, result);
		
		
		$display("\nSubtract:");
		//Sub cases
		control = 3;
		in1 = 16'b1111_1111_1111_1111;
		in2 = 16'b0000_0000_0000_0001;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		in1 = 1;
		in2 = 1;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		in1 = -1;
		in2 = -1;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		in1 = 16'b0111_1111_1111_1111;//MAX_INT
		in2 = 16'b0111_1111_1111_1111;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		in1 = 16'b0111_1111_1111_1111;//MAX_INT
		in2 = 1;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		in1 = 0;
		in2 = 0;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		in1 = 0;
		in2 = 1;
		#100;
		$display("%b - %b = %b", in1, in2, result);
		
		
		$display("\nShift left:");
		//Shift left (sl) cases
		control = 4;
		
		in1 = 1;
		in2 = 1;
		#100;
		$display("%b << %b = %b", in1, in2, result);
		
		in1 = 16'b1000_0000_0000_0000;
		in2 = 1;
		#100;
		$display("%b << %b = %b", in1, in2, result);
		
		in1 = 16'b0101_0101_0101_0101;
		in2 = 1;
		#100;
		$display("%b << %b = %b", in1, in2, result);
		
		in1 = 1;
		in2 = 15;
		#100;
		$display("%b << %b = %b", in1, in2, result);
		
		
		
		$display("\nShift right:");
		//Shift left (srl) cases
		control = 5;
		
		in1 = 16'b1000_0000_0000_0000;
		in2 = 1;
		#100;
		$display("%b >> %b = %b", in1, in2, result);
		
		in1 = 16'b0000_0000_0000_0001;
		in2 = 1;
		#100;
		$display("%b >> %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 1;
		#100;
		$display("%b >> %b = %b", in1, in2, result);
		
		in1 = 16'b1000_0000_0000_0000;
		in2 = 15;
		#100;
		$display("%b >> %b = %b", in1, in2, result);
		
		
		
		$display("\nShift right arithmetic:");
		//Shift left (sra) cases
		control = 'b110;
		
		in1 = 16'b1000_0000_0000_0000;
		in2 = 16'b0000000000000001;
		#100;
		$display("%b >>> %b = %b", in1, in2, result);
		
		in1 = 16'b0000_0000_0000_0001;
		in2 = 1;
		#100;
		$display("%b >>> %b = %b", in1, in2, result);
		
		in1 = 16'b1010_1010_1010_1010;
		in2 = 1;
		#100;
		$display("%b >>> %b = %b", in1, in2, result);
		
		in1 = 16'b1000_0000_0000_0000;
		in2 = 15;
		#100;
		$display("%b >>> %b = %b", in1, in2, result);
		
		
		$display("\nSet less than:");
		//Set less than (slt) cases
		control = 'b111;
		
		in1 = 16'b0000_0000_0000_0000;
		in2 = 16'b0000_0000_0000_0000;
		#100;
		$display("%b slt %b = %b", in1, in2, result);
		
		in1 = 16'b0000_0000_0000_0000;
		in2 = 16'b0000_0000_0000_0001;
		#100;
		$display("%b slt %b = %b", in1, in2, result);
		
		in1 = 16'b0000_0000_0000_0001;
		in2 = 16'b0000_0000_0000_0000;
		#100;
		$display("%b slt %b = %b", in1, in2, result);
		
		in1 = 1;
		in2 = -1;
		#100;
		$display("%b slt %b = %b", in1, in2, result);
		
	end
      
endmodule


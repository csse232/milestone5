`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:04:56 10/27/2015
// Design Name:   PC
// Module Name:   /home/griseous/Documents/csse232/milestone4/test_PC.v
// Project Name:  milestone4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PC;

	// Inputs
	reg [15:0] in;
	reg clock;
	reg PCWrite;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.in(in), 
		.out(out), 
		.clock(clock), 
		.PCWrite(PCWrite)
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
		in = 0;
		clock = 0;
		PCWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display("\nPC = %b", out);
		in = out + 4;
		PCWrite = 1;
		#100;
		$display("PCWrite: %s\nin = %b \nPC = %b",(PCWrite) ? "true" : "false", in, out);
		
		$display("\nPC = %b", out);
		in = out + 4;
		PCWrite = 0;
		#100;
		$display("PCWrite: %s\nin = %b \nPC = %b",(PCWrite) ? "true" : "false", in, out);
		
		
	end
      
endmodule


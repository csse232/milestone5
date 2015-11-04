`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:13:55 11/03/2015
// Design Name:   ALU_Control
// Module Name:   /home/griseous/Documents/csse232/Milestone5/test_ALUControl.v
// Project Name:  Milestone5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ALUControl;

	// Inputs
	reg [2:0] ALUOp;
	reg [2:0] funk;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.ALUOp(ALUOp), 
		.funk(funk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 0;
		funk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$display("ALUOp 0:");
		ALUOp = 0; funk = 3'b001; #10;
		ALUOp = 0; funk = 3'b010; #10;
		ALUOp = 0; funk = 3'b011; #10;
		ALUOp = 0; funk = 3'b100; #10;
		ALUOp = 0; funk = 3'b101; #10;
		ALUOp = 0; funk = 3'b110; #10;
		ALUOp = 0; funk = 3'b111; #10;
		
		$display("\nShifts (1):");
		ALUOp = 1; funk = 3'b100; #10;
		funk = 3'b101; #10;
		funk = 3'b110; #10;
		
		
		funk = 3'b111;
		ALUOp = 2; #10;
		ALUOp = 3; #10;
		ALUOp = 4; #10;
		ALUOp = 5; #10;
		ALUOp = 6; #10;
		ALUOp = 7; #10;
		
	end
      
endmodule


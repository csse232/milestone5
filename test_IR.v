`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:25:56 10/27/2015
// Design Name:   InstructionRegister
// Module Name:   /home/griseous/Documents/csse232/milestone4/test_IR.v
// Project Name:  milestone4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_IR;

	// Inputs
	reg [15:0] IR_in;
	reg clock;
	reg IRWrite;

	// Outputs
	wire [3:0] op;
	wire [3:0] funk;
	wire [2:0] rd;
	wire [2:0] rs;
	wire [2:0] rt;
	wire [5:0] iImm;
	wire [11:0] jImm;

	// Instantiate the Unit Under Test (UUT)
	InstructionRegister uut (
		.IR_in(IR_in), 
		.clock(clock), 
		.IRWrite(IRWrite), 
		.op(op), 
		.funk(funk), 
		.rd(rd), 
		.rs(rs), 
		.rt(rt), 
		.iImm(iImm), 
		.jImm(jImm)
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
		IR_in = 0;
		clock = 0;
		IRWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		IRWrite = 1;
		
		IR_in = 16'b1111_000_111_000_111;

	end
      
endmodule


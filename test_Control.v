`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:05 11/03/2015
// Design Name:   MIPS_control_unit
// Module Name:   /home/griseous/Documents/csse232/Milestone5/test_Control.v
// Project Name:  Milestone5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS_control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Control;

	// Inputs
	reg [3:0] Opcode;
	reg CLK;
	reg Reset;
	reg [2:0] funk;

	// Outputs
	wire [1:0] ALUOp;
	wire SrcA;
	wire [1:0] SrcB;
	wire [1:0] MemtoReg;
	wire RegDest;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire IRWrite;
	wire PCWrite;
	wire [1:0] PCSrc;
	wire [4:0] current_state;
	wire [4:0] next_state;
	wire MemSrc;
	wire OutputWrite;
	wire BranchCond;

	// Instantiate the Unit Under Test (UUT)
	MIPS_control_unit uut (
		.ALUOp(ALUOp), 
		.SrcA(SrcA), 
		.SrcB(SrcB), 
		.MemtoReg(MemtoReg), 
		.RegDest(RegDest), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.IRWrite(IRWrite), 
		.PCWrite(PCWrite), 
		.PCSrc(PCSrc), 
		.Opcode(Opcode), 
		.current_state(current_state), 
		.next_state(next_state), 
		.CLK(CLK), 
		.Reset(Reset), 
		.funk(funk), 
		.MemSrc(MemSrc), 
		.OutputWrite(OutputWrite), 
		.BranchCond(BranchCond)
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
		Opcode = 0;
		CLK = 0;
		Reset = 0;
		funk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


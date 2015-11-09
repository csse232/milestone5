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
		//.current_state(current_state), 
		//.next_state(next_state), 
		.CLK(CLK), 
		//.Reset(Reset), 
		.funk(funk), 
		.MemSrc(MemSrc), 
		.OutputWrite(OutputWrite), 
		.BranchCond(BranchCond)
	);
	
	initial begin //clock
		#100;
		forever
			begin
				CLK = 0;
				#10
				CLK = 1'b1;
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
      
		
		
		Opcode = 0; funk = 0; //generic R-Type
		$display("\n\nTESTING R-TYPES\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b0001; //imm
		$display("\n\nTESTING IMMEDIATES\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b0010; //lw
		$display("\n\nTESTING LW\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b0011; //sw
		$display("\n\nTESTING SW\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b1001; //j
		$display("\n\nTESTING JUMP\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b1010; //jal
		$display("\n\nTESTING JAL\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b1011; //jr
		$display("\n\nTESTING JR\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b0111; //beq
		$display("\n\nTESTING BEQ\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b1000; //bne
		$display("\n\nTESTING BNE\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b1100; funk = 3'b000; //in
		$display("\n\nTESTING IN\n\n"); Reset=1; #10; Reset=0; #100;
		
		Opcode = 4'b1100; funk = 3'b001; //out
		$display("\n\nTESTING OUT\n\n"); Reset=1; #10; Reset=0; #100;
	end
      
endmodule


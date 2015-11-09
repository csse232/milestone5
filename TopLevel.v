`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:42 11/08/2015 
// Design Name: 
// Module Name:    TopLevel 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TopLevel(
    input clock,
	 input [15:0] in,
	 output [15:0] out
	 );
	
	
	wire [15:0] PCin, PCout, WriteData, MemOut, MemIn, WriteFile, readData1, readData2,
		ALUa, ALUb, ALUOutput, AOutput, BOutput, ALUOutOutput, MemoryRegOut, IExtendedOut, JExtendedOut;
	
	wire [11:0] jImm;
	wire [5:0] iImm;
	wire [3:0] op;
	wire [2:0] rd, rs, rt, funk, WriteReg, ALUControl, ALUOp;
	wire [1:0] MemToReg, RegDest, SrcB, PCSrc;
	wire PCWrite, branchCond, isZero, MemWrite, MemRead, IRWrite, RegWrite, OutputWrite, MemSrc, SrcA;
	
	
	
	PC PC(PCin, PCout, clock, PCWrite, branchCond, isZero);
	Memory Memory(clock, MemWrite, MemRead, WriteData, MemOut, MemIn);
	InstructionRegister IR(MemOut, clock, IRWrite, op, rd, rs, rt, funk, iImm, jImm);
	RegisterFile RegisterFile(WriteReg, rs, rt, WriteFile, clock, RegWrite, readData1, readData2);
	ALU ALU(ALUa, ALUb, ALUControl, clock, ALUOutput, isZero);
	
	//Registers
	DataReg16b A(readData1, clock, AOutput);
	DataReg16b B(readData2, clock, BOutput);
	DataReg16b ALUOut(ALUOutput, clock, ALUOutOutput);
	DataReg16b MemoryReg(MemOut, clock, MemoryRegOut);
	OutputRegister OutputReg(readData1, clock, out, OutputWrite);
	
	//Muxxii
	Mux2in16b MemoryMux(PCout, ALUOutOutput, MemSrc, clock, MemIn);
	Mux3in16b WriteRegDataMux(MemoryRegOut, ALUOutOutput, in, MemToReg, clock, WriteFile);
	Mux3in3b  WriteRegSourceMux(rt, rd, 3'b011, RegDest, clock, WriteReg);
	Mux2in16b ALUSrcAMux(PCout, AOutput, SrcA, clock, ALUa);
	Mux3in16b ALUSrcBMux(BOutput, 1, IExtendedOut, SrcB, clock, ALUb);
	Mux3in16b PCSrcMux(ALUOutput, JExtendedOut, ALUOutOutput, PCSrc, clock, PCin);
	
	//Extenders
	SignExtender6to16  ITypeSE(iImm, IExtendedOut);
	SignExtender12to16 JTypeSE(jImm, JExtendedOut);
	
	//Control Units
	MIPS_control_unit Control(ALUOp, SrcA, SrcB, MemToReg, RegDest, RegWrite, MemRead, MemWrite, 
		IRWrite, PCWrite, PCSrc, op, clock, funk, MemSrc, OutputWrite, branchCond);
	ALU_Control ALUControlUnit(ALUOp, funk, ALUControl);
	

endmodule 
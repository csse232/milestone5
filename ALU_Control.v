`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:41 11/03/2015 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(
    input [2:0] ALUOp,
    input [2:0] funk,
    output reg [2:0] out
    );
	 
	 parameter aluAnd = 0;
	 parameter aluOr = 1;
	 parameter add = 2;
	 parameter sub = 3;
	 parameter sl = 4;
	 parameter srl = 5;
	 parameter sra = 6;
	 parameter slt = 7;
	 
	 always @(ALUOp or funk)
	 begin
		case(ALUOp)
			0://R-Type
			begin
				case(funk)
					0://add
					begin
						out = add;
						$display("add");
					end
					3'b001://sub
					begin
						out = sub;
						$display("sub");
					end
					3'b010://or
					begin
						out = aluOr;
						$display("or");
					end
					3'b011://and
					begin
						out = aluAnd;
						$display("and");
					end
					3'b100://sll
					begin
						out = sl;
						$display("sl");
					end
					3'b101://srl
					begin
						out = srl;
						$display("srl");
					end
					3'b110://sra
					begin
						out = sra;
						$display("sra");
					end
					3'b111://slt
					begin
						out = slt;
						$display("slt");
					end
				endcase
			end
		3'b001:
			begin
				case(funk)
					3'b100:
						begin
							out = sl;
							$display("sl");
						end
					3'b101:
						begin
							out = srl;
							$display("srl");
						end
					3'b110:
						begin
							out = sra;
							$display("sra");
						end
				endcase
			end
		2: out = add;
		3: out = sub;
		4: out = sl;
		5: out = srl;
		6: out = sra;
		7: out = slt;
		endcase
	 end


endmodule

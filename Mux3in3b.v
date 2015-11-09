`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:07 11/08/2015 
// Design Name: 
// Module Name:    Mux3in3b 
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
module Mux3in3b(
	input [2:0] in1,
    input [2:0] in2,
	 input [2:0] in3,
    input [1:0] control,
    input clock,
    output reg [2:0] out
    );
always @ (posedge clock)

begin
	case(control)
		0:out = in1;
		1:out = in2;
		2:out = in3;
	endcase
end

endmodule
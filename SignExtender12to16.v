`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:21 11/08/2015 
// Design Name: 
// Module Name:    SignExtender12to16 
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
module SignExtender12to16(
		input [11:0] in,
		output reg [15:0] out
    );

always @ (in)
begin
	out = $signed(in);
end

endmodule

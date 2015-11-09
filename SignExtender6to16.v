`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:15 11/08/2015 
// Design Name: 
// Module Name:    SignExtender6to16 
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
module SignExtender6to16(
		input [5:0] in,
		output reg [15:0] out
    );

always @ (in)
begin
	out = $signed(in);
end

endmodule

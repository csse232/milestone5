`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:50:40 10/21/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [15:0] in1,
    input [15:0] in2,
    input [2:0] control,
    input clock,
    output reg [15:0]result
    );

always @ (posedge clock)
begin
	case(control)
	/*and*/0: result = in1 & in2;
	/*or*/1: result = in1 | in2;
	/*add*/2: result = in1 + in2;
	/*sub*/3: result = in1 - in2;
	/*sl*/4: result = in1 << in2;
	/*srl*/5: result = in1 >> in2;
	/*sra*/6: result = $signed(in1) >>> in2;
	/*slt*/7: result = ($signed(in1 - in2) < 0) ? 1 : 0;
	endcase
end

endmodule

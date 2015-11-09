`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:32:03 10/21/2015 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input [2:0] writeReg,
    input [2:0] readReg1,
    input [2:0] readReg2,
    input [15:0] writeFile,
    input clock,
    input regWrite,
    output reg [15:0] readData1,
    output reg [15:0] readData2
    );
	 
reg [15:0] register [0:7];

initial readData1 = 0;
initial readData2 = 0;
initial register[0] = 0;
initial register[1] = 0;
initial register[2] = 256;//stack pointer
initial register[3] = 0;
initial register[4] = 0;
initial register[5] = 0;
initial register[6] = 0;
initial register[7] = 0;


always @ (posedge clock)
begin
  readData1 = register[readReg1];
  readData2 = register[readReg2];
  if (regWrite) begin
    register[writeReg] = writeFile;
  end
end
endmodule

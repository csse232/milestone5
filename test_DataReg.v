`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:20:47 10/27/2015
// Design Name:   DataReg16b
// Module Name:   /home/griseous/Documents/csse232/milestone4/test_DataReg.v
// Project Name:  milestone4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataReg16b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_DataReg;

	// Inputs
	reg [15:0] data_in;
	reg clock;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	DataReg16b uut (
		.data_in(data_in), 
		.clock(clock), 
		.data_out(data_out)
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
		data_in = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		#100;
		$display("\nin: %b\nout: %b",data_in, data_out);
		
		data_in = 27;
		#100;
		$display("\nin: %b\nout: %b",data_in, data_out);
		
		data_in = -1;
		#100;
		$display("\nin: %b\nout: %b",data_in, data_out);
		

	end
      
endmodule


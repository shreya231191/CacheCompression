`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:36 11/25/2018
// Design Name:   DecompressorUnit
// Module Name:   C:/Users/Hp/Documents/Xilinx/BDI/DecompUnit_TB.v
// Project Name:  BDI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DecompressorUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DecompUnit_TB;

	// Inputs
	reg clk;

	// Outputs
	wire [255:0] DecompCache;

	// Instantiate the Unit Under Test (UUT)
	DecompressorUnit uut (
		.clk(clk), 
		.DecompCache(DecompCache)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
	end
	
 always
#5 clk = ~clk;
     
endmodule


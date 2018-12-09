`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:51:03 09/26/2018
// Design Name:   CompressorUnit
// Module Name:   C:/Users/Hp/Documents/Xilinx/BDI/CompUnit_TB.v
// Project Name:  BDI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CompressorUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CompUnit_TB;

	// Inputs
	reg clk;

	// Outputs
	wire [255:0] CompCache;
	

	// Instantiate the Unit Under Test (UUT)
	CompressorUnit uut (
		.clk(clk), 
		//.UncompCache(UncompCache), 
		.CompCache(CompCache)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
	end
    
always
#5 clk = ~clk;	 
endmodule


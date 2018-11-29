`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:11:40 11/26/2018
// Design Name:   TraceFormat
// Module Name:   C:/Users/Hp/Documents/Xilinx/BDI/TraceFormat_TB.v
// Project Name:  BDI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TraceFormat
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TraceFormat_TB;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] cachelines;

	// Instantiate the Unit Under Test (UUT)
	TraceFormat uut (
		.clk(clk), 
		.cachelines(cachelines)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
	end
 always
#5 clk = ~clk;	
     
endmodule


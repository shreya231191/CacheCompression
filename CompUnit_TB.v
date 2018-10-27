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
	reg [255:0] UncompCache;

	// Outputs
	wire [255:0] CompCache,DecompCache;
	

	// Instantiate the Unit Under Test (UUT)
	CompressorUnit uut (
		.clk(clk), 
		.UncompCache(UncompCache), 
		.CompCache(CompCache),
		.DecompCache(DecompCache)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		UncompCache = {64'h0000000000000066,64'h0000000000000044,64'h0000000000000022,64'h00000000000000FF};
		#50 UncompCache = {64'h0000000000005566,64'h0000000000003344,64'h0000000000001122,64'h0000000000000000};
		#50 UncompCache = {64'h0000000011225566,64'h0000000011223344,64'h0000000011221122,64'h0000000000000000};
		#50 UncompCache = {32'h00000088,32'h00000077,32'h00000066,32'h00000055,32'h00000044,32'h00000033,32'h00000022,32'h00000000};
		#50 UncompCache = {32'h00007788,32'h00006677,32'h00005566,32'h00004455,32'h00003344,32'h00002233,32'h00001122,32'h00000000};
		#50 UncompCache = {16'h0085,16'h0080,16'h0075,16'h0070,16'h0065,16'h0060,16'h0055,16'h0050,16'h0040,16'h0035,16'h0030,16'h0025,16'h0020,16'h0015,16'h0010,16'h0000};
	end
    
always
#5 clk = ~clk;	 
endmodule


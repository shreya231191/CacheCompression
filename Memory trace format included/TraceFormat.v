`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:56 11/26/2018 
// Design Name: 
// Module Name:    TraceFormat 
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
module TraceFormat(clk,cachelines);
input clk;
output reg [31:0]cachelines;

parameter SIZE = 240;
reg [31:0] trace[0:(SIZE-1)];
reg [255:0] trace32;
integer i=0;
integer tracefile,outfile;


initial
begin
$readmemh("trace.txt",trace);
end


always @ (posedge clk)
begin
outfile = $fopen("uncompdata.txt");
$fdisplay(outfile,"\n");

for (i=0; i < SIZE+1; i=i+1)
begin

if(i==0)
begin
trace32 = trace[i];
$display("%d:Trace32= %h",i,trace32);
end

else if (i % 8 == 0)
begin
$fdisplay(outfile,"%h",trace32);
$display("%d:Trace32= %h",i,trace32);
trace32 = {96'd0,trace[i]};
end

else
begin
trace32 = trace32 <<32;
trace32 = {96'd0,trace[i]}|trace32;
$display("%d:Trace32= %h",i,trace32);
end

end //for
end //always
endmodule

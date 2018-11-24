`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:26:09 11/15/2018 
// Design Name: 
// Module Name:    DecompressorUnit 
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
module DecompressorUnit(clk,flag8,flag4,flag2,CoN,CompCache,DecompCache);
input clk;
input [0:2]flag8;
input [0:6]flag4;
input [0:14]flag2;
input [0:5]CoN;
input[255:0]CompCache;
output reg[255:0]DecompCache;

parameter SIZE = 7;
integer decompfile;
integer i=0; //file pointer 
//reg [255:0] compdata[0:(SIZE-1)];

reg [63:0]Base8;
reg [31:0]Base4;
reg [15:0]Base2;

/*initial 
begin 
$readmemh("compdata.txt", compdata);
end*/

always @ (posedge clk)
begin
decompfile = $fopen("decompdata.txt");
//$fdisplay(decompfile,"************************Decompressed Data*************************");

for (i=1; i < SIZE; i=i+1)
begin

/*
CompCache = compdata[i];
$display("%d:%h",i,compdata[i]);*/

//BASE 8 DEL 1 BYTE
if(CoN[0]==1)
begin
DecompCache[63:0] = CompCache[63:0]; //Base8
Base8 = CompCache[63:0];

if (flag8[0] ==0)
DecompCache[127:64] = Base8 - CompCache[79:72];
else 
DecompCache[127:64] = CompCache[79:72]- Base8 ;

if (flag8[1] ==0)
DecompCache[191:128] = Base8 - CompCache[87:80];
else 
DecompCache[191:128] = CompCache[87:80]- Base8 ;

if (flag8[2] ==0)
DecompCache[255:192] = Base8 - CompCache[95:88];
else 
DecompCache[255:192] = CompCache[95:88]- Base8 ;

end

//BASE 8 DEL 2 BYTES
else if(CoN[1]==1)
begin
DecompCache[63:0] = CompCache[63:0]; //Base8
Base8 = CompCache[63:0];

if (flag8[0] ==0)
DecompCache[127:64] = Base8 - CompCache[95:80];
else 
DecompCache[127:64] = CompCache[95:80]- Base8 ;

if (flag8[1] ==0)
DecompCache[191:128] = Base8 - CompCache[111:96];
else 
DecompCache[191:128] = CompCache[111:96]- Base8 ;

if (flag8[2] ==0)
DecompCache[255:192] = Base8 - CompCache[127:112];
else 
DecompCache[255:192] = CompCache[127:112]- Base8 ;

end

//BASE 8 DEL 4 BYTES
else if(CoN[2]==1)
begin
DecompCache[63:0] = CompCache[63:0]; //Base8
Base8 = CompCache[63:0];

if (flag8[0] ==0)
DecompCache[127:64] = Base8 - CompCache[127:96];
else 
DecompCache[127:64] = CompCache[127:96]- Base8 ;

if (flag8[1] ==0)
DecompCache[191:128] = Base8 - CompCache[159:128];
else 
DecompCache[191:128] = CompCache[159:128]- Base8 ;

if (flag8[2] ==0)
DecompCache[255:192] = Base8 - CompCache[191:160];
else 
DecompCache[255:192] = CompCache[191:160]- Base8 ;
end

//BASE 4 DEL 1 BYTE
else if(CoN[3]==1)
begin
//CompCache = CCL4; //96 BITS
DecompCache[31:0] = CompCache[31:0]; //Base4
Base4 = CompCache[31:0]; 

if (flag4[0] == 0)
DecompCache[63:32] = Base4 - CompCache[47:40];
else 
DecompCache[63:32] = CompCache[47:40]- Base4 ;

if (flag4[1] == 0)
DecompCache[95:64] = Base4 - CompCache[55:48];
else 
DecompCache[95:64] = CompCache[55:48]- Base4 ;

if (flag4[2] == 0)
DecompCache[127:96] = Base4 - CompCache[63:56];
else 
DecompCache[127:96] = CompCache[63:56]- Base4 ;

if (flag4[3] == 0)
DecompCache[159:128] = Base4 - CompCache[71:64];
else 
DecompCache[159:128] = CompCache[71:64]- Base4 ;

if (flag4[4] == 0)
DecompCache[191:160] = Base4 - CompCache[79:72];
else 
DecompCache[191:160] = CompCache[79:72]- Base4 ;

if (flag4[5] == 0)
DecompCache[223:192] = Base4 - CompCache[87:80];
else 
DecompCache[223:192] = CompCache[87:80]- Base4 ;

if (flag4[6] == 0)
DecompCache[255:224] = Base4 - CompCache[95:88];
else 
DecompCache[255:224] = CompCache[95:88]- Base4 ;
end

//BASE 4 DEL 2 BYTES
else if(CoN[4]==1)
begin
//CompCache = CCL5; //160 BITS
DecompCache[31:0] = CompCache[31:0]; //Base4
Base4 = CompCache[31:0]; 

if (flag4[0] == 0)
DecompCache[63:32] = Base4 - CompCache[63:48];
else 
DecompCache[63:32] = CompCache[63:48]- Base4 ;

if (flag4[1] == 0)
DecompCache[95:64] = Base4 - CompCache[79:64];
else 
DecompCache[95:64] = CompCache[79:64]- Base4 ;

if (flag4[2] == 0)
DecompCache[127:96] = Base4 - CompCache[95:80];
else 
DecompCache[127:96] = CompCache[95:80]- Base4 ;

if (flag4[3] == 0)
DecompCache[159:128] = Base4 - CompCache[111:96];
else 
DecompCache[159:128] = CompCache[111:96]- Base4 ;

if (flag4[4] == 0)
DecompCache[191:160] = Base4 - CompCache[127:112];
else 
DecompCache[191:160] = CompCache[127:112]- Base4 ;

if (flag4[5] == 0)
DecompCache[223:192] = Base4 - CompCache[143:128];
else 
DecompCache[223:192] = CompCache[143:128]- Base4 ;

if (flag4[6] == 0)
DecompCache[255:224] = Base4 - CompCache[159:144];
else 
DecompCache[255:224] = CompCache[159:144]- Base4 ;
end


//BASE 2 DEL 1 BYTE
else if(CoN[5]==1)
begin
//CompCache = CCL6; //144 BITS
DecompCache[15:0] = CompCache[15:0]; //Base2
Base2  = CompCache[15:0];

if (flag2[0] == 0)
DecompCache[31:16] = Base2 - CompCache[31:24];
else 
DecompCache[31:16] = CompCache[31:24]- Base2 ;

if (flag2[1] == 0)
DecompCache[47:32] = Base2 - CompCache[39:32];
else 
DecompCache[47:32] = CompCache[39:32]- Base2 ;

if (flag2[2] == 0)
DecompCache[63:48] = Base2 - CompCache[47:40];
else 
DecompCache[63:48] = CompCache[47:40]- Base2 ;

if (flag2[3] == 0)
DecompCache[79:64] = Base2 - CompCache[55:48];
else 
DecompCache[79:64] = CompCache[55:48]- Base2 ;

if (flag2[4] == 0)
DecompCache[95:80] = Base2 - CompCache[63:56];
else 
DecompCache[95:80] = CompCache[63:56]- Base2 ;

if (flag2[5] == 0)
DecompCache[111:96] = Base2 - CompCache[71:64];
else 
DecompCache[111:96] = CompCache[71:64]- Base2 ;

if (flag2[6] == 0)
DecompCache[127:112] = Base2 - CompCache[79:72];
else 
DecompCache[127:112] = CompCache[79:72]- Base2 ;

if (flag2[7] == 0)
DecompCache[143:128] = Base2 - CompCache[87:80];
else 
DecompCache[143:128] = CompCache[87:80]- Base2 ;

if (flag2[8] == 0)
DecompCache[159:144] = Base2 - CompCache[95:88];
else 
DecompCache[159:144] = CompCache[95:88]- Base2 ;

if (flag2[9] == 0)
DecompCache[175:160] = Base2 - CompCache[103:96];
else 
DecompCache[175:160] = CompCache[103:96]- Base2 ;

if (flag2[10] == 0)
DecompCache[191:176] = Base2 - CompCache[111:104];
else 
DecompCache[191:176] = CompCache[111:104]- Base2 ;

if (flag2[11] == 0)
DecompCache[207:192] = Base2 - CompCache[119:112];
else 
DecompCache[207:192] = CompCache[119:112]- Base2 ;

if (flag2[12] == 0)
DecompCache[223:208] = Base2 - CompCache[127:120];
else 
DecompCache[223:208] = CompCache[127:120]- Base2 ;

if (flag2[13] == 0)
DecompCache[239:224] = Base2 - CompCache[135:128];
else 
DecompCache[239:224] = CompCache[135:128]- Base2 ;

if (flag2[14] == 0)
DecompCache[255:240] = Base2 - CompCache[143:136];
else 
DecompCache[255:240] = CompCache[143:136]- Base2 ;

end

else  
DecompCache = CompCache;
$display("%02h",DecompCache);
$fdisplay(decompfile,"%02h",DecompCache);

end //for


end //always

endmodule

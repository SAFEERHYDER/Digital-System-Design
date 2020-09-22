`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:42:50 PM
// Design Name: 
// Module Name: Full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_adder(Sum,Carry,A,B,Cin);
output Sum,Carry;
input A,B,Cin;
wire s1, s2, s3; // wire initialisation is optional

xor xor1(s1,A,B);
and and1(s2,A,B);
xor xor2(Sum,s1,Cin);
and and2(s3,s1,Cin);
or or1(Carry,s2,s3);

endmodule

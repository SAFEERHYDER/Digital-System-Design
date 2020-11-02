`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 02:43:13 PM
// Design Name: 
// Module Name: Sixteen_Bit_Adder
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


module Sixteen_Bit_Adder(Sum, Carry, A, B, Cin);
input [15:0] A, B;
input Cin;
output [15:0] Sum;
output Carry;

// logic
Four_bit_Adder Fourbit1(.Sum(Sum[3:0]), .Carry(c1), .A(A[3:0]), .B(B[3:0]), .Cin(Cin));
Four_bit_Adder Fourbit2(.Sum(Sum[7:4]), .Carry(c2), .A(A[7:4]), .B(B[7:4]), .Cin(c1));
Four_bit_Adder Fourbit3(.Sum(Sum[11:8]), .Carry(c3), .A(A[11:8]), .B(B[11:8]), .Cin(c2));
Four_bit_Adder Fourbit4(.Sum(Sum[15:12]), .Carry(Carry), .A(A[15:12]), .B(B[15:12]), .Cin(c3));



endmodule

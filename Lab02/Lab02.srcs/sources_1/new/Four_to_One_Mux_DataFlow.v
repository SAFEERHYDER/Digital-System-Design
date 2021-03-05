`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:16:17 PM
// Design Name: 
// Module Name: Four_to_One_Mux_DataFlow
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
// This example demsonstrates usage of bit-wise operators

module Four_to_One_Mux_DataFlow(A, B, C, D, a, b, Q);
input A, B, C, D, a, b;
output Q;


// logic equation
assign P1 = ~a & ~b & A;   // bit-wise operators
assign P2 =  a & ~b & B;   // bit-wise operators
assign P3 = ~a &  b & C;   // bit-wise operators
assign P4 =  a &  b & D;   // bit-wise operators
assign Q = P1 | P2 | P3 | P4;


endmodule

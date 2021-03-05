`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 04:41:31 PM
// Design Name: 
// Module Name: Reduction_operator
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


module Reduction_operator(OutAnd, OutOr, OutXor, In);
input [7:0] In;
output OutAnd, OutOr, OutXor;

// logic
assign OutAnd = & 8'b1111_1110;  // reduction AND = Zero
assign OutOr =  | 8'b1111_1010;  // reduction OR = One 
assign OutXor = ^ 8'b1010_1010;  // reduction XOR = One



endmodule

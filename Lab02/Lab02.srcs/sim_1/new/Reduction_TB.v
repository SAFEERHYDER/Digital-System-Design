`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 04:47:57 PM
// Design Name: 
// Module Name: Reduction_TB
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


module Reduction_TB();
wire OutAnd, OutOr, OutXor;


// logic
assign OutAnd = & 8'b1111_1110;  // reduction AND = Zero
assign OutOr =  | 8'b1111_1010;  // reduction OR = One 
assign OutXor = ^ 8'b1010_1010;  // reduction XOR = One


endmodule

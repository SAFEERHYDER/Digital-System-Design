`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 02:30:29 PM
// Design Name: 
// Module Name: Comparator_DataFlow
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
// This design demonstrates relational and equality operators

module Comparator_DataFlow(A_lt_B, A_gt_B, A_eq_B, A, B);
input [63:0] A, B;
output A_lt_B, A_gt_B, A_eq_B;

// logic
assign A_lt_B = A < B;  // less than operator
assign A_gt_B = A > B;  // greater than operator
assign A_eq_B = A == B; // equal to operator 

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 02:21:05 PM
// Design Name: 
// Module Name: Inverter
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


module Inverter(A, A_not);

// ports dimensions, size
input  A; 
output A_not; 

// logic
not not1(A_not, A);

endmodule

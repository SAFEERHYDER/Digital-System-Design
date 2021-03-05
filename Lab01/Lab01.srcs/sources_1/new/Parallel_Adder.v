`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 05:58:31 PM
// Design Name: 
// Module Name: Parallel_Adder
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


module Parallel_Adder(sum, c_out, a, b);
input [3:0] a, b;
output [3:0] sum;
output c_out;

// wires 
wire c1, c2, c3;

// logic description 
Half_Adder HA0(sum[0], c1, a[0], b[0]); // HA instantiation
Full_Adder FA0(sum[1], c2, a[1], b[1], c1); // FA instantiation
Full_Adder FA1(sum[2], c3, a[2], b[2], c2); 
Full_Adder FA2(sum[3], c_out, a[3], b[3], c3);



endmodule

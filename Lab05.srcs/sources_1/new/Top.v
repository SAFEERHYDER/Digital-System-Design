`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 12:52:26 PM
// Design Name: 
// Module Name: Top
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


module Top(clkIn, In, q0, q1, q2, q3);
input clkIn, In;
output q0, q1, q2, q3;
wire clkout;

clk_div inst0(clkIn, clkout);
shift_nonblocking inst1(q0, q1, q2, q3, In, clkout);



endmodule

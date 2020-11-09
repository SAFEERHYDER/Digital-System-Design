`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 06:44:01 PM
// Design Name: 
// Module Name: Top_Level
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


module Top_Level(clk, reset, En, d, q);
input clk, reset, En, d;
output q;

// 
wire slow_clk;

Blinky_1Hz inst0(clk, slow_clk);
DFF_AsynReset_Synch_En inst1(q, d, slow_clk, reset, En);



endmodule

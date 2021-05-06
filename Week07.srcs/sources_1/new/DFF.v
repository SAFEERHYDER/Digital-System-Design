`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 01:54:39 PM
// Design Name: 
// Module Name: DFF
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


module DFF(q, d, clk);
input clk, d;
output reg q;

always@(posedge clk)
begin
    q <= d;
end 

endmodule


module TB;
reg clk, d;
wire q;

DFF DFF0(q, d, clk);

initial
clk = 0;
always
#10 clk = ~ clk;

initial
begin
    @(negedge clk);
    d = 1;
    @(negedge clk);
    d = 0;
    @(negedge clk);
    d = 1;
    
    repeat(3) @(negedge clk);
    $finish;
    
end 

endmodule 

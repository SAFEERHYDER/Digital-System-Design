`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 01:25:26 PM
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


module shift_nonblocking(q0, q1, q2, out, in, clk);
input in, clk;
output reg q0, q1, q2, out; 


always@(posedge clk)
begin
    q0  <= in;
    q1  <= q0;
    q2  <= q1;
    out <= q2;
end 
endmodule




module DFFTB;
reg in, clk;
wire q0, q1, q2, out;

DFF inst0(q0, q1, q2, out, in, clk);

initial
clk = 0;
always
#10 clk = ~ clk; 

initial
begin
    in = 0;
    @(negedge clk) in = 1;
    repeat(4) @(negedge clk) in = 0;
    repeat(4) @(negedge clk) $stop;
end 

endmodule 






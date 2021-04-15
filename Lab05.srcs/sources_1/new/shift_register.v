`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 12:48:04 PM
// Design Name: 
// Module Name: shift_register
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

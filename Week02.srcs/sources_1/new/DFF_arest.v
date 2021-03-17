`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 04:10:21 AM
// Design Name: 
// Module Name: DFF_arest
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


module DFF_arest(q, d, clk, reset);

input clk, d, reset;
output reg q;

always@(posedge clk, posedge reset)
begin
    if (reset == 1'b1)      // if (reset)
        q <= 1'b0;          
    else
         q <= d;
    
end

endmodule


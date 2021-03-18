`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 04:40:27 PM
// Design Name: 
// Module Name: DFF_three_segment
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


module DFF_three_segment(clk, reset, en, d, q);
input clk, reset, en, d;
output reg q;

// internal registers 
reg r_reg, r_next;

// memory block, current_state logic
always@(posedge clk, posedge reset)
begin
    if (reset)
        r_reg <= 0;  // non-blocking assignment 
    else 
        r_reg <= r_next;
end 

// Input block , next_state logic
always@(*)
begin
    if (en)
        r_next = d; // blocking assignment 
    else 
        r_next = r_reg;
end 

// Output block  or logic 
always@(*)
begin
    q = r_reg;
end 

endmodule

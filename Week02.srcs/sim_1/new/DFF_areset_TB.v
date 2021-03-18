`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 04:16:58 AM
// Design Name: 
// Module Name: DFF_areset_TB
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


module DFF_areset_TB();

reg d, clk, reset;
wire q;

initial
begin
    #00 clk = 0; d = 1'bx; reset = 0;
    @(negedge clk); d = 1; reset = 0; 
    
    @(negedge clk); reset = 1; // reset 
    @(negedge clk); reset = 0; // un-reset

    @(negedge clk); d = 1; 
    @(negedge clk); d = 0;
    repeat (2) @(negedge clk); $stop; 
end 

always
#10 clk = ~ clk; 

// instantiation
DFF_arest DFF0(q, d, clk, reset);

endmodule


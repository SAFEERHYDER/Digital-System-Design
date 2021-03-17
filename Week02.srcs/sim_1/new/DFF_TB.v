`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:34:58 AM
// Design Name: 
// Module Name: DFF_TB
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


module DFF_TB();

reg d, clk;
wire q;

//initial
//begin
//#00 clk = 0; d = 1'bx;
//#10 d = 0;
//#10 d = 1;
//#20 d = 0;
//#20 $stop; 
//end 

initial
begin
#00 clk = 0; d = 1'bx;
@(negedge clk); d = 0; 
@(negedge clk); d = 1;
@(negedge clk); d = 0;
repeat (2) @(negedge clk); $stop; 
end 

always
#10 clk = ~ clk; 

// instantiation
DFF DFF0(q, d, clk);

endmodule

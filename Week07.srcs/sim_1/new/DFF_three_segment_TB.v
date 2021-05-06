`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 04:58:57 PM
// Design Name: 
// Module Name: DFF_three_segment_TB
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


module TB;
reg clk, d, reset, En;
wire q;

DFF_three_segment DFF0(clk, reset, En, d, q);

initial
clk = 0;
always
#10 clk = ~ clk;

initial
begin
//// Enable deasserted
    @(negedge clk);
    d = 1; En = 1;
    @(negedge clk) ;
    d = 0; En = 1;
//// Enable Asserted    
    @(negedge clk);
    d = 1; En = 0;
    @(negedge clk) ;
    d = 0; En = 0;
    
//// Reset Asserted    
    @(negedge clk);
    reset = 1;
    
    repeat(3) @(negedge clk);
    $finish;
    
end 

endmodule 

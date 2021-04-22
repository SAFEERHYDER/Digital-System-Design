`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 12:59:08 PM
// Design Name: 
// Module Name: uni_shift_reg_TB
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


module uni_shift_reg_TB;
parameter N = 8;
reg clk , reset;
reg [1:0] ctrl;
reg [N-1:0] d;
wire [N-1:0] q;
wire Sout; 

// instantiate 
univ_shift_reg inst0(clk, reset, ctrl, d, q, Sout);

// clk generation
initial
clk = 0;
always 
#10 clk = ~ clk;  


// reset
initial
begin
    reset = 0;
    #10 reset = 1;

// un-reset and test the functionality
    @(negedge clk) reset = 0;

// SIPO, left shifting
    @(negedge clk); ctrl = 2'b01; d[0] = 1'b1;
    repeat(8) @(negedge clk); 

// SIPO, right shifting
    reset = 1; 
    @(negedge clk); reset = 0; ctrl = 2'b10; d[7] = 1'b1;
    repeat(8) @(negedge clk);  
    
// PIPO        
    reset = 1;
    @(negedge clk); reset = 0; ctrl = 2'b11; d = 8'b1010_1101;
    @(negedge clk); $stop;
     
end 




endmodule

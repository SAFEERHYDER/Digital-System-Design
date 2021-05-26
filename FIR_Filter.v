`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 02:24:17 PM
// Design Name: 
// Module Name: FIR_Filter
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


module FIR_Filter(clk, reset, data_in, data_out);

parameter N = 16;

input clk, reset;
input [N-1:0] data_in;
output reg [N-1:0] data_out; 

// coefficients defination
// Moving Average Filter, 3rd order
// four coefficients; 1/(order+1) = 1/4 = 0.25 
// 0.25 x 128(scaling factor) = 32 = 6'b100000
wire [5:0] b0 =  6'b100000; 
wire [5:0] b1 =  6'b100000; 
wire [5:0] b2 =  6'b100000; 
wire [5:0] b3 =  6'b100000;
wire [N-1:0] x1, x2, x3; 

// Create delays i.e x[n-1], x[n-2], .. x[n-N]
// Instantiate D Flip Flops
DFF DFF0(clk, 0, data_in, x1); // x[n-1]
DFF DFF1(clk, 0, x1, x2);      // x[x[n-2]]
DFF DFF2(clk, 0, x2, x3);      // x[n-3] 

//  Multiplication
wire [N-1:0] Mul0, Mul1, Mul2, Mul3;  
assign Mul0 = data_in * b0; 
assign Mul1 = x1 * b1;  
assign Mul2 = x2 * b2;  
assign Mul3 = x3 * b3;  
 
// Addition operation
wire [N-1:0] Add_final; 
assign Add_final = Mul0 + Mul1 + Mul2 + Mul3; 

// Final calculation to output 
always@(posedge clk)
data_out <= Add_final; 

endmodule


module DFF(clk, reset, data_in, data_delayed);
parameter N = 16;
input clk, reset;
input [N-1:0] data_in;
output reg [N-1:0] data_delayed; 

always@(posedge clk, posedge reset)
begin
    if (reset)
    data_delayed <= 0;
    else
    data_delayed <= data_in; 
    
end

endmodule
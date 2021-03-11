`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 07:06:30 PM
// Design Name: 
// Module Name: Param_Adder
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


module Param_Adder(Sum, Cout, A, B, Cin);

parameter N = 16;

input wire [N-1:0] A, B;
input wire Cin;
output reg [N-1:0] Sum;
output reg Cout;

// logic description
always@(*)
begin
    {Cout, Sum} = A + B + Cin;
end

endmodule

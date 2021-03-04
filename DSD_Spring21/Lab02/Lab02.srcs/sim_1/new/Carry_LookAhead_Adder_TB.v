`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 06:16:32 PM
// Design Name: 
// Module Name: Carry_LookAhead_Adder_TB
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


module Carry_LookAhead_Adder_TB();

reg [3:0] a, b;
reg  c_in;
wire [3:0] sum;
wire c_out;

initial
begin
    #00 a = 10; b = 12;
    #10 a = 13; b = 8;
    #10 a = 7;  b = 15;
    #10 a = 5;  b = 3;
    #10 $finish;
end

initial
$monitor($time, "ns, a = %d, b = %d, sum = %d", a, b, {c_out, sum});

Carry_LookAhead_Adder CLA0(sum, c_out, a, b, c_in);


endmodule

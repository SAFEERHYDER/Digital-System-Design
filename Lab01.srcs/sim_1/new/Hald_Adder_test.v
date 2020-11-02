`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 05:44:11 PM
// Design Name: 
// Module Name: Hald_Adder_test
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


module Hald_Adder_test();

reg A, B;
wire Carry, Sum;

// signals
initial
begin
    #00 B = 0; A = 0;
    #10 B = 0; A = 1;
    #10 B = 1; A = 0;
    #10 B = 1; A = 1;
    #100 $stop;
end 

// Instatiate 
Half_Adder Half_Adder1(Carry, Sum, A, B);

endmodule

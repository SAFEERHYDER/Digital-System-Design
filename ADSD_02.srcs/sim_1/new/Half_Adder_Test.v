`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:36:18 PM
// Design Name: 
// Module Name: Half_Adder_Test
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


module Half_Adder_Test();
reg A, B;
wire Sum, Carry;

// signals 
initial
begin
    #00 B = 0; A = 0;
    #10 B = 0; A = 1;
    #10 B = 1; A = 0;
    #10 B = 1; A = 1;
    #10 $stop;     
end 

// design instantiation
Half_Adder Half_Adder1(Sum, Carry, A, B);


endmodule

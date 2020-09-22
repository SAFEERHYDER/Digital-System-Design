`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 06:21:47 PM
// Design Name: 
// Module Name: Four_bit_Adder_Design
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


// Four bit Adder using a HA and three FAs
module Four_bit_Adderr(Sum, A, B);

// vector ports
input [3:0] A, B;
output [4:0] Sum; // Sum[4] = Carry out


// logic 
Half_Adder Half_Adder1(Sum[0], C1, A[0], B[0]);
Full_adder Full_adder1(Sum[1], C2, A[1], B[1], C1);
Full_adder Full_adder2(Sum[2], C3, A[2], B[2], C2);
Full_adder Full_adder3(Sum[3], Sum[4], A[3], B[3], C3);



endmodule

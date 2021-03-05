`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:14:35 PM
// Design Name: 
// Module Name: gates
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

// module initiation 
module gates(Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8, Out9, A, B);

// direction of ports
input A, B;
output Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8, Out9;

// logic substance 
not not1(Out1, A); // 
not not2(Out2, B);

and and1(Out3, A, B);
or or1(Out4, A, B);

nand nand1(Out5, A, B);
nor nor1(Out6, A, B); 

xor xor1(Out7, A, B);
xnor xnor1(Out8, A, B);

buf buf1(Out9, A);

// module end 
endmodule

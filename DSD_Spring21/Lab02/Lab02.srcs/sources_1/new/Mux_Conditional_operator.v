`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 04:55:50 PM
// Design Name: 
// Module Name: Mux_Conditional_operator
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


module Mux_Conditional_operator(Out, S0, S1, S2, In1, In2, In3, In4, In5, In6, In7, In8);
input S0, S1, S2, In1, In2, In3, In4, In5, In6, In7, In8;
output Out;


// 
// assign Out = condition ? True : False;
// assign Out = S ? In2 : In1;    // 2-to-1 
// assign Out = S0 ? (S1 ? In4 : In3) : (S1 ? In2 : In1); // 4-to-1 Mux
// 8-to-1 Mux
assign Out = S2 ? (S1 ? (S0 ? In8 : In7) : (S0 ? In6 : In5)) : (S1 ? (S0 ? In4:In3) : (S0 ? In2 : In1)); 

endmodule

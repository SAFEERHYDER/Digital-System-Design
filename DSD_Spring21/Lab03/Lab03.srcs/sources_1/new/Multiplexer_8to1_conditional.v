`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 07:01:19 PM
// Design Name: 
// Module Name: Multiplexer_8to1_conditional
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


module Multiplexer_8to1_conditional(Out, In, S);
input [7:0] In; // vectored
input [2:0] S;
output Out;

// Conditional operator
//assign Out = Condition ? True : False;
//assign Out = S ? In2 : In1;
//assign Out = S1 ? (S0 ? In4: In3) : (S0 ? In2 : In1);
assign Out = S[2] ? (S[1] ? (S[0] ? In[7] : In[6]) : (S[0] ? In[5]: In[4]) ) : (S[1] ? (S[0] ? In[3]: In[2]) :(S[0] ? In[1]: In[0])); 

endmodule

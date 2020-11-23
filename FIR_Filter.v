`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2020 01:20:00 PM
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


module FIR_Filter(Clk, Xin,  Yout);
parameter N = 16; // coeffient wordlength

input Clk; // clock
input [N-1:0] Xin; // Input data
output reg [N-1:0] Yout; // Output data

// reset signal
reg reset;

//Internal variables.
 wire [N-1:0] b0, b1, b2, b3, b4, b5, b6, b7;
 wire [N-1:0] MUL0, MUL1, MUL2, MUL3, MUL4, MUL5, MUL6, MUL7, Add_out;
 wire [N-1:0] Q1,Q2,Q3, Q4, Q5, Q6, Q7;
 

//filter coefficient for moving average filter
 assign b0 = 16; 
 assign b1 = 17;
 assign b2 = 18;
 assign b3 = 19;
 assign b4 = 19; 
 assign b5 = 18;
 assign b6 = 17;
 assign b7 = 16;

////flip flop instantiations (for introducing a delay).
 DFF dff1 (.clk(Clk), .reset(1'b0), .D(Xin),.Q(Q1));
 DFF dff2 (.clk(Clk), .reset(1'b0), .D(Q1),.Q(Q2));
 DFF dff3 (.clk(Clk), .reset(1'b0), .D(Q2),.Q(Q3));
 DFF dff4 (.clk(Clk), .reset(1'b0), .D(Q3),.Q(Q4));
 DFF dff5 (.clk(Clk), .reset(1'b0), .D(Q4),.Q(Q5));
 DFF dff6 (.clk(Clk), .reset(1'b0), .D(Q5),.Q(Q6));
 DFF dff7 (.clk(Clk), .reset(1'b0), .D(Q6),.Q(Q7));

 
//Multiplications.
 assign MUL0 = b0*Xin;
 assign MUL1 = b1*Q1;
 assign MUL2 = b2*Q2;
 assign MUL3 = b3*Q3;
 assign MUL4 = b4*Q4;
 assign MUL5 = b5*Q5;
 assign MUL6 = b6*Q6;
 assign MUL7 = b7*Q7;

 
//Adders
 assign Add_out = MUL0 + MUL1 + MUL2 + MUL3 + MUL4 + MUL5 + MUL6 + MUL7;

//Assign the adder output to final output.
 always@ (posedge Clk)
 Yout <= Add_out;
endmodule


module DFF(clk, reset, D, Q);

parameter N = 16; // coeffient wordlength
input clk, reset;
input [N-1:0] D;
output reg [N-1:0] Q;

always@(posedge clk, posedge reset)
 if (reset)
    Q <= 0;
 else
    Q <= D;

endmodule


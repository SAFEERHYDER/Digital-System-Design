`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 02:39:00 AM
// Design Name: 
// Module Name: Example01_TB
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


module Example01_TB();
reg  A, I1, I0;
wire  Q;

// signal description
initial
begin
    #00 A = 1'b0; I1 = 1'b0; I0 = 1'bx;  
    #10 A = 1'b0; I1 = 1'b1; I0 = 1'bx;
    #10 A = 1'b1; I1 = 1'bx; I0 = 1'b0;  
    #10 A = 1'b1; I1 = 1'bx; I0 = 1'b1;
    #10 $stop;  
end 

// instantiation
Example02 inst0(Q, A, I0, I1);

initial
$monitor("A = %b, I1 = %b, I0 = %b, Q = %b", A, I1, I0, Q);

endmodule

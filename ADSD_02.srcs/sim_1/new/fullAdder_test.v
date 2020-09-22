`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:49:55 PM
// Design Name: 
// Module Name: fullAdder_test
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


module fullAdder_test();
wire Sum,Carry;
reg A,B,Cin;

initial
begin
    #00 Cin=0; B=0; A=0;
    #10 Cin=0; B=0; A=1;
    #10 Cin=0; B=1; A=0;
    #10 Cin=0; B=1; A=1;
    #10 Cin=1; B=0; A=0;
    #10 Cin=1; B=0; A=1;
    #10 Cin=1; B=1; A=0;
    #10 Cin=1; B=1; A=1;
    #10 $stop;
end
Full_adder Full_adder1(Sum,Carry,A,B,Cin);
endmodule

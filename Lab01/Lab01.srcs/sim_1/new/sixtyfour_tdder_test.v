`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 04:52:02 PM
// Design Name: 
// Module Name: sixtyfour_tdder_test
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



module sixtyfour_tdder_test();

reg [63:0] A, B;
reg Cin;
wire [63:0] Sum;
wire Carry;

initial
begin
    #00 A = 50000; B = 1500; Cin = 0;
    #10 A = 10000; B = 40001; Cin = 0;
    #10 A = 15000; B = 15000; Cin = 0;
    #10 A = 34000; B = 16000; Cin = 0;
    #10 $stop; 
     
end 

SixtyFour_bit_Adder Sixtyfour_bit1(Carry, Sum, A, B, Cin);


endmodule

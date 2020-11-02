`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 02:29:27 PM
// Design Name: 
// Module Name: Four_bit_Adder_Test
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


module Four_bit_Adder_Test();
reg [3:0] A, B; 
reg  Cin;
wire [3:0] Sum; 
wire Carry;

// signal generation 
initial
begin
   #00 A = 7;  B  = 10; Cin = 0; 
   #10 A = 7;  B  = 15; Cin = 0; 
   #10 A = 8;  B  = 6;  Cin = 0; 
   #10 A = 9;  B  = 12; Cin = 0; 
   #10 A = 10; B  = 13; Cin = 0; 
   #10 A = 15; B  = 10; Cin = 0; 
   #10 $stop; 
end 

// instatiate 
Four_bit_Adder Fourbit1(Sum, Carry, A, B, Cin);



endmodule

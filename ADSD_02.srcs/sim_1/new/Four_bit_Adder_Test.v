`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 05:10:32 PM
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
wire [4:0] Sum;


initial
begin
    #00 A = 10; B = 10;
    #10 A = 5;  B = 10;
    #10 A = 6;  B = 10;
    #10 A = 4;  B = 10;
    #10 $stop;

end 

 Four_bit_Adderr Four_bit_Adderr1(Sum, A, B);


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2021 03:32:50 PM
// Design Name: 
// Module Name: SSeg_driver
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
 // Common-anode 7 segment display driver

module SSD_driver(In, Outt);
input wire [3:0] In;
output [7:0] Outt;  // includes decimal point

reg [6:0] Out;

// logic description
always@(*)
begin
    case(In)
        4'b0000 : Out = 8'b10111111;    // 0
        4'b0001 : Out = 8'b10000110;    // 1 
        4'b0010 : Out = 8'b11011011;    // 2
        4'b0011 : Out = 8'b11001111;    // 3
        4'b0100 : Out = 8'b11100110;    // 4 
        4'b0101 : Out = 8'b11101101;    // 5
        4'b0110 : Out = 8'b11111101;    // 6 
        4'b0111 : Out = 8'b10000111;    // 7 
        4'b1000 : Out = 8'b11111111;    // 8
        4'b1001 : Out = 8'b11101111;    // 9
        default : Out = 8'bzzzzzzzz;
    endcase
end

assign Outt = {~Out[6],~Out[5],~Out[4],~Out[3],~Out[2],~Out[1],~Out[0]};

endmodule

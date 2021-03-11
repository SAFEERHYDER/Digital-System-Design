`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 03:06:15 PM
// Design Name: 
// Module Name: SSD_driver
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


module SSD_driver(In, Outt, cc);
input wire [3:0] In;
output [6:0] Outt;
output reg cc;

reg [6:0] Out;
// logic description
always@(*)
begin
cc = 1'b0;
    case(In)
        4'b0000 : Out = 7'b0111111;    // 0
        4'b0001 : Out = 7'b0000110;    // 1 
        4'b0010 : Out = 7'b1011011;    // 2
        4'b0011 : Out = 7'b1001111;    // 3
        4'b0100 : Out = 7'b1100110;    // 4 
        4'b0101 : Out = 7'b1101101;    // 5
        4'b0110 : Out = 7'b1111101;    // 6 
        4'b0111 : Out = 7'b0000111;    // 7 
        4'b1000 : Out = 7'b1111111;    // 8
        4'b1001 : Out = 7'b1101111;    // 9
        default : Out = 7'bzzzzzzz;
    endcase
end

assign Outt = {~Out[6],~Out[5],~Out[4],~Out[3],~Out[2],~Out[1],~Out[0]};

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 12:42:54 PM
// Design Name: 
// Module Name: BCD_to_SSeg
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


module BCD_SSD_driver(BCD, Outt);
input wire [3:0] BCD;
output [7:0] Outt;              // includes decimal point

reg [6:0] Out;

// logic description
always@(*)
begin
    case(BCD)  // Active-HIGH Logic
        4'b0000 : Out = 8'b00111111;    // 0    
        4'b0001 : Out = 8'b00000110;    // 1 
        4'b0010 : Out = 8'b01011011;    // 2
        4'b0011 : Out = 8'b01001111;    // 3
        4'b0100 : Out = 8'b01100110;    // 4 
        4'b0101 : Out = 8'b01101101;    // 5
        4'b0110 : Out = 8'b01111101;    // 6 
        4'b0111 : Out = 8'b00000111;    // 7 
        4'b1000 : Out = 8'b01111111;    // 8
        4'b1001 : Out = 8'b01101111;    // 9
        default : Out = 8'bzzzzzzzz;
    endcase
end

// Convert to Active-LOW logic
assign Outt = {~Out[6],~Out[5],~Out[4],~Out[3],~Out[2],~Out[1],~Out[0]};

endmodule
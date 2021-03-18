`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 03:30:07 AM
// Design Name: 
// Module Name: Example02
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


module Example02(Q, A, I0, I1);
input A, I0, I1;
output reg Q;

// logic description 
// bahavorial 
// case statement
always@(*)
begin
    case(A)
    1'b0 : Q = I1;
    1'b1 : Q = I0;
    default : Q = 1'bz;
    endcase
end 


endmodule

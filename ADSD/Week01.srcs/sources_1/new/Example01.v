`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 02:16:20 AM
// Design Name: 
// Module Name: Example01
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


module Example01(Q, A, I1, I0);

// direction and size of ports
input wire A, I1, I0;
output reg Q;

// logic description
always@(A, I1, I0)  // sensitivity list 
begin
    if (A == 0)
        Q = I1; 
    else if (A == 1)
        Q = I0;
    else 
        Q = 1'bz;     
end 

endmodule

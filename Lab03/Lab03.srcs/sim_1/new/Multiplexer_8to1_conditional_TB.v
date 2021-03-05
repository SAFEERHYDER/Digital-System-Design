`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 07:02:16 PM
// Design Name: 
// Module Name: Multiplexer_8to1_conditional_TB
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


module Multiplexer_8to1_conditional_TB();
reg [7:0] In; 
reg [2:0] S;
wire Out;

Multiplexer_8to1_conditional inst0(Out, In, S);

initial
begin
    #00 S = 3'b000; In = 8'bxxxx_xxx1;
    #10 S = 3'b001; In = 8'bxxxx_xx1x;
    #10 S = 3'b010; In = 8'bxxxx_x1xx;
    #10 S = 3'b011; In = 8'bxxxx_1xxx;
    #10 S = 3'b100; In = 8'bxxx1_xxxx;
    #10 S = 3'b101; In = 8'bxx1x_xxxx;
    #10 S = 3'b110; In = 8'bx1xx_xxxx;
    #10 S = 3'b111; In = 8'b1xxx_xxxx;


    #10 $stop;
end

endmodule

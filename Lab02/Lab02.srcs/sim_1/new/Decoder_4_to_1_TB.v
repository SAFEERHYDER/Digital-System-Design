`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 11:01:13 PM
// Design Name: 
// Module Name: Decoder_4_to_1_TB
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


module Decoder_4_to_1_TB();
reg A, B, En;
wire [3:0] D;

// signal generation
initial
begin
    #00 En = 1'b1; A = 1'bx; B = 1'bx;
    #10 En = 1'b0; A = 1'b0; B = 1'b0;
    #10 En = 1'b0; A = 1'b0; B = 1'b1;
    #10 En = 1'b0; A = 1'b1; B = 1'b0;
    #10 En = 1'b0; A = 1'b1; B = 1'b1;
    #10 $stop;    
end

// display on console
initial
$monitor($time, " ns -- En = %b, A = %b, B = %b -- D =%b", En, A, B, D);

// Instantiate the design
Decoder_4_to_1 inst0(En, A, B, D);

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 07:04:23 PM
// Design Name: 
// Module Name: Verilog_operators
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 04:30:29 PM
// Design Name: 
// Module Name: Data_Flow_Operators
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


module Data_Flow_Operators();
wire Out1, Out2; 
wire [3:0] Out3;
wire Out4;
wire [7:0] Out5;
wire [31:0] Out6;

 

// Logical vs Bit-wise Operators 
assign Out1 = 1'b1 && 1'b0;         // Correct
assign Out1 = 1'b1 & 1'b0;         // Correct

assign Out3 = 4'b1011 &  4'b1111;   // COrrect
assign Out2 = 4'b1011 && 4'b1111;   //  Wrong

// Reduction operator
assign Out4 = & 8'b1010_1101;

// concatenation operator
reg [3:0] X = 4'b1110;
reg [3:0] Y = 4'b1010;
assign Out5 = {X, Y}; 

// Replication operator 
reg [3:0] P = 4'b1010;
assign Out6 = {8{P}};

initial
begin
$display("Output is = %b", Out1);
$display("Output is = %b", Out2);
$display("Output is = %b", Out3);
$display("Output is = %b", Out4);
$display("Output is = %b", Out6);


end


endmodule

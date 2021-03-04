`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 03:43:33 PM
// Design Name: 
// Module Name: Full_Adder_TB
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


module Full_Adder_TB();
reg a, b, c_in;
wire sum, c_out; 

// signal generation
initial
begin
    #00 a = 1'b0; b = 1'b0; c_in = 1'b0; 
    #10 a = 1'b0; b = 1'b0; c_in = 1'b1; 
    #10 a = 1'b0; b = 1'b1; c_in = 1'b0; 
    #10 a = 1'b0; b = 1'b1; c_in = 1'b1; 
    #10 a = 1'b1; b = 1'b0; c_in = 1'b0; 
    #10 a = 1'b1; b = 1'b0; c_in = 1'b1; 
    #10 a = 1'b1; b = 1'b1; c_in = 1'b0; 
    #10 a = 1'b1; b = 1'b1; c_in = 1'b1;
    #10 $finish; 
end

initial
$monitor($time, "ns, inputs = %b outputs = %b", {a,b,c_in}, {c_out, sum});

Full_Adder FA0(sum, c_out, a, b, c_in);


endmodule

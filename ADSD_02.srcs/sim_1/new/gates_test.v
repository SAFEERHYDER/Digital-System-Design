`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 04:26:07 PM
// Design Name: 
// Module Name: gates_test
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


module gates_test();
// input >> reg 
// outputs >> wire 
reg A, B;
wire Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8, Out9;

// signal generation
initial
begin
    #00  B = 0; A = 0; // 0 ns simulation starting time
    #10  B = 0; A = 1; // 10 ns delay
    #10  B = 1; A = 0;
    #10  B = 1; A = 1;
    #10 $stop;    // stop the simulation
end 

// design instantiation
gates gates1(Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8, Out9, A, B);

endmodule

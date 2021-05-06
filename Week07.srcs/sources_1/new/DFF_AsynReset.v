`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 02:38:22 PM
// Design Name: 
// Module Name: DFF_AsynReset
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
module DFF_AsynReset_Synch_En(q, d, clk, reset, En);
input clk, d, reset, En;
output reg q;

always@(posedge clk, posedge reset)
begin
    if (reset)
        q <= 0;
    else if (En)
        q <= d;
        else 
        q <= q;
end 

endmodule


//module TB;
//reg clk, d, reset, En;
//wire q;

//DFF_AsynReset_Synch_En DFF0(q, d, clk, reset, En);

//initial
//clk = 0;
//always
//#10 clk = ~ clk;

//initial
//begin
////// Enable deasserted
//    @(negedge clk);
//    d = 1; En = 1;
//    @(negedge clk) ;
//    d = 0; En = 1;
////// Enable Asserted    
//    @(negedge clk);
//    d = 1; En = 0;
//    @(negedge clk) ;
//    d = 0; En = 0;
    
////// Reset Asserted    
//    @(negedge clk);
//    reset = 1;
    
//    repeat(3) @(negedge clk);
//    $finish;
    
//end 

//endmodule 



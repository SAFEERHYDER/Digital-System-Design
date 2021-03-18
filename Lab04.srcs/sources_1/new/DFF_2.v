`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 02:29:54 PM
// Design Name: 
// Module Name: DFF_2
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
//module DFF_1(q, clk, d);
//input clk, d;
//output reg q;

//always@(posedge clk)
//begin
    
//        q <= d;
    
//end 
//endmodule

//module DFF_2(q, clk, d, reset);
//input clk, d, reset;
//output reg q;

//always@(posedge clk, posedge reset)
//begin
    
//    if (reset)
//        q <= 1'b0;
//    else 
//        q <= d;
    
//end 
//endmodule

module DFF_3(q, clk, d, reset, en);
input clk, d, reset, en;
output reg q;

always@(posedge clk, posedge reset)
begin
    
    if (reset)
        q <= 1'b0;
    else if (en == 0)
        q <= q;
    else
        q <= d;    
    
end 
endmodule

//module SRFF(q, clk, s, r, reset, en);
//input clk, s, r, reset, en;
//output reg q;

//always@(posedge clk, posedge reset)
//begin
    
//    if (reset)
//        q <= 1'b0;
//    else if (en == 1'b0)
//        q <= q;
//    else if (s==1'b0 && r==1'b1)
//        q <= 0;
//    else if (s==1'b0 && r==1'b0)
//        q <= q;
//    else if (s==1'b1 && r==1'b0)
//        q <= 1;
//    else if (s==1'b1 && r==1'b1)
//        q <= 1'bx;
//    else 
//        q <= q;
            
    
//end 
//endmodule

//module JKFF(q, clk, j, k, reset, en);
//input clk, j, k, reset, en;
//output reg q;

//always@(posedge clk, posedge reset)
//begin
    
//    if (reset)
//        q <= 1'b0;
//    else if (en == 1'b0)
//        q <= q;
//    else if (j==1'b0 && k==1'b1)
//        q <= 0;
//    else if (j==1'b0 && k==1'b0)
//        q <= q;
//    else if (j==1'b1 && k==1'b0)
//        q <= 1;
//    else if (j==1'b1 && k==1'b1)
//        q <= ~ q;
//    else 
//        q <= q;
            
    
//end 
//endmodule



//module TFF(q, clk, t, reset, en);
//input clk, t, reset, en;
//output reg q;

//always@(posedge clk, posedge reset)
//begin
    
//    if (reset)
//        q <= 1'b0;
//    else if (en == 1'b0)
//        q <= q; 
//    else if (t==0)
//        q <= q;
//    else if (t==1)
//        q <= ~ q;
//    else 
//        q <= q;            
            
    
//end 
//endmodule
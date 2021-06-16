`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2021 02:17:44 AM
// Design Name: 
// Module Name: FIFO_TB
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


module FIFO_TB();

parameter B  = 8, // number of bits in a word 
          W  = 3;  // number of address bits)
 
 
 reg clk,reset,rd,wr;
 reg [B-1:0] w_data;
 wire empty,full;
 wire [B-1:0]r_data;
 wire [W-1:0] w_ptr_succ, r_ptr_succ; 

// Instantiation
FIFO #(.B(8),.W(3))inst0(empty,full,r_data,w_data,rd,wr,clk,reset,w_ptr_succ,r_ptr_succ);
 
// generate a clock
initial
clk = 0;
always
#10 clk = ~ clk ;

initial 
begin
    reset = 0;
    @(negedge clk) reset = 1;   // reset the system
    @(negedge clk) reset = 0;   // un-reset the system 

    // figure 4.11 b
    @(negedge clk) {wr, rd} = 2'b10; w_data=10;
    // figure 4.11 c
    @(negedge clk) {wr, rd} = 2'b10; w_data=20;
    @(negedge clk) {wr, rd} = 2'b10; w_data=30;
    @(negedge clk) {wr, rd} = 2'b10; w_data=40;
    // figure 4.11 d
    @(negedge clk) {wr, rd} = 2'b01;
    // figure 4.11 e 
    @(negedge clk) {wr, rd} = 2'b10; w_data=50;
    @(negedge clk) {wr, rd} = 2'b10; w_data=60;
    @(negedge clk) {wr, rd} = 2'b10; w_data=70;
    @(negedge clk) {wr, rd} = 2'b10; w_data=80;
    // figure 4.11 f
    @(negedge clk) {wr, rd} = 2'b10; w_data=90;
    // figure 4.11 g
    @(negedge clk) {wr, rd} = 2'b01;
    @(negedge clk) {wr, rd} = 2'b01;
    // figure 4.11 h
    @(negedge clk) {wr, rd} = 2'b01;
    @(negedge clk) {wr, rd} = 2'b01;
    @(negedge clk) {wr, rd} = 2'b01;
    @(negedge clk) {wr, rd} = 2'b01;
    @(negedge clk) {wr, rd} = 2'b01;
    // figure 4.11 i         
    @(negedge clk) {wr, rd} = 2'b01; 
    @(negedge clk)  $finish; 
end


endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2020 01:23:14 PM
// Design Name: 
// Module Name: FIR_TB
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


module FIR_Filter_TestBench;
parameter N = 16;
parameter address = 5;

 // Inputs
 reg Clk;
 reg [address-1:0] addr;
 reg [N-1:0] Xin;
 reg [N-1:0] ram [0:31];

 // Outputs
 wire [N-1:0] Yout;

 //Generate a clock with 10 ns clock period.
initial
Clk = 0;
always
#5 Clk =~Clk;

 // Generate RAM Addresses
 initial
addr=0;
 always
 #10 addr = addr+1;

 // Read data file and assign data to memory
 initial begin
// $readmemb("signal.data",ram);
$readmemb("D:/DSDLabs/Lab07/LAb8/impulse.data",ram);

 end

 // Assign memory data to the Input of the filter
 always @(posedge Clk)
 begin
 Xin <= ram[addr];
 end
 
// Instantiate the DUT
FIR_Filter inst0(Clk, Xin, Yout);


endmodule

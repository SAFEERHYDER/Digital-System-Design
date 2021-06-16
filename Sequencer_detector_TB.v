`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2021 03:52:57 AM
// Design Name: 
// Module Name: Sequencer_detector_TB
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


module Sequencer_detector_TB();
reg clk, reset, In;
wire Out;

// Instatiate 
Sequencer_detector_FSM ins0(clk, reset, In, Out);

// clock gen
initial
clk = 0;
always 
#10 clk = ~ clk;

// 
initial
begin
    // reset 
    reset = 0;
    @(negedge clk) reset = 1;
    @(negedge clk) reset = 0;
    
    // sequence application 
    @(negedge clk) In = 1; 
    @(negedge clk) In = 1; 
    @(negedge clk) In = 0; 
    @(negedge clk) In = 1; 
    @(negedge clk) In = 1;
    
    // sequence application 
    @(negedge clk) In = 1; 
    @(negedge clk) In = 1; 
    @(negedge clk) In = 0; 
    @(negedge clk) In = 0; 
    @(negedge clk) In = 1;
    
    // stop simulation
    @(negedge clk) $stop; 
   

    
end 


endmodule

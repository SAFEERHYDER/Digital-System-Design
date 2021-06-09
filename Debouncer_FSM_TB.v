`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2021 02:53:34 AM
// Design Name: 
// Module Name: db_fsm_TB
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


module db_fsm_TB();
reg clk, reset, sw;
wire db, m_tick; 


debouncer db0(clk, reset, sw, db, m_tick);
 

// clk gen ; period = 20 ns
initial
clk = 0;
always 
#10 clk = ~ clk;

parameter N = 16;
parameter M = 19;

initial
begin
reset = 0;                   sw = 1'b0;
@(negedge clk) reset = 1; 
@(negedge clk) reset = 0;
repeat(2**N) @(negedge clk); sw = 1'b1;  // 1.3 ms 
repeat(2**N) @(negedge clk); sw = 1'b0; 
repeat(2**N) @(negedge clk); sw = 1'b1; 
repeat(2**N) @(negedge clk); sw = 1'b0;
repeat(2**N) @(negedge clk); sw = 1'b1; 
 
repeat(2**M) @(negedge clk); sw = 1'b1;
repeat(2**M) @(negedge clk); sw = 1'b1;
repeat(2**M) @(negedge clk); $stop; 

 
 
end 

endmodule

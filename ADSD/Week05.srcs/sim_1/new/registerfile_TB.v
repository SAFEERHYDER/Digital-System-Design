`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 03:10:51 AM
// Design Name: 
// Module Name: registerfile_TB
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


module registerfile_TB();

parameter W = 2, B = 8;

        reg clk;
        reg wr_en; 
        reg [W-1:0] w_addr, r_addr;
        reg [B-1:0] w_data; 
        wire [B-1:0] r_data;
        
// clock generation with period of 20 ns        
initial
clk = 0;
always 
#10 clk = ~ clk;         
        
initial
begin

/////////////////// write operation ///////////////
wr_en = 1; w_addr = 0; w_data = 10; 
@(negedge clk) wr_en = 1; w_addr = 1; w_data = 20; 
@(negedge clk) wr_en = 1; w_addr = 2; w_data = 30; 
@(negedge clk) wr_en = 1; w_addr = 3; w_data = 40; 
////////////////// read operation //////////////
repeat(2) @(negedge clk) wr_en = 0; r_addr = 0;  
@(negedge clk) wr_en = 0; r_addr = 1; 
@(negedge clk) wr_en = 0; r_addr = 2; 
@(negedge clk) wr_en = 0; r_addr = 3; 

///////////////// stop the simulation
repeat(2) @(negedge clk) $stop;

end 

register_file #(.B(8), .W(2)) inst0( .wr_en(wr_en), .w_addr(w_addr), .r_addr(r_addr), .w_data(w_data), .r_data(r_data), .clk(clk));



endmodule


















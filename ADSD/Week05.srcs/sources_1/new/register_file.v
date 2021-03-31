`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 02:53:57 AM
// Design Name: 
// Module Name: register_file
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


module register_file #(parameter B = 8, W = 2)(clk, wr_en, w_addr, r_addr, w_data, r_data);
        input wire clk;
        input wire wr_en; 
        input wire [W-1:0] w_addr, r_addr;
        input wire [B-1:0] w_data; 
        output reg [B-1:0] r_data;
        
        
// memory 
reg [B-1:0] reg_array [2**W-1:0];

// write operation control
always@(posedge clk)
if(wr_en)
    reg_array[w_addr] <= w_data;
else    
// read operaion control
 r_data <= reg_array[r_addr];

        
                        

endmodule

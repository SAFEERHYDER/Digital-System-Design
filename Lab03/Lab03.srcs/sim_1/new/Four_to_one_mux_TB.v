`timescale 1ns / 1ps // compiler directive
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 02:14:18 PM
// Design Name: 
// Module Name: Four_to_one_mux_TB
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


module Four_to_one_mux_TB();
reg s0, s1, d0, d1, d2, d3;
wire out;

// signals
initial
begin
    #00 s1 = 0; s0 = 0; d3 = 1'bx; d2 = 1'bx; d1 = 1'bx; d0 = 1'b0;
    #10 s1 = 0; s0 = 0; d3 = 1'bx; d2 = 1'bx; d1 = 1'bx; d0 = 1'b1;
    
    #10 s1 = 0; s0 = 1; d3 = 1'bx; d2 = 1'bx; d1 = 1'b0; d0 = 1'bx;                                                                  
    #10 s1 = 0; s0 = 1; d3 = 1'bx; d2 = 1'bx; d1 = 1'b1; d0 = 1'bx;
    
    #10 s1 = 1; s0 = 0; d3 = 1'bx; d2 = 1'b0; d1 = 1'bx; d0 = 1'bx;                                                                  
    #10 s1 = 1; s0 = 0; d3 = 1'bx; d2 = 1'b1; d1 = 1'bx; d0 = 1'bx;
        
    #10 s1 = 1; s0 = 1; d3 = 1'b0; d2 = 1'bx; d1 = 1'bx; d0 = 1'bx;                                                                  
    #10 s1 = 1; s0 = 1; d3 = 1'b1; d2 = 1'bx; d1 = 1'bx; d0 = 1'bx;
    
    #10 $stop; // system task
end

// monitoring
initial
$monitor($time, " ns -- switch = %b, Data = %b, Out = %b", {s1,s0}, {d3,d2,d1,d0}, out);

// instantiation
Four_to_One_Mux inst0(out, s0, s1, d0, d1, d2, d3);


endmodule

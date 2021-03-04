`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 05:21:05 PM
// Design Name: 
// Module Name: Mux_Conditional_TB
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


module Mux_Conditional_TB();
reg  S0, S1, S2, In1, In2, In3, In4, In5, In6, In7, In8;
wire Out;

Mux_Conditional_operator inst0(Out, S0, S1, S2, In1, In2, In3, In4, In5, In6, In7, In8);

//
initial
begin
    #00 {S2,S1,S0} = 3'b000; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'b1xxx_xxxx; 
    #10 {S2,S1,S0} = 3'b001; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bx1xx_xxxx;    
    #10 {S2,S1,S0} = 3'b010; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bxx1x_xxxx;    
    #10 {S2,S1,S0} = 3'b011; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bxxx1_xxxx;    
    #10 {S2,S1,S0} = 3'b100; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bxxxx_1xxx;    
    #10 {S2,S1,S0} = 3'b101; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bxxxx_x1xx;    
    #10 {S2,S1,S0} = 3'b110; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bxxxx_xx1x;  
    #10 {S2,S1,S0} = 3'b111; {In1, In2, In3, In4, In5, In6, In7, In8} = 8'bxxxx_xxx1;    
    #10 $stop;
   
end 

endmodule

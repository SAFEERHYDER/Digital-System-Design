`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2020 12:44:43 PM
// Design Name: 
// Module Name: Final_Exam_Design
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


module Final_Exam_Design(clk, reset, load, d,  out);
input clk, reset, load;
input  [7:0] d;
output  out;

 reg [7:0] q;


always@(posedge clk, posedge reset)
begin
    if (reset)
        q <= 0; 
    else if (load)
        q <= d + 1;      
    else 
        q <= {q[6:0],d[0]}; 
end

assign out = q[7];

endmodule

module TB;
reg clk, reset, load; 
reg [7:0] d;
wire  out;



Final_Exam_Design inst0(clk, reset, load, d,  out);

initial
clk = 0;
always 
#10 clk = ~ clk;

initial
begin
   // Reset the design
    reset=1; 
    @(negedge clk);  load= 1; reset=0; d = 8'b10101010; 
    
    @(negedge clk);  load= 0;
    repeat(8) @(negedge clk);
    $stop; 
end

endmodule 

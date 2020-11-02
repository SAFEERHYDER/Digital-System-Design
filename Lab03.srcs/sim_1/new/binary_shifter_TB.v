`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 02:50:57 PM
// Design Name: 
// Module Name: binary_shifter_TB
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


module binary_shifter_TB();
reg  [4:0] data;
wire [4:0] s1, s2, s3, s4;


// 
initial
begin
    #00 data = 5'b00001;
    #10 $stop;
end 

Binary_shifter inst0(s1, s2, s3, s4, data);

endmodule

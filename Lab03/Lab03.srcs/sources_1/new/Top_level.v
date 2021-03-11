`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 07:24:40 PM
// Design Name: 
// Module Name: Top_level
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


module Top_level(decimal, cathodes, anode);
input [9:0] decimal;
output [6:0] cathodes;
output anode;

wire [3:0] bcd;

// module Decimal_to_BCD(Out, In);
Decimal_to_BCD inst0(bcd, decimal);

// module SSD_driver(In, Outt, cc);
SSD_driver insto(bcd, cathodes, anode);


endmodule

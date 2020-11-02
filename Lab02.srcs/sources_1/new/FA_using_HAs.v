`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 12:35:56 PM
// Design Name: 
// Module Name: FA_using_HAs
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


module FA_using_HAs(Sum, Carry, A, B, Cin);
input A, B, Cin;
output Sum, Carry;

// wires are initialised by default; else  
wire s1, c1, c2;

// logic
// HA instatiation by order 
Half_Adder HA1(c1, s1, A, B);

// Instantiation by name 
Half_Adder HA2(.Sum(Sum),
               .Carry(c2),  
               .A(s1), 
               .B(Cin));
               
or or1(Carry, c1, c2);


endmodule



// module instatiation 
// D_Name Inst_name(ports with same order of design)
// D_Name Inst_name(port_names should be same as current design)


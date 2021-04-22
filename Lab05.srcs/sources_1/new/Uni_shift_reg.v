`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 01:19:05 PM
// Design Name: 
// Module Name: Uni_shift_reg
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


module univ_shift_reg #(parameter N=8)(
    input wire clk,reset,
    input wire [1:0] ctrl,
    input wire [N-1: 0] d, 
    output reg [N-1 : 0] q, 
    output reg Sout
);


// signal declaration
 reg [N-1 :0] r_reg, r_next;
 // register body
 
 always @ (posedge clk, posedge reset)
    if  (reset)
    r_reg <= 0;
    else r_reg <= r_next;
    
   // next stage logic 
 always  @ *
    case (ctrl)
        2'b00 : r_next = r_reg;
        2'b01 : r_next = {r_reg [N-2:0], d[0]}; // left
        2'b10 : r_next = {d[N-1], r_reg[N-1:1]}; // right
        default : r_next = d;
    endcase
    
  // output logic 
    always  @ *
       case (ctrl)
           2'b00 : q = r_reg;
           2'b01 : Sout = r_reg[7]; // left
           2'b10 : Sout = r_reg[0]; // right
           default : q = r_reg;
       endcase   
    
   
endmodule

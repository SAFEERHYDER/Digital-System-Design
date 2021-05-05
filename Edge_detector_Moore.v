`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 03:45:41 PM
// Design Name: 
// Module Name: Edge_detector_Moore
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


module Edge_detector_Moore(clk, reset, level, tick);
input clk, reset, level;
output reg tick;


// state encoding i.e binary
reg [1:0] zero_ = 2'b00;   // zero state  
reg [1:0] edge_ = 2'b01;   // edge state
reg [1:0] one_ =  2'b10;   // one state

// internal registers
reg [1:0] state_reg, state_next;


// current state logic
always@(posedge clk, posedge reset)
begin
    if(reset)
        state_reg <= 0;
    else 
        state_reg <= state_next;
end

// next-state logic
always@(*)
begin
    case(state_reg)
    zero_ : if(level)
                state_next = edge_ ;  // next state is edge
            else  
                state_next = zero_;  // no change 
    edge_ : if(level)
                state_next = one_;
           else
                state_next = zero_; 
    one_  :  if (level)
                state_next = one_;
             else 
                state_next = zero_;
     endcase           
                        
end


// output logic 
always@(*)
begin
    case(state_reg)
    zero_ : tick = 0;
    edge_ : tick = 1;
    one_  : tick = 0; 
    endcase
end

endmodule


module TB;
reg clk, reset, level;
wire tick;

Edge_detector_Moore inst0(clk, reset, level, tick);

// generate a clock
initial
clk = 0;
always
#10 clk = ~ clk ;

initial 
begin
    reset = 0;
    @(negedge clk) reset = 1;   // reset the system
    @(negedge clk) reset = 0;   // un-reset the system 
    
    @(negedge clk) level = 0;
    repeat(3) @(negedge clk); level = 1;
    repeat(3) @(negedge clk); level = 0;
    repeat(3) @(negedge clk); level = 1;
    repeat(3) @(negedge clk); $finish; 
    
     
    
end 

endmodule
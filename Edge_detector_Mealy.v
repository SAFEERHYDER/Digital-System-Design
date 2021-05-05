`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 04:14:44 PM
// Design Name: 
// Module Name: Edge_detector_Mealy
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

// Melay output is function of both current input and current state

module Edge_detector_Mealy(clk, reset, level, tick);
input clk, reset, level;
output reg tick;


// state encoding i.e binary
reg zero_ = 1'b0;   // zero state  
reg one_ =  1'b1;   // one state

// internal registers
reg  state_reg, state_next;


// current state logic
always@(posedge clk, posedge reset)
begin
    if(reset)
        state_reg <= 0;
    else 
        state_reg <= state_next;
end

// next-state & output logic
always@(*)
begin
    case(state_reg)
    zero_ : if(level) begin
                tick = 1;
                state_next = one_ ; end 
            else begin
                tick = 0;     
                state_next = zero_; end  
  
    one_  :  if (level) begin
                tick = 0;
                state_next = one_; end
             else begin
                tick = 0;
                state_next = zero_; end
     endcase           
                        
end


endmodule


module TB;
reg clk, reset, level;
wire tick;

Edge_detector_Mealy inst0(clk, reset, level, tick);

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

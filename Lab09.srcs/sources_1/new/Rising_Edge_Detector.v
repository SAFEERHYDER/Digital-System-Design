`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:14:02 PM
// Design Name: 
// Module Name: Rising_Edge_Detector
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


module Rising_Edge_Detector(clk, reset, level, tick);
input level, clk, reset;
output reg tick;

// State Enconding ; Binary 
reg [1:0] zzero = 2'b00; 
reg [1:0] eedge = 2'b01;
reg [1:0] oone = 2'b10;

// Internal registers 
reg [1:0] current_state; 
reg [1:0] next_state; 

// Current_state logic ; sequential
always@(posedge clk, posedge reset)
if(reset)
    current_state <= zzero;
else 
    current_state <= next_state;

// Input logic ; combinational
always@(current_state, level)
begin
    case(current_state)
    zzero: begin
           // tick = 0;
            if (level == 1)
                next_state = eedge;
            else 
                next_state = zzero;
            end 
    eedge: begin
          // tick = 1; 
           if (level == 1)
                next_state = oone;
           else 
                next_state = zzero;
           end      
    oone: begin 
            // tick = 0;
            if (level == 1)
                next_state = oone;
          else
                next_state = zzero;
          end        
    endcase
end 


// Output logic ; combinational
always@(current_state, level)
begin
    case(current_state)
        zzero: tick = 0;
        eedge: tick = 1;
        oone: tick = 0;
    endcase
end

endmodule




module TB;
reg level, clk, reset;
wire tick;

Rising_Edge_Detector_Mealy inst0(clk, reset, level, tick);

initial
    clk = 0;
always
    #10 clk = ~ clk;

initial
begin
reset = 0;
@(negedge clk) reset = 1;
@(negedge clk) reset = 0;

level = 0;
@(negedge clk) level = 1;
@(negedge clk) level = 0;
@(negedge clk) level = 1;
@(negedge clk) $stop;

end 



endmodule

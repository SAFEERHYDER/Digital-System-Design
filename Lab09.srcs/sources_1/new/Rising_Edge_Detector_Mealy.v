`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:46:49 PM
// Design Name: 
// Module Name: Rising_Edge_Detector_Mealy
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


module Rising_Edge_Detector_Mealy(clk, reset, level, tick);
input level, clk, reset;
output reg tick;

// State Enconding ; Binary 
reg  zzero = 1'b0; 
reg  oone = 1'b1;

// Internal registers 
reg  current_state; 
reg  next_state; 

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
                begin
                    tick = 1;
                    next_state = oone;
                end
            else 
                begin
                    next_state = zzero;
                    tick = 0;
                end 
            end 
   
    oone: begin 
            // tick = 0;
            if (level == 1)
                begin next_state = oone;
                tick = 0; end
          else
                begin next_state = zzero;
                tick = 0;
                end
          end        
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


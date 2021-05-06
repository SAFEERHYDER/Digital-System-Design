`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2021 02:55:56 PM
// Design Name: 
// Module Name: Time_Mux
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

// 4 seven-segment displays

module Time_Mux(anodes, cathodes, clk, reset, In0, In1, In2, In3);
input clk, reset;
input [7:0] In0, In1, In2, In3; 
output reg [3:0] anodes;
output reg [7:0] cathodes; 

parameter N = 19;  // 100 MHz /(2**17) ~= 763 Hz  : 1/763 Hz = 1.31 ms
 
// internal registers
reg [N-1:0] current_state;  
wire [N-1:0] next_state;

// 
reg [7:0] sseg;  

// current_state logic
always@(posedge clk, posedge reset)
begin
    if(reset)
        current_state <= 0;
    else 
        current_state <= next_state;     
end


// next_state logic
assign next_state = current_state + 1; 

wire [7:0] Outt0, Outt1, Outt2, Outt3; 


// output logic 
always@(*)
begin
    case(current_state[N-1:N-2])
    2'b00 : begin   anodes = 4'b1110;
                    cathodes = Outt0; end
    
    2'b01 : begin   anodes = 4'b1101; 
                    cathodes = Outt1; end 
                    
    2'b10 : begin   anodes = 4'b1011;
                    cathodes = Outt2; end 
                    
    default : begin anodes = 4'b0111;
                    cathodes = Outt3; end                                 
          
    endcase
end


SSD_driver inst0(In0, Outt0);
SSD_driver inst1(In1, Outt1);
SSD_driver inst2(In2, Outt2);
SSD_driver inst3(In3, Outt3);



endmodule




module TB;
reg clk, reset;
reg [7:0] In0, In1, In2, In3; 
wire [3:0] anodes;
wire [7:0] cathodes; 

Time_Mux inst0(anodes, cathodes, clk, reset, In0, In1, In2, In3);

// generate 100 MHz i.e 1 / 100MHz = 10 ns 
initial
clk = 0;
always
#5 clk = ~ clk; 

initial
begin
    reset = 0;
    @(negedge clk) reset = 1;   // reset activated
    @(negedge clk) reset = 0;   // reset de-activated
    In3 = 1; In2 = 9; In1 = 8; In0 = 7;  // 1987 my birth year
    repeat(20) @(negedge clk); $finish; 
    
    
end






endmodule

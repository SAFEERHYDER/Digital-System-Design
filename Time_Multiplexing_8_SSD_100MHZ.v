`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 12:44:40 PM
// Design Name: 
// Module Name: Time_Multiplexing_Design
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

module Time_Mux(anodes, cathodes, clk, reset);
input clk, reset;
output reg [7:0] anodes;
output reg [7:0] cathodes; 

reg [3:0] BCD0 = 4'b0001;  
reg [3:0] BCD1 = 4'b0010;  
reg [3:0] BCD2 = 4'b0011;  
reg [3:0] BCD3 = 4'b0100; 
reg [3:0] BCD4 = 4'b0101;  
reg [3:0] BCD5 = 4'b0110;  
reg [3:0] BCD6 = 4'b0111;  
reg [3:0] BCD7 = 4'b1000; 
 



parameter N = 19;  // 100 MHz /(2**17) ~= 763 Hz  : 1/763 Hz = 1.31 ms
 
// internal registers
reg [N-1:0] current_state;  
wire [N-1:0] next_state;

// 
reg [7:0] sseg;  

// current_state logic
always@(posedge clk, posedge reset)
begin
    if(reset) // Active-HIGH
        current_state <= 0;
    else 
        current_state <= next_state;     
end


// next_state logic
assign next_state = current_state + 1; 

wire [7:0] SSeg0, SSeg1, SSeg2, SSeg3, SSeg4, SSeg5, SSeg6, SSeg7; 


// output logic 
always@(*)
begin
    case(current_state[N-1:N-3])
    3'b000 : begin   anodes = 8'b1111_1110;
                    cathodes = SSeg0; end
    
    3'b001 : begin   anodes = 8'b1111_1101;
                    cathodes = SSeg1; end 
                    
    3'b010 : begin   anodes = 8'b1111_1011;
                    cathodes = SSeg2; end 
                    
    3'b011 : begin   anodes = 8'b1111_0111;
                    cathodes = SSeg3; end       
                 
    3'b100 : begin   anodes = 8'b1110_1111;
                    cathodes = SSeg4; end 

    3'b101 : begin   anodes = 8'b1101_1111;
                    cathodes = SSeg5; end 

    3'b110 : begin   anodes = 8'b1011_1111;
                    cathodes = SSeg6; end 
                                
                    
    default : begin anodes = 8'b0111_1111;
                    cathodes = SSeg7; end                                 
          
    endcase
end


BCD_SSD_driver inst0(BCD0, SSeg0);
BCD_SSD_driver inst1(BCD1, SSeg1);
BCD_SSD_driver inst2(BCD2, SSeg2);
BCD_SSD_driver inst3(BCD3, SSeg3);
BCD_SSD_driver inst4(BCD4, SSeg4);
BCD_SSD_driver inst5(BCD5, SSeg5);
BCD_SSD_driver inst6(BCD6, SSeg6);
BCD_SSD_driver inst7(BCD7, SSeg7);



endmodule












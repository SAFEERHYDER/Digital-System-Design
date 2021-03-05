`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 05:07:00 PM
// Design Name: 
// Module Name: andgate_test
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


// module andgate_test(there are no ports);
module andgate_test();

// input >> reg
reg In1, In2;
// output >> wire
wire Out;

// signals generation
initial
begin
    #00 In2 = 0; In1 = 0;   // unit = ns
    #10 In2 = 0; In1 = 1;
    #10 In2 = 1; In1 = 0;
    #10 In2 = 1; In1 = 1;
    #100 $stop;    // finish the sumulation at 100 ns
end

// module instantiation
andgate andgate1(Out, In1, In2);

endmodule

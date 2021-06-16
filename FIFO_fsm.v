`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2021 02:16:36 AM
// Design Name: 
// Module Name: FIFO_fsm
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


module FIFO #(parameter B  = 8, // number of bits in a word 
                        W  = 3)  // number of address bits)
 (empty,full,r_data,w_data,rd,wr,clk,reset, w_ptr_succ, r_ptr_succ);
 
 input wire clk,reset,rd,wr;
 input wire [B-1:0] w_data;
 output wire empty,full;
 output wire [B-1:0]r_data;
 output wire [W-1:0] w_ptr_succ, r_ptr_succ;


// signal declaration
reg [B-1:0] array_reg [2**W-1:0]; //register array
reg [W-1:0] w_ptr_reg, w_ptr_next;  
reg [W-1:0] r_ptr_reg, r_ptr_next;
reg full_reg, empty_reg, full_next, empty_next;
wire wr_en;

// body
// register file write operation
 always @(posedge clk)
     if (wr_en)
       array_reg[w_ptr_reg] <= w_data;

//register file read operation
assign r_data = array_reg[r_ptr_reg];

// write enabled only when FIFO is not full
assign wr_en = wr & ~full_reg;

// FIFO control logic
// register for read and write pointers
always@(posedge clk, posedge reset) 
    if(reset)
       begin
          w_ptr_reg <= 0;  
          r_ptr_reg <= 0;  
          full_reg  <= 0;
          empty_reg <= 0;
        end
     else
       begin
          w_ptr_reg <= w_ptr_next;  
          r_ptr_reg <= r_ptr_next;  
          full_reg  <= full_next;
          empty_reg <= empty_next;
        end            
          
 // next state logic for read and write pointers
 always@(*)
//    begin
      //successive poiner values
//    w_ptr_succ = w_ptr_reg + 1;
//    r_ptr_succ = r_ptr_reg + 1;
    
    // default : keep old values
//    w_ptr_next = w_ptr_reg;
//    r_ptr_next <= r_ptr_reg;  
//    full_next  <= full_reg;
//    empty_next <= empty_reg;
    
    case({wr, rd})
     //2;b00: no op
     2'b01: //read
         if (~empty_reg) // not empty
           begin
             r_ptr_next = r_ptr_reg + 1;
             full_next  = 1'b0;
           if (r_ptr_next==w_ptr_reg)    
             empty_next = 1'b1;
           end  
    
     2'b10: //write
         if(~full_reg) // not full
           begin
             w_ptr_next = w_ptr_reg + 1;
             empty_next = 1'b0;
           if (w_ptr_next==r_ptr_reg)  
             full_next  = 1'b1;
           end
           
     2'b11: // write and read
       begin
         w_ptr_next = w_ptr_reg + 1;
         r_ptr_next = r_ptr_reg + 1;
       end
       default : 
       begin
            w_ptr_next = w_ptr_reg;
           r_ptr_next <= r_ptr_reg;  
           full_next  <= full_reg;
           empty_next <= empty_reg;
       end
               
    endcase
//    end
 
// output logic
assign full  = full_reg;
assign empty = empty_reg;

assign  w_ptr_succ = w_ptr_next; 
assign  r_ptr_succ = r_ptr_next; 

 
endmodule

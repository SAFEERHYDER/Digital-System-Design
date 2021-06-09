




module debouncer(clk, reset, sw, db, m_tick);
input clk, reset, sw;
output reg db;  

// State Encoding ; Binary
localparam [2:0]    zero = 3'b000, 
                    wait1_1 = 3'b001,
                    wait1_2 = 3'b010,
                    wait1_3 = 3'b011,
                    one = 3'b100,
                    wait0_1 = 3'b101,
                    wait0_2 = 3'b110,
                    wait0_3 = 3'b111;
// Counter                      
localparam N = 19; 

// Internal signals for counter FSM
reg [N-1:0] q_reg;
wire [N-1:0] q_next;
output wire m_tick;

// Internals signals for debouncer FSM
reg [2:0] state_reg, state_next; 

/////// Counter FSM Part //////
always@(posedge clk, posedge reset)
if (reset)
q_reg = 1'b0;
else 
q_reg <= q_next; 

assign q_next = q_reg + 1; 
assign m_tick = (q_reg == 1'b0) ? 1'b1 : 1'b0;

//////// Debouncer FSM Part /////////////
always@(posedge clk, posedge reset)
if (reset)
state_reg <= 1'b0;
else 
state_reg <= state_next; 

always@(*)
begin
    state_next = state_reg;
    db = 1'b0; 
    case(state_reg)
    zero : if (sw) state_next = wait1_1; 
    wait1_1 : if (~sw) state_next = zero; else if (m_tick) state_next = wait1_2;
    wait1_2 : if (~sw) state_next = zero; else if (m_tick) state_next = wait1_3;
    wait1_3 : if (~sw) state_next = zero; else if (m_tick) state_next = one;
    one : begin db = 1'b1; if (~sw) state_next = wait0_1; end 
    wait0_1 : begin db = 1; if (sw) state_next = one; else if (m_tick) state_next = wait0_2; end 
    wait0_2 : begin db = 1; if (sw) state_next = one; else if (m_tick) state_next = wait0_3; end 
    wait0_3 : begin db = 1; if (sw) state_next = one; else if (m_tick) state_next = zero; end 
    default: state_next = zero; 
    endcase    
end 


endmodule
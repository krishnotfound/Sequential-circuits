module DFF_sync_reset_n(
input d,
input reset_n,
input clk,
output reg q,
output q_not
);

always @(posedge clk) begin
if (!reset_n) 
q <= 1'b0;
else 
q <= d;
end

assign q_not = ~q;

endmodule 
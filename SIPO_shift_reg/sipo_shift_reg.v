module SIPO_shift_reg(
input sdi,
input clk,
input reset_n,
output reg [3:0] q
);

always @(posedge clk) begin
if (!reset_n)
q <= 4'b0000;
else 
q <= {q[2:0],sdi};            // (.) . . . "."
end

endmodule

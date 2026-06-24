module left_right_shift_reg(
input reset_n,
input enable,
input direction,
input [7:0] d,
input clk,
output reg [7:0] q
);

always @(posedge clk) begin
if (!reset_n)
q <= 8'b0;
else begin
if (enable)
q <= d;
else if (enable == 0) begin
if (direction == 0) //left
q <= { q[6:0],1'b0 };
else if (direction == 1) // right
q <= { 1'b0, q[7:1] };
end
end
end

endmodule	

module LFSR(
input reset_n,
input clk,
output reg [15:0] q
);
wire sdi;
wire [15:0] seed = 16'b1010_0000_1110_1100;

assign sdi = q[15]^	q[13] ^ q[12] ^ q[10];

always @(posedge clk) begin
if (!reset_n)
q <= seed;
else
q <= { q[14:0] , sdi };
end

endmodule

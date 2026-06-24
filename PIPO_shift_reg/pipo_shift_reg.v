module PIPO_reg(
input [3:0] d,
output [3:0] q,
input clk,
input reset_n
);

DFF_sync_reset_n DFF1(
.d(d[3]),
.q(q[3]),
.clk(clk),
.reset_n(reset_n)
);

DFF_sync_reset_n DFF2(
.d(d[2]),
.q(q[2]),
.clk(clk),
.reset_n(reset_n)
);

DFF_sync_reset_n DFF3(
.d(d[1]),
.q(q[1]),
.clk(clk),
.reset_n(reset_n)
);

DFF_sync_reset_n DFF4(
.d(d[0]),
.q(q[0]),
.clk(clk),
.reset_n(reset_n)
);

endmodule

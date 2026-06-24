module testbench();
reg reset_n;
reg clk = 0;
wire [15:0] q;

always begin #0.5; clk = ~clk; end

LFSR LFSRR(
.reset_n(reset_n),
.clk(clk),
.q(q)
);

initial begin
$monitor ("q = %b", q);
end

initial begin
reset_n = 0;
#3.2; reset_n = 1;
repeat (20) @(posedge clk);
#25; $stop;
end

endmodule
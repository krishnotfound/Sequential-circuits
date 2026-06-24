module testbench();
reg sdi;
reg reset_n;
reg clk = 0;
wire [3:0] q;
integer i;

SIPO_shift_reg SIPPOO (
.sdi(sdi),
.reset_n(reset_n),
.clk(clk),
.q(q)
);

always begin #0.5; clk = ~clk; end

initial begin
$monitor ("sdi = %b, q = %4b",sdi,q);
end

initial begin
reset_n = 0; sdi = 0;
#1.3; reset_n = 1;
for (i=0; i<20; i = i+1) begin
@(negedge clk) sdi = $urandom_range(0,1);
end
#30; $stop;
end

endmodule
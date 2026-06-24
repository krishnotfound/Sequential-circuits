module testbench();
reg [3:0] d;
reg reset_n;
reg clk = 0;
wire [3:0] q;

PIPO_reg PIPOO(
.d(d),
.reset_n(reset_n),
.clk(clk),
.q(q)
);

always begin #0.5; clk = ~clk; end

initial begin 
$monitor ("d = %4b, q = %4b, reset_n = %b", d,q,reset_n);
end

initial begin 
reset_n = 0; d = 0;
#1.2; reset_n = 1;
@(negedge clk) d = 4'b1010;
@(posedge clk);
@(negedge clk) d = 4'b1100;
repeat(5) @(posedge clk);
#20; $stop;
end

endmodule
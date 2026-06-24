module testbench();
reg d;
reg clk = 0;
reg reset_n;
wire q;
wire q_not;

DFF_sync_reset_n FDFDFD(
.d(d),
.clk(clk),
.reset_n(reset_n),
.q(q),
.q_not(q_not)
);

initial begin
$monitor ("d = %b, reset_n = %b, q = %b, q_not = %b",d,reset_n,q,q_not);
end

always begin #0.5; clk = ~clk; end

initial begin
reset_n = 0; d = 0;
#1.3; reset_n = 1;
#1; d = 1; 
#3; d = 0;
#2.2; reset_n = 0; 
#20; $stop;
end

endmodule

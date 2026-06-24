module testbench();
reg d;
reg enable;
wire q;
wire q_not;

dlatch dlatch1(
.d(d),
.enable(enable),
.q(q),
.q_not(q_not)
);

initial begin
$monitor ("d = %b, enable = %b, q = %b, q_not = %b", d,enable,q,q_not);
end

initial begin
#1; enable = 0; d = 0;
#1; d = 1;
#1; enable = 1; d = 0;
#1; d = 1;
#1; d = 0;
#1; $finish;
end

endmodule
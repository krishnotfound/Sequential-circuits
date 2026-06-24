module testbench();
reg [7:0] d;
reg clk = 0;
reg reset_n;
reg enable;
reg direction;
wire [7:0] q;

always begin #0.5; clk = ~clk; end

left_right_shift_reg lrsr (
.d(d),
.q(q),
.clk(clk),
.reset_n(reset_n),
.enable(enable),
.direction(direction)
);

initial begin 
$monitor ("d = %8b, enable = %b, direction = %b, q = %8b", d, enable, direction, q);
end

initial begin
reset_n = 0; d = 0; enable = 0; direction = 0;

#1.2; reset_n = 1; d = 8'b1010_1100; enable = 1;
repeat (2) @(posedge clk);
@(negedge clk); enable = 0; direction = 1;
repeat (2) @(posedge clk);
@(negedge clk); direction = 0;
repeat(2) @(posedge clk);
#20; $stop;
end

endmodule 
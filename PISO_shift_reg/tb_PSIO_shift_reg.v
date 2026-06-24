module testbench();
reg sdi;
reg [3:0] d;
reg load;
reg reset_n;
reg clk = 0;
wire sdo;

always begin #0.5; clk = ~clk; end

PISO_shift_reg PISOO(
.sdi(sdi),
.sdo(sdo),
.reset_n(reset_n),
.clk(clk),
.load(load),
.d(d)
);

initial begin
$monitor ("sdi = %b, d = %4b, load = %b, sdo = %b", sdi, d, load, sdo);
end

initial begin
reset_n = 0; sdi = 0; d = 0; load = 0;
#1.2; reset_n = 1;

@(negedge clk); d = 4'b1101; load = 1;
@(posedge clk);
@(posedge clk); load = 0;
repeat(6) @(posedge clk);
@(negedge clk); d = 4'b1010; load = 1;
@(posedge clk);
@(posedge clk); load = 0;
repeat(6) @(posedge clk);
#20; $stop;
end
endmodule

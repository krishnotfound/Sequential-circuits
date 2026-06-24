module testbench();
reg sdi;
reg reset_n;
reg clk = 0;
wire sdo;
integer i;

SISO_shift_reg SISOOO(
.sdi(sdi),
.sdo(sdo),
.reset_n(reset_n),
.clk(clk)
);

always begin #0.5; clk = ~clk; end

initial begin 
$monitor ("sdi = %b, sdo = %b", sdi, sdo);
end

initial begin
reset_n = 0; sdi = 0;
#1.2; reset_n = 1;
for (i = 0; i<20; i = i + 1) begin
@(negedge clk) sdi = $urandom_range(0,1);
end

#25; $stop;

end

endmodule

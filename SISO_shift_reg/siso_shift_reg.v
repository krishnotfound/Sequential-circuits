module SISO_shift_reg(
input sdi,
input reset_n,
input clk,
output sdo
);

reg [3:0] siso;

always @(posedge clk) begin
if(!reset_n)
siso <= 4'b0000;
else
siso <= {siso[2:0],sdi};
end

assign sdo = siso[3];

endmodule

module PISO_shift_reg(
input sdi,
input [3:0] d,
input load,
input reset_n,
input clk,
output sdo
);

reg [3:0] piso_out;

always @(posedge clk) begin
if (!reset_n) 
piso_out <= 4'b0;
else if (load)
piso_out <= d;
else 
piso_out <= {piso_out[2:0] , sdi};
end

assign sdo = piso_out[3];

endmodule	

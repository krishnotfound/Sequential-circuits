module dlatch(
input d,
input enable,
output reg q,
output q_not
);

always @(*) begin
if(enable == 0)
q <= 1'b0;
else 
q <= d;
end

assign q_not = ~q;

endmodule

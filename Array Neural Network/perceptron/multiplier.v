module multiplier (a,b,out);

parameter N = 32;
parameter frac = 24;

input signed [N-1:0] a;
input signed [N-1:0] b;
output signed [N-1:0] out;

wire signed [2*N-1:0] temp;

assign temp = a*b;
assign out = temp[((2*N-1)-(N-frac)):frac];

endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 11/8/2018 
// Module Name   : output_layer
// Project Name  : LSI Design Contest in Okinawa 2018
// Target Devices: Neural Network
// Tool versions : Vivado 2016.4
//
// Description: 
// 		Performing addition for 4 input values
// 
// Input:
//  	A : 16 bit signed : First Value
//  	B : 16 bit signed : Second Value 
//  	C : 16 bit signed : Third Value 
//  	D : 16 bit signed : Fourth Value 
//
// Output:
//  	out : 16 bit signed : Result 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Addtion using operator +
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

module array(clk, rst, A, B, 
            wa1, wa2, wa3, 
            wb1, wb2, wb3, 
            bias1, bias2, bias3, 
            out1, out2, out3);

parameter DWIDTH=32;
parameter frac=24;

input clk, rst;
input signed [DWIDTH-1:0] A, B, wa1, wa2, wa3, wb1, wb2, wb3, bias1, bias2, bias3;
output signed [DWIDTH-1:0] out1, out2, out3;

wire signed [DWIDTH-1:0] wireA, wireB; //connect input_layer to hidden_layer
wire signed [DWIDTH-1:0] wireA1, wireB2, wire C2; //connect hidden_layer to output_layer

input_layer input_layer1(
.clk(clk), 
.rst(rst), 
.A(A), 
.B(B), 
.out1(wireA), 
.out2(wireB)
);

hidden_layer hidden_layer1(
.clk(clk), 
.rst(rst), 
.A(wireA), 
.B(wireB), 
.wa1, 
.wa2, 
.wa3, 
.wb1, 
.wb2, 
.wb3, 
.bias1, 
.bias2, 
.bias3, 
.out1(wireA1), 
.out2(wireB1), 
.out3(wireC1)
);

output_layer output_layer1(
.clk(clk), 
.rst(rst), 
.A(wireA1), 
.B(wireB1), 
.C(wireC1), 
.wa1, 
.wa2, 
.wb1, 
.wb2, 
.wc1, 
.wc2, 
.bias1, 
.bias2, 
.out1, 
.out2
);

endmodule
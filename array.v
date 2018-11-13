////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 11/8/2018
// Module Name   : array
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
            out1, out2);

parameter DWIDTH=32;
parameter frac=24;

input clk, rst;
input signed [DWIDTH-1:0] A, B;
output signed [DWIDTH-1:0] out1, out2;

wire signed [DWIDTH-1:0] wireA, wireB; //connect input_layer to hidden_layer
wire signed [DWIDTH-1:0] wireA1, wireB1, wireC1; //connect hidden_layer to output_layer
wire signed [DWIDTH-1:0] wa11, wa12, wa13, wb11, wb12, wb13, wa21, wa22, wb21, wb22, wc21, wc22, bias11, bias12, bias13, bias21, bias22;//weight and bias
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
.wa1(wa11),
.wa2(wa12),
.wa3(wa13),
.wb1(wb11),
.wb2(wb12),
.wb3(wb13),
.bias1(bias11),
.bias2(bias12),
.bias3(bias13),
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
.wa1(wa21),
.wa2(wa22),
.wb1(wb21),
.wb2(wb22),
.wc1(wc21),
.wc2(wc22),
.bias1(bias21),
.bias2(bias22),
.out1(out1),
.out2(out2)
);

rom romweightandbiasrom(
.clk(clk),
.enable(1'b1),
.wa11(wa11),
.wa12(wa12),
.wa13(wa13),
.wb11(wb11),
.wb12(wb12),
.wb13(wb13),
.wa21(wa21),
.wa22(wa22),
.wb21(wb21),
.wb22(wb22),
.wc21(wc21),
.wc22(wc22),
.bias11(bias11),
.bias12(bias12),
.bias13(bias13),
.bias21(bias21),
.bias22(bias22)
);
endmodule

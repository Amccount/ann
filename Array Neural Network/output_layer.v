
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

module output_layer(clk, rst, A, B, C, wa1, wa2, wb1, wb2, wc1, wc2, bias1, bias2, out1, out2);

parameter DWIDTH=32;
parameter frac=24;
input clk, rst;
input signed [DWIDTH-1:0] A, B, C, wa1, wa2, wb1, wb2, wc1, wc2, bias1, bias2;
output signed [DWIDTH-1:0] out1, out2;

perceptron3 perceptron1(.clk(clk), .rst(rst), .A(A), .B(B), .C(C), .wa(wa1), .wb(wb1), .wc(wc1), .bias(bias1), .out(out1));
perceptron3 perceptron2(.clk(clk), .rst(rst), .A(A), .B(B), .C(C), .wa(wa2), .wb(wb2), .wc(wc2), .bias(bias2), .out(out2));
endmodule
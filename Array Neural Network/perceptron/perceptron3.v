
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 10/29/2018
// Module Name   : perceptron3
// Project Name  : LSI Design Contest in Okinawa 2018
// Target Devices: Sigmoid Function
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

module perceptron3(clk, rst, A, B, C, wa, wb, wc, bias, out);

parameter DWIDTH=32;
parameter frac=24;
input clk, rst;
input signed [DWIDTH-1:0] A, B, C, wa, wb, wc, bias;
output signed [DWIDTH-1:0] out;


wire signed [DWIDTH-1:0] temp1, temp2, temp3, temp4, temp5, temp6;
wire signed [DWIDTH-1:0] sigm;

multiplier mult1(.a(A), .b(wa), .out(temp1));
multiplier mult2(.a(B), .b(wb), .out(temp2));
multiplier mult3(.a(C), .b(wc), .out(temp3));
adder_2in adder1(.A(temp1), .B(temp2), .out(temp4));
adder_2in adder2(.A(temp3), .B(temp4), .out(temp5));
adder_2in adder3(.A(bias), .B(temp5), .out(temp6));
sigmf sigm_func(.in(temp6), .out(sigm));
Dflipflop dff1(.clk(clk),.reset(rst),.in(sigm),.enable(1'b1),.out(out));

endmodule

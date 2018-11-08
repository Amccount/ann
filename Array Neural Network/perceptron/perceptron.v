
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 10/29/2018 
// Module Name   : perceptron
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

module perceptron(clk, rst, A, B, wa, wb, bias, out);

parameter DWIDTH=32;
parameter frac=24;
input clk, rst;
input signed [DWIDTH-1:0] A, B, wa, wb, bias;
output signed [DWIDTH-1:0] out;


wire signed [DWIDTH-1:0] temp1, temp2;
wire signed [DWIDTH-1:0] temp3, temp4;
wire signed [DWIDTH-1:0] sigm;

multiplier mult1(.a({A[31],A[6:0],24'h000000}), .b(wa), .out(temp1));
multiplier mult2(.a({B[31],B[6:0],24'h000000}), .b(wb), .out(temp2));
adder_2in adder1(.A(temp1), .B(temp2), .out(temp3));
adder_2in adder2(.A(bias), .B(temp3), .out(temp4));
sigmf sigm_func(.in(temp4), .out(sigm));
Dflipflop dff1(.clk(clk),.reset(rst),.in(sigm),.enable(1'b1),.out(out));

endmodule
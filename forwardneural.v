////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 11/8/2018
// Module Name   : forwarneural
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

module forwardneural(clk, rst, addread1, addread2, addwrite1, addwrite2);

parameter DWIDTH=32;
parameter frac=24;

input clk, rst;
wire signed [DWIDTH-1:0] A, B, out1, out2;
readmem readmemory(.clk(clk), .enable(1'b1), .addr1(addread1), .addr2(addread2), .data1(A), .data2(B));
writemem writemem(.clk(clk), .enable(1'b1), .addr1(addwrite1), .addr2(addwrite2), .data1(out1), .data2(out2))
array arrayofneural(.clk(clk), .rst(rst), .A(A), .B(B), .out1(out1), .out2(out2));
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 10/29/2018 
// Module Name   : adder_2in
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

module adder_2in(A, B, out);

parameter DWIDTH=32;
parameter frac=24;

input signed [DWIDTH-1:0] A, B;
output signed [DWIDTH-1:0] out;

assign out = A + B;

endmodule
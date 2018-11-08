////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 11/8/2018 
// Module Name   : readmem
// Project Name  : LSI Design Contest in Okinawa 2018
// Target Devices: Neural Network
// Tool versions : Vivado 2016.4
//
// Description: 
// 		Performing read memory
// 
// Input:
//  	addr : 8 bit signed : address to read
//  	
// Output:
//  	data : 8 bit signed : data at address 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
///////////////////////////////////////////////////////////////////////////////////////////////////////


module readmem(addr, data);
 input [7:0] addr;
 output [7:0] data;
 reg [7:0] my_memory [0:255];
 
 initial begin
 $readmemh("memory.list", my_memory);
 end
 
 assign data = my_memory[addr];
endmodule
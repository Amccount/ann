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


module readmem(clk, enable, addr1, addr2, data1, data2);
 parameter DWIDTH=32;
 parameter frac=24;

 input clk,enable;
 input [DWIDTH-1:0] addr1, addr2;
 output reg [DWIDTH-1:0] data1, data2;
 reg [DWIDTH-1:0] my_memory [0:255];

 always@(posedge clk)
   begin
     if (enable) begin
       $readmemh("memoryread.list", my_memory);
       data1 = my_memory[addr1];
       data2 = my_memory[addr2];
     end
 end
endmodule

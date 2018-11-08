////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 11/8/2018 
// Module Name   : writemem
// Project Name  : LSI Design Contest in Okinawa 2018
// Target Devices: Neural Network
// Tool versions : Vivado 2016.4
//
// Description: 
// 		Performing read memory
// 
// Input:
//  	clk    : 1 bit signed : clock
//  	enable : 8 bit signed : enable
//  	addr1   : 8 bit signed : first address to write
//  	data1   : 8 bit signed : first data to be written
//  	addr2   : 8 bit signed : second address to write
//  	data2   : 8 bit signed : second data to be written
//  	 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

module  writemem(clk, enable, addr1, addr2, data1, data2);

parameter DWIDTH=32;
parameter frac=24;

input clk,enable;  
input [DWIDTH-1:0] addr1, addr2, data1, data2;
reg [DWIDTH-1:0] my_memory [0:255];

always@(posedge clk)
  begin
    if (enable) begin
      my_memory[addr1] = data1;
      my_memory[addr2] = data2;
      $writememh("memory.list", my_memory);
    end
end

endmodule
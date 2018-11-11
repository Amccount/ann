////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Institution   : Bandung Institute of Technology
// Engineer      : William Chandra, Teddy Hadi Utama, Shalahuddin
//
// Create Date   : 11/8/2018
// Module Name   : rom
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


module rom(clk, enable, wa11, wa12, wa13, wb11, wb12, wb13, wa21, wa22, wb21, wb22, wc21,
wc22, bias11, bias12, bias13, bias21, bias22);
 parameter DWIDTH=32;
 parameter frac=24;

 input clk,enable;
 output reg [DWIDTH-1:0] wa11, wa12, wa13, wb11, wb12, wb13, wa21, wa22, wb21, wb22, wc21, wc22, bias11, bias12, bias13, bias21, bias22;
 reg [DWIDTH-1:0] my_memory [0:255];

 always@(posedge clk)
   begin
     if (enable) begin
       $readmemh("memoryread.list", my_memory);
       wa11 = my_memory[0];
       wa12 = my_memory[1];
       wa13 = my_memory[2];
       wb11 = my_memory[3];
       wb12 = my_memory[4];
       wb13 = my_memory[5];
       wa21 = my_memory[6];
       wa22 = my_memory[7];
       wb21 = my_memory[8];
       wb22 = my_memory[9];
       wc21 = my_memory[10];
       wc22 = my_memory[11];
       bias11= my_memory[12];
       bias12 = my_memory[13];
       bias13 = my_memory[14];
       bias21 = my_memory[15];
       bias22 = my_memory[16];
     end
 end
endmodule

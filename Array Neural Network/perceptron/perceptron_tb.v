/* Nama Modul : Testbench*/
/* Fungsi : Pengujian dan simulasi toplevel */
/* Tanggal Revisi : 14 Oktober 2018 */
/* Yang Merevisi : William Chandra / 13215052 */
module perceptron_tb ();
parameter DWIDTH=32;

reg clk, rst;
reg signed [DWIDTH-1:0] A, B, bias;
reg [DWIDTH-1:0] wa,wb;
wire signed [DWIDTH-1:0] out;
perceptron perc(.clk(clk), .rst(rst), .A(A), .B(B), .wa(wa), .wb(wb), .bias(bias), .out(out));
initial
begin
//Initialization Variabel Counter
clk = 0;
rst = 1;
#10;
rst = 0;
A = 8;
B = 8;
wa = 32'h00199999;
wb = 32'h00666666; 
bias = -1;
end

always
begin
clk = ~clk; #5;
end

endmodule
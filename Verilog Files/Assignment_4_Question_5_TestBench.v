`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 18:54:33
// Design Name: 
// Module Name: tb_seq
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_seq;
reg seq_in,clk,reset;
wire det_out;

seqdet uut(.seq_in(seq_in),.clk(clk),.reset(reset),.det_out(det_out));

initial begin
 clk = 1'b0; reset = 1'b1;
#15 reset = 1'b0;
 end 

always #5 clk=~clk;

initial
begin
    #12 seq_in = 0; #10 seq_in = 0; #10 seq_in = 1; #10 seq_in = 1; #10 seq_in = 1;#10 seq_in = 1; 
    #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1;#10 seq_in = 0;
    #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1;#10 seq_in = 0;
    #10 seq_in = 1; #10 seq_in = 1; #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1;#10 seq_in = 0;
    #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1; #10 seq_in = 0; #10 seq_in = 1;#10 seq_in = 0;
    
    
end
endmodule

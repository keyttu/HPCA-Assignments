`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 22:22:02
// Design Name: 
// Module Name: parity_tb
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


module parity_tb;
reg clk,x;
wire op;

parity_gen uut(.clk(clk),.x(x),.op(op));

initial begin
clk=1'b1;
end

always #10 clk=~clk;

initial
 begin
    #2 x=0; #10 x=1; #10 x=1; #10 x=1;
    #10 x=0; #10 x=1; #10 x=1; #10 x=0;
    #10 x=0; #10 x=0; #10 x=0; #10 x=0;
    #10 x=1; #10 x=1; #10 x=1; #10 x=1;
 end
endmodule

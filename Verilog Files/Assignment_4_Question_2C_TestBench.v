`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 13:34:46
// Design Name: 
// Module Name: counter_tb
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


module counter_tb;
reg clk, rst, init;
reg [7:0] din;
wire [7:0]out;

counter uut(.clk(clk),.rst(rst),.init(init),.din(din),.out(out));

initial begin
clk=1'b1;
end

always #10 clk=~clk;

initial
 begin
    rst = 1'b1; init=1'b0; din = 8'b10110011;
    #20 rst = 1'b0; init=1'b1; din = 8'b10110011;
    #10 init = 1'b0;
 end

 
endmodule

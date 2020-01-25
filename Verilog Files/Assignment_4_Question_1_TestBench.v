`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 21:45:45
// Design Name: 
// Module Name: lamp_tb
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


module lamp_tb;
reg clk;
wire [2:0]light;

lamp uut(.clk(clk),.light(light));

always #20 clk = ~clk;
initial
begin
clk = 1'b0;
end


endmodule

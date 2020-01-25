`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2020 20:56:54
// Design Name: 
// Module Name: freqdiv_tb
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


module freqdiv_tb;
reg clk;
wire scaled_clk;

freq_diivder uut(.clk(clk), .scaled_clk(scaled_clk));

initial
     begin
     	clk=1'b1;
     	forever #10 clk=~clk;  
     end    
endmodule

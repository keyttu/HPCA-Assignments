`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 13:24:54
// Design Name: 
// Module Name: counter
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


module counter(clk, rst, out, init, din);
input [7:0] din;
input clk,rst,init;
output reg [7:0] out;

always @(posedge clk)
 begin
    if(rst == 1'b1)
      out<=8'b0;
    else if(init==1'b1)
      out<=din;
    else
      out <= {~out[0],out[7:1]};             
 end

endmodule

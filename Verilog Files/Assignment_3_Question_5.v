`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2020 20:50:56
// Design Name: 
// Module Name: freq_diivder
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


module freq_diivder(scaled_clk,clk);
output reg scaled_clk;
input clk;
reg [3:0] counter;
initial
 begin
    scaled_clk<=1;
    counter<=1'd0;
 end

always @(posedge clk)
 begin
    if(counter<7)
    begin
        counter<=counter+1'd1;
        
    end
    else
    begin
        counter = 1'd0;
        scaled_clk=~scaled_clk;
    end
 end
endmodule

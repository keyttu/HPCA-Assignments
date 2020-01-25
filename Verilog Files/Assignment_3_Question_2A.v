`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 15:52:56
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter(clk,reset,preset,up_down,counter);
input clk,reset,up_down,preset;
output[3:0]counter;
reg [3:0] counter_up_down;

always @(posedge clk or posedge reset)
begin
if(reset)
 counter_up_down <= 4'h0;
else if(preset)
 counter_up_down <= 4'h1;  
else if(~up_down)
 counter_up_down <= counter_up_down + 4'd1;
else
 counter_up_down <= counter_up_down - 4'd1;
end 
assign counter = counter_up_down;

endmodule

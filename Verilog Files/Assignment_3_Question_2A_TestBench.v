`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 15:56:44
// Design Name: 
// Module Name: updowncounter_testbench
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


module updowncounter_testbench;
reg clk, reset,preset,up_down;
wire [3:0] counter;

up_down_counter uut(clk,reset,preset,up_down, counter);

initial begin 
clk=1'b0;
end
always #10 clk=~clk;

initial begin
reset=1;up_down=0;preset=0;
#20 reset=0;
#200 up_down=1;
end
endmodule

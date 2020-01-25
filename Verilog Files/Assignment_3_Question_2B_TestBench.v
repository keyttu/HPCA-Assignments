`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 15:02:06
// Design Name: 
// Module Name: t_tb
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


module t_tb;
reg t,clk,rst;
wire [3:0] q,qb;

t_count uut(.clock(clk),.reset(rst),.t(t),.q(q),.qb(qb));

initial begin
clk=1'b1;
end

always #10 clk=~clk;

initial
 begin
    rst = 1'b1;t=1'b1;
    #20 rst = 1'b0;
    
 end
endmodule

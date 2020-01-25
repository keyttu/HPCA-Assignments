`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 14:47:34
// Design Name: 
// Module Name: t_count
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


module t_count(t,clock,reset,q,qb);
input t,clock, reset;
output [3:0]q,qb;

tff T0(t,clock, reset,q[0],qb[0]);
tff T1(t,qb[0], reset,q[1],qb[1]);
tff T2(t,qb[1], reset,q[2],qb[2]);
tff T3(t,qb[2], reset,q[3],qb[3]);
assign reset = q[0] & q[3];
endmodule


module tff(t,clock,reset,q,qb);
input t,clock,reset;
output reg q,qb;
always@(posedge clock)
begin
case({reset,t})
2'b00 :q=q;
2'b01 :q=~q;
default: q=0;
endcase
qb<=~q;
end
endmodule

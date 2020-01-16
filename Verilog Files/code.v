`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 23:06:40
// Design Name: 
// Module Name: code
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


module code(
    input L,
    input T,
    input CLK,
    input P,
    output G,
    output Y,
    output D,
    output C,
    output R,
    wire t1,t2,t3,t4,t5,t6,t7,t8
    );

assign t1 = L | T | P;
assign G = t1;
assign t2 = T ^ P;
assign t3 = T | P;
assign Y = L & t3 | ~L & ~t2;
assign t4 = T & P;
assign t5 = ~L & ~t4;
assign t6 = T ^ P;
assign t7 = ~t6 & L;
assign D = t7 | t5;
assign t8 = L & T & P;
assign C = ~t8;
assign R = C & D | ~C & CLK;

endmodule

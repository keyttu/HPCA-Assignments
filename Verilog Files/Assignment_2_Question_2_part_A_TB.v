`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 08:40:27 PM
// Design Name: 
// Module Name: peTB
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


module peTB();
    reg [15:0] a;
    wire [3:0] o;

pecase uut(.A(a), .O(o));

initial
    begin
        a=16'h0005;
        #100
        a=16'hab08;
        #100
        a=16'h120a;
        #100
        a=16'h452c;
        #100
        a=16'h3252;
    end 
endmodule

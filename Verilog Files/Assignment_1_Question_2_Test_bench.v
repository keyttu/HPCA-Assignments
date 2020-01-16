`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2020 10:43:38 PM
// Design Name: 
// Module Name: FASTB
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


module FASTB();
    reg a, b, c;
    wire s, ca;

FAstruc uut(.A(a),.B(b),.C(c),.S(s),.Carry(ca));
initial
    begin
        a = 0; b=0; c=0;
        #50
        a = 0; b=0; c=1;
        #50
        a = 0; b=1; c=0;
        #50
        a = 0; b=1; c=1;
        #50
        a = 1; b=0; c=0;
        #50
        a = 1; b=0; c=1;
        #50
        a = 1; b=1; c=0;
        #50
        a = 1; b=1; c=1;
    end

endmodule

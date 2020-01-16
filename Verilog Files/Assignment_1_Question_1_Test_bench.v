`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2020 10:03:32 PM
// Design Name: 
// Module Name: FA_TB
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


module FA_TB;
    reg a, b, c;
    wire s, ca;

FA uut(.A(a),.B(b),.C(c),.S(s),.Ca(ca));
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

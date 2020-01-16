`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2020 11:29:46 PM
// Design Name: 
// Module Name: MUX_TB
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


module MUX_TB();
    reg a,b,c,d,s1,s2;
    wire o;
    
MUX uut(.A(a),.B(b),.C(c),.D(d),.S1(s1),.S2(s2),.O(o));
    initial
        begin
            a= 1; b=0; c=0; d=0; s1=0; s2=0;
            #50
            a= 0; b=1; c=0; d=0; s1=0; s2=1;
            #50
            a= 0; b=0; c=1; d=0; s1=1; s2=0;
            #50
            a= 0; b=0; c=0; d=1; s1=1; s2=1;
        end
endmodule

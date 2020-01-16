`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 23:27:09
// Design Name: 
// Module Name: test
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


module test();
    reg l, t, p, clk;
    wire g, y, d, c, r;
    
code uut(.L(l),.T(t),.P(p),.CLK(clk),.G(g),.Y(y),.D(d),.C(c),.R(r));

always
    begin
    clk = 0;
    #10;
    clk = 1;
    #10;
    end

initial
    begin
        l=0; t=0; p=0;
        #50
        l=0; t=0; p=1;
        #50
        l=0; t=1; p=0;
        #50
        l=0; t=1; p=1;
        #50
        l=1; t=0; p=0;
        #50
        l=1; t=0; p=1;
        #50
        l=1; t=1; p=0;
        #50
        l=1; t=1; p=1;
        
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 09:15:06 AM
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
    reg a,b,c,d,e;
    wire o1,o2;
    
code uut(.A(a),.B(b),.C(c),.D(d),.E(e),.O1(o1),.O2(o2));
    initial
        begin
          a=1; b=1;c=0;d=1;e=0;
          #50
          a=0; b=0;c=0;d=1;e=1;
          #50
          a=0; b=0;c=1;d=1;e=1;
          #50
          a=0; b=1;c=1;d=1;e=1;
          #50
          a=1; b=1;c=1;d=1;e=1;
        end
endmodule

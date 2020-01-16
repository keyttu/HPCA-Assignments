`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 04:12:23 PM
// Design Name: 
// Module Name: FaderTB
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


module FaderTB();

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] s;
    wire cout;
    
FourBA uut(.A(a), .B(b), .Cin(cin), .S(s), .Cout(cout));

initial
    begin
       a = 4'b0011; b = 4'b1010; cin=1; 
       #50
       a = 4'b1011; b = 4'b1000; cin=0; 
       #50
       a = 4'b0111; b = 4'b1011; cin=1; 
       #50
       a = 4'b0000; b = 4'b1110; cin=0; 
    end
endmodule

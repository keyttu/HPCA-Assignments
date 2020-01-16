`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 09:03:04
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;
    reg [3:0] a, b;
    reg D;
    wire [3:0] s;
    wire cout;
    
adder_4bit uut(.A(a), .B(b), .Cout(cout), .S(s), .d(D));
    initial
        begin
            a=4'b1000; b=4'b0011; D=1'b1;
            # 100 a=4'b1000; b=4'b1011; D=1'b1;
            # 100 a=4'b1010; b=4'b0111; D=1'b1;
            # 100 a=4'b1100; b=4'b1111; D=1'b0;
            # 100 a=4'b1110; b=4'b1011; D=1'b0;
            # 100 a=4'b1000; b=4'b0011; D=1'b0;
            
        end    
    
endmodule

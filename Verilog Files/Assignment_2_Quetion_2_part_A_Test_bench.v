`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2020 18:57:56
// Design Name: 
// Module Name: pencode_tb
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


module pencode_tb;
reg [15:0] DIN;
wire [3:0] Y;

pencode_if uut(.d_in(DIN), .y(Y));
    initial
        begin
                 DIN = 16'b0000000000000001;
            #100 DIN = 16'b0000000000000010;
            #100 DIN = 16'b0000000000000100;
            #100 DIN = 16'b0000000000001000;
            #100 DIN = 16'b0000000000010000;
            #100 DIN = 16'b0000000000100000;
            #100 DIN = 16'b0000000001000000;
            #100 DIN = 16'b0000000010000000;
            #100 DIN = 16'b0000000100000000;
            #100 DIN = 16'b0000001000000000;
            #100 DIN = 16'b0000010000000000;
            #100 DIN = 16'b0000100000000000;
            #100 DIN = 16'b0001000000000000;
            #100 DIN = 16'b0010000000000000;
            #100 DIN = 16'b0100000000000000;
            #100 DIN = 16'b1000000000000000;
            #100 DIN = 16'b0100000000001010;
            #100 DIN = 16'b0110001000000010;
         end
            
            
            
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 21:03:37
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb;
    wire [15:0]O;
    reg [3:0]I;
    
    decoder uut(.o(O), .i(I));
    initial
        begin
            I=4'b0000;
            #100 I=4'b0001;
            #100 I=4'b0010;
            #100 I=4'b0011;
            #100 I=4'b0100;
            #100 I=4'b0101;
            #100 I=4'b0110;
            #100 I=4'b0111;
            #100 I=4'b1000;
            #100 I=4'b1001;
            #100 I=4'b1010;
            #100 I=4'b1011;
            #100 I=4'b1100;
            #100 I=4'b1101;
            #100 I=4'b1110;
            #100 I=4'b1111;
            
        end
            
            
    
    
endmodule

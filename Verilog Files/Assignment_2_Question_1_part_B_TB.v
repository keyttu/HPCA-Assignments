`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 07:19:09 PM
// Design Name: 
// Module Name: decoderifTB
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


module decoderifTB();
    reg [1:0] a;
    wire [3:0] b;
    reg e;
    
decoderone uut(.A(a), .E(e), .O(b));

initial
    begin
        a=2'b10; e=0;
        #100
        a=2'b00; e=1;
        #100
        a=2'b10; e=1;
        #100
        a=2'b01; e=1;
        #100
        a=2'b11; e=1;
    end    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2020 18:48:14
// Design Name: 
// Module Name: pencode_if
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


module pencode_if(y, d_in);
    input [15:0] d_in;
    output reg [3:0] y;
    
    always @(d_in)
     begin
        if(d_in[0]) y=4'b0000;else
        if(d_in[1]) y=4'b0001;else
        if(d_in[2]) y=4'b0010;else
        if(d_in[3]) y=4'b0011;else
        if(d_in[4]) y=4'b0100;else
        if(d_in[5]) y=4'b0101;else
        if(d_in[6]) y=4'b0110;else
        if(d_in[7]) y=4'b0111;else
        if(d_in[8]) y=4'b1000;else
        if(d_in[9]) y=4'b1001;else
        if(d_in[10]) y=4'b1010;else
        if(d_in[11]) y=4'b1011;else
        if(d_in[12]) y=4'b1100;else
        if(d_in[13]) y=4'b1101;else
        if(d_in[14]) y=4'b1110;else
        if(d_in[15]) y=4'b1111;else
        y=4'bxxxx;
      end  
        
endmodule

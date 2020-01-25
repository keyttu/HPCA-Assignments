`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 22:07:40
// Design Name: 
// Module Name: parity_gen
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


module parity_gen(clk,x,op);
input clk,x;
output reg op;

reg parity;//0-even parity,1-odd parity
parameter E=0,O=1;

always @(posedge clk)
    case(parity)
    E:begin
        op<=x?1:0;
        parity<=x?O:E;
    end
    O:begin
        op<=x?0:1;
        parity<=x?E:O;
    end 
    default:parity<=E;
    endcase           
endmodule



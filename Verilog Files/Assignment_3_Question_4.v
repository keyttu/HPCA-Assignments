`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2020 07:22:43
// Design Name: 
// Module Name: univreg
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


module univreg(din,sin,dout,clk,mode);
input [3:0] din;
input sin,clk;
output reg [3:0] dout;
input [1:0]mode;
always @(posedge clk)
 begin
    case(mode)
        2'b00:dout=dout;
        2'b01:dout=din;
        2'b10:dout={din[2:0],sin};
        2'b11:dout={sin,din[3:1]};
    endcase        
 end
endmodule

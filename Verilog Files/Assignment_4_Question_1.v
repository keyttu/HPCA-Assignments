`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 21:32:26
// Design Name: 
// Module Name: lamp
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


module lamp(clk, light);
input clk;
output reg [2:0]light;
parameter S0=1,S1=2, S2=3;
parameter red=3'b001, green = 3'b010, yellow = 3'b100;
reg [1:0]state;

always @(posedge clk)
 begin
    case(state)
      S0:begin
      light<=green;state<=S1;
      end
      S1:begin
      light<=yellow;state<=S2;
      end
      S2:begin
      light<=red;
      state<=S0;
      end
      default:begin
      light<=red;
      state<=S0;
      end
     endcase
 end
endmodule

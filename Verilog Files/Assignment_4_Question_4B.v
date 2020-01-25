`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2020 07:00:25
// Design Name: 
// Module Name: serial
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


module serial(a, b, s, reset, clk);
input a, b, reset, clk;
output reg s;
   
   parameter s0=1'b0,s1=1'b1;
   reg PS,NS;
   
   always@(posedge clk or posedge reset)
     begin
       if(reset)
         PS<=s0;
       else
         PS<=NS;
     end
   always@(PS)
     begin
       case(PS)
         s0:begin
           case({a,b})
             2'b00:begin s=1'b0; NS=s0;end
             2'b01:begin s=1'b1; NS=s0;end
             2'b10:begin s=1'b1; NS=s0;end
             2'b11:begin s=1'b0; NS=s1;end
           endcase
         end
         s1:begin
           case({a,b})
             2'b00:begin s=1'b1;NS=s0;end
             2'b01:begin s=1'b0;NS=s1;end
             2'b10:begin s=1'b0;NS=s1;end
             2'b11:begin s=1'b1;NS=s1;end
           endcase
         
         end
       endcase
     end 
 endmodule





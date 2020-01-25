`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2020 17:36:47
// Design Name: 
// Module Name: serial_tb
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


module serial_tb;
reg a,b,reset,clk;
wire s;


serial uut(.a(a),.b(b),.reset(reset),.clk(clk));

initial
     begin
     	clk=1'b1;
     	forever #10 clk=~clk;  
     end

initial
     begin
              //add 7 and 6 
    			reset = 1'b1;  a = 1'b0; b = 1'b0;
			#50; reset = 1'b0; a = 1'b1; b = 1'b0;
			#50;  a = 1'b1; b = 1'b1;
			#50;  a = 1'b0; b = 1'b1;		
			#10;  a = 1'b0; b = 1'b0;
	end
			
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2020 07:30:42
// Design Name: 
// Module Name: tb_reg
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


module tb_reg;
reg [3:0] Din;
reg [1:0] Mode;
reg Clk,Sin;
wire [3:0] Dout;

univreg uut(.din(Din),.mode(Mode),.clk(Clk),.sin(Sin),.dout(Dout));

initial
     begin
     	Clk=1'b1;
     	forever #50 Clk=~Clk;  
     end

initial
 begin
    Mode=2'b01;Din=4'b0011;
    #100 Mode=2'b10;Din=4'b0011;Sin=1'b1;
    #100 Mode=2'b11;Din=4'b0011;Sin=1'b1;
    #100 Mode=2'b00;Din=4'b0011;
 end
endmodule

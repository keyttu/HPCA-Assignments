`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2020 00:45:27
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
    reg [2:0]s; 
reg [3:0]a, b, c, d, e, f, g, h;
wire [3:0]o;

mux uut(.A(a),.B(b),.C(c),.D(d),.E(e),.F(f),.G(g),.H(h),.S(s),.O(o));

initial
begin
    a = 4'h1; b=4'h2;c=4'h3;d=4'h4;e=4'h5;g=4'h6;f=4'h7;h=4'h8;s=3'b000; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b001; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b010; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b011; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b100; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b101; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b110; 
    #50
    a = 4'h8; b=4'h9;c=4'ha;d=4'hb;e=4'hc;g=4'hd;f=4'he;h=4'hf;s=3'b111; 
end
endmodule

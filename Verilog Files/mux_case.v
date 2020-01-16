`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 23:49:31
// Design Name: 
// Module Name: mux
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


module mux(
    input [2:0] S,
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [3:0] E,
    input [3:0] F,
    input [3:0] G,
    input [3:0] H,
    output reg [3:0] O
    );
    
  always @*
    begin
        case(S)
            3'b000: O<= A;
            3'b001: O<= B;
            3'b010: O<= C;
            3'b011: O<= D;
            3'b100: O<= E;
            3'b101: O<= F;
            3'b110: O<= G;
            3'b111: O<= H;
        endcase
    end

endmodule

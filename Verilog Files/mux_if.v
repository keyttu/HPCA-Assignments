`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2020 00:38:31
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


module mux(input [2:0] S,
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
                if(S==3'b000) O<= A;else
                if(S==3'b001) O<= B;else
                if(S==3'b010) O<= C;else
                if(S==3'b011) O<= D;else
                if(S==3'b100) O<= E;else
                if(S==3'b101) O<= F;else
                if(S==3'b110) O<= G;else
                if(S==3'b111) O<= H;
                
            
        end
    
endmodule

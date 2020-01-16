`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 06:58:40 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [1:0] A,
    output reg [3:0] O,
    input E
    );
    
    always @*
        begin
            if (E == 1'b1)
                case(A)
                    2'b00: O<= 4'b0001;
                    2'b01: O<= 4'b0010;
                    2'b10: O<= 4'b0100;
                    2'b11: O<= 4'b1000;
                    default O<= 4'b0000;
                endcase
            else
                O<=4'b0000;
        end    
endmodule
